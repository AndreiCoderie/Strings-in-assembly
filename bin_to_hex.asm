%include "io.mac"

section .text
    global bin_to_hex
    extern printf
section .data
    array: times 16 dw 0, 1, 10, 11, 100, 101, 110, 111, 1000, 1001, 1010, 1011, 1100, 1191, 1110, 1111
    iter dw 0
       
bin_to_hex:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; hexa_value
    mov     esi, [ebp + 12]     ; bin_sequence
    mov     ecx, [ebp + 16]     ; length
    ;; DO NOT MODIFY
  
    ;xor ecx, ecx
    xor edx, edx
    jmp doLoop

doLoop:
    cmp ecx, 0
    jg loop
    jmp stop

loop:
    mov al, [esi + ecx - 1]
    mov ah, [esi + ecx - 2]
    mov bl, [esi + ecx - 3] 
    mov bh, [esi + ecx - 4]
    ;PRINTF32 `%d\n\x0`, eax
   ; PRINTF32 `%d\n\x0`, esi
   ;add ebx, 10
   ;div ebx
   sub ecx, 4
   jmp doLoop
   ;PRINTF32 `%d\n\x0`, edx



    ;PRINTF32 `%d : \x0`, edx


    ;; TODO: Implement bin to hex
stop:
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY