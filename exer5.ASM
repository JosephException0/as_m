 .MODEL SMALL
.code
.STACK 1024h
START:
;change the background
	mov Ah,09H
	mov bl,10h ;3 is aqua E is yellow
	mov cx,8
	INT 10H
	
    int 10h 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	 mov ah, 02h
    mov dl, 0Dh
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov Ah,09H
	mov bl,10h ;3 is aqua E is yellow
	mov cx,3
	INT 10H
	
    int 10h 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov Ah,09H
	mov bl,40h ;3 is aqua E is yellow
	mov cx,2
	INT 10H
	
	int 10h 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov Ah,09H
	mov bl,10h ;3 is aqua E is yellow
	mov cx,3
	INT 10H
	
	int 10h ;ayaw ni e butang ug tagsa2 every letter after ra sa mo return sa INT 10H
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h


    mov ah, 02h
    mov dl, 0Ah
    int 21h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov Ah,09H
	mov bl,10h ;3 is aqua E is yellow
	mov cx,1
	INT 10H
	
    int 10h 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov Ah,09H
	mov bl,40h ;3 is aqua E is yellow
	mov cx,6
	INT 10H
	
    int 10h 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov Ah,09H
	mov bl,10h ;3 is aqua E is yellow
	mov cx,1
	INT 10H
	
	int 10h
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov ah, 02h
    mov dl, 0Ah
    int 21h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov Ah,09H
	mov bl,10h ;3 is aqua E is yellow
	mov cx,3
	INT 10H
	
    int 10h 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov Ah,09H
	mov bl,40h ;3 is aqua E is yellow
	mov cx,2
	INT 10H
	
	int 10h 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov Ah,09H
	mov bl,10h ;3 is aqua E is yellow
	mov cx,3
	INT 10H
	
	int 10h ;ayaw ni e butang ug tagsa2 every letter after ra sa mo return sa INT 10H
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h


    mov ah, 02h
    mov dl, 0Ah
    int 21h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov Ah,09H
	mov bl,10h ;3 is aqua E is yellow
	mov cx,8
	INT 10H
	
    int 10h 
    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
	
	 mov ah, 02h
    mov dl, 0Dh
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h
	
	

int 27h
END START