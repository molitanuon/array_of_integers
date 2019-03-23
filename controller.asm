;Author name:   Molita   Nuon
;Program name:  How to Average Integers
;Names of files in this programming:  driver.cpp, controllor.asm, display.c, compute_mean.asm, square.cpp
;Course number: CPSC 240
;Scheduled delivery date:  March 7, 2019
;Program purpose:  Software to assist teachers in computing a class average.
;Status: Finished.  No known bugs
;Date of last modification:  March 5, 2019
;Information about this module: Get the input of integers from user and set up an array of integers
;This module purpose:  Controller for How to Average Integers
;File name of this module:  controller.asm

extern printf
extern scanf
extern display                              ;void display(long [], long size)
extern square                               ;void square(long [], long size)
extern compute_mean                         ;double mean

global controller
;Declare messages

segment .data

initialmessage db "The control module has begun.", 10, 0
instruction db "Instructions: Enter a sequence of integers. Include white space between each number.", 10, 0
terminatemessage db "To terminate press 'Enter' followed by Control+D.", 10, 0
data db "Here are the data as received:", 10, 0
showmean db "The mean of these %ld numbers is %8.4lf.", 10, 0
message db "Here are the squares of the data: ", 10, 0
goodbye db "The control module is now returning to the caller module. Bye.", 10, 0

integerformat db "%ld", 0
stringformat db "%s", 0

segment .bss
myarray resq 100

segment .text
controller:

;Back up all the GPRs
push       rbp
mov        rbp, rsp
push       rbx
push       rcx
push       rdx
push       rsi
push       rdi
push       r8
push       r9
push       r10
push       r11
push       r12
push       r13
push       r14
push       r15
pushf

;=============Show the initial message==========================================
push qword 0
mov rax, 0
mov rdi, stringformat                               ;"%s"
mov rsi, initialmessage                             ;"Welcome to an array...."
call printf
pop rax

;=============Show the Instructions=============================================
push qword -99
mov  rax, 0
mov rdi, stringformat                              ;"%s"
mov rsi, instruction                          ;"Enter a squence of integers...."
call printf
pop rax

;=============How to terminate==================================================
push qword 0
mov rax, 0
mov rdi, stringformat                         ;"%s"
mov rsi, terminatemessage                     ;"To terminate press...."
call printf
pop rax

;=====================Set up Array==============================================
mov r13, 0                                  ;counter
mov r14, myarray                            ;r14 is one section of the array

startloop:

;obtain the integers
mov qword rax, 0
mov rdi, integerformat                      ;"%ld"
mov rsi, r14
call scanf

cdq                                       ;convert a  double to a quad
shl rdx, 32                               ;shift to the left 32 places
or rax, rdx                               ;combines the upper half of rdx with
                                          ;upper half of rax leaving the answer in rax

cmp rax, -1                               ;test if rax == -1

je done                                   ;jump to done if rax == -1
inc r13                                   ;increase r13 by 1
add r14, 8                                ;move to the next address by 8 bit
jmp startloop                             ;jump to the top of the loop
done:                                     ;exit the loop

;=============Show the data by calling display==================================
push qword 0
mov rax, 0
mov rdi, stringformat                     ;"%s"
mov rsi, data                             ;"Here are the data as received:"
call printf
pop rax

mov rax, 0
mov rdi, myarray                     ;pass the array to display first parameter
mov rsi, r13                          ;pass the counter of integer to second parameter
call display

;============Show the mean of the array by calling mean=========================
mov rax, 0
mov rdi, myarray                     ;pass the array to display first parameter
mov rsi, r13                         ;pass the counter of integer to second parameter
call compute_mean

mov rax, 1
mov rdi, showmean                     ;"The mean of these %ld numbers is %8.4lf"
mov rsi, r13                          ;r13 = counter
call printf                           ;build in to call 1 floating in this case

;==========Show the square of each integer in the array by calling square=======
push qword -99
mov rax, 0
mov rdi, stringformat                 ;"%s"
mov rsi, message                      ;"Here are the squares of these data:"
call printf
pop rax

mov rax, 0
mov rdi, myarray                      ;pass array as first parameter
mov rsi, r13                          ;pass counter as second parameter
call square

mov qword rax, 0
mov rdi, myarray                      ;pass array as first parameter
mov rsi, r13                          ;pass counter as second parameter
call display

;============Show the goodbye message===========================================
mov qword rax, 0
mov rdi, stringformat                   ;"%s"
mov rsi, goodbye                        ;"The control module is now returning...."
call printf

movsd xmm0, xmm3                        ;return mean to the caller modle

;Restore GPR values
popf
pop        r15
pop        r14
pop        r13
pop        r12
pop        r11
pop        r10
pop        r9
pop        r8
pop        rdi
pop        rsi
pop        rdx
pop        rcx
pop        rbx
pop        rbp

ret
