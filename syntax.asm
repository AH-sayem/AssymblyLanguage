

data segment   ; define data segment
    s1 db 10,1,2,3,4,5,6,7,8,9,10    ; source data 
    s2 db dup(0)   ; destination data initialize with zero
data ends

code segment       ; code segment started here 
    assume cs:code,ds:data
    start: mov ax, data ; move data segment base adress to ax
    mov ds,ax ; mov ax to es 
    mov es,ax ; mov ax to es 
    lea si , s1
    lea di ,s2 ; mov s2 to di 
    mov cl,[si] ; copy value from offset si to cl to make counter
    mov ch , 00h ; moc 00 to ch register 
    inc si ; incriment si one by one 
    cld       ; clear direction flag 
    rep movsb ; mov data from ds:si to es;di 
    mov ax,4c00h
    int 21h
    code ends 
end start

    