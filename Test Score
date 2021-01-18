.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

INCLUDE Irvine32.inc

.data

	str1 BYTE ": The letter grade is", 0
	grade BYTE ?

.code
main PROC
	
	call Randomize
	mov ecx, 10

	again:
		push ecx

		mov eax, 51
		call RandomRange
		add eax, 50
		call WriteDec
		call CalcGrade
		mov grade, al

		mov edx, OFFSET str1
		call WriteString
		move al, grade
		call WriteChar
		call Crlf

		pop ecx
		loop again

	INVOKE ExitProcess, 0
main ENDP

PROC CalcGrade

	Grade_A:
		cmp eax, 90
		jb Grade_B
		mov al, 'A'
		jmp finished

	Grade_B:
		cmp eax, 80
		jb Grade_C
		mov al, 'B'
		jmp finished

	Grade_C:
		cmp eax, 70
		jb Grade_D
		mov al, 'C'
		jmp finished
	
	Grade_D:
		cmp eax, 60
		jb Grade_F
		mov al, 'D'
		jmp finished

	Grade_F:
		mov al, 'F'

	finished:
	ret
	CalcGrade ENDP


END main
