		;		ARM Programming Assignment #2: Writing C-strings
		;
		;		Write a program that assembles the values in chars*
		;		into a C-style string. A C-style string is an array
		;		of byte-size characters, terminated by a NULL (0x0).
		;		Write the C-string to the FILL memory at 'string'.
		;		Note: It's up to you to declare the correct number
		;		of bytes to hold the result.
		
		;		Your code here
		
chars0	DCD		'T', 'h', 'e', ' ', '2', '0', '1', '8', ' ', 'T', 'u'
chars1	DCD		'r', 'i', 'n', 'g', ' ', 'A', 'w', 'a', 'r', 'd', ' '
chars2	DCD		'w', 'a', 's', ' ', 'a', 'w', 'a', 'r', 'd', 'e', 'd'
chars3	DCD		' ', 't', 'o', ' ', 'B', 'e', 'n', 'g', 'i', 'o'
chars4	DCD		' ', 'H', 'i', 'n', 't', 'o', 'n', ' ', 'a', 'n'
chars5	DCD		'd', ' ', 'L', 'e', 'C', 'u', 'n', 'n', ' ', 'f', 'o'
chars6	DCD		'r', ' ', 't', 'h', 'e', 'i', 'r', ' ', 'w', 'o', 'r'
chars7	DCD		'k', ' ', 'o', 'n', ' ', 'n', 'e', 'u', 'r', 'a', 'l'
chars8	DCD		'n', 'e', 't', 'w', 'o', 'r', 'k', 's', '.'
count	DCD		95
string	FILL		100
		
		ADR		R0, chars0                 ;Address of first char
		ADR		R1, string                 ;Address in memory to write to.
		MOV		R2, #0                     ;Offset
		MOV		R3, #4                     ;Bit counter
		MOV		R4, #0                     ;Temp reg
		MOV		R5, #0
		MOV		R6, #0
		MOV		R7, #95
		
LOOP
		LDR		R4, [R0, R2]!              ;Load in letter
		SUB		R7, R7, #1
		ADD		R5, R5, R4
		LSL		R5, R5, #8
		SUB		R3, R3, #1
		CMP		R7, #0
		BEQ		ENDIT
		CMP		R3, #0
		BEQ		NEXTREG
		MOV		R2, #4
		B		LOOP
		
NEXTREG
		STR		R5, [R1, R6]!
		ADD		R1, R1, #4
		MOV		R5, #0
		MOV		R3, #4
		B		LOOP
		
		
ENDIT
		END
