.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

INCLUDE Irvine32.inc

.data

		reg DWORD 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1
		door DWORD 0, 1, 1, 1
		num_open DWORD 0
		count DWORD 0
		prompt BYTE "Number of Doors Open: ", 0

.code
main PROC
	mov esi, OFFSET reg
	mov edi, OFFSET door
	mov ecx, 30

	Traverse:
		cmp count, 4
		jz Same
		mov eax, [esi]
		mov ebx, [edi]
		cmp eax, ebx
		jnz NotFound
		loop Found

	NotFound:
		mov edi, OFFSET door
		cmp count, 0
		jz GoBack
		
		sub count, 1
		push ecx
		mov ecx, count
		Reverb:
			sub esi, TYPE reg
			loop Reverb
		pop ecx
		add ecx, count

		mov count, 0
		loop Traverse

	GoBack:
		add esi, TYPE reg
		mov count, 0
		loop Traverse

	Found:
		inc count
		add esi, TYPE reg
		add edi, TYPE door
		loop Traverse

	Same:
		inc num_open
		mov count, 0
		loop Traverse
	
	mov edx, prompt
	call WriteString
	mov eax, num_open
	call WriteDec

	call Clrf
	call WaitMsg
	INVOKE ExitProcess, 0
main ENDP
END main
