
_main:

;Relay.c,1 :: 		void main() {
;Relay.c,2 :: 		TRISB = 0x00;        // PortB as Output
	CLRF       TRISB+0
;Relay.c,3 :: 		portb = 0x00;        // Initialize Portb as Off
	CLRF       PORTB+0
;Relay.c,4 :: 		while(1)
L_main0:
;Relay.c,6 :: 		portb.f1=1;
	BSF        PORTB+0, 1
;Relay.c,7 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;Relay.c,8 :: 		portb.f1=0;
	BCF        PORTB+0, 1
;Relay.c,9 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;Relay.c,10 :: 		}
	GOTO       L_main0
;Relay.c,11 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
