/*
ALGORITHM: DivMod, discards n.
INPUT:  >n d
OUTPUT: >0 d-n%d n%d n/d 0 0
SOURCE: http://esolangs.org/wiki/Brainfuck_algorithms
NOTE:
- Assumes all bytes beyond x are zero.
- Uses 6 bytes.
- Destroys n in the process, so if you need to keep it, copy it first!
*/

[->-[>+>>]>[+[-<+>]>+>>]<<<<<]
