section .text
    global leer_numero, leer_operacion, mostrar_resultado
    extern ciclo, mensaje_error_num, mensaje_num, mensaje_op, mensaje_mensaje_inicio_ciclo, nueva_linea, msg_error_div, printf, scanf, getchar

    ; Leer número desde la entrada
leer_numero:
    mov rdi, mensaje_num          ; Mostrar mensaje para ingresar número
    xor eax, eax                  ; Limpiar eax antes de llamar a printf
    call printf                   ; Llamar a printf para mostrar el mensaje

intentar_entrada:
    mov rdi, format_num           ; Dirección del formato para leer el número
    mov rsi, numero               ; Dirección de la variable donde guardar el número
    xor eax, eax                  ; Limpiar eax antes de llamar a scanf
    call scanf                    ; Llamar a scanf para leer el número

    ; Verificar si se leyó un número válido
    cmp eax, 1                    ; Comparar el valor de retorno de scanf
    jne numero_invalido           ; Si no se leyó un número válido, saltar a manejar el error

    ; Limpiar el buffer de entrada para evitar caracteres no deseados
    call limpiar_buffer

    mov eax, [numero]             ; Cargar el número leído en eax (retorno)
    ret                            ; Retornar el número

numero_invalido:
    ; Limpiar el buffer antes de volver a solicitar entrada
    call limpiar_buffer

    ; Mostrar mensaje de error
    mov rdi, mensaje_error_num     ; Mensaje de error para número inválido
    xor eax, eax
    call printf                    ; Llamar a printf para mostrar el mensaje

    jmp leer_numero         ; Volver a intentar la entrada

    ; Leer la operación (+, -, *, /, %)
leer_operacion:
    mov rdi, mensaje_op        ; Mostrar mensaje para ingresar operación
    xor eax, eax               ; Limpiar eax antes de llamar a printf
    call printf                ; Llamar a printf para mostrar el mensaje

    mov rdi, format_op         ; Dirección del formato para leer la operación
    mov rsi, operacion         ; Dirección de la variable donde guardar la operación
    xor eax, eax               ; Limpiar eax antes de llamar a scanf
    call scanf                 ; Llamar a scanf para leer la operación

    mov al, [operacion]        ; Cargar la operación leída en al (retorno)
    ret                        ; Retornar la operación

    ; Función para limpiar el buffer de entrada
limpiar_buffer:
    xor eax, eax
limpiar_loop:
    call getchar               ; Leer cada carácter residual en el buffer
    cmp al, 10                 ; Comparar con salto de línea (10 es '\n')
    jne limpiar_loop           ; Repetir hasta encontrar un salto de línea
    ret                        ; Terminar limpieza del buffer

    ; Mostrar el resultado en consola

section .data
    format_num db "%d", 0      ; Formato para leer un número entero
    format_op db "%c", 0       ; Formato para leer un carácter (operación)
    numero dd 0                ; Variable para almacenar el número
    operacion db 0             ; Variable para almacenar la operación