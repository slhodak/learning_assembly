section       .data
SYS_EXIT      equ   60
EXIT_SUCCESS  equ   0

w1            dw    10
w2            dw    -10
w3            dw    0

d1            dd    42000
d2            dd    -13000
dAns1         dd    0  
dAns2         dd    0

q1            dq    120000
q2            dq    -230000
qAns1         dq    0
qAns2         dq    0

section       .text
global  _start
_start:

  mov         ax, word [w1]
  imul        ax, word [w2]
  mov         word [w3], ax

  mov         ebx, dword [d1]
  imul        ebx, 113
  mov         dword [dAns1], ebx

  mov         ecx, dword [d1]
  imul        ecx, dword [d2]
  mov         dword [dAns2], ecx

  imul        rdx, qword [q1], 7096
  mov         qword [qAns1], rdx

  mov         r8, qword [q1]
  imul        r8, qword [q2]
  mov         qword [qAns2], r8

  mov         rax, 0 

last:
  mov         rax, SYS_EXIT
  mov         rdi, EXIT_SUCCESS
  syscall