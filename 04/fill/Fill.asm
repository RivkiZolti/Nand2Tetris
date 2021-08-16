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

(CHANGE_SCREEN)
    @KBD
    D=M
    @WHITE
    D;JEQ
    @BLACK
(BLACK)
    @SCREEN
    D=A
    @i
    M=D
    (LOOP_BLACK)
        @i
        D=M
        @KBD
        D=D-A
        @STOP_LOOP_BLACK
        D;JGE
        @KBD
        D=M
        @WHITE
        D;JEQ
        @i
        A=M
        M=-1
        @i
        M=M+1
        @LOOP_BLACK
        0;JMP
    (STOP_LOOP_BLACK)
        @CHANGE_SCREEN
        0;JMP


(WHITE)
    @SCREEN
    D=A
    @i
    M=D
    (LOOP_WHITE)
        @i
        D=M
        @KBD
        D=D-A
        @STOP_LOOP_WHITE
        D;JGE
        @KBD
        D=M
        @BLACK
        D;JNE
        @i
        A=M
        M=0
        @i
        M=M+1
        @LOOP_WHITE
        0;JMP
    (STOP_LOOP_WHITE)
        @CHANGE_SCREEN
        0;JMP
