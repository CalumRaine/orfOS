.globl setup_framebuffer
.section .text

setup_framebuffer:
	ldr r0,=0x2000B880			/* load mailbox base address */
	check_write_status:
		ldr r2,[r0,#0x18]
		tst r2,#0x80000000		/* wait for 'write' status to be vacant */
		bne check_write_status

	ldr r1, =FrameBufferQuestionnaire	/* load framebufferinfo address */
	add r1,#0x40000001			/* shift for l2 caching and set channel to 1 */
	str r1,[r0,#0x20]			/* write message to mailbox */

	check_read_status:
            ldr r2,[r0,#0x18]			/* load status */
            tst r2,#0x40000000			/* is read ready? Has frame buffer been completed? */
            bne check_read_status
	
        mov r2, #179200                         /* calculate offset to move 'cursor' to bottom row */
        mov r3, #10
        mul r2, r3

        ldr r0, =FrameBufferQuestionnaire       /* load frame buffer details */
        ldr r0,[r0,#32]                         /* load beginning address of screen */
        ldr r1, =screen_begin                   /* load address to store value in */
        str r0, [r1]                            /* store beginning address of screen */
        
	add r0, r2                              /* add offset calculated above */
        ldr r1, =X_offset_begin                 /* load address to store X offset beginning of row */
        str r0, [r1]                            /* store X offset position */
        ldr r1, =X_offset_current               /* load address to store current X offset */
        str r0, [r1]                            /* store it */

        add r0, #2560                           /* add number to find end of row (when reaches here, start new line) */
        ldr r1, =X_offset_end                   /* load address to store end of line position */
        str r0, [r1]                            /* store end of line position */
	
	add r0, #23040
	ldr r1, =screen_end
	str r0, [r1]

        mov pc, lr

.globl FrameBufferQuestionnaire
.section .data
.align 12
FrameBufferQuestionnaire:
.int 1280    /* #0 Width */
.int 720    /* #4 Height */
.int 1280    /* #8 vWidth */
.int 720    /* #12 vHeight */
.int 0        /* #16 GPU - Pitch */
.int 16        /* #20 Bit Depth */
.int 0        /* #24 X */
.int 0        /* #28 Y */
.int 0        /* #32 GPU - Pointer */
.int 0        /* #36 GPU - Size */
