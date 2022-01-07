        .section .text (1)
        .globl _start; (2)
        len = 8
        enroll = 4
        elem_sz = 4
_start: (4)
        addi x20, x0, len/enroll (5)
        la x1, _x (6)
loop:
        lw x2, 0(x1) (7)
        add x31, x31, x2 (8)
        lw x2, 4(x1)
        add x31, x31, x2
        lw x2, 8(x1)
        add x31, x31, x2
        lw x2, 12(x1)
        add x31, x31, x2
        addi x1, x1, elem_sz*enroll (9)
        addi x20, x20, -1 (10)
        bne x20, x0, loop (11)
        addi x31, x31, 1
forever: j forever (12)

        .section .data (13)
_x:     .4byte 0x1 (14)
        .4byte 0x2
        .4byte 0x3
        .4byte 0x4
        .4byte 0x5
        .4byte 0x6
        .4byte 0x7
        .4byte 0x8
