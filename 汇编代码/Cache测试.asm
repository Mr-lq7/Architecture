	lui s2,0xfffff  # �����ַ
	lui s3,0x80000  # ROM���ݵ�ַ
	addi s4,zero,4	# 4 ���ֽڣ�����

	addi s6,zero,8	# N
	addi s7,zero,0  # i
m1:
	addi s8,zero,8	# M
	addi s9,zero,0  # j
m2:
	mul t2,s7,s8	# i * M	
	add t2,t2,s9    # i * M + j
	
	mul t0,t2,s4	# A[i * M + j]��Ե�ַ
	add t1,t0,s3	# ����ROM�ⲿ��ַ����A[i * M + j]�ľ��Ե�ַ
	lw t3,0(t1) 	# ����A[i * M + j]��ֵ
	
	mul t4,s6,s8	# �ҵ�B[i * M + j]����Ե�ַ = A�ܸ��� * 4���ֽ�
	mul t4,t4,s4	# * 4
	add t5,t1,t4	# ����ROM�ⲿ��ַ����B[i * M + j]�ľ��Ե�ַ
	lw t6,0(t5)	# ����B[i * M + j]��ֵ
	
	add s10,t3,t6 	# A + B
	#sw s10,0(t0)	# �� A + B�Ľ���洢��RAM��

######################################
# ��A + B�Ľ����ʾ��TTY�ն�
######################################				
ASCII_loop:
	addi t2,zero,4 		# һ��32λ������4���ֽڣ���Ҫѭ��4��
	addi t3,zero,0
	add t4,s10,zero 	# ��Ҫ��ʾ�����ݱ��浽��ʱ����t4��
loop1:  
	andi t1,t4,0xF  	# ȡ��4λ
	sltiu t5,t1,0xA		# ��0xA���бȽ�
	bne t5,zero,loop2 	# ���С��0xA������ת��loop2
	addi t1,t1,0x7  	# ��0xA~0xF֮�䣬������7
loop2:
	addi t1,t1,0x30 	# ת����Ӧ��ASCII��
	slli t3,t3,8 		# ��t3�Ĵ�������8��bit
	add t3,t3,t1 		# ���ν�ת�ɵ�ASCII�룬�Ӹ�λ���Ϳ�����t3�Ĵ����У�����4��ASCII���ݶ���ŵ�t3�Ĵ�����	
		
	srli t4,t4,4 		# t0����4λ������ѭ��ת��ASCII
	addi t2,t2,-1 		# ѭ��������һ
	bne t2,zero,loop1 	# ��ѭ��4�κ���ת��һ��32bit���ݵ�ASCII���

loop3:				#  ��ת��ASCII���������ʾ��TTY��
	addi t6,t3,0		# ��ת��������ݸ�ֵ��t6
	andi t6,t6,0xFF 	# ȡt6�����8λ
	sw t6,8(s2) 		# д��TTY��
	srli t3,t3,8 		# ��t5����8bit����ʾ��һ��ASCII����
	bne t3,zero,loop3 	# ��t5����4�κ���һ��32bit������ʾ���
	
	addi t6,zero,0x20	# ��ʾ�ո�����32bit��֮���ÿո����
	sw t6,8(s2)		# д��TTY��
######################################	

	addi s9,s9,1		# j++
	bne s9,s8,m2		# ѭ��
	
	addi s7,s7,1		# i++
	bne s7,s6,m1		# ѭ��
	
		

	   	 
															
