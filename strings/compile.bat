nasm -f win32 get_string.asm
nasm -f win32 Main.asm
gcc get_string.obj Main.obj -o strings -m32
