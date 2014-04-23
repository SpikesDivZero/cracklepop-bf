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

/* DEBUG: The number we want to print is 168 -- 11 * 15 + 3 */
>+++++ +++++ +[-<+++++ +++++ +++++>]<+++

/*
	MEM: >x - assume all cells to the right are 0

	First, make room for our print buffer. We're going to use 0 as a stop
	marker, and set it to print "0\n" by default.

	This way, when it comes time to print our number, we can simply use a
	while loop to walk backwards, printing as we go.
*/
[->>>+<<<]
> +++++ +++++
>>>+++++ + [-<<+++++ +++>>]
<

/* MEM: 0 10 48 >x */

[
	/*
		Do the divmod loop shit in here. We expect that for each time we
		enter this loop, our SP will move to the right one spot.

		For example, if MEM was:
			0 >x

		Then MEM should end up as:
			(x%10)+48 0 >(x/10)
	*/

	/*
		DivMod by 10. Algo from http://esolangs.org/wiki/Brainfuck_algorithms
		IN :  >n d
		OUT:  >0 d-n%d n%d n/d 
	*/
	>+++++ +++++<
	[->-[>+>>]>[+[-<+>]>+>>]<<<<<]

	/* And we don't care about the d-n%d, so get rid of it. */
	>[-]<

	/* MEM: 0 10 48 >0 0 n%d n/d */

	/*
		Create our byte for printing, into the slot to the left of us.
		(0) Zero the slot to the left of us. (Because we did a default "0".)
		(1) Move (n%d) into that slot.
		(2) Add 48 to it.
	*/
	<[-]
	>>>[-<<<+>>>]<<<
	>+++++ + [-<+++++ +++>]

	/* MEM: 0 10 >48+n%d >0 0 0 n/d */
	/* Move n/d to the spot immediately to our right. */
	>>>[-<<+>>]<<
]

#
/* Do the printing. In our test case, we have MEM: 0 10 '8' '6' '1' 0 >0 */
<<[.[-]<]
#

