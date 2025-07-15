;Assignment 2
;COSC-273-A Computer Organization & Architecture
;Juan Salas
;Fall 2024 (10/22/2024)
;This Assembly program will ask the user for some inputs and make calculations on those corresponding inputs. Towards the end, it will provide the user with a username-
;which corresponds to their previous inputs.


 
[SECTION .text]			;Section containing code
extern printf			;Tells the compiler to reference the C function library for printf
extern scanf			;Tells the complier to reference the C function library for scanf
extern getchar			;Tells the complier to reference the C function library for getchar
global main				;Required so linker can find entry point

main:				;Entry point of Program
	push ebp		;Sets up the stack frame
	mov ebp, esp	;ebp = esp
	push ebx        
	push esi
	push edi        ;Program must prevere the value of the registers ebp, ebx, esi, and edi.

        ;;End of top portion of boilerplate code

;This block of code prints my name "Juan Salas"

    push dword name     ;Pushes the address of string Name
    call printf         ;Prints the string prompt to screen
    add esp, 4          ;adds 4 to to the stack pointer

;These blocks of code print the first prompt and asks the user for an input

	push dword Prompt   ;Pushes adress of string Prompt
	call printf         ;Prints Prompt to the screen
	add esp, 4          ;adds 4 to the stack points

	push dword num1			;Pushes the address of the integer buffer - num1
	push dword input_fmt	;Pushes the address of the input format string - input_fmt
	call scanf				;Scans in an integer value from the keyboard
	add esp, 8				;Adds the value of 8 to the stack pointer


;This block of code prints the second prompt and asks the user for an input

	push dword Prompt2      ;Pushes address of string Prompt2
    call printf             ;Prints Promp2 to the screen
	add esp, 4              ;adds (4*1) to the stack pointer

    push dword num2         ;Pushes address of integer buffer - num2
    push dword input_fmt    ;Pushes address of input format string - input_fmt
    call scanf              ;Prints num2 to the string
    add esp, 8              ;adds (4*2) to the stack pointer


;This block of code prints the Color Question and asks the user for an input

	push dword ColorPrompt      ;Pushes address of string ColorPrompt
	call printf                 ;Prints ColorPrompt to the screen
	add esp, 4                  ;adds (4*1) to the stack pointer

    push dword col              ;Pushes address of string buffer - col
    push dword input_fmt_str    ;Pushes address of input format string - input_fmt_str
    call scanf                  ;Prints col to the string
    add esp, 8                  ;adds (4*2) to the stack pointer

	
;"You Entered" prompt

    push dword col                  ;pushes address of col
    push dword [num2]               ;pushes the %d argument from the value in memory for printf
    push dword [num1]               ;pushes the %d argument from the value in memory for printf
    push dword YouEnteredPrompt     ;pushes the address of YouEnteredPrompt
    call printf                     ;prints the YouEnteredPrompt to the screen along with the corresponding values
    add esp, 16                     ;adds (4*4) to the stack pointer
	
;Addition:

    mov eax, [num1]     ;eax = num1
    add eax, [num2]     ;eax = eax + num2

    push dword eax          ;pushes address of eax
    push dword [num2]       ;pushes the %d argument from the value in memory for printf
    push dword [num1]       ;pushes the %d argument from the value in memory for printf
    push dword SumPrompt    ;pushes the address of SumPrompt
    call printf             ;prints the SumPrompt to the screen along with its corresponding values
    add esp, 16             ;adds (4*4) to the stack poitner


;subtract:

    sub eax, eax ;reset eax value to 0  (eax = eax - eax)

    mov eax, [num1]     ;eax = num1
    sub eax, [num2]     ;eax = eax - num2


;subtract prompt: 

    push dword eax                  ;pushes the %d argument from the eax register for printf
    push dword [num2]               ;pushes the %d argument from the value in memory for printf
    push dword [num1]               ;pushes the %d argument from the value in memory for printf
    push dword SubtractPrompt       ;pushes the address of SubtractPrompt
    call printf                     ;prints the SubtractPrompt to the screen along with its corresponding values
    add esp, 16                     ;adds (4*4) to the stack pointer


;product:

    mov eax, [num1]     ; eax = num1
    imul eax, [num2]    ;eax = eax * num2

    push dword eax      ;pushes the %d argument from the eax register for printf
    push dword [num2]   ;pushes the %d argument from the value in memory for printf
    push dword [num1]   ;pushes the %d argument from the value in memory for printf
    push dword ProductPrompt    ;pushes the address of ProductPrompt
    call printf         ;prints the SubtractPrompt to the screen along with its corresponding values
    add esp, 16         ;adds (4*4) to the stack pointer


;division:
 
    mov eax, [num1] ; eax = num1
    cdq             ;initialize edx by sign extend
    mov ebx, [num2]     ;ebx = num2
    idiv ebx            ;   (Quotient: eax = eax / ebx)

    push dword edx      ;pushing edx which contains the reminder of the previous division
    push dword eax      ;pushing eax which contains the quotient of the previous division
    push dword [num2]   ;pushes the %d argument from the value in memory for printf
    push dword [num1]   ;pushes the %d argument from the value in memory for printf
    push dword QuotPrompt   ;pushes the address of QuotPrompt
    call printf         ;prints the SubtractPrompt to the screen along with its corresponding values
    add esp, 20         ;adds (4*5) to the stack pointer

;username:

    push dword [num2]   ;pushes the %d argument from the value in memory for printf
    push dword [num1]   ;pushes the %d argument from the value in memory for printf
    push dword col      ;pushes address of string col
    push dword Username     ;pushes the address of Username
    call printf         ;prints the SubtractPrompt to the screen along with its corresponding values
    add esp, 16         ;adds (4*4) to the stack pointer

;Sucessful termination

    push dword FinalPrompt      ;pushes the address of FinalPrompt
    call printf         ;prints the SubtractPrompt to the screen along with its corresponding values
    add esp, 4          ;adds (4*1) to the stack pointer

					
				;;Bottom part of boilerplate code
	pop edi			;Program restores saved register values by 
	pop esi				;popping them from the stack as they 
	pop ebx				;were pushed from the beginning.
	mov esp, ebp		;Destroys stack frame before returning
	pop ebp
	ret				;Returns the control to LINUX

[SECTION .data]			;Section containing initailized data	
	name		db		"Juan Salas", 10, 0                ;defines name phrase

	Prompt    	db       	"Please enter a number: ",0		;defines Prompt phrase

	Prompt2    	db       	"Please enter another number: ",0		;defines Prompt2 phrase

	ColorPrompt    	db       	"Please enter a color: ",0		    ;defines ColorPrompt phrase
							
	input_fmt	db			"%d\n", 10, 0					;defines the format of input
    
    input_fmt_str   db      "%s\n", 10, 0                   ;defines the format of input string

    YouEnteredPrompt    db      "You entered %d, %d, and %s.",10,0      ;defines YouEnteredPrompt phrase

    SumPrompt   db      "   The sum of %d and %d is %d.",10,0           ;defines SumPrompt phrase

    SubtractPrompt  db  "   The difference between %d and %d is %d.", 10, 0     ;defines SubtractPrompt phrase

    ProductPrompt   db  "   The product of %d and %d is %d.", 10, 0             ;defines ProductPrompt phrase

    QuotPrompt  db  "   The quotient of %d and %d is %d with a remainder of %d.", 10, 0         ;defines QuotPrompt phrase

    Username    db  "Your made up Username is %s_%d_%d.", 10, 0                 ;defines Username phrase

    FinalPrompt db  "***Successful Program Termination***", 10, 0               ;;defines FinalPrompt phrase
	
[SECTION .bss]			;Section containing unitialized data
				
	num1		resd	1	;Reserves space for one number value from input in num1
    num2        resd    1   ;Reserves space for one number value from input in num2
    col         resd    1   ;Reserves space for the string address from input in col
