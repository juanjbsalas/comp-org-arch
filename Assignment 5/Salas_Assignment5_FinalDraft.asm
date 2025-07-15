;Assignment 5
;COSC-273-A Computer Organization & Architecture
;Juan Salas
;Fall 2024 (11/20/2024)
;This program stores and calculates total credit hours, current credit hours and
;GPA of two students using structures designed to represent students. It also does
;additional calculations with the students' data towards the end.


 [SECTION .bss]			;Section containing unitialized data

    num1    resd    1
    num2    resd    1
    num3    resd    1

    struc student                      ;Declares the structure prototype called student
        gpa             resd    1
        tot_comp_hours  resd    1
        curr_hours      resd    1
    endstruc


[SECTION .data]			;Section containing initailized data	
	
	name		           db		"Juan Salas", 10, 0                ;defines name phrase
    followingInfo          db       "The following information should be entered in order of total completed hours, current hours, and GPA with spaces between them.", 10, 0
    enterStudent1_Prompt   db       "Please enter StudentOne's Information: ", 10, 0
    enterStudent2_Prompt   db       "Please enter StudentTwo's Information: ", 10, 0
    emptyline              db       "", 10, 0
    Update_StudentTwo      db       "Updating StudentTwo:", 10, 0

    input_fmt_stu1  db  "%d %d %d\n", 10, 0
    input_fmt_stu2  db  "%d %d %d\n", 10, 0

    StudentOnePrompt    db  "Student One: total: %d current: %d GPA: %d", 10, 0
    StudentTwoPrompt    db  "Student Two: total: %d current: %d GPA: %d", 10, 0


    student_one:                        ;Names the structure student_one
        istruc student                  ;Declares the type of struct
        at gpa, dd 0                    ;Initializes the structure variables
        at tot_comp_hours,  dd  0
        at curr_hours,  dd  0
    iend

    student_two:                        ;Names the structure student_two
        istruc student                  ;Declares the type of struct
        at gpa,             dd  0       ;Initializes the structure variables
        at tot_comp_hours,  dd  0
        at curr_hours,      dd  0
    iend


    compSum_and_diff    db      "Computing Sum and Difference in GPAs of the two students:", 10, 0
    sumStuPrompt        db      "The sum of student GPAs is %d.", 10, 0
    diffStuPrompt       db      "The difference of student GPAs is %d.", 10, 0
    success				db		"***Successful Program Termination***", 10, 0

    check_registers     db      "EAX = %d , EBX = %d", 10, 0


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

;;;;;;;;Prints my name:;;;;;;;;;;;;;;;

    push dword name
    call printf
    add esp, 4

;;;;;;;Prints Informational prompt on how to enter data;;;;;;;;;

    push dword followingInfo
    call printf
    add esp, 4


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;Gathering Info from User for Student One;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    push dword student_one
    call printf
    add esp, 4
    
    push dword enterStudent1_Prompt
    call printf
    add esp, 4

    push dword num3
    push dword num2
    push dword num1
    push dword input_fmt_stu1
    call scanf
    add esp, 16

    call getchar
    mov eax, [num1]                                     ;Moves the value of num1 into eax
    mov ebx, [num2]
    mov ecx, [num3]
    mov dword [student_one + tot_comp_hours], eax       ;Moves the value of eax into student_one structure at tot_comp_hours   
    mov dword [student_one + curr_hours], ebx
    mov dword [student_one + gpa], ecx

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;Gathering Info from User for Student Two;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    push dword enterStudent2_Prompt
    call printf
    add esp, 4

    push dword num3
    push dword num2
    push dword num1
    push dword input_fmt_stu2
    call scanf
    add esp, 16

    call getchar
    mov eax, [num1]                                     ;Moves the value of num1 into eax
    mov ebx, [num2]
    mov ecx, [num3]
    mov dword [student_two + tot_comp_hours], eax       ;Moves the value of eax into student_two structure at tot_comp_hours
    mov dword [student_two + curr_hours], ebx
    mov dword [student_two + gpa], ecx

;;;;;;Prints an empty line;;;;;;;

    push dword emptyline
    call printf
    add esp, 4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;Prints the information the user inputted for student one;;;;;;;;;;;;;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    push dword [student_one + gpa]
    push dword [student_one + curr_hours]
    push dword [student_one + tot_comp_hours]
    push dword StudentOnePrompt
    call printf
    add esp, 16

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;Prints the information the user inputted for student two;;;;;;;;;;;;;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    push dword [student_two + gpa]
    push dword [student_two + curr_hours]
    push dword [student_two + tot_comp_hours]
    push dword StudentTwoPrompt
    call printf
    add esp, 16

;;;;;;Prints empty line;;;;;;;;
    push dword emptyline
    call printf
    add esp, 4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;Updates Student 2 info;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    push dword Update_StudentTwo
    call printf
    add esp, 4

    mov eax, [num1]
    add eax, ebx
    mov ebx, 0
    
    mov dword [student_two + tot_comp_hours], eax
    mov dword [student_two + curr_hours], ebx

    push dword [student_two + gpa]
    push dword [student_two + curr_hours]
    push dword [student_two + tot_comp_hours]
    push dword StudentTwoPrompt
    call printf
    add esp, 16

;;;;;;Prints empty line;;;;;;;;
    push dword emptyline
    call printf
    add esp, 4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;Computing Sum & diff;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    push dword compSum_and_diff
    call printf
    add esp, 4

    mov ebx, ecx ;;contains gpa of student 2
    add ebx, [student_one + gpa]

    push dword ebx
    push dword sumStuPrompt
    call printf
    add esp, 8


    mov ebx, ecx
    sub ebx, [student_one + gpa] 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;If the difference is negative, then it makes the difference positive;;;;;;;;;;;;;
;;;;;;;;;;;If it's not negative, then it leaves it as positive;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    cmp ebx, 0
    jl diff_is_negative
    jmp taco


;;if the difference is negative then it turns it positive

diff_is_negative:
    NOT ebx
    add ebx, 1
    jmp taco

;;;;;;;;;;Prints the prompt with the difference of GPAs;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

taco:
    push dword ebx
    push dword diffStuPrompt
    call printf
    add esp, 8

;;;;;;;;;;;;;;;;;Sucessful Termination Prompt;;;;;;;;;;;;;;;;;;;;;;;;;;

    push dword success
    call printf
    add esp, 4



				;;Bottom part of boilerplate code
	pop edi			;Program restores saved register values by 
	pop esi				;popping them from the stack as they 
	pop ebx				;were pushed from the beginning.
	mov esp, ebp		;Destroys stack frame before returning
	pop ebp
	ret				;Returns the control to LINUX

