.MODEL SMALL
.code
.STACK 1024h
START:

	mov Ah,09H
	mov bl,8Eh ;8=BLINKING // E FOR FONT COLOR ; OR BACKGROUND COLOR// FONT COLOR COMBO
	mov cx,2
	INT 10H
	
	int 10h 
    mov ah, 02h
    mov cl, 'I'
    mov dl, cl
    int 21h
	
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov Ah,09H
	mov bl,84h ;3 is aqua E is yellow
	mov cx,1
	INT 10H
	
	int 10h
	mov ah, 02h
    mov cl, 03h
    mov dl, cl
    int 21h
	
	mov Ah,09H
	mov bl,8Eh ;3 is aqua E is yellow
	mov cx,2
	INT 10H
	
	int 10h 
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov ah, 02h
    mov cl, 'U'
    mov dl, cl
    int 21h
	
int 27h
END START