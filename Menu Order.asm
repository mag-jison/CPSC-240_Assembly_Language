.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

INCLUDE Irvine32.inc

.data

	menu BYTE "--------------------MENU--------------------", 0
	drinks BYTE "Drinks................................... $2", 0
	sandwiches BYTE "Sandwiches............................... $4", 0
	prompt_drinks BYTE "    How many drinks? ", 0
	prompt_sandwiches BYTE "    How many sandwiches? ", 0
	prompt_bill BYTE "      Your total bill $", 0

	temp DWORD 0
	varD DWORD 2
	varS DWORD 4
	num_T DWORD ?
	num_D DWORD ?
	num_S DWORD ?

.code
main PROC

	mov edx, OFFSET menu
	call WriteString
	call Crlf

	mov edx, OFFSET drinks
	call WriteString
	call Crlf
	
	mov edx, OFFSET sandwiches
	call WriteString
	call Crlf

	mov edx, OFFSET prompt_drinks
	call WriteString
	call ReadDec
	mov num_D, eax

	mov edx, OFFSET prompt_sandwiches
	call WriteString
	call ReadDec
	mov num_S, eax

	mov ecx, num_D
	mov ebx, varD
	drink:		
		add temp, ebx
		loop drink
	
	mov eax, temp
	mov num_T, eax
	mov temp, 0

	mov ecx, num_S
	mov edx, varS
	sandwich:
		add temp, edx
		loop sandwich

	mov eax, temp
	add num_T, eax

	mov edx, OFFSET prompt_bill
	call WriteString
	mov eax, num_T
	call WriteDec

	call Crlf
	call Crlf
	call WaitMsg
	INVOKE ExitProcess, 0
main ENDP
END main
