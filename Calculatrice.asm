section .text
    global _start



_addition:
    movzx eax, byte [num1]
    movzx ebx, byte [num2]

    sub eax, '0'
    sub ebx, '0'

    add eax, ebx

    add eax, '0'
    mov [result], al

    ;Afficher le Calcul
    mov edx, len_addition
    mov ecx, str_addition
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 1
    mov ecx, result
    mov ebx, 1
    mov eax, 4
    int 0x80

    jmp fin

_soustraction:
    movzx eax, byte[num1]
    movzx ebx, byte[num2]

    sub eax, '0'
    sub ebx, '0'

    sub eax, ebx

    add eax, '0'
    mov [result], al


    ;Afficher le calcul
    mov edx, len_soustraction
    mov ecx, str_soustraction
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 1
    mov ecx, result
    mov ebx, 1
    mov eax, 4
    int 0x80

    jmp fin

_start:
    ;Demander le premier chifre a l'utilisateur
    mov edx, len
    mov ecx, ask_number
    mov ebx, 1
    mov eax, 4
    int 0x80

    ;Stocker le nombre choisis
    mov edx, 2
    mov ecx, num1
    mov ebx, 0
    mov eax, 3
    int 0x80

    ;Demander le second chifre a l'utilisateur
    mov edx, len2
    mov ecx, ask_number2
    mov ebx, 1
    mov eax, 4
    int 0x80
 
    ;Stocker le 2eme nombre choisis
    mov edx, 2
    mov ecx, num2
    mov ebx, 0
    mov eax, 3
    int 0x80

    ;Demaander l'operateurs + ou -
    mov edx, len3
    mov ecx, operator
    mov ebx, 1
    mov eax, 4
    int 0x80

    ;Stocker l'opreateur
    mov edx, 2
    mov ecx, oper
    mov ebx, 0
    mov eax, 3
    int 0x80

    ;Tout afficher
    mov edx, len4
    mov ecx, char1
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 1
    mov ecx, num1
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, len5
    mov ecx, char2
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 1
    mov ecx, num2
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, len6
    mov ecx, char3
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 1
    mov ecx, oper
    mov ebx, 1
    mov eax, 4
    int 0x80

    ;Calculer le resultat
    mov al, [oper]

    cmp al, '+'
    je _addition
    
    cmp al, '-'
    je _soustraction

fin:
    mov eax, 1
    xor ebx, ebx
    int 0x80


section .bss
    num1 resb 5
    num2 resb 5
    oper resb 5
    result resb 1

section .data
    ask_number db 'Entrer un nombre : '
    len equ $ - ask_number

    ask_number2 db 0xa, 'Entrer un nombre : '
    len2 equ $ - ask_number2

    operator db 0xa, 'Entrer + ou - : '
    len3 equ $ - operator

    char1 db 0xa, 'Vous avez choisis les nombre '
    len4 equ $ - char1

    char2 db ' et '
    len5 equ $ - char2

    char3 db 0xa, 'Vous avez choisis l operateur : ', 
    len6 equ $ - char3

    str_addition db 0xa, 'Le resultat est : '
    len_addition equ $ - str_addition

    str_soustraction db 0xa, 'Le resultat est : '
    len_soustraction equ $ - str_soustraction