# Liquidity Pool Calculator

A simple calculator demonstrating how to calculate token swaps in a liquidity pool.

## Overview

This calculator helps determine the amount of tokens you'll receive when swapping tokens in a liquidity pool. The example uses a common scenario with two tokens:
- A stable coin (USDT)
- A utility token (JP)

## Example Pool Setup

Initial liquidity pool contains:
- 3,201 USDT
- 312 JP tokens

## Swap Calculation Example

Note: Move doesn't support floating-point numbers, so all calculations use the smallest unit of the token.


### Scenario 1
We want to swap 495 USDT for JP tokens with a 5% swap fee.

### Step-by-Step Calculation

1. **Calculate Swap Fee**
   ```
   Swap Fee = 495 USDT × 5% = 2 USDT
   ```

2. **Calculate Pool Constant (k)**
   ```
   k = USDT × JP = 3,201 × 312 = 998,712
   ```

3. **Calculate New USDT Supply**
   ```
   New USDT = 3,201 + 493 = 3,696
   ```

4. **Calculate New JP Supply**
   ```
   New JP = Pool Constant / (New USDT - Swap Fee)
   New JP = 998,712 / (3,696 - 2) = 270
   ```

5. **Calculate JP Tokens Received**
   ```
   JP Received = Initial JP - New JP
   JP Received = 312 - 270 = 42
   ```

Therefore, swapping 495 USDT will yield 42 JP tokens.