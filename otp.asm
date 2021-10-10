%include "io.mac"

extern puts

section .text
    global otp
    extern printf

otp:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY
    
    
    ;; TODO: Implement the One Time Pad cipher
DoLoop:

	mov bl, byte [edi]
	xor bl, byte [esi]
	mov [edx], bl
                                                                                                             
	inc edi
	inc esi
	inc edx
	
    loop DoLoop
    ;; DO NOT MODIFY
stop:
    popa
    leave    
    ret
    ;; DO NOT MODIFY