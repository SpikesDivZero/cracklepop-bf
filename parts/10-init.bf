/*
	First, our constant strings.

	Crackle\0
	sp 0, len = 8
	[67, 114, 97, 99, 107, 108, 101, 0]

	Pop\0
	sp 8, len = 4
	[80, 111, 112, 0]

	\n\0
	sp 0, len = 2
	[10, 0]
*/

>>>>> >>>>> >>>>
+++++ +++++
[
	-
	<                \0
	< +              \n
	<                \0
	< +++++ +++++ +  p
	< +++++ +++++ +  o
	< +++++ +++      P
	<                \0
	< +++++ +++++    e
	< +++++ +++++ +  l
	< +++++ +++++ +  k
	< +++++ +++++    c
	< +++++ +++++    a
	< +++++ +++++ +  r
	< +++++ ++       C
	>>>>> >>>>> >>>>
]
<       \0
<       \n
<       \0
< ++     p
< +      o
<        P
<       \0
< +      e
< --     l
< ---    k
< -      c
< ---    a
< ++++   r
< ---    C
>>>>> >>>>> >>>>



/*
	Let's just move to the next line of stack, giving us a new base addr at 0x10.
	We actually don't need this, but it makes it easier to debug things when
	looking at the stack dumps.
*/

>>

/* STATE:
Stack Position: 0010
Stack:
0000000: 4372 6163 6b6c 6500 506f 7000 0a00 0000  Crackle.Pop.....
0000010: 00                                       .               
*/
