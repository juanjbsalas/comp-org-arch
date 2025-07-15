[SECTION .text]
extern printf
extern getchar
global military_to_regular

military_to_regular:
	push ebp
	mov ebp, esp

	;code here
	mov ebx, 0
	mov ecx, [ebp+12]
	mov edx, [ebp+8]

	;if(ecx > 12):
	cmp ecx, 12
	jg ecx_greaterthan_12

    cmp ecx, 12
    je ecx_equalto_12

	;else:
	cmp edx, 10
	jl edx_lessthan_10_PM

    ;print("The time for 12-Hour Clock is " + str(y) + ":" + str(m) + " PM")
	push dword edx
	push dword ecx
	push dword prompt3 ;;;;
	call printf
	add esp, 12
	jmp taco

ecx_equalto_12:
    ;if(edx < 10)
    cmp edx, 10
    jl edx_lessthan_10_blah

    ;else:
    push dword edx
    push dword ecx
    push dword prompt2
    call printf
    add esp, 12
    jmp taco


ecx_greaterthan_12:
	mov ebx, 1
	sub ecx, 12
	
	;if(edx<10)
	cmp edx, 10
	jl edx_lessthan_10_blah
	
	;else
    ;print("The time for 12-Hour Clock is " + str(y) + ":" + str(m) + " AM") ;;
	
    push dword edx ;;;;changed  ;;its going to this
	push dword ecx ;;;;;changed
	push dword prompt2
	call printf
	add esp, 12
	jmp taco


;ebx_equalto_0:
	;cmp edx, 10
	;jl edx_lessthan_10_AM
	
	;else:
	;print("The time for 12-Hour Clock is " + str(y) + ":" + str(m) + " AM")
	;jmp taco


edx_lessthan_10_blah:
;print("The time for 12-Hour Clock is " + str(y) + ":" + "0" + str(m) + " PM")
	push dword edx
	push dword ecx
	push dword prompt1
	call printf
	add esp, 12
	jmp taco

edx_lessthan_10_PM:
	;print("The time for 12-Hour Clock is " + str(y) + ":" + "0" + str(m) + " PM")
	push dword edx
	push dword ecx
	push dword prompt4
	call printf
	add esp, 12
	jmp taco


taco:
	mov esp, ebp
	pop ebp
	ret


[SECTION .data]

	prompt1				db		"The time for 12-Hour Clock is %d:0%d PM.", 10, 0
	prompt2				db 		"The time for 12-Hour Clock is %d:%d PM.", 10, 0
	prompt3				db		"The time for 12-Hour Clock is %d:%d AM.", 10 , 0
	prompt4				db		"The time for 12-Hour Clock is %d:0%d AM.", 10 , 0

[SECTION .bss]