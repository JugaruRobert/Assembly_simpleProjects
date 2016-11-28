;29. (a+b)/(c-2)-d+2
;a,b,c-byte; d-doubleword
;unsigned interpretation
assume cs:code,ds:data
data segment
	a DB 12
	b DB 10
	c DB 4
	d DD 6
data ends
code segment
start:
	mov ax,data
	mov ds,ax
	mov al,a   ;al=a=12 
	add al,b   ;al=al+b=22
	mov ah,0   ;ax=22
	mov bl,c   ;bl=4
	sub bl,2   ;bl=2
	div bl     ;al=ax/bl=11
	add al,2   ;al=13
	mov ah,0   ;ax=13
	mov dx,0   ;dx:ax=13

	sub ax,word ptr d     
	sbb dx,word ptr d+2   

	mov ax,4C00h
	int 21h
code ends
end start
