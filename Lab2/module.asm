.586
.model flat, c
.code
StrHex_MY proc
    push ebp
    mov ebp,esp

    mov ecx, [ebp+8]        ; ������� ��� �����  
    cmp ecx, 0
    jle @exitp
    shr ecx, 3              ; ���������� � �����
    mov esi, [ebp+12]       ; ������ �����
    mov ebx, [ebp+16]       ; ������ ������

@cycle:
    mov dl, byte ptr [esi+ecx-1]  ; �������� ���� �����
    mov al, dl
    shr al, 4                ; ������ hex-�����
    call HexSymbol_MY
    mov byte ptr [ebx], al

    mov al, dl               ; ������� hex-�����
    call HexSymbol_MY
    mov byte ptr [ebx+1], al

    add ebx, 2
    dec ecx
    jnz @cycle

    mov byte ptr [ebx], 0   ; ���������� �����
@exitp:
    pop ebp
    ret 12
StrHex_MY endp

HexSymbol_MY proc
    and al, 0Fh
    add al, 48
    cmp al, 58
    jl @exitp
    add al, 7
@exitp:
    ret
HexSymbol_MY endp

end
