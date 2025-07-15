[SECTION .text]
extern printf
extern scanf
extern getchar
global factorial


factorial:
	push ebp
	mov ebp, esp


	mov edx, [ebp+8] ;;edx holds the number the user inputted
	
    ;;BaseCase:
    cmp edx, 0
    je edx_equalto_1_or_0
	cmp edx, 1
	je edx_equalto_1_or_0

    ;Else:
    ;return n*factorial (n-1)

    sub edx, 1
   
    push dword edx
    call factorial
    add esp, 4

    mov edx, [ebp+8]
    imul eax, edx ;;eax holds the answer


    ;mov eax, [ebp+8]
    ;imul eax, ebx


    jmp mcdonalds ;jumps to where return eax is


edx_equalto_1_or_0:
    mov eax, 1
    jmp mcdonalds


mcdonalds:
	mov esp, ebp
	pop ebp
	ret

[SECTION .data]



[SECTION .bss]

    numnum      resd    1
