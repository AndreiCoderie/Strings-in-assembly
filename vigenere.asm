%include "io.mac"

section .text
    global vigenere
    extern printf


vigenere:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     ecx, [ebp + 16]     ; plaintext_len
    mov     edi, [ebp + 20]     ; key
    mov     ebx, [ebp + 24]     ; key_len
    ;; DO NOT MODIFY



    ;; TODO: Implement the Vigenere cipher

xor ecx, ecx          ;contor pentru for
xor ebx, ebx          ;ebx va fi lungimea noului key == plaintext_len

doLoop:
    cmp ecx, [ebp + 16]
    jl loop
    lea ebx, [edx] 
    mov edx, [ebp + 8]
    xor ecx, ecx
    xor eax, eax
    jmp afterKey    


loop:
    mov al, [esi + ecx]
    mov ah, [edi + ebx]
    or al, 0x20
    sub al, 'a'
    cmp al, 'z' - 'a'
    ja isNotLetter
    jmp isLetter

isLetter:
    mov [edx], ah
    inc ecx
    inc ebx
    inc edx
    jmp checkCars

isNotLetter:
    mov byte [edx], 0x20
    inc ecx
    inc edx
    jmp checkCars

checkCars:
    cmp ebx, [ebp + 24]
    je resetKey
    jmp doLoop

resetKey:
    mov ebx, 0
    ;inc ecx
    jmp doLoop

afterKey:
    cmp ecx, [ebp + 16]
    jl loop2
    jmp stop


loop2:
    mov al, [edx]
    mov ah, [esi]
    mov bl, [esi]
    
    or bl, 0x20
    sub bl, 'a'
    cmp bl, 'z' - 'a'
    ja nextChar
    sub al, 'A'
   
    cmp ah, 0x5A
    jle upper
   
    cmp ah, 0x61
    jge lower

    inc ecx
    inc esi
    inc edx
    
    jmp afterKey


lower:
    add ah, al
    cmp ah, 0x7A
    ja lower2
    mov [edx], ah
    inc esi
    inc ecx
    inc edx
    jmp afterKey

lower2:
    sub ah, 0x7A
    add ah, 0x61
    sub ah, 1
    mov [edx], ah
    inc esi
    inc ecx
    inc edx
    jmp afterKey

upper:
    add ah, al
    cmp ah, 0x5A
    ja upper2
    mov [edx], ah
    inc esi
    inc ecx
    inc edx
    jmp afterKey

upper2:
    sub ah, 0x5A
    add ah, 0x41
    sub ah, 1
    ;PRINTF32 `%c : \x0`, edx
    mov [edx], ah
    inc esi
    inc ecx
    inc edx
    jmp afterKey    

nextChar:
    mov [edx], ah
    inc ecx
    inc edx
    inc esi
    jmp afterKey


    ;; DO NOT MODIFY
stop:
    ;
    
    popa
    leave
    ret
    ;; DO NOT MODIFY