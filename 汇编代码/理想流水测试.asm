lui s0,0xfffff  # Õ‚…Ëµÿ÷∑

ori s1,s1,0x123
ori t0,t0,0x1
ori t1,t1,0x12
ori t2,t2,0x123
sw t0,0(s0)
sw t1,0(s0)
sw t2,0(s0)

# 7-Segment Display
slli t0,s1,4
slli t1,s1,8
slli t2,s1,12
sw t0,0(s0)
sw t1,0(s0)
sw t2,0(s0)
slli t0,s1,16
slli t1,s1,20
nop
sw t0,0(s0)
sw t1,0(s0)





