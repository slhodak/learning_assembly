section       .data

; Constants for exiting program
EXIT_SUCCESS  equ   0
SYS_EXIT      equ   60

; Vars
bNumA         db    100
wNumA         dw    0


section       .text
global _start
_start:

; Operations



last:
  mov          rax, SYS_EXIT
  mov          rdi, EXIT_SUCCESS
  syscall