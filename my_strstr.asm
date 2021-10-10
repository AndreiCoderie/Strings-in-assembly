%include "io.mac"

section .text
    global my_strstr
    extern printf

section .data
    iterator dw 0
    current db 0
    hash db 0
    iterator2 db 0
    nextPos db 0
my_strstr:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edi, [ebp + 8]      ; substr_index
    mov     esi, [ebp + 12]     ; haystack
    mov     ebx, [ebp + 16]     ; needle
    mov     ecx, [ebp + 20]     ; haystack_len
    mov     edx, [ebp + 24]     ; needle_len
    
       
xor ecx, ecx     
xor edx, edx    

doLoop:
    cmp edx, [ebp + 20]
    jl loop
    jmp wrong

loop: 
    mov al, [esi + edx]
    mov ah, [ebx + ecx]
    cmp al, ah
    jne reset
    jmp resetLoop

resetLoop:
    inc edx
    inc ecx
    cmp ecx, [ebp + 24]
    jl doLoop
    jmp good

reset:
    inc edx
    mov ecx, 0
    jmp doLoop

good:
    sub edx, ecx
    mov [edi], edx
    jmp stop

wrong:
    add edx, 1
    mov [edi], edx
    jmp stop


    
stop:
    popa
    leave
    ret
    ;; DO NOT MODIFY
