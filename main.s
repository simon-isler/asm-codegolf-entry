section .text
global _start             ; Must be declared for linker

_start:                   ; Entry point for linker

    ; get first commandline arg into eax
    pop     eax
    pop     eax
    pop     eax

    movzx   eax, byte[eax] 

    ; chatch the input characters:
    mov     edx, cpass0
    cmp     eax, 48        ; ascii '0'
    je      output

    mov     edx, cpass1
    cmp     eax, 49        ; ascii '1'
    je      output

    mov     edx, cpass2
    cmp     eax, 50        ; ascii '2'
    je      output

    mov     edx, cpass3
    cmp     eax, 51        ; ascii '3'
    je      output

    mov     edx, cpass4
    cmp     eax, 52        ; ascii '4'
    je      output

    mov     edx, cpass5
    cmp     eax, 53        ; ascii '5'
    je      output

    mov     edx, cpass6
    cmp     eax, 54        ; ascii '6'
    je      output

    mov     edx, cpass7
    cmp     eax, 55        ; ascii '7'
    je      output

output:
    mov     eax, 4        ; Syscall: sys_write
    mov     ebx, 1        ; File descriptor (stdout)
    mov     ecx, edx      ; Pointer to string in mermory
    mov     edx, 48       ; Length of string
    int     0x80          ; Invoke syscall

exit:
    mov     eax, 1        ; Syscall: sys_exit
    mov     ebx, 0        ; Exit code 0
    int     0x80          ; Invoke syscall

section .data

;   _N_
;  /   \
;W|  .  |E
; |     |
;  \_ _/
;    S

cpass0: db "   _N_",0xA,"  / | \",0xA,"W|  .  |E" ,0xA," |     |",0xA,"  \_ _/",0xA,"    S", 0xA
cpass1: db "   _N_",0xA,"  /   \",0xA,"W|  ./ |E" ,0xA," |     |",0xA,"  \_ _/",0xA,"    S", 0xA
cpass2: db "   _N_",0xA,"  /   \",0xA,"W|  ._ |E" ,0xA," |     |",0xA,"  \_ _/",0xA,"    S", 0xA
cpass3: db "   _N_",0xA,"  /   \",0xA,"W|  .  |E" ,0xA," |   \ |",0xA,"  \_ _/",0xA,"    S", 0xA
cpass4: db "   _N_",0xA,"  /   \",0xA,"W|  .  |E" ,0xA," |     |",0xA,"  \_|_/",0xA,"    S", 0xA
cpass5: db "   _N_",0xA,"  /   \",0xA,"W|  .  |E" ,0xA," | /   |",0xA,"  \_ _/",0xA,"    S", 0xA
cpass6: db "   _N_",0xA,"  /   \",0xA,"W| _.  |E" ,0xA," |     |",0xA,"  \_ _/",0xA,"    S", 0xA
cpass7: db "   _N_",0xA,"  /   \",0xA,"W| \.  |E" ,0xA," |     |",0xA,"  \_ _/",0xA,"    S", 0xA
