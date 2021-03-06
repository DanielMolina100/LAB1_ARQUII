title laboratorio1
.model small
.stack 64
.data
LABEL1 DB 'Ejemplo de direccionamiento directo: ',0AH,'$'
LABEL2 DB 'Ejemplo de direccionamiento indirecto: ',0AH, '$'
LABEL3 DB 'Ejemplo 1 de direccionamiento con escalar: ',0AH, '$'

TEXTO1 DB 'Laboratorio 1 de Arquitectura del computador1 !', '$'
TEXTO2 DB 'ARROZ', '$'
TEXTO3 DB 'AUDIO', '$'
TEXTO4 DB 'VOCAL', '$'
TEXTO5 DB 'BINGO', '$'

BREAK  DB 0DH, 0AH, '$'

.CODE
.386
LAB1 PROC FAR
	MOV AX, @DATA
	MOV DS, AX
	MOV ES, AX
	LEA DX, LABEL1
	CALL OUTPUT
	LEA DX, TEXTO1
	CALL OUTPUT
	CALL OUTBREAK
	CALL OUTBREAK
	LEA DX, LABEL2
	CALL OUTPUT
	LEA DX, [TEXTO1+17]
	CALL OUTPUT
	CALL OUTBREAK
	CALL OUTBREAK
	LEA DX, LABEL3
	CALL OUTPUT
	LEA DX, [TEXTO2+6*2]
	CALL OUTPUT
	CALL OUTBREAK
	CALL OUTBREAK
	MOV LABEL3[8], 32H
	LEA DX, LABEL3
	CALL OUTPUT
	LEA DX, [TEXTO2+6*3]
	CALL OUTPUT
	MOV AX, 4C00H
	INT 21H
LAB1 ENDP
;Guarda un enter en DX y llama a outbreak
OUTBREAK PROC NEAR
	PUSHA
	LEA DX, BREAK
	CALL OUTPUT
	POPA
	RET
OUTBREAK ENDP
;Escribe el mensaje al que apunta DX
OUTPUT PROC NEAR
	PUSH AX
	MOV AH, 09H
	INT 21H
	POP AX
	RET
OUTPUT ENDP


END LAB1