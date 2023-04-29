;=================================================
; Name: Justin An
; Email: jan053
; 
; Lab: lab 8, ex 2
; Lab section: 022
; TA: Westin Montano
; 
;=================================================

.orig x3000

LD R6, top_stack_addr

LEA R0, prompt
PUTS
LD R0, newline
OUT

GETC
OUT

LD R4, DEC_0_3000
ADD R4, R4, R0
ADD R4, R4, #12
ADD R4, R4, #12
ADD R4, R4, #12
ADD R4, R4, #12


LD R1, DEC_0_3000
ADD R1, R1, R0

LD R5, PARITY_CHECK_3600
JSRR R5

LD R0, newline
OUT

LEA R0, output
PUTS

LD R0, DEC_0_3000
ADD R0, R0, R4
ADD R0, R0, #-12
ADD R0, R0, #-12
ADD R0, R0, #-12
ADD R0, R0, #-12
OUT

LEA R0, output2
PUTS

LD R0, DEC_0_3000 
ADD R0, R0, R3
ADD R0, R0, #12
ADD R0, R0, #12
ADD R0, R0, #12
ADD R0, R0, #12
OUT



; Test harness
;-------------------------------------------------

HALT

; Test harness local data
;-------------------------------------------------
top_stack_addr .fill xFE00
prompt .STRINGZ "Input a single character"
newline .STRINGZ "\n"
n48 .FILL #-48
DEC_0_3000 .FILL #0
PARITY_CHECK_3600 .FILL x3600
output .STRINGZ "The number of 1’s in '"
output2 .STRINGZ "' is: "

.end

;=================================================
; Subroutine: PARITY_CHECK_3600
; Parameter: // Fixme
; Postcondition: // Fixme
; Return Value (R3): // Fixme
;=================================================

.orig x3600
ADD R6, R6, #-1
STR R4, R6, #0
ADD R6, R6, #-1
STR R1, R6, #0
ADD R6, R6, #-1
STR R7, R6, #0

LD R3, DEC_0 ;R3 is onecounter
LD R4, counter


loop
ADD R1, R1, #0
BRzp positivenumber

ADD R3, R3, #1

positivenumber
ADD R1, R1, R1
ADD R4, R4, #-1
BRp loop

LDR R7, R6, #0
ADD R6, R6, #1
LDR R1, R6, #0
ADD R6, R6, #1
LDR R4, R6, #0
ADD R6, R6, #1



RET

DEC_0 .FILL #0
counter .FILL #16
.end