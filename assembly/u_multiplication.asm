section         .data

SYS_EXIT        equ   60
EXIT_SUCCESS    equ   0

b1              db    255
b2              db    100
wAns            dw    0
w1              dw    50000
w2              dw    20000
dAns            dd    0 ; 1,000,000,000
d1              dd    1000200300
d2              dd    4000500600
qAns            dq    0 ; 4,001,301,900,270,180,000
q1              dq    98765432123
q2              dq    12345678909
dqAns           ddq   0 ; 1,219,326,312,299,192,193,807
                      ; = 0x42 198d 44c4 b85d 130f
                      ; that's cray
section     .text
global _start
_start:
  mov       al, byte [b1]
  mul       byte [b2]
  mov       word [wAns], ax

  mov       ax, word [w1]
  mul       word [w2]
  mov       word [dAns], ax ; least sig word
  mov       word [dAns+2], dx ; most sig word

  mov       eax, dword [d1]
  mul       dword [d2]
  mov       dword [qAns], eax ; lower-order dword
  mov       dword [qAns+4], edx ; upper-order dword

  mov       rax, qword [q1]
  mul       qword [q2]
  mov       qword [dqAns], rax
  mov       qword [dqAns+8], rdx

last:
  mov       rax, SYS_EXIT
  mov       rdi, EXIT_SUCCESS
  syscall