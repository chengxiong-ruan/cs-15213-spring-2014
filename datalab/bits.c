/* 
 * CS:APP Data Lab 
 * 
 * <Please put your name and userid here>
 * 
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.  
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:
 
  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code 
  must conform to the following style:
 
  int Funct(arg1, arg2, ...) {
      /* brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
      not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. Unary integer operations ! ~
  4. Binary integer operations & ^ | + << >>
    
  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
     cannot use arrays, structs, or unions.

 
  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting an integer by more
     than the word size.

EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   */
  int pow2plus1(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     return (1 << x) + 1;
  }

  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
   */
  int pow2plus4(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     int result = (1 << x);
     result += 4;
     return result;
  }

FLOATING POINT CODING RULES

For the problems that require you to implent floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants.

You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
     cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.


NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to 
     check the legality of your solutions.
  2. Each function has a maximum number of operators (! ~ & ^ | + << >>)
     that you are allowed to use for your implementation of the function. 
     The max operator count is checked by dlc. Note that '=' is not 
     counted; you may use as many of these as you want without penalty.
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies 
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 * 
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce 
 *      the correct answers.
 */


#endif
/* 
 * evenBits - return word with all even-numbered bits set to 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 8
 *   Rating: 1
 */
int evenBits(void) {
  /*
  * 0x55 in binary is 01010101
  * copy 0x55 to each byte of a word by shifting it :)
  */
  int x;
  x = (0x55<<8) | 0x55;
  return x<<16|x;
}

/* 
 * isEqual - return 1 if x == y, and 0 otherwise 
 *   Examples: isEqual(5,5) = 1, isEqual(4,5) = 0
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 5
 *   Rating: 2
 */
int isEqual(int x, int y) {
  /*
  * if x==y, x^y would return 0
  */
  return !(x^y);
}
/* 
 * byteSwap - swaps the nth byte and the mth byte
 *  Examples: byteSwap(0x12345678, 1, 3) = 0x56341278
 *            byteSwap(0xDEADBEEF, 0, 2) = 0xDEEFBEAD
 *  You may assume that 0 <= n <= 3, 0 <= m <= 3
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 25
 *  Rating: 2
 */
int byteSwap(int x, int n, int m) {
  /*
  * extract the two bytes we want to swap,
  * shift them to the exact position we want,
  * and then map them to x
  */
  int shiftm;
  int shiftn;
  int mskm;
  int mskn;
  int bytem;
  int byten;
  int newx;
  //get mask for byte extraction
  shiftm = m<<3;
  shiftn = n<<3;
  mskm = 0xff<<shiftm;
  mskn = 0xff<<shiftn;
  //extracting the tow bytes and shift them to the least significant bytes,
  //mask them using 0xff
  bytem = ((x&mskm)>>shiftm)&0xff;
  byten = ((x&mskn)>>shiftn)&0xff;
  //set bits of the two bytes in x to zero
  newx = ((~(mskm|mskn))&x);
  //shift the extracted bytes and map them to x
  newx = newx |(bytem<<shiftn)|(byten<<shiftm);  
  return newx;
}
/* 
 * rotateRight - Rotate x to the right by n
 *   Can assume that 0 <= n <= 31
 *   Examples: rotateRight(0x87654321,4) = 0x18765432
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 25
 *   Rating: 3 
 */
int rotateRight(int x, int n) {
  /*
  * the idea is to swap the n bits from right to left,
  * which is equal to rotate them
  */
  int left_shift_num;
  int left_bits;
  int right_bits;
  left_shift_num = ((~n)&0x1f) + 1; //shift_count+n=32
  left_bits = x<<left_shift_num; //shift right bits to left
  right_bits = (x>>n)&(~((~0)<<left_shift_num)); //shift left bits to right and mask the n significant bits
  return left_bits | right_bits;
}
/* 
 * logicalNeg - implement the ! operator, using all of 
 *              the legal operators except !
 *   Examples: logicalNeg(3) = 0, logicalNeg(0) = 1
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 4 
 */
int logicalNeg(int x) {
  /*
  * if an x's negative has a sign bit different from x,
  * then x is none zero (positive),
  * x's negative is ~x+1
  */
  int notX;
  int rslt;
  notX=~x;
  rslt = (((~(notX+1))&notX)>>31); //as said before, if x is none zero, then rslt has 0 as its sign bit
  rslt = rslt&1; //set other bits to zero except the least significant one
  return rslt;
}
/* 
 * TMax - return maximum two's complement integer 
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 4
 *   Rating: 1
 */
int tmax(void) {
  /*
  * tmax is 0x7fffffff, which is Not(0x10000000)
  * and we can get 0x10000000 by shift 0x1 31 bits to the left
  */
  return ~(1<<31);
}
/* 
 * sign - return 1 if positive, 0 if zero, and -1 if negative
 *  Examples: sign(130) = 1
 *            sign(-23) = -1
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 10
 *  Rating: 2
 */
int sign(int x) {
    int sign; 
    int b_non_zero;
    sign = x>>31; //if x is negative, sign=0xffffffff, or it would be 0x0
    b_non_zero = !(!x); //if x is non-zero, !x is 0x0, then b_non_zero is 0x1, or it would be 0x0
    /* 
    * so, if x is negative, 0xffffffff | 0x1 = -1;
    * if x is positive, 0x0 | 0x1 = 1;
    * if x is zero, 0x0 | 0x0 = 0;
    */
    return sign | b_non_zero;
}
/* 
 * isGreater - if x > y  then return 1, else return 0 
 *   Example: isGreater(4,5) = 0, isGreater(5,4) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
int isGreater(int x, int y) {
  /*
  * idea: if x is greater than y, then x+(-y)>0
  * in case of x and y have different sign bits, x+(-y) may overflow,
  * but we can know that if x and y have different sign, and if x is negative,
  * then x<y, if x is positive, x>y
  */
  int bdiffsign;  //if x and y have different sign
  int z;          // z = x-y = x+(-y)
  int bsubgreat;  //test is x-y>0
  int bxgz;       //x greater than zero
  int rslt;
  bdiffsign = ((x^y)>>31)&1;      //check whether x and y have different sign bits
  z=x+(~y+1);     //z = x+(-y)
  bsubgreat = ~(z>>31) & !(!z);   //if z is great than zero, then bsubgreat is 1
  bxgz = !((x>>31)&1);  //check whether x is a positive number

  //if x and y have different sign bits, and if x is positive, then x>y;
  //or, if x and y have same sign bits and if z>0, then x>y
  rslt = (bdiffsign&bxgz) | ((!bdiffsign)&bsubgreat);
  return rslt;
}
/* 
 * subOK - Determine if can compute x-y without overflow
 *   Example: subOK(0x80000000,0x80000000) = 1,
 *            subOK(0x80000000,0x70000000) = 0, 
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3
 */
int subOK(int x, int y) {
  /*
  * "x-y without overflow" is equal to "x+(-y) without overflow"
  * rule 1: if x>=0 , y<0 and x-y<0, then overflow
  * rule 2: if x<0 , y>=0 and x-y>=0, then overflow
  * an special case: x>=0 and y=0x80000000, this would satisfy rule 1
  */
  int negy;
  int sub;
  int bsubsz;
  int bsubgz;
  int bxsz;
  int bxgz;
  int bysz;
  int bygz;
  int bneg_over;
  int bpos_over;
  int rslt;
  negy=(~y+1); // negy=-y
  sub=x+negy; //sub=x-y
  bsubsz = sub>>31; //if x-y smaller than 0, bsubsz=1
  bsubgz = ~bsubsz;     //x-y>=0
  bxsz = x>>31;     //if x smaller than 0, bxsz=1
  bxgz = ~bxsz;         //x>=0
  bysz = y>>31;     //if y smaller than 0, bysz=1
  bygz = ~bysz;         //y>=0
  bneg_over = bxsz&bygz&bsubgz; //check if negative overflow
  bpos_over = bxgz&bysz&bsubsz; //check if positive overflow
  rslt = !(bneg_over|bpos_over);
  return rslt;
}
/*
 * satAdd - adds two numbers but when positive overflow occurs, returns
 *          maximum possible value, and when negative overflow occurs,
 *          it returns minimum positive value.
 *   Examples: satAdd(0x40000000,0x40000000) = 0x7fffffff
 *             satAdd(0x80000000,0xffffffff) = 0x80000000
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 30
 *   Rating: 4
 */
int satAdd(int x, int y) {
  /*
  * Firstly, check if there is overflow when x+y
  * if x<0, y<0 and x+y>0, then negative overflow
  * if x>0, y>0 and x+y<0, then positive overflow
  * quite similar to function "subOK" above
  */
  int sum; //sum=x+y
  int bsumsz;
  int bsumgz;
  int bxsz;
  int bxgz;
  int bysz;
  int bygz;
  int bneg_over; //negative overflow
  int bpos_over; //positive overflow
  int bover; //overflow
  int rslt;
  sum=x+y; //sum=x+y
  bsumsz = sum>>31;
  bsumgz = ~bsumsz;
  bxsz = x>>31;
  bxgz = ~bxsz;
  bysz = y>>31;
  bygz = ~bysz;
  bneg_over = bxsz&bysz&bsumgz; //negative overflow
  bpos_over = bxgz&bygz&bsumsz; //positive overflow
  bover = bneg_over|bpos_over; //overflow
  rslt = ((~bover)&sum)|(bneg_over&(1<<31))|(bpos_over&(~(1<<31)));
  return rslt;
}
/* howManyBits - return the minimum number of bits required to represent x in
 *             two's complement
 *  Examples: howManyBits(12) = 5
 *            howManyBits(298) = 10
 *            howManyBits(-5) = 4
 *            howManyBits(0)  = 1
 *            howManyBits(-1) = 1
 *            howManyBits(0x80000000) = 32
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 90
 *  Rating: 4
 */
int howManyBits(int x) {
  /*
  * Firstly, we get y=|x|, then we find smallest (2^k-1) larger than y
  * finally, we count the number of bits with value 1 using hamming weight.
  * we have to add 1 sign bit to the result, now we get what we want
  * there are two special case:
  * when x=0, return 1
  * when x=0x80000000, return 32
  * we should also consider situations, where x=-2^k, which is similar to 2^k, but need one less bit
  */
  int rslt;
  int xsign;    //if x<0 xsign is 0xffffffff, or xsign is 0x0
  int bzero;    // bzero=0xffffffff when x=0
  int btmin;    // if x=0x80000000, btmin=0xffffffff
  int xnpower;  // let y is the smallest 2^k larger than x, then xnpower=y-1
  int count=0;  // count how many bits should we use
  int bp2;      // bp2=1 when x is 2^k
  int posmask;  // position mask for hamming weight method
  xsign = x>>31;
  bp2 = x & (x+~0);
  bp2 = !bp2;
  bzero = !x;
  bzero = ~bzero+1;
  btmin =  x ^ (1<<31);
  btmin = !btmin;
  btmin = ~btmin+1;

  xnpower = x;
  xnpower = ((~xsign)&xnpower) | (xsign & ((~xnpower +1))); //get xnpower=|x|
  /*
  * to make sure that we get an answer different to x=2^k when x=-2^k, since -2^k needs one less bit than 2^k.
  * we subtract 1 from |x|
  * now we would lost 1 bit for x=2^k, but we will plus 1 bit to count for x=2^k in final steps
  */
  xnpower = xnpower + ((1<<31)>>31);
  //to make 2^k-1 by shifting to right
  xnpower = xnpower | xnpower>>1;
  xnpower = xnpower | xnpower>>2;
  xnpower = xnpower | xnpower>>4;
  xnpower = xnpower | xnpower>>8;
  xnpower = xnpower | xnpower>>16;

  //count number of bits with value '1' using "hamming weight" method
  posmask = 0x55 | 0x55<<8;
  posmask = posmask | posmask<<16;
  xnpower = (xnpower&posmask) + ((xnpower>>1)&posmask);
  posmask = 0x33 | 0x33<<8;
  posmask = posmask | posmask<<16;
  xnpower = (xnpower&posmask) + ((xnpower>>2)&posmask);
  posmask = 0x0f | 0x0f<<8;
  posmask = posmask | posmask<<16;
  xnpower = (xnpower&posmask) + ((xnpower>>4)&posmask);
  posmask = 0xff | 0xff<<16;
  xnpower = (xnpower&posmask) + ((xnpower>>8)&posmask);
  posmask = 0xff | 0xff<<8;
  xnpower = (xnpower&posmask) + ((xnpower>>16)&posmask);

  count = count+xnpower;
  count += bp2; //if x is 2^k, count=count+1
  count = count+1; //add 1 bit for sign
  /*
  * merge results in three different situations by "|"
  * the first one is normal situation
  * the second one is "x=0"
  * the third one is "x=0x80000000"
  */
  rslt = ( ( (~btmin)& (count & (~bzero) )) | (bzero & 1))|(btmin&32);
  return rslt;
}
/* 
 * float_half - Return bit-level equivalent of expression 0.5*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   uWhen argment is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned float_half(unsigned uf) {
  /*
  *  we can see uf*0.5 as uf/2
  */
  unsigned int exp_bits;
  unsigned int frac_bits;
  unsigned int sign;
  unsigned int rslt;
  unsigned int exp_nzero;
  exp_bits = uf&0x7f800000; //exp bits
  frac_bits = uf&0x007fffff;//frac bits
  sign = uf&0x80000000;     //sign bit
  exp_nzero = exp_bits;     //check if exp bits are zero

  //if it's not an number (exp bits are all 1)
  if (exp_bits==0x7f800000)
  {
    return uf;
  }

  //if exp bits are not all zeros, subtract 1 from the exponent
  if (exp_bits)
  {
    exp_bits = exp_bits-0x00800000;
  }

  //now we check exp bits again
  //if they are all zeros we have to do shifts on frac bits to do divesion by 2
  //else, we already got the right answer
  if (!exp_bits)
  {
    //if the original exp bits are not all zeros
    //we need to plus 1 to frac_bits, as there is a free bit 1 when uf is normalized float
    if (exp_nzero)
    {
      frac_bits = (frac_bits|0x800000);
    }
    //check if we need to do "rounding"
    if ((frac_bits&0x3)==0x3)
    {
      frac_bits = frac_bits + 0x1;
    }
    //divide by shifting (already consider rounding in previous steps)
    frac_bits = frac_bits>>1;
  }
  //put all bits together
  rslt = exp_bits+frac_bits+sign;
  return rslt;
}
/* 
 * float_f2i - Return bit-level equivalent of expression (int) f
 *   for floating point argument f.
 *   Argument is passed as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point value.
 *   Anything out of range (including NaN and infinity) should return
 *   0x80000000u.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
int float_f2i(unsigned uf) {
   /*
   * int's range is -2^31~2^31-1
   * E=exp-bias should range from 0 to 30
   */
   int exp_bits = (uf >> 23) & 0xFF;
   int frac_bits = uf & 0x7FFFFF;
   int e_minus_bias;
   int sign = uf>>31;
   int rslt;
   
   //if exp bits are all one, uf is not an number
   if(exp_bits == 0xff)
      return 0x80000000u;
   
   e_minus_bias = exp_bits - 127;
   //if E<0 or exp bits are all zeros
   if((e_minus_bias < 0) | (!exp_bits))
      return 0;
   //if (E)>30, 2^E is out of range
   if(e_minus_bias > 30)
      return 0x80000000u;

    //plus 1 to frac, since exp are not all zeros
    rslt = frac_bits + 0x800000;
    //since number of frac bits is 23
    //we only have to do little shifts on frac bits
    if (e_minus_bias<23)
      rslt = rslt >> (23 -e_minus_bias);
    else
      rslt = rslt << (e_minus_bias-23); 

   //get negative number if sign bit is 1
   if(sign) 
      return ~rslt + 1;

   return rslt;
}
