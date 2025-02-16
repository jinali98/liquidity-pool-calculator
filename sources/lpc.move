module liquidity_pool_calculator::lpc {
    use std::string::{String, utf8};

    const E_INVALID_USDT_AMOUNT: u64 = 1;
    const E_NOT_ENOUGH_USDT: u64 = 2;
    const E_NOT_ENOUGH_UTILITY_TOKEN: u64 = 3;

    const JP: u64 = 1;
    const APT: u64 = 2;
    const WETH: u64 = 3;

    const Pool1_USDT: u64 = 3201;
    const Pool1_JP: u64 = 312;
    const JP_name: vector<u8> = b"JP Token Reward";

    const Pool2_USDT: u64 = 56000;
    const Pool2_APT: u64 = 2790;
    const APT_name: vector<u8> = b"Aptos Token Reward";

    const Pool3_USDT: u64 = 23000;
    const Pool3_WETH: u64 = 5678;
    const WETH_name: vector<u8> = b"Wrapped Ether Reward";


  
  fun calculate_swap(usdt: u64, utility_token: u64, usdt_amount: u64): u64 {
 // validation
 assert!(usdt_amount > 0, E_INVALID_USDT_AMOUNT);
 assert!(usdt > 0, E_NOT_ENOUGH_USDT);
 assert!(utility_token > 0, E_NOT_ENOUGH_UTILITY_TOKEN);

 // calculate
 let swap_fee = usdt_amount * 5 / 1000;

 let mix_sup = usdt * utility_token;

 let new_usdt_supply = usdt + usdt_amount;
 let new_utility_token_supply = mix_sup / (new_usdt_supply - swap_fee);

 let utility_token_received = utility_token - new_utility_token_supply;

 utility_token_received
  }

  fun get_suppy(utility_token: u64):(u64, u64, vector<u8>){
    if(utility_token == JP){
      return (Pool1_USDT, Pool1_JP, JP_name)
    } else if(utility_token == APT){
      return (Pool2_USDT, Pool2_APT, APT_name)
    } else{
      return (Pool3_USDT, Pool3_WETH, WETH_name)
    } 
  }

  #[test_only]
  use std::debug::print;
  #[test]
  
  fun test_calculate_swap() {
        let usdt_amount = 495;

let (usdt, utility_token, name) = get_suppy(JP);


    print(&utf8(b"USDT swapping for:"));

    print(&utf8(name));
    let jp_received = calculate_swap(usdt, utility_token, usdt_amount);
    print(&utf8(b"JP received:"));
    print(&jp_received);

    let (usdt, utility_token, name) = get_suppy(APT);
    print(&utf8(b"USDT swapping for:"));
    print(&utf8(name));
    let apt_received = calculate_swap(usdt, utility_token, usdt_amount);
    print(&utf8(b"Aptos received:"));
    print(&apt_received);

    let (usdt, utility_token, name) = get_suppy(WETH);
    print(&utf8(b"USDT swapping for:"));
    print(&utf8(name));
    let weth_received = calculate_swap(usdt, utility_token, usdt_amount);
    print(&utf8(b"Wrapped Ether received:"));
    print(&weth_received);  
  }
    


}