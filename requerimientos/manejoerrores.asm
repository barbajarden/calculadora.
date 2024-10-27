section .data
    extern error_msg, printf

section .text
    global manejar_error

manejar_error:
    mov rdi, error_msg
    xor eax, eax
    call printf
    ret