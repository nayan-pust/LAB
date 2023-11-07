// 4 Digit 7 segment LED for COMMON CATHODE
char ArrayCC[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
void main()
{
    int button1=0,button2=0,button3=0,button4=0;
    int i,right,mid,lst,k;
    TRISD=0xff;
    TRISB=0x00;
    TRISC=0x00;
    portb=0x00;
    portd=0x00;
    while(1)
    {

  while(1)
    {
        for(i=1;i<=100;i++)
        {

             right = i / 100;
              mid = (i / 10) % 10;
              lst = i% 10;
             for(k=1;k<=10;k++)
               {
                   portc.f3=0;
                   portb=ArrayCC[lst];
                   delay_ms(3);
                   portc.f3=1;
                   portc.f2=0;
                   portb=ArrayCC[mid];
                   delay_ms(3);
                   portc.f2=1;
                   portc.f1=0;
                   portb=ArrayCC[right];
                   delay_ms(3);
                   portc.f1=1;
               }

          }

     }
}
    }
