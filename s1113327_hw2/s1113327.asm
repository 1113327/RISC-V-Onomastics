.data
str0: .string "s1113327\n"
str1: .string "Please enter the strokes of the first character of the last name = "
str2: .string "Please enter the strokes of the second character of the last name = "
str3: .string "Please enter the strokes of the first character of the first name = "
str4: .string "Please enter the strokes of the second character of the first name = "
str5: .string "Sky= "
str6: .string "People= "
str7: .string "Land= "
str8: .string "Outside= "
str9: .string "Total= "
str10: .string "\n"
str11: .string " Metal"
str12: .string " Wood"
str13: .string " Water"
str14: .string " Fire"
str15: .string " Earth"
str16:.string"Sky"
str17:.string"People"
str18:.string"Land"
str19:.string"Oustside"
str20:.string"Total"
str21:.string " generate "
str22:.string " restraint "
str23:.string " equal "


.global __start

 .text
 #main:
  __start:
	la a0, str0			# prepare to print string "s1113327\n"
	li a7, 4			# print string
	ecall
	
	la a0, str1			# prepare to print string "Please enter the strokes of the first character of the last name = "
	li a7, 4			# print string
	ecall

	jal LastNameOne		# return the result a0	
	mv s0,a0			# Set s0 equal to LastNameOne

	la a0, str2			# prepare to print string "Please enter the strokes of the second character of the last name ="
	li a7, 4			# print string
	ecall

	jal LastNameTwo		# return the result a0	
	mv s1,a0			# Set s1 equal to LastNameTwo

	la a0, str3			# prepare to print string "Please enter the strokes of the first character of the first name ="
	li a7, 4			# print string
	ecall

	jal firstNameOne	# return the result a0	
	mv s2,a0			# Set s2 equal to firstNameOne

	la a0, str4			# prepare to print string "Please enter the strokes of the second character of the first name ="
	li a7, 4			# print string
	ecall

	jal firstNameTwo	# return the result a0	
	mv s3,a0			# Set s3 equal to firstNameTwo

	# input s0,s1,s2,s3
	# s4sky = s0 + s1
	# s5people = s1 + s2
	# s6land = s2 + s3
	# s7outside = s3 + 1
	# s0_new total = s4 + s6

	mv a0, s0
	add a0, a0, s1
	mv s4, a0

	mv a0, s1
	add a0, a0, s2
	mv s5, a0

	mv a0, s2
	add a0, a0, s3
	mv s6, a0

	mv a0, s3
	addi a0, a0, 1
	mv s7, a0
	
	
	
	# 將立即數 2 存儲到暫存器 t2 中
	li t2, 2

	# 將 s0 加載到暫存器 t0 中
	mv t0, s0

	# 檢查 t0 是否小於 2
	blt t0, t2, skip_s0  # 如果 t0 < 2，跳過將 s0 添加到 s5 的操作

	# 如果 t0 > 1，將 s0 添加到 s5
	mv a0, s0
	add a0, a0, s5
	mv s0, a0  # 更新 s0 為新的 total

	skip_s0:
	# 將 s3 加載到暫存器 t1 中
	mv t1, s3

	# 檢查 t1 是否小於 2
	blt t1, t2, end_if_s3  # 如果 t1 < 2，跳過將 s3 添加到 s5 的操作

	# 如果 t1 > 1，將 s3 添加到 s5
	mv a0, s3
	add a0, a0, s5
	mv s0, a0  # 更新 s0 為新的 total

	end_if_s3:

#--------------------------------------------------------------------------------------------------------------------
#print in main


	la a0, str5			# prepare to print string "Sky= "
	li a7, 4			# print string
	ecall

	mv a0,s4
	jal printResult		# printResult(s4 sky)
	
	jal modules		# modules(s4%10=a0), return a0
	mv s4,a0			# Set s2 equal to sky%10
	jal computeWuXin # computeWuXin(M=a0), return a0
	mv s4,s10
	
	la a0, str10			# prepare to print newline
	li a7, 4			# print string
	ecall




	la a0, str6			# prepare to print string "People= "
	li a7, 4			# print string
	ecall

	mv a0,s5
	jal printResult		# printResult(s5 people)

	jal modules		# modules(s4%10=a0), return a0
	mv s5,a0			# Set s2 equal to sky%10
	jal computeWuXin # computeWuXin(M=a0), return a0
	mv s5,s10
	
	la a0, str10			# prepare to print newline
	li a7, 4			# print string
	ecall





	la a0, str7			# prepare to print string "Land= "
	li a7, 4			# print string
	ecall

	mv a0,s6
	jal printResult		# printResult(s6 land)
	mv a0,s6
	
	jal modules		# modules(s4%10=a0), return a0
	mv s6,a0			# Set s2 equal to sky%10
	jal computeWuXin # computeWuXin(M=a0), return a0
	mv s6,s10
	
	la a0, str10			# prepare to print newline
	li a7, 4			# print string
	ecall
	
	

	
	la a0, str8			# prepare to print string "Outside= "
	li a7, 4			# print string
	ecall
	
	mv a0,s7
	jal printResult		# printResult(s7 outside)
	mv a0,s7

	jal modules		# modules(s4%10=a0), return a0
	mv s7,a0			# Set s2 equal to sky%10
	jal computeWuXin # computeWuXin(M=a0), return a0
	mv s7,s10 
	
	la a0, str10			# prepare to print newline
	li a7, 4			# print string
	ecall
	
	
	
	la a0, str9			# prepare to print string "Total="
	li a7, 4			# print string
	ecall
	
	mv a0,s0
	jal printResult		# printResult(s0_new total)
	mv a0,s0
	
	jal modules		# modules(s4%10=a0), return a0
	mv s0,a0			# Set s2 equal to sky%10
	jal computeWuXin # computeWuXin(M=a0), return a0
	mv s0,s10
	
	la a0, str10			# prepare to print newline
	li a7, 4			# print string
	ecall
	la a0, str10			# prepare to print newline
	li a7, 4			# print string
	ecall
	
#--------------------------------------------------------------------------------------------------------------------------------------------
#advanced in main
	#sky to all
	jal skyPeople #sky and people to cal
	jal calRelation
	la a0, str10			# prepare to print newline
	li a7, 4			# print string
	ecall
	
	jal skyLand #sky and land to cal
	jal calRelation
	la a0, str10			# prepare to print newline
	li a7, 4			# print string
	ecall
	
	jal skyOutside #sky and outside to cal
	jal calRelation
	la a0, str10			# prepare to print newline
	li a7, 4			# print string
	ecall
	
	jal skyTotal
	jal calRelation
	la a0, str10			# prepare to print newline
	li a7, 4			# print string
	ecall
	#people to all(no sky)
	jal peopleLand
	jal calRelation
	la a0, str10			# prepare to print newline
	li a7, 4			# print string
	ecall
	
	jal peopleOutside
	jal calRelation
	la a0, str10			# prepare to print newline
	li a7, 4			# print string
	ecall
	
	jal peopleTotal
	jal calRelation
	la a0, str10			# prepare to print newline
	li a7, 4			# print string
	ecall
	#land to all(no sky people)
	jal landOutside
	jal calRelation
	la a0, str10			# prepare to print newline
	li a7, 4			# print string
	ecall
	
	jal landTotal
	jal calRelation
	la a0, str10			# prepare to print newline
	li a7, 4			# print string
	ecall
	#outside to all(no sky people land)
	jal outsideTotal
	jal calRelation
	la a0, str10			# prepare to print newline
	li a7, 4			# print string
	ecall
	
	j end
	
	
#----------------------------------------------------------------------------------------------------------------------------------------
#function define


#input values
LastNameOne:
	li a7, 5
	ecall
	ret	
LastNameTwo:
	li a7, 5
	ecall
	ret
firstNameOne:
	li a7, 5
	ecall
	ret
firstNameTwo:
	li a7, 5
	ecall
	ret
	
	
# word %= 10
modules:
	li a1,10
	rem a0, a0, a1		
	ret


computeWuXin: 
	mv t1,a0

	addi sp,sp,-4
	sw ra,0(sp)
	
	blez t1,ModeWater #12(Wood),34(Fire),56(Earth),78(Metal),90(Water)	
	li a2,2	 
	ble t1,a2,ModeWood
	li a2,4
	ble t1,a2,ModeFire
	li a2,6	 
	ble t1,a2,ModeEarth
	li a2,8
	ble t1,a2,ModeMetal
	li a2,9
	ble t1,a2,ModeWater

endcomputeWuXin: 
	lw ra,0(sp)
	addi sp,sp,4
	ret  #return (a0)

ModeWood:
	la a0, str12
	li a7, 4
	ecall
	li s10,0
	j endcomputeWuXin
	
ModeFire:
	la a0, str14
	li a7, 4
	ecall
	li s10,1
	j endcomputeWuXin

ModeEarth:
	la a0, str15
	li a7, 4
	ecall
	li s10,2
	j endcomputeWuXin

ModeMetal:
	la a0, str11
	li a7, 4
	ecall
	li s10,3
	j endcomputeWuXin

ModeWater:
	la a0, str13
	li a7, 4
	ecall
	li s10,4
	j endcomputeWuXin


# print integer




skyPeople:#
	la t0,str16#strsky
	la t1,str17#strpeople
	mv t2,s4 #sky
	mv t3,s5 #people
	ret
skyLand:
	la t0,str16#strsky
	la t1,str18#strland
	mv t2,s4 #sky
	mv t3,s6 #land
	ret
skyOutside:
	la t0,str16#strsky
	la t1,str19#stroutside
	mv t2,s4 #sky
	mv t3,s7 #outside
	ret
skyTotal:#
	la t0,str16#strsky
	la t1,str20#strtotal
	mv t2,s4 #sky
	mv t3,s0 #total
	ret
peopleLand:#
	la t0,str17#strpeople
	la t1,str18#strland
	mv t2,s5 #people
	mv t3,s6 #land
	ret
peopleOutside:
	la t0,str17#strpeople
	la t1,str19#stroutside
	mv t2,s5 #people
	mv t3,s7 #outside
	ret
peopleTotal:
	la t0,str17#strpeople
	la t1,str20#strtotal
	mv t2,s5 #people
	mv t3,s0 #total
	ret
landOutside:#
	la t0,str18#strland
	la t1,str19#stroutside
	mv t2,s6 #land
	mv t3,s7 #outside
	ret
landTotal:
	la t0,str18#strland
	la t1,str20#strtotal
	mv t2,s6 #land
	mv t3,s0 #total
	ret
outsideTotal:
	la t0,str19#stroutside
	la t1,str20#strtotal
	mv t2,s7 #outside
	mv t3,s0 #total
	ret
calRelation:
	beq t2,t3,t2Equal_t3 #if t2 = t3 print equal
	
	addi t2,t2,-1
	beq t2,t3,t2Gernarate_t3rev
	addi t2,t2,-1
	beq t2,t3,t2Restraint_t3rev
	addi t2,t2,2
	
	addi t2,t2,1
	beq t2,t3,t2Generate_t3
	addi t2,t2,1
	beq t2,t3,t2Restraint_t3
	addi t2,t2,-2
	
	addi t2,t2,4
	beq t2,t3,t2Gernarate_t3rev
	addi t2,t2,-1
	beq t2,t3,t2Restraint_t3rev
	addi t2,t2,-3
	
	addi t2,t2,-4
	beq t2,t3,t2Generate_t3
	addi t2,t2,1
	beq,t2,t3,t2Restraint_t3
	addi t2,t2,3
	
	ret
t2Equal_t3:
	mv a0,t0
	li a7,4
	ecall
	
	la a0,str23#equal
	li a7,4
	ecall
	
	mv a0,t1
	li a7,4
	ecall
	ret
t2Gernarate_t3rev:
	mv a0,t1
	li a7,4
	ecall
	
	la a0,str21#generate
	li a7,4
	ecall
	
	mv a0,t0
	li a7,4
	ecall
	ret
t2Restraint_t3rev:
	mv a0,t1
	li a7,4
	ecall
	
	la a0,str22#restraint
	li a7,4
	ecall
	
	mv a0,t0
	li a7,4
	ecall
	ret
t2Generate_t3:
	mv a0,t0
	li a7,4
	ecall
	
	la a0,str21#generate
	li a7,4
	ecall
	
	mv a0,t1
	li a7,4
	ecall
	ret
t2Restraint_t3:
	mv a0,t0
	li a7,4
	ecall
	
	la a0,str22#restraint
	li a7,4
	ecall
	
	mv a0,t1
	li a7,4
	ecall
	ret


printResult:
	li a7, 1
 	ecall
 	ret	
	
end:
	li a7, 10			
 	ecall
