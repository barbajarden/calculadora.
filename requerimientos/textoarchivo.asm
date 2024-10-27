section .data
global mensaje_num    
mensaje_num db "Ingrese un numero: ", 0

global mensaje_op     
mensaje_op db "", 10, "Ingrese una de estas operaciones: (+, -, *, /, %)", 10, "o escriba 'q' para salir: ", 0

global mensaje_inicio_ciclo       
mensaje_inicio_ciclo db "", 10, "calculadora", 10, 10, "hecho por Anderson Ceballos", 10, "git hub:https://github.com/barbajarden", 10, 10, 0

global mensaje_ciclo       
mensaje_ciclo db "", 10, 10, "... Continuando. ", 10, 10, 10, 0

global error_msg       
error_msg db "",10 ,"    Salto de error.", 10, 0

global nueva_linea
nueva_linea db " ", 0

global msg_error_div
msg_error_div db "",10 , "    No se puede dividir por cero.", 10, 0

; Mensaje para math.asm
global mensaje_suma
mensaje_suma db "El resultado de la suma es: %lld", 10, 0

global mensaje_resta
mensaje_resta db "El resultado de la resta es: %lld", 10, 0

global mensaje_multiplicacion
mensaje_multiplicacion db "El resultado de la multiplicación es: %lld", 10, 0

global mensaje_division
mensaje_division db "El resultado de la división es: %lld", 10, 0

global mensaje_modulo
mensaje_modulo db "El resultado del módulo es: %lld", 10, 0

global mensaje_operacion_invalida
mensaje_operacion_invalida db "", 10, "    No se ha seleccionado ninguna operación válida.", 10, 10, 10, 0  ; Agregando salto de línea

global mensaje_error_num
mensaje_error_num db "",10, "    No se ingreso un numero. ", 10, 10, 0
