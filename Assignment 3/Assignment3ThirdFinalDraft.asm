;Assignment 3
;COSC-273-A Computer Organization & Architecture
;Juan Salas
;Fall 2024 (10/30/2024)
;This program takes a word and integer X from the user and prints that word an X amount of times.
;Then it asks the user for three more numbers with spaces in between them, and then it prints the numbers inputted and the numbers inputted in order.


 
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

;;;Asks the user for a word and stores the input

	push dword enterWordPrompt   ;Pushes adress of string enterWordPrompt
	call printf         ;Prints Prompt to the screen
	add esp, 4          ;adds 4 to the stack points

	push dword wishWord			    ;Pushes the address of the integer buffer - num1
	push dword input_fmt_str	;Pushes the address of the input format string - input_fmt
	call scanf				    ;Scans in an integer value from the keyboard
	add esp, 8				    ;Adds the value of 8 to the stack pointer


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;WishPrint



	push dword wishPrint   ;Pushes adress of string wishPrint
	call printf         ;Prints Prompt to the screen
	add esp, 4          ;adds 4 to the stack points

	push dword wishNum	
	push dword input_fmt	;Pushes the address of the input format string - input_fmt
	call scanf				;Scans in an integer value from the keyboard
	add esp, 8				;Adds the value of 8 to the stack pointer


    mov eax, 0
    mov ebx, [wishNum]
    cmp eax, ebx
    jl lessthan

lessthan:
    ;push dword wishWord
    ;push dword wishWord_str
   
    push dword eax ;temp eax value

    push dword wishWord
    push dword wishWord_str
    call printf
    add esp, 8

    pop eax ;recovering that eax value

    add eax, 1
    cmp eax, ebx
    jl lessthan
    

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;Enter number with spaces between them:

	;asks the user for 
	push dword spacePrompt   
    call printf         
	add esp, 4          

	push dword num3
	push dword num2
	push dword num1
	push dword space_ans_fmt
	call scanf
	add esp, 16 

	mov eax, [num1]
	mov ebx, [num2]
	mov ecx, [num3]

;;;This chunk of code prints, again, the three numbers that the user entered:
;I used this for clarification for myself when testing the program.

	push dword ecx
	push dword ebx
	push dword eax
	push dword ram_str
	call printf
	add esp, 16

	mov eax, [num1]
	mov ebx, [num2]
	mov ecx, [num3]

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Once the comparisons end, I want eax to have the smallest number, ebx the mid, and ecx the largest.
;Meaning I will need to use a temp register so I don't lose values when setting registers to others.


    cmp eax, ebx

    ;if(eax < ebx)
    jl eax_lessthan_ebx 

    ;else:
    mov edx, eax    ;I'm using edx as a register to store temporary values   
    mov eax, ebx    
    mov ebx, edx    


eax_lessthan_ebx:
    cmp eax, ecx
    
    ;if(eax<ecx)
    jl eax_lessthan_ecx

    ;else:
    mov edx, eax    
    mov eax, ecx     
    mov ecx, edx    

eax_lessthan_ecx:

    cmp ebx, ecx
    
    ;if(ebx < ecx)
    jl ascending
    
    ;else:
    mov edx, ebx       
    mov ebx, ecx       
    mov ecx, edx       


;;;;;;Prints ascending prompt with numbers in ascending order:

ascending:
    push dword ecx
    push dword ebx
    push dword eax
    push dword AscendingPrompt
    call printf
    add esp, 16


;;;
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

	enterWordPrompt    	db       	"Please enter a word: ",0		;defines Prompt phrase

	wishPrint    	db       	"Please enter the number of times you wish the word to print: ",0		;defines Prompt2 phrase

    spacePrompt     db          "Please enter three more numbers with spaces between them: ", 0

	space_ans_fmt		db			"%d %d %d\n", 10, 0

    AscendingPrompt     db      "Your numbers in ascending order are: %d %d %d ", 10, 0
							
	input_fmt	db			"%d\n", 10, 0					;defines the format of input
    
    input_fmt_str   db      "%s\n", 10, 0                   ;defines the format of input string

    FinalPrompt db  "***Successful Program Termination***", 10, 0               ;;defines FinalPrompt phrase

    wishWord_str    db      "%s", 10, 0

    ram_str     db      "The numbers you entered are: %d %d %d", 10, 0

[SECTION .bss]			;Section containing unitialized data
				
	wishWord		resd	3	
    wishNum        resd    1   
	num1		resd	1	 
    num2        resd    1   ;Reserves space for one number value from input in num2
    num3        resd    1   ;Reserves space for one number value from input in num3
