.586
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include \masm32\macros\macros.asm

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

.data
    Caption1 db "Я програма на асемблері",0
    Text1 db "Здоровенькі були! Мій автор - Бессараб Марія Павлівна", 0  

.code
main:
    invoke MessageBoxA, 0, ADDR Text1, ADDR Caption1, 0  

    invoke GetProcessHeap
    invoke HeapAlloc, eax, 0, 100
    mov esi, eax

    invoke ExitProcess, 0


end main