    global    _main
    extern    _printf
    extern    get_string

    segment  .data
	string: times 32 db 0
        formatin: db "%c", 0
        chars: times 4 db 0
    section .text
_main:
    mov ebp, esp; for correct debugging
	enter 0, 0
	pusha
        push string         ;param 1: string where result will be stored
        push 32             ;param 2: maximum length of result
        call get_string
        add esp, 8
        push string
        call _printf
        add esp, 4
	popa
	xor eax, eax
	leave
        ret