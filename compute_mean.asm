;Author name:   Molita   Nuon
;Program name:  How to Average Integers
;Names of files in this programming:  driver.cpp, controllor.asm, display.c, compute_mean.asm, square.cpp
;Course number: CPSC 240
;Scheduled delivery date:  March 7, 2019
;Program purpose:  Software to assist teachers in computing a class average.
;Status: Finished.  No known bugs
;Date of last modification:  March 5, 2019
;Information about this module: Compute the mean of the array
;This module purpose:  Mean for How to Average Integers
;File name of this module:  compute_mean.asm


global compute_mean

segment .text
compute_mean:

;Back up
push r12

mov r11, 0                            ;counter
mov r12, 0                            ;sum

sumloop:
mov rax, qword[rdi+r11*8]             ;get myarray[i]
add r12, rax                          ;add to sum
inc r11                               ;increase by 1
cmp r11, rsi                          ;compare the counter to the size of myarray
jb sumloop                            ;just below, jump to sumloop

cvtsi2sd xmm3, r12                    ;convert integer to a floating point
cvtsi2sd xmm4, r11                    ;convert integer to a floating point
divsd xmm3, xmm4                      ;divide sum by count
movsd xmm0, xmm3                      ;move the mean in xmm3 to xmm0

pop r12

ret
