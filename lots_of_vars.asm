section       .data

EXIT_SUCCESS  equ     0
SYS_EXIT      equ     60

dVar1         dd      255
dVar1         dd      65535
aResult       dd      0 ; do you need these empty registers after the ones you'll add?
qVar1         dq      4294967295
qVar2         dq      1844674407
bResult       dq      0

strng1        db      "Hello "
strng2        db      "World"
cResult       db      ""
arrVar        db      123, 231, 255
flt1          dd      3.14159
flt2          dq      8.2612385932837234819

section       .text
global _start
_start:

  ; Add byte to largest word, require double-word space
  mov     eax, dWord [dVar1]
  add     eax, dWord [dVar2]
  mov     dWord [aResult], eax
  ; Add double-word to largest double-word, require quadword space
  mov     rbx, qWord [qVar1]
  add     rbx, qWord [qVar2]
  mov     qWord [bResult], rbx
  ; Add strings together
  mov     cl, byte [strng1]
  add     cl, byte [strng2]
  mov     byte [cResult], cl
  ; Resetting dd upper-order
  mov     ebx, 100
  mov     rcx, -1   ; rcx = 0xffff...
  mov     ecx, ebx
  ; Not resetting upper-order
  mov     edx, 1000000
  mov     dx,  20000 ; turns edx into wrong value (1003040)

last:
  mov     rax, SYS_EXIT
  mov     rdi, EXIT_SUCCESS
  syscall