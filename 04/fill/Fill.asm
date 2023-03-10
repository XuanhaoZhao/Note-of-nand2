// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.


// BLACKEN(){
// 	for(int i = )
//}
// while(1){
//	if(KBD) Blacken();
//  else CLEAR();
//}

// 24576为键盘的地址 16384 - 24575刚好8k为屏幕的地址

	@24575
	D = A
	@R0
	M = D
	// R0存储最大地址

	@SCREEN
	D = A
	// R1存储当前地址
	@R1
	M = D

(LOOP)
	@KBD
	D = M
	@FILL
	D;JGT

	@CLEAR
	0;JMP

(FILL)
	// 判断屏幕是否为满
	@R0
	D = M
	@R1
	D = D - M
	@LOOP
	D;JLT

	@R1
	// 存储R1当前地址
	D = M
	// 将当前地址推入A
	A = M

	// 将地址对应的屏幕位置变黑
	// 如果使用 1，翻译成二进制是 0000000000000001
	// -1 翻译成二进制是 1111111111111111
	// 如果表示在屏幕上，1 有 15 位是空白的，1位是黑的
	// -1 则屏幕上的 16 位全是黑色
	
	M = -1
	// 赋值为黑色 

	@R1
	M = D + 1

	@LOOP
	0;JMP

(CLEAR)
	// 判断屏幕是否为空
	@SCREEN
	D = A
	@R1
	D = D - M
	@LOOP
	D;JGT

	@R1
	D = M
	A = M

	M = 0
	// 赋值为白色

	@R1
	M = D - 1

	@LOOP
	0;JMP
