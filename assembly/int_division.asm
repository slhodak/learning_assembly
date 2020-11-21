section         .data

SYS_EXIT        equ   60
EXIT_SUCCESS    equ   0

b1              db    63
b2              db    17
b3              db    5
bAns1           db    0
bAns2           db    0
bRem2           db    0
bAns3           db    0

w1              dw    4321
w2              dw    1234
w3              dw    167
wAns1           dw    0
wAns2           dw    0
wRem2           dw    0
wAns3           dw    0

section       .text
global _start
_start:

  ; Division
  ; bAns1 = b1 / 3
  mov         al, byte [b1]
  mov         ah, 0
  mov         bl, 3
  div         bl  ; al = ax / bl
  mov         byte [bAns1], al
  ; bAns2 = b1 / b2
  mov         al, byte [b1]
  mov         ah, 0
  mov         bl, byte [b2]
  div         bl
  mov         byte [bAns2], al
  ; bRem2 = b1 % b2
  mov         byte [bRem2], ah ; 12
  ; bAns3 = (b1 * b3) / b2
  mov         al, byte [b1]
  mul         byte [b3]
  div         byte [b2]
  mov         byte [bAns3], al

last:
  mov         rax, SYS_EXIT
  mov         rdi, EXIT_SUCCESS
  syscall