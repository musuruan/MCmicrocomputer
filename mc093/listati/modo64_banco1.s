; cl65 -o modo64_banco1.prg -t none modo64_banco1.s

; Commodore Load Address
LOADADDR = $2000

.word LOADADDR
.org LOADADDR

Main:
	LDA #$00	;Si seleziona il banco 15
	STA $FF00	;     I/O+RAM 0+Kernal

	SEI 		;Si dasabilitano le interruzioni IRQ

	LDA #$74	;Il VIC "vede" la
	STA $D506	;   RAM 1

	LDA #$E3 	;Viene settata
	STA $01	;la porta di I/O
	LDA #$2F	;del microprocessore
	STA $00	;locata a (0 e 1)

	LDX #$0E	;Viene trasferita
@1:	LDA @2-1,X	;una parte di codice
	STA $01,X	;da $2023 - $2030 a $0002
	DEX		;Tale parte di codice resta accessibile
	BNE @1		;da tutti i banchi

	STX $D030	;Si azzera $D030

	JMP $0002	;Salta a $0002 per eseguire il GO 64 in RAM 1

@2:	LDA #$7E	;-Codice trasferito a 0002-. Si seleziona
	STA $FF00	; RAM 1 + I/O
	LDA #$F7	;Modo 64.Le ROM del 128 non sono piu' visibili
	STA $D505	;all'8502 ora subentrano quelle del 64
	JMP ($FFFC)	;Si salta alla routine di RESET del 64

