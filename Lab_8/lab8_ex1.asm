;=================================================
; Name: Justin An
; Email: jan053@ucr.edu
; 
; Lab: lab 8, ex 1
; Lab section: 022
; TA: Westin Montano
; 
;================================================

.orig x3000

LD R6, top_stack_addr


LD R5, LOAD_FILL_VALUE
JSRR R5

LD R5, OUTPUT_AS_DECIMAL
JSRR R5

					
HALT

;---------------	
; Program Data
;---------------

top_stack_addr .fill xFE00
LOAD_FILL_VALUE .fill x3200
OUTPUT_AS_DECIMAL .fill x3400

.END


;=================================================
; Subroutine: LOAD_FILL_VALUE_3200
; Parameter: (R1) which is the register to be filled
; Postcondition: Should fill in a value into R1
; Return Value: Nothin to return (void function)
;=================================================

.orig x3200


ADD R6, R6, #-1
STR R7, R6, #0
ADD R6, R6, #-1
STR R2, R6, #0
; Backup registers

; Code
LD R1, value
; Restore registers

LDR R2, R6, #0
ADD R6, R6 #1
LDR R7, R6, #0
ADD R6, R6, #1


RET

value .FILL #1208
help .STRINGZ "Test"

.end

;=================================================
; Subroutine: OUTPUT_AS_DECIMAL_3400
; Parameter: // Fixme
; Postcondition: // Fixme
; Return Value: // Fixme
;=================================================

.orig x3400
ADD R6, R6, #-1
STR R1, R6, #0
ADD R6, R6, #-1
STR R2, R6, #0
ADD R6, R6, #-1
STR R4, R6, #0
ADD R6, R6, #-1
STR R5, R6, #0
ADD R6, R6, #-1
STR R7, R6, #0

ADD R1, R1, #0
BRzp notnegative

LD R0, negativestring
OUT

NOT R1, R1
ADD R1, R1, #1

notnegative

LD R2, DEC_0 ;counter, the number in this digit
LD R3, ntenthousand
tenthousandloop
ADD R1, R1, R3
BRn stoptenthousand
Add R2, R2, #1
BR tenthousandloop
stoptenthousand
NOT R3, R3
ADD R3, R3, #1
ADD R1, R1, R3
ADD R0, R2, #12
ADD R0, R0, #12
ADD R0, R0, #12
ADD R0, R0, #12
OUT

LD R2, DEC_0 ;counter, the number in this digit
LD R3, nthousand
thousandloop
ADD R1, R1, R3
BRn stopthousand

Add R2, R2, #1
;out put R2
BR thousandloop
stopthousand
NOT R3, R3
ADD R3, R3, #1
ADD R1, R1, R3
ADD R0, R2, #12
ADD R0, R0, #12
ADD R0, R0, #12
ADD R0, R0, #12
OUT


LD R2, DEC_0 ;counter, the number in this digit
LD R3, nhundred
hundredloop
ADD R1, R1, R3
BRn stophundred

Add R2, R2, #1
;out put R2
BR hundredloop
stophundred
NOT R3, R3
ADD R3, R3, #1
ADD R1, R1, R3
ADD R0, R2, #12
ADD R0, R0, #12
ADD R0, R0, #12
ADD R0, R0, #12
OUT

LD R2, DEC_0 ;counter, the number in this digit
LD R3, nten
tenloop
ADD R1, R1, R3
BRn stopten

Add R2, R2, #1
;out put R2
BR tenloop
stopten
NOT R3, R3
ADD R3, R3, #1
ADD R1, R1, R3
ADD R0, R2, #12
ADD R0, R0, #12
ADD R0, R0, #12
ADD R0, R0, #12
OUT

ADD R0, R1, #12
ADD R0, R0, #12
ADD R0, R0, #12
ADD R0, R0, #12
OUT

STR R7, R6, #0
ADD R6, R6, #1
LDR R5, R6, #0
ADD R6, R6, #1
LDR R4, R6, #0
ADD R6, R6, #1
LDR R2, R6, #0
ADD R6, R6, #1
LDR R1, R6, #0
ADD R6, R6, #1


RET

negativestring .STRINGZ "-"
counter .FILL #4
DEC_0 .FILL #0
n48 .FILL #48
ntenthousand .FILL #-10000
nthousand .FILL #-1000
nhundred .FILL #-100
nten .FILL #-10


.end







