; ------------------------------------------------------------------
; inputOutput.asm
;
; This is a Win32 console program that return the int you give it
;
; To assemble to .obj: nasm -f win32 inputOutput.asm
; To compile to .exe:  gcc inputOutput.obj -o inputOutput -m32
; ------------------------------------------------------------------


    global    _main                 ; declare main() method
    extern    _printf               ; link to external library
    extern    _scanf
    extern    print_num

    segment  .data
	integer1: times 4 db 0      ; variable tha stores an int
        formatin: db "%d", 0        ; formatting for scanf
    section .text
_main:                              ; the entry point! void main()
        mov ebp, esp                ; for correct debugging
	enter 0, 0                  ; not sure but is needed
	pusha                       ; not sure but is needed
        push integer1               ; where user input is stored
        push formatin               ; formatting for scanf
        call _scanf                 ; gets user input
        add esp, 8                  ; resets stack
        push dword [integer1]       ; pushes int to stack to be printed
        call print_num              ; starts print_num function 
        add esp, 4                  ; resets the stack pointer
	popa                        ; not sure but is needed
	xor eax, eax                ; not sure but might be needed
	leave                       ; exits the program
        ret                         ; not sure but might be needed
        

