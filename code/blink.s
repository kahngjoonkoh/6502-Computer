PORTB = $6000
PORTA = $6001
DDRB = $6002
DDRA = $6003

E = %10000000
RW = %01000000
RS = %00100000

  .org $8000

reset:
  lda #%11111111 ; Set all pins on port B to output
  sta DDRB

  lda #%11100000 ; Set top 3 pins on port A to output
  sta DDRA

  lda #%0011100 ; Set 8-bit mode; 2-line display; 5x8 font
  sta PORTB
  lda #0	; Clear RS/RW/E bits
  sta PORTA
  lda #E	; Set E bit to send instruction
  sta PORTA
  lda #0	; Clear E bits
  sta PORTA


  lda #%00001110 ; Display on; cursor on; blink off
  sta PORTB
  lda #0	; Clear RS/RW/E bits
  sta PORTA
  lda #E	; Set E bit to send instruction
  sta PORTA
  lda #0	; Clear E bits
  sta PORTA


  lda #%00000110 ; Increment and shift cursor; don't shift display
  sta PORTB
  lda #0	; Clear RS/RW/E bits
  sta PORTA
  lda #E	; Set E bit to send instruction
  sta PORTA
  lda #0	; Clear E bits
  sta PORTA


  lda #"H"	; Set 8-bit mode; 2-line display; 5x8 font
  sta PORTB
  lda #RS	; Clear RS/RW/E bits
  sta PORTA
  lda #(RS | E)	; Set E bit to send instruction
  sta PORTA
  lda #RS	; Clear E bits
  sta PORTA


  lda #"e"	; Set 8-bit mode; 2-line display; 5x8 font
  sta PORTB
  lda #RS	; Clear RS/RW/E bits
  sta PORTA
  lda #(RS | E)	; Set E bit to send instruction
  sta PORTA
  lda #RS	; Clear E bits
  sta PORTA


  lda #"l"	; Set 8-bit mode; 2-line display; 5x8 font
  sta PORTB
  lda #RS	; Clear RS/RW/E bits
  sta PORTA
  lda #(RS | E)	; Set E bit to send instruction
  sta PORTA
  lda #RS	; Clear E bits
  sta PORTA


  lda #"l"	; Set 8-bit mode; 2-line display; 5x8 font
  sta PORTB
  lda #RS	; Clear RS/RW/E bits
  sta PORTA
  lda #(RS | E)	; Set E bit to send instruction
  sta PORTA
  lda #RS	; Clear E bits
  sta PORTA


  lda #"o"	; Set 8-bit mode; 2-line display; 5x8 font
  sta PORTB
  lda #RS	; Clear RS/RW/E bits
  sta PORTA
  lda #(RS | E)	; Set E bit to send instruction
  sta PORTA
  lda #RS	; Clear E bits
  sta PORTA


  lda #","	; Set 8-bit mode; 2-line display; 5x8 font
  sta PORTB
  lda #RS	; Clear RS/RW/E bits
  sta PORTA
  lda #(RS | E)	; Set E bit to send instruction
  sta PORTA
  lda #RS	; Clear E bits
  sta PORTA


  lda #" "	; Set 8-bit mode; 2-line display; 5x8 font
  sta PORTB
  lda #RS	; Clear RS/RW/E bits
  sta PORTA
  lda #(RS | E)	; Set E bit to send instruction
  sta PORTA
  lda #RS	; Clear E bits
  sta PORTA


  lda #"w"	; Set 8-bit mode; 2-line display; 5x8 font
  sta PORTB
  lda #RS	; Clear RS/RW/E bits
  sta PORTA
  lda #(RS | E)	; Set E bit to send instruction
  sta PORTA
  lda #RS	; Clear E bits
  sta PORTA


  lda #"o"	; Set 8-bit mode; 2-line display; 5x8 font
  sta PORTB
  lda #RS	; Clear RS/RW/E bits
  sta PORTA
  lda #(RS | E)	; Set E bit to send instruction
  sta PORTA
  lda #RS	; Clear E bits
  sta PORTA


  lda #"r"	; Set 8-bit mode; 2-line display; 5x8 font
  sta PORTB
  lda #RS	; Clear RS/RW/E bits
  sta PORTA
  lda #(RS | E)	; Set E bit to send instruction
  sta PORTA
  lda #RS	; Clear E bits
  sta PORTA


  lda #"l"	; Set 8-bit mode; 2-line display; 5x8 font
  sta PORTB
  lda #RS	; Clear RS/RW/E bits
  sta PORTA
  lda #(RS | E)	; Set E bit to send instruction
  sta PORTA
  lda #RS	; Clear E bits
  sta PORTA


  lda #"d"	; Set 8-bit mode; 2-line display; 5x8 font
  sta PORTB
  lda #RS	; Clear RS/RW/E bits
  sta PORTA
  lda #(RS | E)	; Set E bit to send instruction
  sta PORTA
  lda #RS	; Clear E bits
  sta PORTA


  lda #"!"	; Set 8-bit mode; 2-line display; 5x8 font
  sta PORTB
  lda #RS	; Clear RS/RW/E bits
  sta PORTA
  lda #(RS | E)	; Set E bit to send instruction
  sta PORTA
  lda #RS	; Clear E bits
  sta PORTA

  lda #$50
  sta PORTB

loop:
  jmp loop

  .org $fffc
  .word reset
  .word $0000