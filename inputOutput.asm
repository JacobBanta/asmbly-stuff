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
    extern _scanf

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
        
print_num:
	xor eax, eax                ; clears a few registers
	xor ebx, ebx
	xor edi, edi
        mov eax, [esp + 4]          ; puts integer1 in eax register
	mov bx, 10                  ; puts 10 in bx register. this is needed to get multiple digits
    loop_start:                     ; start of the first loop
	inc di                      ; di is used to count the digits
	xor dx, dx                  ; dx register has to be cleared befor division
	div bx                      ; divides ax(integer1) / bx(10) with remainder going to dx
	add dx, 48                  ; converts raw value to ascii digit
        mov [esp - 4], edx          ; stores value on the stack in a weird way for printf
        sub esp, 4
        push esp
	cmp ax, 0                   ; checks if there are any more digits
	jg loop_start               ; if so, repeat the loop
    loop2_start:                    ; start of second loop
	call _printf                ; prints the last value on the stack
        add esp, 8                  ; sets the stack pointer to the last value
        dec di                      ; couts how many digits have been printed
        cmp di, 0                   ; checks if all the digits have been printed
        jg loop2_start              ; if not, go to start of loop2
        ret                         ; return to main function
