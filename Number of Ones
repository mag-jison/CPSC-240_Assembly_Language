.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

INCLUDE Irvine32.inc

.data
	
	prompt BYTE "Number of Ones: ", 0
	reg DWORD 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1
	accumulator DWORD 0

.code
main PROC
	
	mov esi, OFFSET reg
	mov ecx, LENGTHOF reg

	count:
		mov eax, [esi]
		add esi, TYPE reg
		CMP eax, 1
		jnz ValueFound
		inc accumulator

	ValueFound:
		loop count

	mov edx, OFFSET prompt
	call WriteString
	mov eax, accumulator
	call WriteDec

	INVOKE ExitProcess, 0
main ENDP
END main
