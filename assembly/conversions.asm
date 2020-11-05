section       .data

; Constants for exiting program
EXIT_SUCCESS  equ   0
SYS_EXIT      equ   60

; Vars
bNumA         db    100
wNumA         dw    0
bNumB         db    -100
bNum3         db    0
wNumB         dw    0
wNumC         dw    200
bNumC         db    0
qNumD         dq    40000
wNumD         dw    0
bNumE         db    9
qNumE         dq    0
bNumF         db    13
qNumF         dq    1000000

; Empty Vars
dNumA         dd    0
qNumA         dq    0
dNumB         dd    -9000
wNumE         dw    0

section       .text
global _start
_start:

  ; Operations
  ; Narrowing
  mov         ax, -100 ; Signed
  mov         byte [bNum3], al
  ; bNum3 = -100
  mov         ax, word [wNumC] ; Unsigned
  mov         byte [bNumC], al
  ; bNumC = 200
  mov         rbx, qWord [qNumD]
  mov         word [wNumD], bx ; Unsigned
  ; wNumD = 40000
  mov         r8d, dWord [dNumB] ; Signed
  mov         word [wNumE], r8w
  ; wNumE = -9000
  ; ## Unsigned Widening ##
  ; Widening memory
  mov         rdx, 1000000
  mov         cl, byte [bNumE]
  mov         rdx, 0
  mov         dl, cl
  mov         qWord [qNumE], rdx
  ; qNumE = 9
  ; load effective address
  lea         rsi, qWord [qNumE]
  ; Widening register alone
  mov         rcx, 2103000
  mov         bl, 120
  mov         rcx, 0
  mov         cl, bl
  ; movzx
  mov         rsi, 2345678
  movzx       rsi, byte [bNumF]
  ; ## Signed Widening ##
  mov         ax, -7
  cwde  ; signed ax into double-word in eax
  mov         ax, -26
  movsx       ebx, ax ; signed src into larger dest (not dw to qw)
  mov         dWord [dNumA], ebx
  mov         ecx, -30000
  movsxd      rcx, ecx ; signed dw into qw specifically
  mov         qWord [qNumA], rcx


last:
  mov         rax, SYS_EXIT
  mov         rdi, EXIT_SUCCESS
  syscall