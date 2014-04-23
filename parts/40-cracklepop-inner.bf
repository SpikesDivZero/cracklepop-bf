/* SEGMENT: 10-init.min.bf */
>>>>>>>>>>>>>>++++++++++[-<<+<<+++++++++++<+++++++++++<++++++++<<++++++++++<+++
++++++++<+++++++++++<++++++++++<++++++++++<+++++++++++<+++++++>>>>>>>>>>>>>>]<<
<<++<+<<<+<--<---<-<---<++++<--->>>>>>>>>>>>>>>>



/* SEGMENT: DEBUG - pretend like we've entered our loop */
> +++++ +++++ [ - < +++++ +++++ > ] <    /* Set *sp=100 - just to fake a test value */
> [-]                                    /* Set *sp=0 - should we print newline or number? */

/* Simulate how far we are in our counting process */
   > +                    /* sp=1  */
/*   > +++                  /* sp=3  */
/*   > +++++                /* sp=5  */
/*   > +++++ +++++ +++++    /* sp=15 */

/* STATE:
	Stack Position: 0012
	0000000: 4372 6163 6b6c 6500 506f 7000 0a00 0000  Crackle.Pop.....
	0000010: 6400 03                                  d..             

	REGISTERS:
		0x10 => countdown (so we can count to 100)
		0x11 => should we print the number or a newline? (true = newline, false = number)
		0x12 => our counter (counting up)
*/



/* First, see if our number is divisible by 3. */
>> +++ <<                                   /*  dividend = 3  */
[->+>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-<+>]<   /*  ALGO: divmod-preserve.min.bf  --  >n 0 d-n%d n%d n/d 0 0  */
>> [-] >> [-] <<<<                          /*  Discard d-n%d and n/d  */
>>>                                         /*  Go to n%d  */

/*  if (*sp == 0) -- [tmp1, x, tmp0]  */
>[-]+<<[-]>[>-<[<+>-]]<[>+<-]>>
[
	-    /* Zero tmp0, now that we no longer need it. tmp1 is also already 0  */

	<<<<< <<<<< <<<<< <<<<< <<    /* Move over to where Crackle is. */
	[.>]                          /* puts("Crackle") -- advances sp 8 positions */
	>>>>> >>>>> >>>>>             /* Move back to where we started this loop at */

	<<<<<+                        /* Set should_print_number to false, since we printed something. */
	>>>>>                         /* End our test at tmp0 */
]
<[-]    /* zero x */
<<<     /* return to n */



/* Now, see if our number is divisible by 5. Same as above, except for the inner parts. */
>> +++++ <<
[->+>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-<+>]<
>> [-] >> [-] <<<<
>>>

>[-]+<<[-]>[>-<[<+>-]]<[>+<-]>>
[
	-    /* Zero tmp0, tmp1 already 0 as well. */

	<<<<< <<<<< <<<<               /* Move over to where Pop is. */
	[.>]                           /* puts("Pop") -- advances sp 4 positions */
	>>>>> >>>>> >                  /* Move back to where we started this loop at */

	<<<<<+                         /* Set should_print_number to false, since we printed something. */
	>>>>>                         /* End our test at tmp0 */
]
<[-]    /* zero x */
<<<     /* return to n */



/*
	Okay, so, if we printed either Crackle or Pop, we need to put a newline.
	Otherwise, we'll print the number as text.

	Stack Position: 0012
	0000000: 4372 6163 6b6c 6500 506f 7000 0a00 0000  Crackle.Pop.....
	0000010: 6402 0f00 0000 0000 00                   d........       

	MEM for the next steps:   printed >n tmp1
*/
>+    /* Set tmp1 to true */
<<    /* Go to printed */
[
	[-]                   /* zero printed                */
    +++++ +++++ . [-]     /* putchar('\n') and zero again */
    >>-                   /* set tmp1 to false, since we entered our if condition */
    <<                    /* Return to printed (false) */
]
>>    /* Go to tmp1 */
[
	[-]    /* zero tmp1 */
	<      /* go to n */


	/* ALGO: print-num.min.bf */
	[->>+<<]>>[-<+<+>>]<[->>>+<<<]>++++++++++>>>++++++[-<<++++++++>>]<[>+++
	+++++++<[->-[>+>>]>[+[-<+>]>+>>]<<<<<]>[-]<<[-]>>>[-<<<+>>>]<<<>++++++[
	-<++++++++>]>>>[-<<+>>]<<]<<[.[-]<]<

	>     /* go back to tmp1 (false) */
]
<    /* go to n to end this magic */

!