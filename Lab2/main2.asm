.586
.model flat, stdcall
option casemap:none

INCLUDE C:\masm32\include\windows.inc
INCLUDE C:\masm32\include\kernel32.inc
INCLUDELIB C:\masm32\lib\kernel32.lib
INCLUDE C:\masm32\include\user32.inc
INCLUDELIB C:\masm32\lib\user32.lib
INCLUDE module.inc

.data
    Caption db "Hex Representation",0
    TextBuf db 64 dup(?)

    X  equ 11 + 10    ; X = N + 10 = 21
    Y  equ 2 * X      ; Y = 2 * X = 42

    Value db X         
    NegValue db -X     

    Value16 dw X       
    NegValue16 dw -X   

    Value32 dd X       
    NegValue32 dd -X   

    Value64 dq X       
    NegValue64 dq -X   

    Float32_X dd 11.0  
    Float32_Y dd -22.0 
    Float32_Xx dd 11.11 

    Float64_X dq 11.0  
    Float64_Y dq -22.0 
    Float64_Xx dq 11.11 

    Float80_X dt 11.0  
    Float80_Y dt -22.0 
    Float80_Xx dt 11.11 

.code
start:
    ; ¬ив≥д 8-б≥тових значень
    push offset TextBuf
    push offset Value
    push 8
    call StrHex_MY
    invoke MessageBoxA, 0, addr TextBuf, addr Caption, MB_ICONINFORMATION

    push offset TextBuf
    push offset NegValue
    push 8
    call StrHex_MY
    invoke MessageBoxA, 0, addr TextBuf, addr Caption, MB_ICONINFORMATION

    ; ¬ив≥д 16-б≥тових значень
    push offset TextBuf
    push offset Value16
    push 16
    call StrHex_MY
    invoke MessageBoxA, 0, addr TextBuf, addr Caption, MB_ICONINFORMATION

    push offset TextBuf
    push offset NegValue16
    push 16
    call StrHex_MY
    invoke MessageBoxA, 0, addr TextBuf, addr Caption, MB_ICONINFORMATION

    ; ¬ив≥д 32-б≥тових значень
    push offset TextBuf
    push offset Value32
    push 32
    call StrHex_MY
    invoke MessageBoxA, 0, addr TextBuf, addr Caption, MB_ICONINFORMATION

    push offset TextBuf
    push offset NegValue32
    push 32
    call StrHex_MY
    invoke MessageBoxA, 0, addr TextBuf, addr Caption, MB_ICONINFORMATION

    ; ¬ив≥д 64-б≥тових значень
    push offset TextBuf
    push offset Value64
    push 64
    call StrHex_MY
    invoke MessageBoxA, 0, addr TextBuf, addr Caption, MB_ICONINFORMATION

    push offset TextBuf
    push offset NegValue64
    push 64
    call StrHex_MY
    invoke MessageBoxA, 0, addr TextBuf, addr Caption, MB_ICONINFORMATION

    ; ¬ив≥д 32-б≥тових значень з плаваючою комою
    push offset TextBuf
    push offset Float32_X
    push 32
    call StrHex_MY
    invoke MessageBoxA, 0, addr TextBuf, addr Caption, MB_ICONINFORMATION

    push offset TextBuf
    push offset Float32_Y
    push 32
    call StrHex_MY
    invoke MessageBoxA, 0, addr TextBuf, addr Caption, MB_ICONINFORMATION

    push offset TextBuf
    push offset Float32_Xx
    push 32
    call StrHex_MY
    invoke MessageBoxA, 0, addr TextBuf, addr Caption, MB_ICONINFORMATION

    ; ¬ив≥д 64-б≥тових значень з плаваючою комою
    push offset TextBuf
    push offset Float64_X
    push 64
    call StrHex_MY
    invoke MessageBoxA, 0, addr TextBuf, addr Caption, MB_ICONINFORMATION

    push offset TextBuf
    push offset Float64_Y
    push 64
    call StrHex_MY
    invoke MessageBoxA, 0, addr TextBuf, addr Caption, MB_ICONINFORMATION

    push offset TextBuf
    push offset Float64_Xx
    push 64
    call StrHex_MY
    invoke MessageBoxA, 0, addr TextBuf, addr Caption, MB_ICONINFORMATION

    ; ¬ив≥д 80-б≥тових значень з плаваючою комою
    push offset TextBuf
    push offset Float80_X
    push 80
    call StrHex_MY
    invoke MessageBoxA, 0, addr TextBuf, addr Caption, MB_ICONINFORMATION

    push offset TextBuf
    push offset Float80_Y
    push 80
    call StrHex_MY
    invoke MessageBoxA, 0, addr TextBuf, addr Caption, MB_ICONINFORMATION
    push offset TextBuf
    push offset Float80_Xx
    push 80
    call StrHex_MY
    invoke MessageBoxA, 0, addr TextBuf, addr Caption, MB_ICONINFORMATION

    invoke ExitProcess, 0
end start
