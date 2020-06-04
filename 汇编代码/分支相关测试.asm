  lui s0,0xfffff  # Õ‚…Ëµÿ÷∑
  
  ori s1,s1,32
  ori s2,s2,34
  j jmp_next1
  addi s1,zero,0
  addi s2,zero,0
jmp_next1:
  beq zero,zero,jmp_next2
  addi s1,zero,0
  addi s2,zero,0
jmp_next2:
  bne zero,s2,jmp_next3
  addi s1,zero,0
  addi s2,zero,0
jmp_next3:
  jal ra, jum_func
  addi s2,zero,10
  nop
  nop
  ori s1,s1,32
  nop
  nop
jum_func:
  addi s1,s1,-1
  nop
  nop
  sw s1,0(s0)
  nop
  nop  
  bne s1,zero,jum_func
  jr ra  