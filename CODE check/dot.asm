
_offState:

;dot.c,9 :: 		void offState(){
;dot.c,10 :: 		portc=0x00;    // Initialize PortC  as off state
	CLRF       PORTC+0
;dot.c,11 :: 		portd=0x00;    // Initialize PortD  as off state
	CLRF       PORTD+0
;dot.c,12 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_offState0:
	DECFSZ     R13+0, 1
	GOTO       L_offState0
	DECFSZ     R12+0, 1
	GOTO       L_offState0
	DECFSZ     R11+0, 1
	GOTO       L_offState0
	NOP
	NOP
;dot.c,13 :: 		}
L_end_offState:
	RETURN
; end of _offState

_main:

;dot.c,15 :: 		void main()
;dot.c,18 :: 		TRISC=0x00;  // PortC set as Output
	CLRF       TRISC+0
;dot.c,19 :: 		TRISD=0x00;  // PortD set as Output
	CLRF       TRISD+0
;dot.c,20 :: 		TRISB.F0=0xff;
	BSF        TRISB+0, 0
;dot.c,21 :: 		while(1)
L_main1:
;dot.c,23 :: 		if(portb.f0==0x00)
	BTFSC      PORTB+0, 0
	GOTO       L_main3
;dot.c,25 :: 		offState(); //Function Call
	CALL       _offState+0
;dot.c,28 :: 		for(i=1;i<=100;i++){
	MOVLW      1
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_main4:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVF       _i+0, 0
	SUBLW      100
L__main13:
	BTFSS      STATUS+0, 0
	GOTO       L_main5
;dot.c,29 :: 		for(j=0;j<8;j++){
	CLRF       _j+0
	CLRF       _j+1
L_main7:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      8
	SUBWF      _j+0, 0
L__main14:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;dot.c,30 :: 		PORTD=col_data[j];   // Column Data
	MOVF       _j+0, 0
	ADDLW      _col_data+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;dot.c,31 :: 		PORTC=row_dataA[j];  // Row Data
	MOVF       _j+0, 0
	ADDLW      _row_dataA+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;dot.c,32 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	NOP
	NOP
;dot.c,29 :: 		for(j=0;j<8;j++){
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;dot.c,33 :: 		}
	GOTO       L_main7
L_main8:
;dot.c,28 :: 		for(i=1;i<=100;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;dot.c,34 :: 		}
	GOTO       L_main4
L_main5:
;dot.c,36 :: 		}
L_main3:
;dot.c,39 :: 		}
	GOTO       L_main1
;dot.c,40 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
