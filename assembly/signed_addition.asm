section         .data

SYS_EXIT        equ   60
EXIT_SUCCESS    equ   0

b1              db    -25
b2              db    -50

b3              db    50
b4              db    -100

section       .text
global _start
_start:

  mov         al, byte [b1]
  add         al, byte [b2]
  add         al, byte [b3]
  add         al, byte [b4]

last:
  mov         rax, SYS_EXIT
  mov         rdi, EXIT_SUCCESS
  syscall