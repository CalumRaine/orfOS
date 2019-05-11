.section .text
.globl find_1F_A
.globl find_1R_T
.globl main
main:
mov sp, #0x8000

bl setup_framebuffer

ldr r0, =my_sequence
mov r3, #1
skip_line:
	add r0, #1
	ldrb r1, [r0]
	cmp r1, #10
	bne skip_line
	add r0, #1
	mov r2, r0
find_1F_A:
	ldrb r1, [r0]
	cmp r1, #65
	beq find_1F_T
	cmp r1, #10
	beq F_change_frame
	ldrb r1, [r0,#1]
	cmp r1, #10
	beq find_1F_AT_inc
	ldrb r1, [r0, #2]
	cmp r1, #10
	bne F_next_triplet
	add r0, #2
	b F_change_frame
F_next_triplet:
	add r0, #3
	b find_1F_A
F_change_frame:
	cmp r3, #1
	bne check_frame_2F
	mov r3, #2
	mov r0, r2
	add r0, #1
	b find_1F_A
check_frame_2F:
	cmp r3, #2
	bne check_frame_3F
	mov r3, #3
	mov r0, r2
	add r0, #2
	b find_1F_A
check_frame_3F:
	mov r3, #4
	sub r0, #1
	mov r2, r0
	b find_1R_T
find_1F_AT_inc:
	add r0, #1
	b F_change_frame
find_1F_T:
	ldrb r1, [r0,#1]
	cmp r1, #84
	beq find_1F_G
	cmp r1, #10
	beq find_1F_AT_inc
	ldrb r1, [r0,#2]
	cmp r1, #10
	bne F_next_triplet
	add r0, #2
	b F_change_frame
find_1F_G:
	ldrb r1, [r0,#2]
	cmp r1, #71
	beq print_F_M
	cmp r1, #10
	bne F_next_triplet
	add r0, #2
	b F_change_frame
print_F_M:
	bl print_M
	add r0, #3
print_F_loop:
	ldrb r1, [r0]
	cmp r1, #10
	beq call_scroll_up_F
	add r0, #1		/* surely this now moves it along 4 places, not 3.  Yes, pretty sure this needs to be deleted.  Not sure how the first frame is actually printing at all. */
	ldrb r4, [r0]
	cmp r4, #10
	beq call_scroll_up_F
	add r0, #1
	ldrb r5, [r0]
	cmp r5, #10
	beq call_scroll_up_F
	cmp r1, #84
	beq test_TA
	cmp r1, #67
	beq test_CA
	cmp r1, #65
	beq test_AA
	cmp r1, #71
	beq test_GA
	bl print_X
	b post_translate_F
test_TA:
	cmp r4, #65
	beq test_TAA
	cmp r4, #67
	beq test_TCA
	cmp r4, #71
	beq test_TGA
	cmp r4, #84
	beq test_TTA
	bl print_X
	b post_translate_F
test_CA:
	cmp r4, #65
	beq test_CAA
	cmp r4, #67
	beq test_CCA
	cmp r4, #71
	beq test_CGA
	cmp r4, #84
	beq test_CTA
	bl print_X
	b post_translate_F
test_AA:
        cmp r4, #65
        beq test_AAA
        cmp r4, #67
        beq test_ACA
        cmp r4, #71
        beq test_AGA
        cmp r4, #84
        beq test_ATA
	bl print_X
	b post_translate_F
test_GA:
        cmp r4, #65
        beq test_GAA
        cmp r4, #67
        beq test_GCA
        cmp r4, #71
        beq test_GGA
        cmp r4, #84
        beq test_GTA
	bl print_X
	b post_translate_F
test_TAA:
	cmp r5, #65
	bleq print_stopF
	cmp r5, #67
	bleq print_Y
	cmp r5, #71
	bleq print_stopF
	cmp r5, #84
	bleq print_Y		/* add in bl print_X just in case? */
	b post_translate_F
test_TCA:
	bl print_S
	b post_translate_F
test_TGA:
	cmp r5, #65
        bleq print_stopF
        cmp r5, #67
        bleq print_C
        cmp r5, #71
        bleq print_W
        cmp r5, #84
        bleq print_C
	b post_translate_F
test_TTA:
        cmp r5, #65
        bleq print_L
        cmp r5, #67
        bleq print_F
        cmp r5, #71
        bleq print_L
        cmp r5, #84
        bleq print_F
	b post_translate_F
test_AAA:
        cmp r5, #65
        bleq print_K
        cmp r5, #67
        bleq print_N
        cmp r5, #71
        bleq print_K
        cmp r5, #84
        bleq print_N
	b post_translate_F
test_ATA:
	cmp r5, #65
        bleq print_I
        cmp r5, #67
        bleq print_I
        cmp r5, #71
        bleq print_M
        cmp r5, #84
        bleq print_I
	b post_translate_F
test_ACA:
        bl print_T
	b post_translate_F
test_AGA:
	cmp r5, #65
        bleq print_R
        cmp r5, #67
        bleq print_S
        cmp r5, #71
        bleq print_R
        cmp r5, #84
        bleq print_S
	b post_translate_F
test_CAA:
	cmp r5, #65
        bleq print_Q
        cmp r5, #67
        bleq print_H
        cmp r5, #71
        bleq print_Q
        cmp r5, #84
        bleq print_H
	b post_translate_F
test_CTA:
        bl print_L
	b post_translate_F
test_CGA:
        bl print_R
	b post_translate_F
test_CCA:
        bl print_P
	b post_translate_F
test_GAA:
        cmp r5, #65
        bleq print_E
        cmp r5, #67
        bleq print_D
        cmp r5, #71
        bleq print_E
        cmp r5, #84
        bleq print_D
	b post_translate_F
test_GCA:
        bl print_A
	b post_translate_F
test_GTA:
        bl print_V
	b post_translate_F
test_GGA:
        bl print_G
	b post_translate_F
post_translate_F:
	add r0, #1
	ldrb r1, [r0]
	cmp r1, #10
	beq call_scroll_up_F
	b print_F_loop
find_1R_T:
	ldrb r1, [r0]
	cmp r1, #84
	beq find_1R_A
	cmp r1, #10
	beq R_change_frame
	ldrb r1, [r0,#-1]
	cmp r1, #10
	beq find_1R_AT_dec
	ldrb r1, [r0,#-2]
	cmp r1, #10
	bne R_next_triplet
	sub r0, #2
	b R_change_frame
find_1R_A:
	ldrb r1, [r0, #-1]
	cmp r1, #65
	beq find_1R_C
	cmp r1, #10
	beq find_1R_AT_dec
	ldrb r1, [r0,#-2]
	cmp r1, #10	
	bne R_next_triplet
	sub r0, #2
	b R_change_frame
find_1R_C:
	ldrb r1, [r0, #-2]
	cmp r1, #67
	beq print_R_M
	cmp r1, #10
	bne R_next_triplet
	sub r0, #2
	b R_change_frame
find_1R_AT_dec:
	sub r0, #1
	b R_change_frame
R_next_triplet:
	sub r0, #3
	b find_1R_T
R_change_frame:
	cmp r3, #4
	bne check_frame_5R
	mov r3, #5
	mov r0, r2
	sub r0, #1
	b find_1R_T
check_frame_5R:
	cmp r3, #5
	bne frame_6R
	mov r3, #6
	mov r0, r2
	sub r0, #2
	b find_1R_T
frame_6R:
	mov r3, #1	
	mov r0, r2
	add r0, #2
	ldrb r1, [r0]
	cmp r1, #0
	bne skip_line
	b halt
print_R_M:
	bl print_M
	sub r0, #3
print_R_loop:
	ldrb r1, [r0]
	cmp r1, #10
	beq call_scroll_up_R
	cmp r1, #65
	bne test_1R_T
	mov r1, #84
	b test_2R_A
test_1R_T:
	cmp r1, #84
	bne test_1R_C
	mov r1, #65
	b test_2R_A
test_1R_C:
	cmp r1, #67
	bne test_1R_G
	mov r1, #71
	b test_2R_A
test_1R_G:
	cmp r1, #71
	bne print_B_R
	mov r1, #67
	b test_2R_A
test_2R_A:
	ldrb r4, [r0,#-1]	
	cmp r4, #65
	bne test_2R_T
	mov r4, #84
	b test_3R_A
test_2R_T:
	cmp r4, #84
	bne test_2R_C
	mov r4, #65
	b test_3R_A
test_2R_C:
	cmp r4, #67
	bne test_2R_G
	mov r4, #71
	b test_3R_A
test_2R_G:
	cmp r4, #71
	bne test_2R_NL
	mov r4, #67
	b test_3R_A
test_2R_NL:
	cmp r4, #10
	beq call_scroll_up_R
	b print_B_R
test_3R_A:
	ldrb r5, [r0,#-2]
	cmp r5, #65
	bne test_3R_T
	mov r5, #84
	b find_R
test_3R_T:
	cmp r5, #84
	bne test_3R_C
	mov r5, #65
	b find_R
test_3R_C:
	cmp r5, #67
	bne test_3R_G
	mov r5, #71
	b find_R
test_3R_G:
	cmp r5, #71
	bne test_3R_NL
	mov r5, #67
	b find_R
test_3R_NL:
	cmp r5, #10
	beq call_scroll_up_R
	b print_B_R
print_B_R:
	bl print_X
	b post_translate_R
find_R:
	cmp r1, #84
        beq Rtest_TA
        cmp r1, #67
        beq Rtest_CA
        cmp r1, #65
        beq Rtest_AA
        cmp r1, #71
        beq Rtest_GA
        bl print_X
        b post_translate_R
Rtest_TA:
        cmp r4, #65
        beq Rtest_TAA
        cmp r4, #67
        beq Rtest_TCA
        cmp r4, #71
        beq Rtest_TGA
        cmp r4, #84
        beq Rtest_TTA
        bl print_X
        b post_translate_R
Rtest_CA:
        cmp r4, #65
        beq Rtest_CAA
        cmp r4, #67
        beq Rtest_CCA
        cmp r4, #71
        beq Rtest_CGA
        cmp r4, #84
        beq Rtest_CTA
        bl print_X
        b post_translate_R
Rtest_AA:
        cmp r4, #65
        beq Rtest_AAA
        cmp r4, #67
        beq Rtest_ACA
        cmp r4, #71
        beq Rtest_AGA
        cmp r4, #84
        beq Rtest_ATA
        bl print_X
        b post_translate_R
Rtest_GA:
        cmp r4, #65
        beq Rtest_GAA
        cmp r4, #67
        beq Rtest_GCA
        cmp r4, #71
        beq Rtest_GGA
        cmp r4, #84
        beq Rtest_GTA
        bl print_X
        b post_translate_R
Rtest_TAA:
        cmp r5, #65
        bleq print_stopR
        cmp r5, #67
        bleq print_Y
        cmp r5, #71
        bleq print_stopR
        cmp r5, #84
        bleq print_Y
        b post_translate_R
Rtest_TCA:
        bl print_S
        b post_translate_R
Rtest_TGA:
        cmp r5, #65
        bleq print_stopR
        cmp r5, #67
        bleq print_C
        cmp r5, #71
        bleq print_W
        cmp r5, #84
        bleq print_C
        b post_translate_R
Rtest_TTA:
        cmp r5, #65
        bleq print_L
        cmp r5, #67
        bleq print_F
        cmp r5, #71
        bleq print_L
        cmp r5, #84
        bleq print_F
        b post_translate_R
Rtest_AAA:
        cmp r5, #65
        bleq print_K
        cmp r5, #67
        bleq print_N
        cmp r5, #71
        bleq print_K
        cmp r5, #84
        bleq print_N
        b post_translate_R
Rtest_ATA:
        cmp r5, #65
        bleq print_I
        cmp r5, #67
        bleq print_I
        cmp r5, #71
        bleq print_M
        cmp r5, #84
        bleq print_I
        b post_translate_R
Rtest_ACA:
        bl print_T
        b post_translate_R
Rtest_AGA:
        cmp r5, #65
        bleq print_R
        cmp r5, #67
        bleq print_S
        cmp r5, #71
        bleq print_R
        cmp r5, #84
        bleq print_S
        b post_translate_R
Rtest_CAA:
        cmp r5, #65
        bleq print_Q
        cmp r5, #67
        bleq print_H
        cmp r5, #71
        bleq print_Q
        cmp r5, #84
        bleq print_H
        b post_translate_R
Rtest_CTA:
        bl print_L
        b post_translate_R
Rtest_CGA:
        bl print_R
        b post_translate_R
Rtest_CCA:
        bl print_P
        b post_translate_R
Rtest_GAA:
        cmp r5, #65
        bleq print_E
        cmp r5, #67
        bleq print_D
        cmp r5, #71
        bleq print_E
        cmp r5, #84
        bleq print_D
        b post_translate_R
Rtest_GCA:
        bl print_A
        b post_translate_R
Rtest_GTA:
        bl print_V
        b post_translate_R
Rtest_GGA:
        bl print_G
        b post_translate_R
post_translate_R:
        sub r0, #3
        b print_R_loop
call_scroll_up_F:
	bl print_newline
	b F_change_frame
call_scroll_up_R:
	bl print_newline
	b R_change_frame
halt:
b halt

