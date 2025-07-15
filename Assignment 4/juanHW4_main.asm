;Assignment 4
;COSC-273-A Computer Organization & Architecture
;Juan Salas
;Fall 2024 (10/30/2024)
;Description


 
[SECTION .text]			;Section containing code
extern printf			;Tells the compiler to reference the C function library for printf
extern scanf			;Tells the complier to reference the C function library for scanf
extern getchar			;Tells the complier to reference the C function library for getchar
extern military_to_regular
extern factorial
global main				;Required so linker can find entry point

main:				;Entry point of Program
	push ebp		;Sets up the stack frame
	mov ebp, esp	;ebp = esp
	push ebx        
	push esi
	push edi        ;Program must prevere the value of the registers ebp, ebx, esi, and edi.

        ;;End of top portion of boilerplate code


	push dword militaryPrompt
	call printf
	add esp, 4

	push dword enterHoursPrompt
	call printf
	add esp, 4

	push dword hours
	push dword input_fmt_hours
	call scanf
	add esp, 4

	push dword enterMinsPrompt
	call printf
	add esp, 4

	push dword minutes
	push dword input_fmt_minutes
	call scanf
	add esp, 4

;pushing parameters before calling function:
    push dword [hours]
    push dword [minutes]
    call military_to_regular
    add esp, 8
	
    ;;;;jmp sigmanu


;;other function blah blah
;;Code works until here

	push dword factorialPrompt
	call printf
	add esp, 4

	push dword enterNumberPrompt
	call printf
	add esp, 4
	
	push dword num
	push dword input_fmt_num
	call scanf
	add esp, 8

    mov ecx, [num]

    push dword [num]
    call factorial
    add esp, 4
	

    push dword eax
    push dword ecx
    push dword resultPrompt
    call printf
    add esp, 12


sigmanu:
				;;Bottom part of boilerplate code
	pop edi			;Program restores saved register values by 
	pop esi				;popping them from the stack as they 
	pop ebx				;were pushed from the beginning.
	mov esp, ebp		;Destroys stack frame before returning
	pop ebp
	ret				;Returns the control to LINUX



[SECTION .data]			;Section containing initailized data	
	
	name		db		"Juan Salas", 10, 0                ;defines name phrase
	militaryPrompt		db		"24-Hour Time Converter SubProgram: ", 10, 0
	enterHoursPrompt	db		"Please enter the hours: ", 0
	enterMinsPrompt		db		"Please enter the minutes: ", 0
	timePrompt			db		"The time for 12-Hour Clock is %d : %d"

	factorialPrompt		db		"Factorial SubProgram: ", 10, 0
	enterNumberPrompt	db		"Please enter a number: ", 0
	resultPrompt		db		"The result of %d! is %d.", 10, 0

	success				db		"***Successful Program Termination***", 10, 0

	input_fmt_hours		db		"%d\n", 10, 0
	input_fmt_minutes		db		"%d\n", 10, 0
	input_fmt_num		db		"%d\n", 10, 0

	blahblah			db		"ebx = %d ; ecx = %d edx = %d", 10, 0
    burrito             db      "hours = %d ; minutes = %d", 10, 0

[SECTION .bss]			;Section containing unitialized data
				
	hours		resd	1
	minutes		resd	1

	num			resd	1

