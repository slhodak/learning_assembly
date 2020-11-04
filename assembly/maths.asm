section       .data

EXIT_SUCCESS  equ    0
SYS_EXIT      equ    60

bNumA         db      3
bNumB         db      5
wAns1         dw      0
bAns          db      0
wNumA         dw      1000
wNumB         dw      2000
wNumC         dw      3000
wAns2          dw      0

section       .text
global _start
_start:

  mov     al, byte [bNumA]
  mul     byte [bNumB] ; al = 15
  mov     word [wAns1], ax

  mov     al, byte [bNumA]
  inc     al
  add     al, byte [bNumB]
  mov     byte [bAns], al

  mov     bx, word [wNumA]
  add     bx, word [wNumB]
  add     bx, word [wNumC]
  mov     word [wAns2], bx

last:
  mov     rax, SYS_EXIT
  mov     rdi, EXIT_SUCCESS
  syscall