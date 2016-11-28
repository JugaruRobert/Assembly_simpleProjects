;29. (a+b)/(c-2)-d+2
;a,b,c-byte; d-doubleword
;signed interpretation

assume cs:code,ds:data
data segment
	a DB -7
	b DB -8
	c DB -1
	d DD 10
data ends
code segment
start:
	mov ax,data
	mov ds,ax
	mov al,a ;al=a=-7 
	add al,b ;al=al+b=-8
	cbw      ;ax=-15
	mov bl,c ;bl=c=-1
	sub bl,2 ;bl=-3
	idiv bl  ;al=ax/bl=5  
	add al,2 ;al=al+2=7
	cbw
	cwd
	sub ax,word ptr d     
	sbb dx,word ptr d+2   ;dx:ax=7-10=-3

	mov ax,4C00h
	int 21h
code ends
end start

