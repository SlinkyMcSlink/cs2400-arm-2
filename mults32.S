		;		ARM Programming Assignment #2: 32 bit signed integer multiplier
		;
		;		Write a 32-bit SIGNED multiplier. It should take only a small modification to your
		;		unsigned version. Remember (-6)*(-6) = 36, (-6)*6 = -36.
		;		Use the standard shift-and-add operation.
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" word.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
		
		;		Your code here
		
numbers	DCD		0xA0BCFF0D, 0xFFF0ADEA
result	FILL		8
carry	FILL		4
		
		ADR		R0, numbers         ; Put the address of the first number in R0
		MOV		R1, #0             	; Offset
		LDR		R2, [R0, R1]  	     ; Loads multicand B
		MOV		R1, #4	   		; Changes address in R0 to point to second number
		LDR		R3, [R0, R1]  		; Loads Q
		
		MOV		R4, #0        		; Accumulator
		MOV		R5, #1        		; Mask
		MOV		R6, #16      		; num of bits used
		MOV		R7, #0
		MOV		R8, #1
		
		
mainLoop
		AND		R7, R3, R5    		; compares Last bit of Q and 1
		CMP		R7, #0        		; if 1
		BGT		accum	   		; branch to a = a + b
pause
		MOV		R2, R2, LSL #1      ; shift b left
		MOV		R3, R3, LSR #1		; shift q right
		SUB		R6, R6, #1          ; subtract from bit counter
		CMP		R6, #0			; If bitcounter is 0:
		BEQ		exit				; branch to exit
		B		mainLoop			; back to beginng
		
exit
		STR		R4, [R0, #8]
		STR		R8, [R0, #12]
		END		; Ends program
		
accum
		ADD		R4, R4, R2         	; adds b to a
		B		pause		     ; back to pause
