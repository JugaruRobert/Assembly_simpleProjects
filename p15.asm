;15. The words A and B are given. Obtain the word C in the following way:
;- the bits 0-2 of C have the value 0
;- the bits 3-5 of C have the value 1
;- the bits 6-9 of C are the same as the bits 11-14 of A
;- the bits 10-15 of C are the same as the bits 1-6 of B

assume cs:code,ds:data
data segment
	a dw 0000011101010111b
	b dw 1001101111111110b
	c dw ?
data ends

code segment
start:
	mov ax,data
	mov ds,ax
	
	mov bx,0

	and bx,1111111111111000b
	or bx,0000000000111000b

	mov ax,a
	and ax,0111100000000000b
	mov cl,5
	ror ax,cl
	or bx,ax
	
	mov ax,b
	and ax,0000000001111110b
	mov cl,9
	rol ax,cl
	or bx,ax
	
	mov c,bx
	
	mov ax,4C00h
	int 21h
code ends
end start