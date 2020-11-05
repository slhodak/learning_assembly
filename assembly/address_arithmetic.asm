section         .data

SYS_EXIT        equ   60
EXIT_SUCCESS    equ   0

b1              db    0
w1              dw    0
d1              dd    0
q1              dq    0
dq1             ddq   0

section     .text
global _start
_start:

  mov       al, 100
  mov       byte [b1], al
  mov       byte [b1], 0 ; works

  mov       word [w1], 1000
  ;mov       word [w1], 0 ; works
  mov       al, byte [w1+1] ; works

  mov       bx, 0xabcd
  mov       byte [w1+1], bl ; works, moves cd to upper-order of w1 word

last:
  mov       rax, SYS_EXIT
  mov       rdi, EXIT_SUCCESS
  syscall