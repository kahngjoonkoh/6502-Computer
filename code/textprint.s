PORTB = $6000
PORTA = $6001
DDRB = $6002
DDRA = $6003

E = %10000000
RW = %01000000
RS = %00100000

  .org $8000

reset:
  ldx #$ff	; to initialize the stack pointer
  txs

  lda #%11111111 ; Set all pins on port B to output
  sta DDRB

  lda #%11100000 ; Set top 3 pins on port A to output
  sta DDRA

  lda #%0011100 ; Set 8-bit mode; 2-line display; 5x8 font
  jsr lcd_instruction	;jump to subroutine
  lda #%00001100 ; Display on; cursor off; blink off
  jsr lcd_instruction
  lda #%00000110 ; Increment and shift cursor; don't shift display
  jsr lcd_instruction
  lda #%00000001 ; Clear display
  jsr lcd_instruction


  ldx #0
print:
  lda message,x
  beq loop
  jsr print_char
  inx
  jmp print

loop:
  jmp loop

message: .asciiz " 6502 Computer                           Kahngjoon Koh"

lcd_wait:
  pha		; push the stack value
  lda #%00000000 ; Port B is input temporarily
  sta DDRB
lcd_busy:
  lda #RW
  sta PORTA
  lda #(RW | E)
  sta PORTA
  lda PORTB
  and #%10000000 ;  Just checking the busy flag
  bne lcd_busy

  lda #RW
  sta PORTA
  lda #%11111111 ; Port B is back to output mode
  sta DDRB
  pla		; pull the stack value
  rts


lcd_instruction:
  jsr lcd_wait
  sta PORTB
  lda #0	; Clear RS/RW/E bits
  sta PORTA
  lda #E	; Set E bit to send instruction
  sta PORTA
  lda #0	; Clear E bits
  sta PORTA
  rts		;return to subroutine

print_char:
  jsr lcd_wait	; I missed this part
  sta PORTB
  lda #RS	; Clear RS/RW/E bits
  sta PORTA
  lda #(RS | E)	; Set E bit to send instruction
  sta PORTA
  lda #RS	; Clear E bits
  sta PORTA
  rts


  .org $fffc
  .word reset
  .word $0000