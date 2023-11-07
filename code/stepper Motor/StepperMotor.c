 void main()
 {
    CMCON=0x07;    // To turn off comparetor
    ADCON1=0x06;   // To turn off analog to digital converter
    TRISB=0;
    portb=0x0F;
    
    //code for wave drive
//    while(1)
//    {
//    portb=0b00000001;
//     Delay_ms(500);
//     portb=0b00000010;
//     Delay_ms(500);
//     portb=0b00000100;
//     Delay_ms(500);
//     portb=0b00001000;
//     Delay_ms(500);
//    }
   
    //code for Half drive
    while(1)                // Differece between 45 degree
    {
     portb=0b00000001;
     Delay_ms(500);
     portb=0b00000011;
     Delay_ms(500);
     portb=0b00000010;
     Delay_ms(500);
     portb=0b00000110;
     Delay_ms(500);
     portb=0b00000100;
     Delay_ms(500);
     portb=0b00001100;
     Delay_ms(500);
     portb=0b00001000;
     Delay_ms(500);
     portb=0b00001001;
     Delay_ms(500);
    }

//code for Full drive

//    while(1)
//    {
//     portb=0b00000011;        // 90 degree
//     Delay_ms(500);
//     portb=0b00000110;        // 0 degree
//     Delay_ms(500);
//     portb=0b00001100;        // -90 degree
//     Delay_ms(500);
//     portb=0b00001001;        // 180 degree
//     Delay_ms(500);
//    }
 }