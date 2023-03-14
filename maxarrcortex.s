.syntax unified
.cpu cortex-a9

.section .data
arr:   .word  5, 10, 15, 20, 25  @ the array data
size:  .word  5                   @ the size of the array

.section .text
.global main

main:
    @ initialize registers
    ldr r0, =arr   @ load the address of the array into r0
    ldr r1, =size  @ load the address of the size into r1
    ldr r2, [r1]   @ load the size value into r2
    mov r3, #0     @ set r3 to 0 to store the maximum value
    
    @ loop over the array
    loop:
        cmp r2, #0         @ check if we've reached the end of the array
        beq end_loop       @ if so, exit the loop
        ldr r4, [r0], #4   @ load the next element of the array into r4, and increment the address by 4
        cmp r4, r3         @ compare the value in r4 to the current maximum in r3
        bgt update_max     @ if r4 is greater than r3, jump to update_max
        subs r2, r2, #1    @ decrement r2 to move to the next element of the array
        b loop             @ jump back to the top of the loop
    
    update_max:
        mov r3, r4         @ set r3 to the new maximum value
        subs r2, r2, #1    @ decrement r2 to move to the next element of the array
        b loop             @ jump back to the top of the loop
    
    end_loop:
        mov r0, r3         @ store the maximum value in r0 to return from the function
        bx lr             @ return from the function
