// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.
// 3 * 2 换算成2个3相加

//int RAM[2] = 0,i = 0;
//for(i = 0; i < RAM[1];i++){
//	RAM[2] = RAM[2] + RAM[0];
//}
// output:RAM[2]

	@R2
	M = 0

	@i
	M = 0

	// 检查RAM[0]是否小于0
	@R0
	D = M
	@END
	D;JLE
(LOOP)
	@R1
	D = M
	@i
	D = D - M
	@END
	D;JLE// RAM[1] == RAM[i] break

	@i
	M = M + 1
	@R0
	D = M
	@R2
	M = M + D

	@LOOP
	0;JMP

(END)
	@END
	0;JMP