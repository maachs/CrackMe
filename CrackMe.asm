.model tiny
.code
org 100h

Start:
            mov ax, 0900h
            mov dx, offset HelloPhrase
            int 21h

            call GetUserPassword

            call EasyBug

            call CalcHash

            cmp dx, HashPassword
        jne wrong_password

            mov ax, 0900h
            mov dx, offset Success
            int 21h

        jmp skip

        wrong_password:
            mov ax, 0900h
            mov dx, offset Wrong
            int 21h

        skip:
            mov ax, 4c00h           ;exit
            int 21h
;------------------------------------------------
;CalcHash - func to calculate hash of str
;Entry: si - str
;Exit: dx - hash
;Destr: ax, cx
;------------------------------------------------
CalcHash        proc
            push si
            mov si, offset Buffer
            mov dx, 5381h

            mov ch, 0d
            mov cl, [si + 1]            ;second symbol is len
            add si, 2d
        calc:
            shl dx, 5d                  ;dx * 32

            mov al, [si]
            mov ah, 0
            xor dx, ax
            inc si

        loop calc
            pop si
            ret
            endp

;-------------------------------------
;EasyBug
;-------------------------------------
EasyBug     proc
            mov si, offset Buffer
            ;mov cl, [si + 1]

            mov ch, [si + 3]
            cmp ch, '@'
        jne to_end

            mov ax, 0900h
            mov dx, offset Success
            int 21h

            mov ax, 4c00h
            int 21h
        to_end:

            ret
            endp

GetUserPassword proc
            mov dx, offset Buffer
            mov ah, 0ah
            int 21h

            ret
            endp

;------------PASSWORD-----------------
;-----------------BUFFER--------------
Buffer      db 15d
            db 15 dup("0")
;-------------------------------------
HashPassword equ 0a98eh
ValRegisters db 20d dup(0)
;-------------------------------------
HelloPhrase db 'Enter Password:$'
Success     db '----------------Success------------------$'
Wrong       db '------Wrong password,loser-------$'
end         Start
