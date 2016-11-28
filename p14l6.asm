;14. Two character strings S1 and S2 are given. Obtain the string D by concatenating the elements found on the positions multiple of 3 from S1 and the elements of S2 in reverse order.
;Example:
;S1: '+', '4', '2', 'a', '8', '4', 'X', '5'
;S2: 'a', '4', '5'
;D: '+', 'a', 'X', '5', '4', 'a'

assume cs:code, ds:data
data segment
      s1 db '+', '4', '2', 'a', '8', '4', 'X', '5'
      l1 EQU $-s1
      s2 db 'a', '4', '5'
      l2 EQU $-s2
      ;d db l1+l2 dup (?)
      d db (l1-1)/3+l2+1 dup (?)
data ends

code segment
start:
      mov ax, data
      mov ds, ax

      mov ax,l1  ;ax=l1=8
      add ax,2	 ;ax=10	
      mov bl,3   ;bl=3
      div bl     ;al=ax/bl=3
      mov ah,0   ;ax=3
      mov cx, ax ;cx=ax=3
      mov si, 0  ;si=0 - index folosit in pracurgerea sirurilor
      mov bx, 0  ;bx=0 index pentru sirul d
      
      jcxz Sfarsit   
      Repeta:

      mov al, s1[si]          
      mov d[bx], al      

      add si,3   ;si=si+3
      inc bx     ;bx=bx+1
      loop Repeta
      Sfarsit:
   
      mov cx, l2  ;cx=3    
      mov si, cx  ;si=3
      sub si,1    ;si=2

      jcxz Sf  
      Repet:

      mov al, s2[si]          
      mov d[bx], al      

      dec si    ;si=si-bl
      inc bx    ;bx=bx+1
      loop Repet
      Sf: 
    
      mov ax, 4C00h
      int 21h
code ends
end start