/*
ALGORITHM: DivMod, preserves n.
INPUT:  >n 0 d
OUTPUT: >n 0 d-n%d n%d n/d 0 0
SOURCE: http://esolangs.org/wiki/Brainfuck_algorithms
NOTE:
- Assumes all bytes beyond x are zero.
- Uses 7 bytes.
*/

/*
	DEBUG:
	INPUT: [ 13 0 10 ]
	OUTPUT: [ 13 0 7 3 1 0 0 ]
*/
+++++ +++++ +++ >> +++++ +++++ <<

[->+>-[>+>>]>[+[-<+>]>+>>]<<<<<<]
>[-<+>]<      /* The preservation bit */

#