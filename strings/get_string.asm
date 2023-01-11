    global    get_string
    extern    _scanf

    segment  .data
        formatin: db "%c", 0
        chars: times 4 db 0
    section .text
get_string:
        mov edi, [esp + 4]
        mov esi, [esp + 8]
    loop_start:
        mov dword[chars], 0
        push chars
        push formatin
        call _scanf
        add esp, 8
        cmp dword[chars], 10
        je loop_end
        mov eax, [esp + 4]
        sub eax, edi
        mov edx, [chars]
        mov dword[esi + eax], edx
        dec edi
        cmp edi, 0
        jg loop_start
    loop_end:
        ret