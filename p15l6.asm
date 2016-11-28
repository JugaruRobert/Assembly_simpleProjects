;15. A byte string S is given. Build the string D whose elements represent the sum of each two consecutive bytes of S.
;S: 1, 2, 3, 4, 5, 6
;D: 3, 5, 7, 9, 11

assume cs:code, ds:data
data segment
      s db 1, 2, 3, 4, 5, 6
      l EQU $-s
      d db l-1 dup (?)

data ends
code segment
start:
      mov ax, data
      mov ds, ax

      mov cx, l      
      mov si, 0 
     
      jcxz Sfarsit   
      Repeta:

      mov al, s[si]  
      mov bl, s[si+1]     

      add al,bl    

      mov d[si], al      

      inc si      
      loop Repeta
      Sfarsit:  
   
mov ax, 4C00h
int 21h

code ends
end start