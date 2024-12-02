.model small
.stack 100h
.data
    ; Menu strings
    menuMsg db 13,10,' _____ __ __   ___ __      __    __ __  ',13,10,
               '(_  | |_ |__)   | |__) /\ /  |_/|_ |__) ',13,10,
               '__) | |__|      | | \ /--\\__| \|__| \  ',13,10,
               '                                         ',13,10,
               '1. Add steps',13,10,
               '2. View all steps',13,10,
               '3. Update steps',13,10,
               '4. Delete steps',13,10,
               '5. Exit',13,10,
               'Enter choice: $'
 
   
    promptMonth db 13,10,'Enter month (1-12): $'
    promptSteps db 13,10,'Enter steps count (max 65535): $'
    monthLabel  db 13,10,'Month: $'
    stepsLabel  db 13,10,'Steps: $'
    updateMsg   db 13,10,'Updated steps for $'
    deleteMsg   db 13,10,'Deleted steps for $'
    invalidMsg  db 13,10,'Invalid input! Try again.$'
    emptyMsg    db 13,10,'No steps recorded for this month.$'
    newline     db 13,10,'$'
    buffer      db 6,0       ; Buffer for number input (5 digits + Enter)
                db 6 dup(0)
   
    ; Month names
    months      db 'January  $'
               db 'February $'
               db 'March    $'
               db 'April    $'
               db 'May      $'
               db 'June     $'
               db 'July     $'
               db 'August   $'
               db 'September$'
               db 'October  $'
               db 'November $'
               db 'December $'
   
    ; Data storage
    steps       dw 12 dup(0)  ; Array to store steps (12 months), using word size
    hasData     db 12 dup(0)  ; Flag array to track which months have data
    tempNum     dw 0          ; Temporary storage for number conversion
    monthNum    db 0          ; Store month number
 
.code
main proc
    mov ax, @data
    mov ds, ax
   
menu_loop:
    ; Display menu
    lea dx, menuMsg
    mov ah, 9
    int 21h
   
    ; Get user choice
    mov ah, 1
    int 21h
    sub al, '0'
   
    ; Process menu choice
    cmp al, 1
    je add_steps
    cmp al, 2
    je view_steps
    cmp al, 3
    je update_steps
    cmp al, 4
    je delete_steps
    cmp al, 5
    je exit_program
   
    ; Invalid choice
    lea dx, invalidMsg
    mov ah, 9
    int 21h
    jmp menu_loop
   
add_steps:
    call get_month_number
    mov monthNum, al      ; Save month number
   
    ; Check if month is valid
    cmp monthNum, 1
    jb invalid_input
    cmp monthNum, 12
    ja invalid_input
   
    ; Get steps count
    call get_steps_count
   
    ; Store steps in array
    xor bx, bx
    mov bl, monthNum
    dec bl              ; Convert to 0-based index
    shl bx, 1          ; Multiply by 2 for word addressing
    mov ax, tempNum
    mov steps[bx], ax
   
    ; Mark month as having data
    mov bl, monthNum
    dec bl              ; Convert to 0-based index
    mov hasData[bx], 1
   
    jmp menu_loop
   
view_steps:
    ; View all months
    mov cx, 12         ; 12 months to check
    xor bx, bx         ; Start with January (0)
   
view_loop:
    push cx            ; Save counter
   
    ; Check if month has data
    mov al, hasData[bx]
    test al, al
    jz skip_month
   
    ; Display month name
    lea dx, newline
    mov ah, 9
    int 21h
   
    push bx            ; Save BX
    mov ax, 9          ; Each month name is 9 bytes
    mul bl             ; Multiply by month index
    mov di, ax
    lea dx, months[di] ; Point to correct month name
    mov ah, 9
    int 21h
    pop bx            ; Restore BX
   
    ; Display steps
    lea dx, stepsLabel
    mov ah, 9
    int 21h
   
    shl bx, 1          ; Multiply by 2 for word addressing
    mov ax, steps[bx]  ; Load steps into AX
    shr bx, 1          ; Restore BX
    call display_number
   
skip_month:
    inc bx             ; Next month
    pop cx             ; Restore counter
    loop view_loop
   
    lea dx, newline
    mov ah, 9
    int 21h
    jmp menu_loop
   
update_steps:
    call get_month_number
    mov monthNum, al    ; Save month number
   
    ; Check if month is valid
    cmp monthNum, 1
    jb invalid_input
    cmp monthNum, 12
    ja invalid_input
   
    ; Get new steps count
    call get_steps_count
   
    ; Update steps in array
    xor bx, bx
    mov bl, monthNum
    dec bl              ; Convert to 0-based index
    shl bx, 1          ; Multiply by 2 for word addressing
    mov ax, tempNum
    mov steps[bx], ax
   
    ; Mark month as having data
    mov bl, monthNum
    dec bl              ; Convert to 0-based index
    mov hasData[bx], 1
   
    ; Display confirmation
    lea dx, updateMsg
    mov ah, 9
    int 21h
   
    ; Display month name
    push bx
    mov ax, 9          ; Each month name is 9 bytes
    mul bl             ; Multiply by month index
    mov di, ax
    lea dx, months[di] ; Point to correct month name
    mov ah, 9
    int 21h
    pop bx
   
    jmp menu_loop
   
delete_steps:
    call get_month_number
    mov monthNum, al    ; Save month number
   
    ; Check if month is valid
    cmp monthNum, 1
    jb invalid_input
    cmp monthNum, 12
    ja invalid_input
   
    ; Delete steps (set to 0)
    xor bx, bx
    mov bl, monthNum
    dec bl              ; Convert to 0-based index
   
    ; Clear data flag
    mov hasData[bx], 0
   
    ; Clear steps
    shl bx, 1          ; Multiply by 2 for word addressing
    mov word ptr steps[bx], 0
   
    ; Display confirmation
    lea dx, deleteMsg
    mov ah, 9
    int 21h
   
    ; Display month name
    shr bx, 1          ; Convert back to month index
    push bx
    mov ax, 9          ; Each month name is 9 bytes
    mul bl             ; Multiply by month index
    mov di, ax
    lea dx, months[di] ; Point to correct month name
    mov ah, 9
    int 21h
    pop bx
   
    jmp menu_loop
   
invalid_input:
    lea dx, invalidMsg
    mov ah, 9
    int 21h
    jmp menu_loop
   
exit_program:
    mov ah, 4ch
    int 21h
   
main endp
 
; Helper procedure to get month number
get_month_number proc
    lea dx, promptMonth
    mov ah, 9
    int 21h
   
    mov ah, 1
    int 21h
    sub al, '0'
   
    ; Handle two digit months
    push ax
    mov ah, 1
    int 21h
    cmp al, 13         ; Check if Enter key
    je single_digit
   
    pop bx             ; Get first digit
    sub al, '0'        ; Convert second digit
    add al, bl         ; Add first digit * 10
    ret
   
single_digit:
    pop ax
    ret
get_month_number endp
 
; Helper procedure to get steps count
get_steps_count proc
    lea dx, promptSteps
    mov ah, 9
    int 21h
   
    ; Reset tempNum
    mov word ptr tempNum, 0
   
    ; Read string input
    lea dx, buffer
    mov ah, 0ah
    int 21h
   
    ; Convert string to number
    mov si, 2           ; Start from actual input
    xor cx, cx
    mov cl, buffer[1]   ; Get length of input
    xor ax, ax          ; Clear AX for number building
   
convert_loop:
    mov bx, 10
    mul bx              ; Multiply current number by 10
    mov bl, buffer[si]  ; Get next digit
    sub bl, '0'         ; Convert to number
    add ax, bx          ; Add to current number
    inc si
    loop convert_loop
   
    mov tempNum, ax     ; Store result
   
    ; Display newline
    lea dx, newline
    mov ah, 9
    int 21h
    ret
get_steps_count endp
 
; Helper procedure to display number
display_number proc
    push ax
    push bx
    push cx
    push dx
   
    mov bx, 10          ; Divisor
    xor cx, cx          ; Counter for digits
   
    ; Handle zero case
    test ax, ax
    jnz convert_digits
    mov dl, '0'         ; Load character '0'
    mov ah, 2           ; Display character function
    int 21h
    jmp display_end
   
convert_digits:
    test ax, ax
    jz display_digits
    xor dx, dx
    div bx              ; Divide by 10
    add dl, '0'         ; Convert remainder to ASCII
    push dx             ; Save digit
    inc cx
    jmp convert_digits
   
display_digits:
    test cx, cx         ; Check if we have any digits to display
    jz display_end
    pop dx              ; Get digit
    mov ah, 2           ; Display character
    int 21h
    dec cx
    jmp display_digits
   
display_end:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
display_number endp
 
end main
