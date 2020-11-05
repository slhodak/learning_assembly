section      .data
; -----
; Define constants
EXIT_SUCCESS      equ       0     ; successful operation
SYS_EXIT          equ       60    ; call code for terminate
; -----
; Byte variable declarations
bVar1             db        -17
bVar2             db        -9
bResult           db        0
; -----
; Word variable declarations
wVar1             dw        17000
wVar2             dw        9000
wResult           dw        0
; omitting some of the example program
; it demonstrates how different sized registers will be needed for different sized operands

section      .text
global _start
_start:

; Basic addition
; Byte example
  mov     al, byte [bVar1]
  add     al, byte [bVar2]
  mov     byte [bResult], al
; Word example
  mov     ax, word [wVar1]
  add     ax, word [wVar2]
  mov     word [wResult], ax

; Done, terminate program
last:
  mov     rax, SYS_EXIT         ; call code for exit
  mov     rdi, EXIT_SUCCESS     ; exit program with success
  syscall