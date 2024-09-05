.MODEL SMALL
.code
.STACK 100h
START:
;change the background
	mov Ah,09H
	mov bl,3Eh ;3 is aqua E is yellow
	mov cx,7
	INT 10H
	
    int 10h 
    mov ah, 02h
    mov cl, 'C'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 'o'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 'l'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 'l'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 'e'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 'g'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 'e'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h
	
	;change the background
	mov Ah,09H
	mov bl,50h ;3 is aqua E is yellow; background/font color
	mov cx,2
	INT 10H
	
    mov ah, 02h
    mov cl, 'o'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 'f'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h
;;
	;change the background
	mov Ah,09H
	mov bl,6Dh ;3 is aqua E is yellow; background/font color
	mov cx,8; how many letters
	INT 10H
	
    mov ah, 02h
    mov cl, 'C'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 'o'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 'm'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 'p'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 'u'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 't'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 'e'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 'r'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h
	
	;change the background
	mov Ah,09H
	mov bl,47h ;3 is aqua E is yellow; background/font color
	mov cx,7
	INT 10H

    mov ah, 02h
    mov cl, 'S'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 't'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 'u'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 'd'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 'i'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 'e'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 's'
    mov dl, cl
    int 21h
	
    mov ah, 02h
    mov dl, 0Ah
    int 21h


int 27h
END START
