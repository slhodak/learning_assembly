section         .data

SYS_EXIT        equ   60
EXIT_SUCCESS    equ   0

; Variables
b1              db    0
b2              db    3
b3              db    5
b4              db    7

test_neg        db    -8
test_neg2       db    100

b5              db    10
b6              db    -8

w1              dw    0

bNum1           db    42
bNum2           db    73
bAns            db    0

wNum1           dw    4321
wNum2           dw    1234
wAns            dw    0

dNum1           dd    42000
dNum2           dd    73000
dAns            dd    0

qNum1           dq    42000000
qNum2           dq    73000000
qAns            dq    0

dquad1          ddq   0x1A000000000000000
dquad2          ddq   0x2C000000000000000
dqSum           ddq   0

section     .text
global _start
_start:

  ; Addition
  mov       al, byte [b1]
  add       al, byte [b2]
  add       al, byte [b3]
  add       al, byte [b4]
  ; al = 15

  mov       cl, byte [test_neg]
  add       cl, byte [test_neg2]
  ; cl = 142 no, -114
  ; problem is 150 is unsigned. treating as if it's signed yields unexpected results.
  ; what if 150 were signed? 
  mov       bl, byte [b5]
  add       bl, byte [b6]
  ; bl = 2 yes

  ; bAns = bNum1 + bNum2
  mov       al, byte [bNum1]
  add       al, byte [bNum2] ; type spec can be omitted, not good practice
  mov       byte [bAns], al
  ; wAns = wNum2 + wNum2
  mov       ax, word [wNum1]
  add       ax, word [wNum2]
  mov       word [wNum1], ax
  ; dAns = dNum1 + dNum2
  mov       eax, dWord [dNum1]
  add       eax, dWord [dNum2]
  mov       dWord [dAns], eax
  ; qAns = qNum1 + qNum2
  mov       rax, qWord [qNum1]
  add       rax, qWord [qNum2]
  mov       qWord [qAns], rax
  ; increment
  inc       al ; works on registers
  inc       ax
  inc       dWord [dAns] ; works on memory (spec type required)
  inc       qWord [qAns]
  add       qWord [qAns], 300 ; either operand can be memory
  ; add two double quadwords
  mov       rax, qWord [dquad1] ; load the first ddq LSQ
  mov       rdx, qWord [dquad1+8] ; load the MSQ
  add       rax, qWord [dquad2] ; add the LSQs
  adc       rdx, qWord [dquad2+8] ; add the MSQs with carry
  mov       qword [dqSum], rax ; save the LSQ
  mov       qword [dqSum+8], rdx ; save the MSQ

last:
  mov       rax, SYS_EXIT
  mov       rdi, EXIT_SUCCESS
  syscall