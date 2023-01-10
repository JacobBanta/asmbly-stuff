    global    print_num
    extern    _printf
section .text
print_num:
	xor eax, eax                ; clears a few registers
	xor ebx, ebx
	xor edi, edi
        mov eax, [esp + 4]          ; puts integer1 in eax register
	mov ebx, 10                 ; puts 10 in ebx register. this is needed to get multiple digits
    loop_start:                     ; start of the first loop
	inc di                      ; di is used to count the digits
	xor edx, edx                ; edx register has to be cleared befor division
	div ebx                     ; divides eax(integer1) / ebx(10) with remainder going to dx
	add edx, 48                 ; converts raw value to ascii digit
        mov [esp - 4], edx          ; stores value on the stack in a weird way for printf
        sub esp, 4
        push esp
	cmp eax, 0                  ; checks if there are any more digits
	jg loop_start               ; if so, repeat the loop
    loop2_start:                    ; start of second loop
	call _printf                ; prints the last value on the stack
        add esp, 8                  ; sets the stack pointer to the last value
        dec di                      ; couts how many digits have been printed
        cmp di, 0                   ; checks if all the digits have been printed
        jg loop2_start              ; if not, go to start of loop2
        ret                         ; return to main function