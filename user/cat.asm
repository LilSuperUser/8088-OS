; ===============================
; cat.asm — minimal input echo
; ===============================

bits 16
org 0x0000

start:
    ; ---- establish correct segments ----
    mov ax, cs
    mov ds, ax
    mov es, ax

.loop:
    ; ---- get character ----
    mov ah, 0x01        ; syscall: get_char
    int 0x60
    cmp al, 0
    je .loop            ; no input yet

    ; ---- exit on Enter ----
    cmp al, 0x0D
    je .done

    ; ---- print character ----
    mov ah, 0x02        ; syscall: print_char
    int 0x60

    jmp .loop

.done:
    ; print CRLF before exit
    mov al, 0x0D
    mov ah, 0x02
    int 0x60
    mov al, 0x0A
    int 0x60

.hang:
    jmp .hang           ; no process exit yet
