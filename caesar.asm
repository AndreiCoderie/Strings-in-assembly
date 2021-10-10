%include "io.mac"

section .text
    global caesar
    extern printf

caesar:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY

    ;; TODO: Implement the caesar cipher




DoLoop:
    cmp ecx, 0
    je stop

    mov bl, byte [esi]
    mov al, byte [esi]
    or al, 0x20
    sub al, 'a'
    cmp al, 'z' - 'a'
    ja nextChar

    cmp edi, 27
    jg specialLabel
    cmp bl, 0x5A
    jl upper  

    cmp bl, 0x61
    jge lower

    jmp stop

specialLabel:
    sub edi, 26
    cmp edi, 27
    jg specialLabel
    jmp DoLoop

lower:
    add ebx, edi
    cmp bl , 0x7A
    ja lower2
    mov [edx], bl
    inc esi
    dec ecx
    inc edx
    jmp DoLoop


lower2:
    sub bl, 0x7A
    add bl, 0x61
    sub bl, 1
    mov [edx], bl
    inc esi
    dec ecx
    inc edx
    jmp DoLoop




upper:
    add ebx, edi
    cmp bl , 0x5A
    ja upper2
    mov [edx], bl
    inc esi
    dec ecx
    inc edx
    jmp DoLoop

upper2:
    sub bl, 0x5A
    add bl, 0x41
    sub bl, 1 ;
    mov [edx], bl
    inc esi
    dec ecx
    inc edx
    jmp DoLoop
    
nextChar:
    
    mov [edx], bl
    dec ecx
    inc esi
    inc edx
    jmp DoLoop


    
stop:
    popa
    leave
    ret
    ;; DO NOT MODIFY