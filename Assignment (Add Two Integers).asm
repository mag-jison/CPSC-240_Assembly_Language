.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

INCLUDE Irvine32.inc

.data

	val1 SDWORD ?
	val2 SWORD ?
	str1 BYTE "Enter first integer: ", 0
	str2 BYTE "Enter second integer: ", 0
	str3 BYTE "The sum is:       ", 0

.code
main PROC
	
	call Clrscr
	mov dh, 10
	mov dl, 20
	call Gotoxy

	mov edx, OFFSET str1
	call WriteString
	call ReadInt
	mov val1, eax

	mov dh, 12
	mov dl, 20
	call Gotoxy
	mov edx, OFFSET str2
	call WriteString
	call ReadInt
	add eax, val1

	mov dh, 14
	mov dl, 20
	call Gotoxy
	mov edx, OFFSET str3
	call WRiteString
	call WriteInt
	call Crlf
	call Crlf

	INVOKE ExitProcess, 0
main ENDP
END main