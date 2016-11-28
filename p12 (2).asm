;12. Being given a string of words, find the lenght of the longest substring of ordered words (in increasing order) from this string.

assume cs:code,ds:data
data segment
	s dw 450,700,200,400,900
	l EQU ($-s)/2
	temp dw l dup (?)
	sir dw l dup(?)
	lmax db 0
	lc db 1

data ends
code segment

start:
	mov ax,data
	mov ds,ax
	
	mov si, offset s	
	cld			   
	;mov cx, l-1
	mov cx,l
	dec cx
				
			
	repeta:
		lodsw		
		mov bx,ax
		lodsw
		cmp bx,ax
		ja notcresc

		inc lc
		jmp cresc

		notcresc:
			mov al,lc
			cmp al,lmax
			ja maxim
			jmp cresc
		maxim:
			mov lmax,0
			mov lmax,al
			mov lc,1
		cresc:
			sub si,2
		
	loop repeta
	
	mov al,lc
	cmp al,lmax
	ja max
	max:
		mov lmax,0
		mov lmax,al
		

	mov ax,4C00h
	int 21h
code ends

end start