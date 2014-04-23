/*
ALGORITHM: Printing a number, using a loop.
INPUT:  >x
OUTPUT: >0
NOTE:
- Assumes all bytes beyond x are zero.
- Uses 12 bytes to print a 3-digit number.
- Should work with 16- and 32-bit integers, if the interpreter supports it. UNTESTED!
- Cleans up after itself (ALL memory used by this algo is zero afterwords)
- Uses the DivMod algo from http://esolangs.org/wiki/Brainfuck_algorithms
*/

[->>+<<]>>[-<+<+>>]<[->>>+<<<]>++++++++++>>>++++++[-<<++++++++>>]<[>+++
+++++++<[->-[>+>>]>[+[-<+>]>+>>]<<<<<]>[-]<<[-]>>>[-<<<+>>>]<<<>++++++[
-<++++++++>]>>>[-<<+>>]<<]<<[.[-]<]<