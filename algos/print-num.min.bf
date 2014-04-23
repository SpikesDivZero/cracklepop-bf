/*
ALGORITHM: Printing a number, using a loop.
INPUT:  >x
OUTPUT: >0
NOTE:
- Assumes all bytes beyond x are zero.
- Uses 11 bytes to print a 3-digit number.
- Destroys x in the process, so if you need to keep it, copy it first!
- Should work with 16- and 32-bit integers, if the interpreter supports it. UNTESTED!
- Cleans up after itself (ALL memory used by this algo is zero afterwords)
- Uses the DivMod algo from http://esolangs.org/wiki/Brainfuck_algorithms
*/

[->>>+<<<]>++++++++++>>>++++++[-<<++++++++>>]<[>++++++++++<[->-[>+>>]>[
+[-<+>]>+>>]<<<<<]>[-]<<[-]>>>[-<<<+>>>]<<<>++++++[-<++++++++>]>>>[-<<+
>>]<<]<<[.[-]<]
