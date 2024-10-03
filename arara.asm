; Filename: EXAM3.ASM
; CS243 Lab Hands-on Exam No. 3
; First Semester SY 2024-2025
; Student Name: JOSEPH VICTOR P. NOVABOS
; Date Finished: OCTOBER 11, 2024

.model small
.stack 100h
.data
    ; Constants
    THIS_MAIN   db 1Bh,'[30;43m','VOTER''S REGISTRATION FORM',1Bh,'[0m',13,10
                db 1Bh,'[30;42m','Created by: JOSEPH VICTOR P. NOVABOS',1Bh,'[0m',13,10
                db 1BH,'[30;46m','Date: OCTOBER 11, 2024',1Bh,'[0m',13,10,10
                DB 1Bh,' Please enter the following data:',13,10,'$'
    ; Input prompts
    FIRST_NAME_PROMPT    db 13,10,'First Name: $'
    MIDDLE_NAME_PROMPT   db 13,10,'Middle Name: $'
    FAMILY_NAME_PROMPT   db 13,10,'Family Name: $'
    GENDER_PROMPT        db 13,10,'Gender: $'
    
    ; Birthday prompts
    BIRTHDAY_HEADER      db 13,10,'Birthday$'
    MONTH_PROMPT         db 13,10,'  Month: $'
    DAY_PROMPT           db 13,10,'  Day: $'
    YEAR_PROMPT          db 13,10,'  Year: $'
    
    ; Address prompts
    ADDRESS_HEADER       db 13,10,'Address$'
    HOUSE_NUM_PROMPT     db 13,10,'  House Number: $'
    STREET_PROMPT        db 13,10,'  Street: $'
    BARANGAY_PROMPT      db 13,10,'  Barangay: $'
    CITY_PROMPT          db 13,10,'  City: $'
    PROVINCE_PROMPT      db 13,10,'  Province: $'
    
    ; Educational background prompts
    EDU_HEADER           db 13,10,'Educational Background$'
    ELEM_HEADER          db 13,10,'  Elementary$'
    JHS_HEADER           db 13,10,'  Junior High School$'
    SHS_HEADER           db 13,10,'  Senior High School$'
    COLLEGE_HEADER       db 13,10,'  College$'
    SCHOOL_PROMPT        db 13,10,'    Name of School: $'
    YEAR_GRAD_PROMPT     db 13,10,'    Year Graduated: $'
    COURSE_PROMPT        db 13,10,'    Course: $'
    
    ; Summary text
    SUMMARY_HEADER       db 13,10,13,10,'SUMMARY OF INFORMATION$'
    VERIFY_TEXT          db 13,10,'Please verify if all entries are correct.$'
    
    ; Footer text
    VOTE_WISELY          db 13,10,10,1bh,'[33;41;5m','Vote wisely!',1bh,'[0m','$'
    THANK_YOU            db 13,10,'Thank you for registering.$'
    
    
    ; Variables for storing user input
    first_name    db 30, 0, 30 dup('$')  ; First byte is max length, second is actual length
middle_name   db 30, 0, 30 dup('$')
family_name   db 30, 0, 30 dup('$')
gender        db 10, 0, 10 dup('$')
month         db 15, 0, 15 dup('$')
day           db  5, 0,  5 dup('$')
year          db  5, 0,  5 dup('$')
house_num     db 10, 0, 10 dup('$')
street        db 30, 0, 30 dup('$')
barangay      db 30, 0, 30 dup('$')
city          db 30, 0, 30 dup('$')
province      db 30, 0, 30 dup('$')
elem_school   db 50, 0, 50 dup('$')
elem_year     db  5, 0,  5 dup('$')
jhs_school    db 50, 0, 50 dup('$')
jhs_year      db  5, 0,  5 dup('$')
shs_school    db 50, 0, 50 dup('$')
shs_year      db  5, 0,  5 dup('$')
college_school db 50, 0, 50 dup('$')
course        db 30, 0, 30 dup('$')
college_year  db 10, 0, 10 dup('$')

.code
main proc
    mov ax, @data
    mov ds, ax
    call display_header
    call get_personal_info
    call get_birthday_info
    call get_address_info
    call get_educational_info
    call display_summary
    call display_footer
    
    mov ah, 4ch
    int 21h
main endp

display_header proc
    lea dx, THIS_MAIN
    mov ah, 9
    int 21h
    ret
display_header endp


get_personal_info proc
    ; Get first name
    lea dx, FIRST_NAME_PROMPT
    mov ah, 9
    int 21h
    lea dx, first_name
    call get_string
    
    ; Get middle name
    lea dx, MIDDLE_NAME_PROMPT
    mov ah, 9
    int 21h
    lea dx, middle_name
    call get_string
    
    ; Get family name
    lea dx, FAMILY_NAME_PROMPT
    mov ah, 9
    int 21h
    lea dx, family_name
    call get_string
    
    ; Get gender
    lea dx, GENDER_PROMPT
    mov ah, 9
    int 21h
    lea dx, gender
    call get_string
    
    ret
get_personal_info endp

get_birthday_info proc
    ; Display birthday header
    lea dx, BIRTHDAY_HEADER
    mov ah, 9
    int 21h
    
    ; Get month
    lea dx, MONTH_PROMPT
    mov ah, 9
    int 21h
    lea dx, month
    call get_string
    
    ; Get day
    lea dx, DAY_PROMPT
    mov ah, 9
    int 21h
    lea dx, day
    call get_string
    
    ; Get year
    lea dx, YEAR_PROMPT
    mov ah, 9
    int 21h
    lea dx, year
    call get_string
    
    ret
get_birthday_info endp

get_address_info proc
    ; Display address header
    lea dx, ADDRESS_HEADER
    mov ah, 9
    int 21h
    
    ; Get house number
    lea dx, HOUSE_NUM_PROMPT
    mov ah, 9
    int 21h
    lea dx, house_num
    call get_string
    
    ; Get street
    lea dx, STREET_PROMPT
    mov ah, 9
    int 21h
    lea dx, street
    call get_string
    
    ; Get barangay
    lea dx, BARANGAY_PROMPT
    mov ah, 9
    int 21h
    lea dx, barangay
    call get_string
    
    ; Get city
    lea dx, CITY_PROMPT
    mov ah, 9
    int 21h
    lea dx, city
    call get_string
    
    ; Get province
    lea dx, PROVINCE_PROMPT
    mov ah, 9
    int 21h
    lea dx, province
    call get_string
    
    ret
get_address_info endp

get_educational_info proc
    ; Display educational background header
    lea dx, EDU_HEADER
    mov ah, 9
    int 21h
    
    ; Elementary
    lea dx, ELEM_HEADER
    mov ah, 9
    int 21h
    lea dx, SCHOOL_PROMPT
    mov ah, 9
    int 21h
    lea dx, elem_school
    call get_string
    lea dx, YEAR_GRAD_PROMPT
    mov ah, 9
    int 21h
    lea dx, elem_year
    call get_string
    
    ; Junior High School
    lea dx, JHS_HEADER
    mov ah, 9
    int 21h
    lea dx, SCHOOL_PROMPT
    mov ah, 9
    int 21h
    lea dx, jhs_school
    call get_string
    lea dx, YEAR_GRAD_PROMPT
    mov ah, 9
    int 21h
    lea dx, jhs_year
    call get_string
    
    ; Senior High School
    lea dx, SHS_HEADER
    mov ah, 9
    int 21h
    lea dx, SCHOOL_PROMPT
    mov ah, 9
    int 21h
    lea dx, shs_school
    call get_string
    lea dx, YEAR_GRAD_PROMPT
    mov ah, 9
    int 21h
    lea dx, shs_year
    call get_string
    
    ; College
    lea dx, COLLEGE_HEADER
    mov ah, 9
    int 21h
    lea dx, SCHOOL_PROMPT
    mov ah, 9
    int 21h
    lea dx, college_school
    call get_string
    lea dx, COURSE_PROMPT
    mov ah, 9
    int 21h
    lea dx, course
    call get_string
    lea dx, YEAR_GRAD_PROMPT
    mov ah, 9
    int 21h
    lea dx, college_year
    call get_string
    
    ret
get_educational_info endp

display_summary proc
    ; Display summary header
    lea dx, SUMMARY_HEADER
    mov ah, 9
    int 21h
    
    lea dx, VERIFY_TEXT
    mov ah, 9
    int 21h
    
    ; Display all collected information
    call display_personal_info
    call display_birthday_info
    call display_address_info
    call display_educational_info
    
    ret
display_summary endp

display_personal_info proc
    ; Display personal information
    lea dx, FIRST_NAME_PROMPT
    mov ah, 9
    int 21h
    lea dx, first_name
    call display_string
    
    lea dx, MIDDLE_NAME_PROMPT
    mov ah, 9
    int 21h
    lea dx, middle_name
    call display_string
    
    lea dx, FAMILY_NAME_PROMPT
    mov ah, 9
    int 21h
    lea dx, family_name
    call display_string
    
    lea dx, GENDER_PROMPT
    mov ah, 9
    int 21h
    lea dx, gender
    call display_string
    
    ret
display_personal_info endp

display_birthday_info proc
        ; Display birthday information
    
    ; Display header
    lea dx, BIRTHDAY_HEADER
    mov ah, 9
    int 21h
    
    ; Display month
    lea dx, MONTH_PROMPT
    mov ah, 9
    int 21h
    lea dx, month
    call display_string
    
    ; Display day
    lea dx, DAY_PROMPT
    mov ah, 9
    int 21h
    lea dx, day
    call display_string
    
    ; Display year
    lea dx, YEAR_PROMPT
    mov ah, 9
    int 21h
    lea dx, year
    call display_string
    
    ret
display_birthday_info endp

display_address_info proc
    ; Display address information
    lea dx, ADDRESS_HEADER
    mov ah, 9
    int 21h
    
    ; Display house number
    lea dx, HOUSE_NUM_PROMPT
    mov ah, 9
    int 21h
    lea dx, house_num
    call display_string
    
    ; Display street
    lea dx, STREET_PROMPT
    mov ah, 9
    int 21h
    lea dx, street
    call display_string
    
    ; Display barangay
    lea dx, BARANGAY_PROMPT
    mov ah, 9
    int 21h
    lea dx, barangay
    call display_string
    
    ; Display city
    lea dx, CITY_PROMPT
    mov ah, 9
    int 21h
    lea dx, city
    call display_string
    
    ; Display province
    lea dx, PROVINCE_PROMPT
    mov ah, 9
    int 21h
    lea dx, province
    call display_string
    
    ret
display_address_info endp

display_educational_info proc
    ; Display educational information header
    lea dx, EDU_HEADER
    mov ah, 9
    int 21h
    
    ; Elementary
    lea dx, ELEM_HEADER
    mov ah, 9
    int 21h
    lea dx, SCHOOL_PROMPT
    mov ah, 9
    int 21h
    lea dx, elem_school
    call display_string
    lea dx, YEAR_GRAD_PROMPT
    mov ah, 9
    int 21h
    lea dx, elem_year
    call display_string
    
    ; Junior High School
    lea dx, JHS_HEADER
    mov ah, 9
    int 21h
    lea dx, SCHOOL_PROMPT
    mov ah, 9
    int 21h
    lea dx, jhs_school
    call display_string
    lea dx, YEAR_GRAD_PROMPT
    mov ah, 9
    int 21h
    lea dx, jhs_year
    call display_string
    
    ; Senior High School
    lea dx, SHS_HEADER
    mov ah, 9
    int 21h
    lea dx, SCHOOL_PROMPT
    mov ah, 9
    int 21h
    lea dx, shs_school
    call display_string
    lea dx, YEAR_GRAD_PROMPT
    mov ah, 9
    int 21h
    lea dx, shs_year
    call display_string
    
    ; College
    lea dx, COLLEGE_HEADER
    mov ah, 9
    int 21h
    lea dx, SCHOOL_PROMPT
    mov ah, 9
    int 21h
    lea dx, college_school
    call display_string
    lea dx, COURSE_PROMPT
    mov ah, 9
    int 21h
    lea dx, course
    call display_string
    lea dx, YEAR_GRAD_PROMPT
    mov ah, 9
    int 21h
    lea dx, college_year
    call display_string
    
    ret
display_educational_info endp

display_footer proc
    lea dx, VOTE_WISELY
    mov ah, 9
    int 21h

    lea dx, THANK_YOU
    mov ah, 9
    int 21h
    
    
    ret
display_footer endp

get_string proc
    push ax
    push dx
    
    mov ah, 0ah    ; Function to get string input
    int 21h
    
    ; Move to the next line after input
    mov ah, 02h    ; Function to output character
    mov dl, 0Dh    ; Carriage return
    int 21h
    ;mov dl, 0Ah    ; Line feed
    int 21h
    
    pop dx
    pop ax
    ret
get_string endp

display_string proc
    ; Input: DX points to the string buffer (after the length bytes)
    push ax
    
    mov ah, 09h    ; Function to output string
    add dx, 2      ; Skip the length bytes to point to actual string
    int 21h
    
    pop ax
    ret
display_string endp

end main
