section .bss
    num1 resq 1          ; Reservar espacio para el primer número
    num2 resq 1          ; Reservar espacio para el segundo número
    operacion resb 1     ; Reservar espacio para el operador

section .text
    global main, salir, ciclo
    extern mensaje_ciclo, mensaje_inicio_ciclo, leer_numero, leer_operacion, suma, resta, multiplicacion, division, modulo, printf
    extern mensaje_operacion_invalida

main:
    ; Imprimir el mensaje de inicio de ciclo solo una vez
    mov rdi, mensaje_inicio_ciclo 
    xor eax, eax
    call printf

ciclo:
    ; Leer primer número
    call leer_numero
    mov [num1], rax  ; Guardar primer número en memoria

    ; Leer segundo número
    call leer_numero
    mov [num2], rax  ; Guardar segundo número en memoria

    ; Leer la operación
    call leer_operacion
    mov [operacion], al  ; Guardar la operación en memoria


    cmp byte [operacion], 'q'
    je salir
    ; Realizar operación según el operador
    cmp byte [operacion], '+'
    je realizar_suma
    cmp byte [operacion], '-'
    je realizar_resta
    cmp byte [operacion], '*'
    je realizar_multiplicacion
    cmp byte [operacion], '/'
    je realizar_division
    cmp byte [operacion], '%'
    je realizar_modulo

    ; Si no se encuentra la operación, mostrar mensaje de operación inválida
    call mostrar_msj_op_invalida
    jmp ciclo ; Se implementa un ciclo

mostrar_msj_op_invalida:
    mov rdi, mensaje_operacion_invalida
    xor rax, rax
    call printf
    ret
    
realizar_suma:
    mov rdi, [num1]     ; Cargar num1 en rdi
    mov rsi, [num2]     ; Cargar num2 en rsi
    call suma           ; Llamar a suma
    jmp iterar

realizar_resta:
    mov rdi, [num1]     ; Cargar num1 en rdi
    mov rsi, [num2]     ; Cargar num2 en rsi
    call resta          ; Llamar a resta
    jmp iterar

realizar_multiplicacion:
    mov rdi, [num1]     ; Cargar num1 en rdi
    mov rsi, [num2]     ; Cargar num2 en rsi
    call multiplicacion  ; Llamar a multiplicación
    jmp iterar

realizar_division:
    mov rdi, [num1]     ; Cargar num1 en rdi
    mov rsi, [num2]     ; Cargar num2 en rsi
    call division        ; Llamar a división
    jmp iterar

realizar_modulo:
    mov rdi, [num1]     ; Cargar num1 en rdi
    mov rsi, [num2]     ; Cargar num2 en rsi
    call modulo          ; Llamar a módulo
    jmp iterar

iterar:
    mov rdi, mensaje_ciclo 
    xor eax, eax
    call printf
    jmp ciclo           ; Volver al ciclo de lectura y operación

salir:
    mov rax, 60      ; syscall número para salir en 64 bits
    xor rdi, rdi     ; código de salida 0
    syscall          ; Llamada al sistema para salir