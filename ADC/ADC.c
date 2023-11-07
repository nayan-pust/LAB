int valADC;         //Create a variable that will hold the ADC value
char x[4];         // Crate a char array
void main()
{
     UART1_Init(9600);     //Initialize UART
     ADC_Init();           //Initialize ADC
     //while(1){
     valADC=ADC_Read(0);    // Read ADC value in RA0
     IntToStr(valADC,x);    // Convert into string/char array
     UART1_Write_Text("Analog value : ");  //Print
     UART1_Write_Text(x);  // X = (1024*x)/5
     //strcpy(x,"");
     //UART1_Write(13);   //For new Line
     // Delay_ms(1000);
     //}

}