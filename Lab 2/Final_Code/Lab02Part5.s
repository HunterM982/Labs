.data
A: .word 0
B: .word 0
C: .word 0

.text
main:
	addi t0,zero,5 # i = 5
	addi t1,zero,10 # j = 10
	
	# Call 1
	addi sp,sp,-8
	sw t0,0(sp)
	sw t1,4(sp)
	
	mv a0,t0
	jal additup
	
	lw t1,4(sp)
	lw t0,0(sp)
	addi sp,sp,8
	
	la t6,A
	sw a0,0(t6)
	
	# Call 2
	addi sp,sp,-8
	sw t0,0(sp)
	sw t1,4(sp)
	
	mv a0,t1
	jal additup
	
	lw t1,4(sp)
	lw t0,0(sp)
	addi sp,sp,8
	
	la t6,B
	sw a0,0(t6)
	
	# Operation
	lw t6,A
	lw t5,B
	la t4,C
	add t6,t6,t5
	sw t6,0(t4)
	
	j exit
	
additup:
	mv t0,zero # i = 0
	mv t2,zero # x = 0
	mv t1,a0 # n = arg
loopstart: 
	addi t2,t2,1 
	add t2,t2,t0
	addi t0,t0,1 # i++
	BLT t0,t1,loopstart # if i < n then loop
	mv a0,t2
	ret 
exit: