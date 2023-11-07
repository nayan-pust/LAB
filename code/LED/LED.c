void main() {
       TRISB = 0X00;      //PortB as Output
       PORTB = 0X00;      //Initialize  PortB as off state
        while(1){
          portb.f0 = 0xff;     //On
          delay_ms(200);
          portb.f0 = 0x00;     //off
          portb.f1 = 0xff;     //On
          delay_ms(200);
          portb.f1 = 0x00;     //off
          portb.f2 = 0xff;     //On
          delay_ms(200);
          portb.f2 = 0x00;     //off
        }
}