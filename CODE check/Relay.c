void main() {
    TRISB = 0x00;        // PortB as Output
    portb = 0x00;        // Initialize Portb as Off
    while(1)
    {
        portb.f1=1;
        delay_ms(2000);
        portb.f1=0;
        delay_ms(2000);
    }
}