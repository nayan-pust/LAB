void main() {
      int i;
      char arra[]={0x40,0x79,0x24,0x30,0x19,0x12,0x02,0x78,0x00,0x10};       // For Common Anode
      TRISB=0x00;      // PORTB as Output
      portb=0x00;      // Initialize Portb as off  state
      while(1){
                // For Increase Digit
               for(i=0; i<10;i++){
                    portb=arra[i];
                    delay_ms(500);
               }
                // For Decrease Digit
                for(i=9; i>=0;i--){
                    portb=arra[i];
                    delay_ms(500);
               }

           }
}