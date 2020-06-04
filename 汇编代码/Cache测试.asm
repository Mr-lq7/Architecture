	lui s2,0xfffff  # 外设地址
	lui s3,0x80000  # ROM数据地址
	addi s4,zero,4	# 4 个字节，常量

	addi s6,zero,8	# N
	addi s7,zero,0  # i
m1:
	addi s8,zero,8	# M
	addi s9,zero,0  # j
m2:
	mul t2,s7,s8	# i * M	
	add t2,t2,s9    # i * M + j
	
	mul t0,t2,s4	# A[i * M + j]相对地址
	add t1,t0,s3	# 加上ROM外部地址，即A[i * M + j]的绝对地址
	lw t3,0(t1) 	# 读出A[i * M + j]的值
	
	mul t4,s6,s8	# 找到B[i * M + j]的相对地址 = A总个数 * 4个字节
	mul t4,t4,s4	# * 4
	add t5,t1,t4	# 加上ROM外部地址，即B[i * M + j]的绝对地址
	lw t6,0(t5)	# 读出B[i * M + j]的值
	
	add s10,t3,t6 	# A + B
	#sw s10,0(t0)	# 将 A + B的结果存储到RAM中

######################################
# 将A + B的结果显示到TTY终端
######################################				
ASCII_loop:
	addi t2,zero,4 		# 一个32位数据有4个字节，需要循环4次
	addi t3,zero,0
	add t4,s10,zero 	# 将要显示的数据保存到临时变量t4中
loop1:  
	andi t1,t4,0xF  	# 取低4位
	sltiu t5,t1,0xA		# 与0xA进行比较
	bne t5,zero,loop2 	# 如果小于0xA，则跳转到loop2
	addi t1,t1,0x7  	# 在0xA~0xF之间，需多加上7
loop2:
	addi t1,t1,0x30 	# 转成相应的ASCII码
	slli t3,t3,8 		# 将t3寄存器左移8个bit
	add t3,t3,t1 		# 依次将转成的ASCII码，从高位到低拷贝到t3寄存器中，即将4个ASCII数据都存放到t3寄存器中	
		
	srli t4,t4,4 		# t0右移4位，继续循环转换ASCII
	addi t2,t2,-1 		# 循环次数减一
	bne t2,zero,loop1 	# 当循环4次后，则转换一个32bit数据的ASCII完成

loop3:				#  将转换ASCII后的数据显示到TTY中
	addi t6,t3,0		# 将转换后的数据赋值给t6
	andi t6,t6,0xFF 	# 取t6的最低8位
	sw t6,8(s2) 		# 写到TTY中
	srli t3,t3,8 		# 将t5右移8bit，显示下一个ASCII数据
	bne t3,zero,loop3 	# 当t5右移4次后，则一个32bit数据显示完成
	
	addi t6,zero,0x20	# 显示空格，两个32bit数之间用空格隔开
	sw t6,8(s2)		# 写到TTY中
######################################	

	addi s9,s9,1		# j++
	bne s9,s8,m2		# 循环
	
	addi s7,s7,1		# i++
	bne s7,s6,m1		# 循环
	
		

	   	 
															
