section           .data

SYS_EXIT          equ     60
EXIT_SUCCESS      equ     0

bNum1             db    73
bNum2             db    42
bAns              db    0
wNum1             dw    50000
wNum2             dw    20000
wAns              dw    0

section     .text
global _start
_start:

  ; Subtraction
  mov       al, byte [bNum1]
  sub       al, byte [bNum2]
  mov       byte [bAns], al

  mov       bx, word [wNum1]
  sub       bx, word [wNum2]
  mov       word [wAns], bx

last:
  mov       rax, SYS_EXIT
  mov       rdi, EXIT_SUCCESS
  syscall