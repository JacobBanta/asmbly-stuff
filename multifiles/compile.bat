nasm -f win32 inputOutput.asm
nasm -f win32 print_num.asm
gcc inputOutput.obj print_num.obj -o multifiles -m32
