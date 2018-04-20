.data
A: .word 
B: .word
C: .word

.text
addi t0,zero,5 # i = 5
addi t1,zero,10 # j = 10

add a2,zero,t0
addi sp,sp,-4
sw t1,0(sp)
j ADDITUP
mv t0,a2
lw t1,0(sp)
addi sp,sp,4
sw a0,A

mv a2,t2
addi sp,sp,-4
sw t0,0(sp)
j ADDITUP
mv t1,a2
lw t0,0(sp)
addi sp,sp,4
sw a0,B,t6

lw t2,A
lw t3,B
add t4,t2,t3
sw t4,C

j EXIT

ADDITUP:
mv t0,zero
mv a0,zero
j LOOP
ret

LOOP:
BLT a2,t0,4(ra)
add a0,a0,t0
addi a0,a0,1
j LOOP



EXIT:

