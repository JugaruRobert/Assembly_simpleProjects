;30. a*b-(100-c)/(b*b)+e
;a-word; b,c-byte; e-doubleword
;signed representation

assume cs:code,ds:data
data segment
	a DW 10
	b DB -2
	c DB 80
	e DD -25
data ends
code segment
start:
	mov ax,data
	mov ds,ax

	mov al,b   ;al=b=-2
	imul b     ;ax=al*b=-2*(-2)=4
	mov bx,ax  ;bx=ax=4
		   ;bx=b*b

	mov al,100 ;al=100
	sub al,c   ;al=al-c=20
		   ;al=100-c

	cbw        ;ax=20
	cwd        ;dx:ax=20
	idiv bx    ;ax=dx:ax / bx =20/4=5
		   ;ax=(100-c)/(b*b) 

	cwd        ;dx:ax=5 
	mov bx,ax  
	mov cx,dx  ;cx:bx=5
		   ;cx:bx = (100-c)/(b*b) 

	mov al,b   ;al=-2
	cbw   	   ;ax=-2
	imul a     ;dx:ax=ax*a=-2*10=-20
                   ;dx:ax=a*b

	add ax,word ptr e
	adc dx, word ptr e+2
                   ;dx:ax=a*b+e = -45

	sub ax,bx
	sbb dx,cx ;dx:ax=-50

	mov ax,4C00h
	int 21h
code ends
end start
	
