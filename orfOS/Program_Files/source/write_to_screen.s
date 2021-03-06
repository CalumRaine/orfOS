.globl my_sequence
.globl print_A
.globl print_B
.globl print_C
.globl print_D
.globl print_E
.globl print_F
.globl print_G
.globl print_H
.globl print_I
.globl print_K
.globl print_L
.globl print_M
.globl print_N
.globl print_P
.globl print_Q
.globl print_R
.globl print_S
.globl print_T
.globl print_V
.globl print_W
.globl print_X
.globl print_Y
.globl print_newline
.globl print_stopF
.globl print_stopR
.section .text

print_newline:
	push {r0, r1, r2, r3, r4}
	ldr r0, =screen_begin
	ldr r0, [r0]
	ldr r3, =X_offset_begin
	ldr r3, [r3]
	ldr r4, =X_offset_current
	str r3, [r4]
	mov r1, #25600
	newline_loop:
		ldr r2, [r0, r1]
		str r2, [r0]		
		add r0, #4
		cmp r0, r3
		blt newline_loop
	mov r2, #0
	ldr r3, =screen_end
	ldr r3, [r3]
	make_black_loop:
		str r2, [r0]	
		add r0, #4
		cmp r0, r3
		blt make_black_loop
	pop {r0, r1, r2, r3, r4}
	mov pc, lr 

print_A:
	push {r0, r1, r2, r3, r4}		/* preserve current register values for return later */
	ldr r3, =X_offset_current		/* load current 'cursor' position */
	ldr r0, [r3]			
	mov r2, r0				/* copy current cursor position into r2 for later */
	ldr r4, =X_offset_end			/* are we at end of row yet? */
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_A
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_A_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_A_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_A_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_A_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_A:
	mov r1, #0b111111111111111111111111			/* prepare white */
	strh r1, [r0, #8]		
	add r0, #2560			
	strh r1, [r0, #6]			
	strh r1, [r0, #10]			
	add r0, #2560
	strh r1, [r0, #4]
	strh r1, [r0, #12]
	add r0, #2560
	strh r1, [r0, #4]
	strh r1, [r0, #12]
	add r0, #2560
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #10]
	strh r1, [r0, #12]
	strh r1, [r0, #14]
	add r0, #2560
	strh r1, [r0, #2]	    
	strh r1, [r0, #14]	    
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #14]
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #16]
   	add r2, #20			/* add 20 to X offset loaded earlier */
	str r2, [r3]			/* store it */
	pop {r0, r1, r2, r3, r4}	/* restore register values */
	mov pc, lr			/* return from function */

.ltorg

print_B:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_B
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_B_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_B_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_B_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_B_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_B:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	strh r1, [r0, #2]		
	strh r1, [r0, #4]		
	strh r1, [r0, #6]		
	strh r1, [r0, #8]		
	strh r1, [r0, #10]		
	strh r1, [r0, #12]		
	add r0, #2560			
	strh r1, [r0]			
	strh r1, [r0, #10]			
	strh r1, [r0, #12]			
	strh r1, [r0, #14]		
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #14]
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #10]
	strh r1, [r0, #12]
	strh r1, [r0, #14]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #10]
	add r0, #2560
	strh r1, [r0]	    
	strh r1, [r0, #10]	    
	strh r1, [r0, #12]	    
	strh r1, [r0, #14]	    
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #14]
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #10]
	strh r1, [r0, #12]
	strh r1, [r0, #14]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #10]
	strh r1, [r0, #12]
   	add r2, #20	
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg
print_C:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_C
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_C_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_C_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_C_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_C_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_C:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	strh r1, [r0, #2]		
	strh r1, [r0, #4]		
	strh r1, [r0, #6]		
	strh r1, [r0, #8]		
	strh r1, [r0, #10]		
	strh r1, [r0, #12]		
	strh r1, [r0, #14]		
	strh r1, [r0, #16]		
	add r0, #2560			
	strh r1, [r0]			
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]	    
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #10]
	strh r1, [r0, #12]
	strh r1, [r0, #14]
	strh r1, [r0, #16]
   	add r2, #20	
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg
print_D:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_D
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_D_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_D_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_D_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_D_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_D:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	strh r1, [r0, #2]		
	strh r1, [r0, #4]		
	strh r1, [r0, #6]		
	strh r1, [r0, #8]		
	add r0, #2560			
	strh r1, [r0]			
	strh r1, [r0, #6]			
	strh r1, [r0, #8]			
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #10]
	strh r1, [r0, #12]
	strh r1, [r0, #14]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #14]
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]	    
	strh r1, [r0, #14]	    
	strh r1, [r0, #16]	    
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #10]
	strh r1, [r0, #12]
	strh r1, [r0, #14]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #10]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
   	add r2, #20	
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg
print_E:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_E
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_E_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_E_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_E_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_E_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_E:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	strh r1, [r0, #2]		
	strh r1, [r0, #4]		
	strh r1, [r0, #6]		
	strh r1, [r0, #8]		
	strh r1, [r0, #10]		
	strh r1, [r0, #12]		
	strh r1, [r0, #14]		
	strh r1, [r0, #16]		
	add r0, #2560			
	strh r1, [r0]			
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #10]
	strh r1, [r0, #12]
	strh r1, [r0, #14]
	add r0, #2560
	strh r1, [r0]	    
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #10]
	strh r1, [r0, #12]
	strh r1, [r0, #14]
	strh r1, [r0, #16]
   	add r2, #20	
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg
print_F:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_F
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_F_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_F_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_F_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_F_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_F:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	strh r1, [r0, #2]		
	strh r1, [r0, #4]		
	strh r1, [r0, #6]		
	strh r1, [r0, #8]		
	strh r1, [r0, #10]		
	strh r1, [r0, #12]		
	strh r1, [r0, #14]		
	strh r1, [r0, #16]		
	add r0, #2560			
	strh r1, [r0]			
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #10]
	strh r1, [r0, #12]
	strh r1, [r0, #14]
	add r0, #2560
	strh r1, [r0]	    
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
   	add r2, #20	
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg
print_G:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_G
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_G_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_G_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_G_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_G_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_G:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	strh r1, [r0, #2]		
	strh r1, [r0, #4]		
	strh r1, [r0, #6]		
	strh r1, [r0, #8]		
	strh r1, [r0, #10]		
	strh r1, [r0, #12]		
	strh r1, [r0, #14]		
	strh r1, [r0, #16]		
	add r0, #2560			
	strh r1, [r0]			
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #10]
	strh r1, [r0, #12]
	strh r1, [r0, #14]
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]	    
	strh r1, [r0, #16]	    
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #16]	    
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #16]	    
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #10]
	strh r1, [r0, #12]
	strh r1, [r0, #14]
	strh r1, [r0, #16]
   	add r2, #20	
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg
print_H:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_H
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_H_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_H_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_H_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_H_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_H:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	strh r1, [r0, #16]		
	add r0, #2560			
	strh r1, [r0]			
	strh r1, [r0, #16]		
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #16]		
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #16]		
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #10]
	strh r1, [r0, #12]
	strh r1, [r0, #14]
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]	    
	strh r1, [r0, #16]	    
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #16]	    
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #16]	    
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #16]
   	add r2, #20	
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg
print_I:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_I
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_I_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_I_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_I_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_I_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_I:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	strh r1, [r0, #2]		
	strh r1, [r0, #4]		
	strh r1, [r0, #6]		
	strh r1, [r0, #8]		
	strh r1, [r0, #10]		
	strh r1, [r0, #12]		
	strh r1, [r0, #14]		
	strh r1, [r0, #16]		
	add r0, #2560			
	strh r1, [r0, #8]			
	add r0, #2560
	strh r1, [r0, #8]
	add r0, #2560
	strh r1, [r0, #8]
	add r0, #2560
	strh r1, [r0, #8]
	add r0, #2560
	strh r1, [r0, #8]
	add r0, #2560
	strh r1, [r0, #8]
	add r0, #2560
	strh r1, [r0, #8]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #10]
	strh r1, [r0, #12]
	strh r1, [r0, #14]
	strh r1, [r0, #16]
   	add r2, #20	
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg
print_K:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_K
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_K_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_K_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_K_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_K_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_K:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	strh r1, [r0, #12]		
	strh r1, [r0, #14]		
	strh r1, [r0, #16]		
	add r0, #2560			
	strh r1, [r0]			
	strh r1, [r0, #10]			
	strh r1, [r0, #12]			
	strh r1, [r0, #14]			
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #8]
	strh r1, [r0, #10]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	add r0, #2560
	strh r1, [r0]	    
	strh r1, [r0, #4]	    
	strh r1, [r0, #6]	    
	strh r1, [r0, #8]	    
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #8]
	strh r1, [r0, #10]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #10]
	strh r1, [r0, #12]
	strh r1, [r0, #14]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #12]
	strh r1, [r0, #14]
	strh r1, [r0, #16]
   	add r2, #20	
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg
print_L:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_L
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_L_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_L_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_L_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_L_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_L:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	add r0, #2560			
	strh r1, [r0]			
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]	    
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #10]
	strh r1, [r0, #12]
	strh r1, [r0, #14]
	strh r1, [r0, #16]
   	add r2, #20	
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg
print_M:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_M
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_M_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_M_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_M_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_M_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_M:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	strh r1, [r0, #2]		
	strh r1, [r0, #14]		
	strh r1, [r0, #16]		
	add r0, #2560			
	strh r1, [r0]			
	strh r1, [r0, #4]			
	strh r1, [r0, #12]			
	strh r1, [r0, #16]			
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #4]
	strh r1, [r0, #12]
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #6]
	strh r1, [r0, #10]
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #8]
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]	    
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #16]
   	add r2, #20	
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg
print_N:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_N
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_N_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_N_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_N_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_N_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_N:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	strh r1, [r0, #2]		
	strh r1, [r0, #16]
	add r0, #2560			
	strh r1, [r0]			
	strh r1, [r0, #4]			
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #4]
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #6]
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #8]
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]	    
	strh r1, [r0, #10]	    
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #12]
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #14]
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #16]
   	add r2, #20	
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg
print_P:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_P
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_P_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_P_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_P_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_P_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_P:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	strh r1, [r0, #2]		
	strh r1, [r0, #4]		
	strh r1, [r0, #6]		
	strh r1, [r0, #8]		
	strh r1, [r0, #10]		
	strh r1, [r0, #12]		
	strh r1, [r0, #14]		
	strh r1, [r0, #16]		
	add r0, #2560			
	strh r1, [r0]			
	strh r1, [r0, #16]			
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #16]			
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #16]			
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #10]
	strh r1, [r0, #12]
	strh r1, [r0, #14]
	strh r1, [r0, #16]			
	add r0, #2560
	strh r1, [r0]	    
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
   	add r2, #20	
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg
print_Q:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_Q
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_Q_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_Q_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_Q_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_Q_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_Q:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	strh r1, [r0, #2]		
	strh r1, [r0, #4]		
	strh r1, [r0, #6]		
	strh r1, [r0, #8]		
	strh r1, [r0, #10]		
	strh r1, [r0, #12]		
	strh r1, [r0, #14]		
	add r0, #2560			
	strh r1, [r0]			
	strh r1, [r0, #14]			
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #14]			
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #14]			
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #14]			
	add r0, #2560
	strh r1, [r0]	    
	strh r1, [r0, #8]			
	strh r1, [r0, #14]			
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #10]			
	strh r1, [r0, #14]			
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #12]
	strh r1, [r0, #14]			
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #10]
	strh r1, [r0, #12]
	strh r1, [r0, #14]
	strh r1, [r0, #16]
   	add r2, #20	
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg

print_R:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_R
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_R_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_R_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_R_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_R_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_R:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	strh r1, [r0, #2]		
	strh r1, [r0, #4]		
	strh r1, [r0, #6]		
	strh r1, [r0, #8]		
	strh r1, [r0, #10]		
	strh r1, [r0, #12]		
	strh r1, [r0, #14]		
	strh r1, [r0, #16]		
	add r0, #2560			
	strh r1, [r0]			
	strh r1, [r0, #16]			
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #16]			
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #16]			
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #2]			
	strh r1, [r0, #4]			
	strh r1, [r0, #6]			
	strh r1, [r0, #8]			
	strh r1, [r0, #10]			
	strh r1, [r0, #12]			
	strh r1, [r0, #14]			
	strh r1, [r0, #16]			
	add r0, #2560
	strh r1, [r0]	    
	strh r1, [r0, #2]			
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #4]			
	strh r1, [r0, #6]			
	strh r1, [r0, #8]			
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #8]
	strh r1, [r0, #10]			
	strh r1, [r0, #12]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #12]
	strh r1, [r0, #14]
	strh r1, [r0, #16]
   	add r2, #20	
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg
print_S:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_S
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_S_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_S_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_S_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_S_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_S:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	strh r1, [r0, #2]		
	strh r1, [r0, #4]		
	strh r1, [r0, #6]		
	strh r1, [r0, #8]		
	strh r1, [r0, #10]		
	strh r1, [r0, #12]		
	strh r1, [r0, #14]		
	strh r1, [r0, #16]		
	add r0, #2560			
	strh r1, [r0]			
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #2]			
	strh r1, [r0, #4]			
	strh r1, [r0, #6]			
	strh r1, [r0, #8]			
	strh r1, [r0, #10]			
	strh r1, [r0, #12]			
	strh r1, [r0, #14]			
	strh r1, [r0, #16]			
	add r0, #2560
	strh r1, [r0, #16]	    
	add r0, #2560
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0, #16]
	add r0, #2560
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #10]
	strh r1, [r0, #12]
	strh r1, [r0, #14]
	strh r1, [r0, #16]
   	add r2, #20	
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg
print_T:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_T
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_T_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_T_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_T_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_T_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_T:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	strh r1, [r0, #2]		
	strh r1, [r0, #4]		
	strh r1, [r0, #6]		
	strh r1, [r0, #8]		
	strh r1, [r0, #10]		
	strh r1, [r0, #12]		
	strh r1, [r0, #14]		
	strh r1, [r0, #16]		
	add r0, #2560			
	strh r1, [r0, #8]			
	add r0, #2560
	strh r1, [r0, #8]			
	add r0, #2560
	strh r1, [r0, #8]			
	add r0, #2560
	strh r1, [r0, #8]			
	add r0, #2560
	strh r1, [r0, #8]			
	add r0, #2560
	strh r1, [r0, #8]			
	add r0, #2560
	strh r1, [r0, #8]			
	add r0, #2560
	strh r1, [r0, #8]			
   	add r2, #20	
	strh r1, [r0, #8]			
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg
print_V:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_V
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_V_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_V_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_V_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_V_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_V:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	strh r1, [r0, #16]		
	add r0, #2560			
	strh r1, [r0, #2]			
	strh r1, [r0, #14]			
	add r0, #2560
	strh r1, [r0, #2]			
	strh r1, [r0, #14]			
	add r0, #2560
	strh r1, [r0, #2]			
	strh r1, [r0, #4]			
	strh r1, [r0, #12]			
	strh r1, [r0, #14]			
	add r0, #2560
	strh r1, [r0, #4]			
	strh r1, [r0, #12]			
	add r0, #2560
	strh r1, [r0, #4]			
	strh r1, [r0, #6]			
	strh r1, [r0, #10]			
	strh r1, [r0, #12]			
	add r0, #2560
	strh r1, [r0, #6]			
	strh r1, [r0, #10]			
	add r0, #2560
	strh r1, [r0, #6]			
	strh r1, [r0, #10]			
	add r0, #2560
	strh r1, [r0, #8]
   	add r2, #20	
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg
print_W:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_W
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_W_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_W_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_W_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_W_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_W:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	strh r1, [r0, #16]		
	add r0, #2560			
	strh r1, [r0]			
	strh r1, [r0, #2]			
	strh r1, [r0, #14]			
	strh r1, [r0, #16]			
	add r0, #2560
	strh r1, [r0, #2]			
	strh r1, [r0, #14]			
	add r0, #2560
	strh r1, [r0, #2]			
	strh r1, [r0, #14]			
	add r0, #2560
	strh r1, [r0, #2]			
	strh r1, [r0, #8]			
	strh r1, [r0, #14]			
	add r0, #2560
	strh r1, [r0, #2]			
	strh r1, [r0, #4]			
	strh r1, [r0, #8]			
	strh r1, [r0, #12]			
	strh r1, [r0, #14]			
	add r0, #2560
	strh r1, [r0, #4]			
	strh r1, [r0, #8]			
	strh r1, [r0, #12]			
	add r0, #2560
	strh r1, [r0, #4]			
	strh r1, [r0, #6]			
	strh r1, [r0, #10]			
	strh r1, [r0, #12]			
	add r0, #2560
	strh r1, [r0, #4]			
	strh r1, [r0, #12]			
   	add r2, #20	
	strh r1, [r0, #8]			
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg
print_X:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_X
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_X_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_X_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_X_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_X_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_X:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	strh r1, [r0, #16]		
	add r0, #2560			
	strh r1, [r0, #2]			
	strh r1, [r0, #14]			
	add r0, #2560
	strh r1, [r0, #4]			
	strh r1, [r0, #12]			
	add r0, #2560
	strh r1, [r0, #6]			
	strh r1, [r0, #10]			
	add r0, #2560
	strh r1, [r0, #8]			
	add r0, #2560
	strh r1, [r0, #6]			
	strh r1, [r0, #10]			
	add r0, #2560
	strh r1, [r0, #4]			
	strh r1, [r0, #12]			
	add r0, #2560
	strh r1, [r0, #2]			
	strh r1, [r0, #14]			
	add r0, #2560
	strh r1, [r0]			
	strh r1, [r0, #16]			
   	add r2, #20	
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg
print_Y:
	push {r0, r1, r2, r3, r4}
	ldr r3, =X_offset_current
	ldr r0, [r3]			
	mov r2, r0		
	ldr r4, =X_offset_end	
	ldr r4, [r4]
	cmp r0, r4
	bne proceed_print_Y
		sub r2, #2560
		push {r0, r1, r2, r3, r4}
        	ldr r0, =screen_begin
        	ldr r0, [r0]
        	ldr r3, =X_offset_begin
        	ldr r3, [r3]
        	mov r1, #25600
        	newline_Y_loop:
        	        ldr r2, [r0, r1]
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt newline_Y_loop
        	mov r2, #0
        	ldr r3, =screen_end
        	ldr r3, [r3]
        	make_Y_black_loop:
        	        str r2, [r0]                    
        	        add r0, #4
        	        cmp r0, r3
        	        blt make_Y_black_loop
        	pop {r0, r1, r2, r3, r4}
	proceed_print_Y:
	mov r1, #0b111111111111111111111111
	strh r1, [r0]		
	strh r1, [r0, #16]		
	add r0, #2560			
	strh r1, [r0, #2]			
	strh r1, [r0, #14]			
	add r0, #2560
	strh r1, [r0, #4]			
	strh r1, [r0, #12]			
	add r0, #2560
	strh r1, [r0, #6]			
	strh r1, [r0, #10]			
	add r0, #2560
	strh r1, [r0, #8]			
	add r0, #2560
	strh r1, [r0, #6]			
	add r0, #2560
	strh r1, [r0, #4]			
	add r0, #2560
	strh r1, [r0, #2]			
	add r0, #2560
	strh r1, [r0]			
   	add r2, #20	
	str r2, [r3]
	pop {r0, r1, r2, r3, r4}
	mov pc, lr
.ltorg

print_stopF:
        push {r0, r1, r2, r3, r4}
        ldr r3, =X_offset_current
        ldr r0, [r3]
        mov r2, r0
        ldr r4, =X_offset_end
        ldr r4, [r4]
        cmp r0, r4
        bne proceed_print_stopF
                sub r2, #2560
                push {r0, r1, r2, r3, r4}
                ldr r0, =screen_begin
                ldr r0, [r0]
                ldr r3, =X_offset_begin
                ldr r3, [r3]
                mov r1, #25600
                newline_stopF_loop:
                        ldr r2, [r0, r1]
                        str r2, [r0]
                        add r0, #4
                        cmp r0, r3
                        blt newline_stopF_loop
                mov r2, #0
                ldr r3, =screen_end
                ldr r3, [r3]
                make_stopF_black_loop:
                        str r2, [r0]
                        add r0, #4
                        cmp r0, r3
                        blt make_stopF_black_loop
                pop {r0, r1, r2, r3, r4}
        proceed_print_stopF:
        mov r1, #0b111111111111111111111111
        add r0, #2560
        add r0, #2560
        add r0, #2560
        strh r1, [r0]
        strh r1, [r0, #2]
        strh r1, [r0, #4]
        strh r1, [r0, #6]
        strh r1, [r0, #8]
        strh r1, [r0, #10]
        add r0, #2560
        strh r1, [r0]
        strh r1, [r0, #2]
        strh r1, [r0, #4]
        strh r1, [r0, #6]
        strh r1, [r0, #8]
        strh r1, [r0, #10]
        add r0, #2560
        strh r1, [r0]
        strh r1, [r0, #2]
        strh r1, [r0, #4]
        strh r1, [r0, #6]
        strh r1, [r0, #8]
        strh r1, [r0, #10]
        add r0, #2560
        add r0, #2560
        add r0, #2560
        add r2, #20
	str r2, [r3]
        pop {r0, r1, r2, r3, r4}
	bl print_newline
	add r0, #1
	b find_1F_A
.ltorg
print_stopR:
        push {r0, r1, r2, r3, r4}
        ldr r3, =X_offset_current
        ldr r0, [r3]
        mov r2, r0
        ldr r4, =X_offset_end
        ldr r4, [r4]
        cmp r0, r4
        bne proceed_print_stopR
                sub r2, #2560
                push {r0, r1, r2, r3, r4}
                ldr r0, =screen_begin
                ldr r0, [r0]
                ldr r3, =X_offset_begin
                ldr r3, [r3]
                mov r1, #25600
                newline_stopR_loop:
                        ldr r2, [r0, r1]
                        str r2, [r0]
                        add r0, #4
                        cmp r0, r3
                        blt newline_stopR_loop
                mov r2, #0
                ldr r3, =screen_end
                ldr r3, [r3]
                make_stopR_black_loop:
                        str r2, [r0]
                        add r0, #4
                        cmp r0, r3
                        blt make_stopR_black_loop
                pop {r0, r1, r2, r3, r4}
        proceed_print_stopR:
        mov r1, #0b111111111111111111111111
	add r0, #2560
        add r0, #2560
        add r0, #2560
        strh r1, [r0]
        strh r1, [r0, #2]
        strh r1, [r0, #4]
        strh r1, [r0, #6]
        strh r1, [r0, #8]
        strh r1, [r0, #10]
        add r0, #2560
        strh r1, [r0]
        strh r1, [r0, #2]
        strh r1, [r0, #4]
        strh r1, [r0, #6]
        strh r1, [r0, #8]
        strh r1, [r0, #10]
        add r0, #2560
        strh r1, [r0]
        strh r1, [r0, #2]
        strh r1, [r0, #4]
        strh r1, [r0, #6]
        strh r1, [r0, #8]
        strh r1, [r0, #10]
        add r0, #2560
        add r0, #2560
        add r0, #2560
        add r2, #20
        str r2, [r3]
        pop {r0, r1, r2, r3, r4}
        bl print_newline
        sub r0, #3		
        b find_1R_T

.globl X_offset_begin
.globl X_offset_end
.globl X_offset_current
.globl screen_begin
.globl screen_end
.section .data
X_offset_begin:
.int 0
X_offset_end:
.int 0
X_offset_current:
.int 0
screen_begin:
.int 0
screen_end:
.int 0

my_sequence:

.ascii ">my_favourite_sequence"
.byte 10
.ascii "ATTAATTCCTACAATATAGTCATTTACAAAAATAACCCTCCATTTGATATTTAAGTCAAAATCAGTCAACGGAACGTGGAATAAATTATAACTTTCGACGCTCCGATCAGATTCATCATCATCTCTCTCTGTGTCGCTCCGATTTTGAATTTGGAATCTCTTAGTTAAGTTGGAAGTTTGTTCTTTGGTCTTTTCGCCTAGTTGTTGTTGGATCTGTTTTAAATTAAGCCAAAAACCTCCGATTAGATCGATCTCGGAACCGTCGAAATACAGTTCACCGTATCCGTTGTTTGTTTTTGGTATATGTATGTTTGAGAAGCTCTTACCATCTTTGTTTACAAGTCTGGTTCTTGGTAAACTTTAGCTATGAACACCATCGTCGTTGCTCAGTTGCAGAGACAATTTCAAGACTACATCGTTTCTCTTTATCAACAGGTTCGTTCCTAACCAAACTTTTCTTACTTTGGCTGGATTCTCACTTTTGGGCTTAGATAAGCTTAAGGTGCAGTTATGTGTGAATTTGAATTTTTTTATTTTTTTTATAAAGATGATATAATATGTTGTTGTTTTGAAGGGATTTCTGGATAATCAGTTCTCAGAGTTGAGAAAGTTGCAAGATGAAGGAACCCCTGATTTTGTAGCTGAAGTTGTCTCTCTATTCTTCGACGACTGTTCCAAGCTTATTAATACCATGTCTATATCCCTGTAAGCTTTGCTTACTCTCTTAGGCTTCTCTTTTTTATCTAACATGGGACTTTGTCTCTAATCCTCCTTCATATTCATTTTTGAGGGTGTAAATTAGCTTCATATATTCATGACAGCATTTTATGAGTTTATTATAAACATTAGGGAGCGGCCAGATAATGTGGATTTCAAACAGGTGGATTCAGGTGTTCATCAACTCAAGGGTAGTAGCTCCAGGTTTGTCACAGTGAACACTGCTAAATTTGCTTTTCTAGTTTTAAGTGACCAAACTACATTGATTTTAATGGCTCAGTCTCTGCTTTGTACTCAGTGTCGGTGCAAGGAGGGTGAAAAATGTGTGCATATCTTTCAAGGAATGTTGCGATGTTCAGAACCGTGAAGGGTGAGTATATTTTTTAGCTTGTTGATGCAAAATGTTATTGGATCTCTAAACTTTTTTATTATATGAGAAGCTATTCTTCTAATTCACACACAAATTGTGATAATGATATCTGGCACAGGTGTCTAAGGTGTTTACAGCAGGTGGATTATGAATATAAGATGTTAAAGACTAAACTTCAGGATCTCTTTAATGTGAGTTTTAAACTTTGCGAAAACCTACTTGTTCTGCTTGTGTATTCTTTTTACTGAGCCTTTTGCTACTTCTCATTCTTCTGTTTCTGTTATGTTATGTTGTTGCAGTTAGAGAAACAGATCCTCCAAGCTGGAGGTACAATTCCTCAAGTGGATATAAATTAGACCGATGCGTTTCTCGATTATGCAAATGTTCAAGGCTGATGACACAAATGAAACCGAAACTCCTCTGTAGTTTTGTTGTTGTTGTTATGTTTTATATTGATTAATGAGGTTCAGCAACACTGTCCCTGGCCAGATATCGTGTCTTGTTTAGACTCTTAATTGAGTTCTAAGAGTAAAAATTGAATTATTAGTCTATAAATAGACATGTCCATATGTATTCCTGTCACAATGCAACCACCATTTGGAGCCTTTGTTCTGACCATCATGACTTAGAATTCTCAGCATTATTCTGAATCTGATATACTCTATTGGATTCATGATTTTGATTTGAGCCGTAAAGCATGCGGGTACTAGTTAGCACTTTAGACGATTTCATTATGTGTGGA"
.byte 10
.byte 0
