
_main:

;fourdigitsev.c,3 :: 		void main()
;fourdigitsev.c,5 :: 		int button1=0,button2=0,button3=0,button4=0;
;fourdigitsev.c,7 :: 		TRISD=0xff;
	MOVLW      255
	MOVWF      TRISD+0
;fourdigitsev.c,8 :: 		TRISB=0x00;
	CLRF       TRISB+0
;fourdigitsev.c,9 :: 		TRISC=0x00;
	CLRF       TRISC+0
;fourdigitsev.c,10 :: 		portb=0x00;
	CLRF       PORTB+0
;fourdigitsev.c,11 :: 		portd=0x00;
	CLRF       PORTD+0
;fourdigitsev.c,15 :: 		while(1)
L_main2:
;fourdigitsev.c,17 :: 		for(i=1;i<=100;i++)
	MOVLW      1
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
L_main4:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVF       main_i_L0+0, 0
	SUBLW      100
L__main14:
	BTFSS      STATUS+0, 0
	GOTO       L_main5
;fourdigitsev.c,20 :: 		right = i / 100;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      main_right_L0+0
	MOVF       R0+1, 0
	MOVWF      main_right_L0+1
;fourdigitsev.c,21 :: 		mid = (i / 10) % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      main_mid_L0+0
	MOVF       R0+1, 0
	MOVWF      main_mid_L0+1
;fourdigitsev.c,22 :: 		lst = i% 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      main_lst_L0+0
	MOVF       R0+1, 0
	MOVWF      main_lst_L0+1
;fourdigitsev.c,23 :: 		for(k=1;k<=10;k++)
	MOVLW      1
	MOVWF      main_k_L0+0
	MOVLW      0
	MOVWF      main_k_L0+1
L_main7:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_k_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVF       main_k_L0+0, 0
	SUBLW      10
L__main15:
	BTFSS      STATUS+0, 0
	GOTO       L_main8
;fourdigitsev.c,25 :: 		portc.f3=0;
	BCF        PORTC+0, 3
;fourdigitsev.c,26 :: 		portb=ArrayCC[lst];
	MOVF       main_lst_L0+0, 0
	ADDLW      _ArrayCC+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;fourdigitsev.c,27 :: 		delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	NOP
	NOP
;fourdigitsev.c,28 :: 		portc.f3=1;
	BSF        PORTC+0, 3
;fourdigitsev.c,29 :: 		portc.f2=0;
	BCF        PORTC+0, 2
;fourdigitsev.c,30 :: 		portb=ArrayCC[mid];
	MOVF       main_mid_L0+0, 0
	ADDLW      _ArrayCC+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;fourdigitsev.c,31 :: 		delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	NOP
	NOP
;fourdigitsev.c,32 :: 		portc.f2=1;
	BSF        PORTC+0, 2
;fourdigitsev.c,33 :: 		portc.f1=0;
	BCF        PORTC+0, 1
;fourdigitsev.c,34 :: 		portb=ArrayCC[right];
	MOVF       main_right_L0+0, 0
	ADDLW      _ArrayCC+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;fourdigitsev.c,35 :: 		delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	NOP
	NOP
;fourdigitsev.c,36 :: 		portc.f1=1;
	BSF        PORTC+0, 1
;fourdigitsev.c,23 :: 		for(k=1;k<=10;k++)
	INCF       main_k_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_k_L0+1, 1
;fourdigitsev.c,37 :: 		}
	GOTO       L_main7
L_main8:
;fourdigitsev.c,17 :: 		for(i=1;i<=100;i++)
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;fourdigitsev.c,39 :: 		}
	GOTO       L_main4
L_main5:
;fourdigitsev.c,41 :: 		}
	GOTO       L_main2
;fourdigitsev.c,43 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
