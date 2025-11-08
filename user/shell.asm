org 0x0000

start:
    mov si, prompt
    call print_string

.loop:
    mov ah, 0x01          ; syscall: get_char
    int 0x60
    cmp al, 0
    je .loop              ; wait for input

    mov ah, 0x02          ; syscall: print_char
    int 0x60
    jmp .loop

print_string:
    mov ah, 0x0E
.next:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .next
.done:
    ret

prompt db "8088/OS Shell> ", 0
