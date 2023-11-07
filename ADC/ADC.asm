
_main:

;ADC.c,3 :: 		void main()
;ADC.c,5 :: 		UART1_Init(9600);     //Initialize UART
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;ADC.c,6 :: 		ADC_Init();           //Initialize ADC
	CALL       _ADC_Init+0
;ADC.c,8 :: 		valADC=ADC_Read(0);    // Read ADC value in RA0
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _valADC+0
	MOVF       R0+1, 0
	MOVWF      _valADC+1
;ADC.c,9 :: 		IntToStr(valADC,x);    // Convert into string/char array
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _x+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;ADC.c,10 :: 		UART1_Write_Text("Analog value : ");  //Print
	MOVLW      ?lstr1_ADC+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;ADC.c,11 :: 		UART1_Write_Text(x);  // X = (1024*x)/5
	MOVLW      _x+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;ADC.c,17 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
