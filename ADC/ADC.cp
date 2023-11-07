#line 1 "E:/3-1/Computer Architechture & Microcontroller/Lab/code/ADC/ADC.c"
int valADC;
char x[4];
void main()
{
 UART1_Init(9600);
 ADC_Init();

 valADC=ADC_Read(0);
 IntToStr(valADC,x);
 UART1_Write_Text("Analog value : ");
 UART1_Write_Text(x);





}
