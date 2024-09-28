;Filename: EXAM2.ASM
;CS243 lab Hands-on Exam No.2
;First Semester SY 2024-2025
;Student Name: JOSEPH VICTOR P. NOVABOS
;Date Finished: September 28, 2024

.MODEL SMALL
.STACK 100h
.DATA

    header      DB 'THE CALCULATOR', 13, 10
                DB 'Created by: YOUR FULL NAME', 13, 10
                DB 'Date: Date Today', 13, 10, 13, 10
                DB 'Main Menu', 13, 10
                DB 1Bh, '[30;43m', 'a - Addition', 1Bh, '[0m', 13, 10
                DB 1Bh, '[30;42m', 's - Subtraction', 1Bh, '[0m', 13, 10
                DB 1Bh, '[30;46m', 'm - Multiplication', 1Bh, '[0m', 13, 10
                DB 1Bh, '[30;41m', 'd - Division', 1Bh, '[0m', 13, 10
                DB 1Bh, '[30;47m', 'e - Exit', 1Bh, '[0m', 13, 10,'$'

    choice_msg  DB 'Enter your choice: $'

    thank_you   DB 13, 10, 'Thank you.', '$'
    newline     DB 13, 10, '$'

    add_msg     DB 13, 10, 1Bh, '[30;43m', 'Addition', 1Bh, '[0m', 13, 10, '$'
    first_add   DB 'Enter first addend: $'
    second_add  DB 'Enter second addend: $'
    first_res   DB 'First addend is: $'
    second_res  DB 'Second addend is: $'

    add_msg2    DB 13, 10, 1Bh, '[30;43m', 'Subtraction', 1Bh, '[0m', 13, 10, '$'
    first_minus DB 'Enter minuend: $'
    second_minus DB 'Enter subtrahend: $'
    first_resminus DB 'Minuend is: $'
    second_resminus DB 'Subtrahend is: $'

    add_msg3    DB 13, 10, 1Bh, '[30;43m', 'Multiplication', 1Bh, '[0m', 13, 10, '$'
    first_multip DB 'Enter multiplicand: $'
    second_multip DB 'Enter multiplier: $'
    first_resmultip DB 'Multiplicand is: $'
    second_resmultip DB 'Multiplier is: $'

    add_msg4    DB 13, 10, 1Bh, '[30;43m', 'Division', 1Bh, '[0m', 13, 10, '$'
    first_divide DB 'Enter dividend: $'
    second_divide DB 'Enter divisor: $'
    first_divide2 DB 'Dividend is: $'
    second_divide2 DB 'Divisor is: $'

    error       DB 13,10,10,1Bh, '[33;41;5m', 'INVALID CHOICE!', 1Bh, '[0m', '$'

.CODE
display_addition proc
    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Handle addition
    LEA DX, add_msg
    MOV AH, 09h
    INT 21h

    ; Get first addend
    LEA DX, first_add
    INT 21h
    MOV AH, 01h
    INT 21h
    MOV BH, AL  ; Store first addend

    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Get second addend
    LEA DX, second_add
    INT 21h
    MOV AH, 01h
    INT 21h
    MOV BL, AL  ; Store second addend

    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Display results
    LEA DX, first_res
    INT 21h
    MOV DL, BH
    MOV AH, 02h
    INT 21h

    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    LEA DX, second_res
    INT 21h
    MOV DL, BL
    MOV AH, 02h
    INT 21h

    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    RET
display_addition endp

display_subtraction proc
    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Handle subtraction
    LEA DX, add_msg2
    MOV AH, 09h
    INT 21h

    ; Get minuend
    LEA DX, first_minus
    INT 21h
    MOV AH, 01h
    INT 21h
    MOV BH, AL  ; Store minuend

    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Get subtrahend
    LEA DX, second_minus
    INT 21h
    MOV AH, 01h
    INT 21h
    MOV BL, AL  ; Store subtrahend

    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Display results
    LEA DX, first_resminus
    INT 21h
    MOV DL, BH
    MOV AH, 02h
    INT 21h

    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    LEA DX, second_resminus
    INT 21h
    MOV DL, BL
    MOV AH, 02h
    INT 21h

    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    RET
display_subtraction endp

display_multiplication proc
    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Handle multiplication
    LEA DX, add_msg3
    MOV AH, 09h
    INT 21h

    ; Get multiplicand
    LEA DX, first_multip
    INT 21h
    MOV AH, 01h
    INT 21h
    MOV BH, AL  ; Store multiplicand

    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Get multiplier
    LEA DX, second_multip
    INT 21h
    MOV AH, 01h
    INT 21h
    MOV BL, AL  ; Store multiplier

    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Display results
    LEA DX, first_resmultip
    INT 21h
    MOV DL, BH
    MOV AH, 02h
    INT 21h

    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    LEA DX, second_resmultip
    INT 21h
    MOV DL, BL
    MOV AH, 02h
    INT 21h

    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    RET
display_multiplication endp

display_division proc
    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Handle division
    LEA DX, add_msg4
    MOV AH, 09h
    INT 21h

    ; Get dividend
    LEA DX, first_divide
    INT 21h
    MOV AH, 01h
    INT 21h
    MOV BH, AL  ; Store dividend

    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Get divisor
    LEA DX, second_divide
    INT 21h
    MOV AH, 01h
    INT 21h
    MOV BL, AL  ; Store divisor

    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Display results
    LEA DX, first_divide2
    INT 21h
    MOV DL, BH
    MOV AH, 02h
    INT 21h

    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    LEA DX, second_divide2
    INT 21h
    MOV DL, BL
    MOV AH, 02h
    INT 21h

    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    RET
display_division endp

display_exit proc
    ; Thank you message
    LEA DX, thank_you
    MOV AH, 09h
    INT 21h
    RET
display_exit endp

display_error proc
    ; Error message
    LEA DX, error
    MOV AH, 09h
    INT 21h

    LEA DX, newline
    MOV AH, 09h
    INT 21h

    CALL display_exit
    RET
    
display_error endp

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Print header
    MOV AH, 09h
    LEA DX, header
    INT 21h

    ; Get user choice
    LEA DX, choice_msg
    INT 21h

    MOV AH, 01h
    INT 21h

    ; Check if choice is 'a' for addition
    CMP AL, 'a'
    JE CALL_ADDITION

    ; Check if choice is 's' for subtraction
    CMP AL, 's'
    JE CALL_SUBTRACTION

    ; Check if choice is 'm' for multiplication
    CMP AL, 'm'
    JE CALL_MULTIPLICATION

    ; Check if choice is 'd' for division
    CMP AL, 'd'
    JE CALL_DIVISION

    ; Check if choice is 'e' for exit
    CMP AL, 'e'
    JE CALL_EXIT

    ; Invalid choice
    CALL display_error
    JMP EXIT_PROGRAM

CALL_ADDITION:
    CALL display_addition
    JMP EXIT_PROGRAM

CALL_SUBTRACTION:
    CALL display_subtraction
    JMP EXIT_PROGRAM

CALL_MULTIPLICATION:
    CALL display_multiplication
    JMP EXIT_PROGRAM

CALL_DIVISION:
    CALL display_division
    JMP EXIT_PROGRAM

CALL_EXIT:
    CALL display_exit
    JMP EXIT_PROGRAM

EXIT_PROGRAM:
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN
