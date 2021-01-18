.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

INCLUDE Irvine32.inc

.data

	source BYTE 6 DUP (?)
	target BYTE SIZEOF source DUP (?)

.code
main PROC

	mov edx, OFFSET source
	mov ecx, SIZEOF source
	call ReadString

	mov esi, OFFSET source                 ; the first three lines gets the ;memory location of the last element in the array
	add esi, SIZEOF source
	sub esi, TYPE source
	mov edi, OFFSET target                 ; gets the memory location of the ;first element in the array
	mov ecx, SIZEOF source                 ; loop counter set to the TYPE times ;the number of characters

	L1:
		
		mov al, [esi]                      ; moves the current dereferenced ;memory location starting from the last element into register al
		mov [edi], al                      ; moves the register, al, into the ;curent dereferenced memory location starting from the first element
		add edi, TYPE target               ; moves edi to the next memory ;location
		sub esi, TYPE source               ; moves esi to the previous ;memory location

		loop L1


	mov edx, OFFSET target
	call WriteString

	call Crlf
	call WaitMsg
	INVOKE ExitProcess, 0
main ENDP
END main