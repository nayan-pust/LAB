void main()
{
    short duty=0;                    // Initial value for duty
    TRISD=0xff;                      // PortD set as Input
    TRISB=0x00;                      // PortB set as Output
    // Run motor in anticlock wise
    portb.f0=0xff;                   // Initialize portb.f0 as on
    portb.f1=0x00;                   // Initialize portb.f1 as off

    PWM1_Init(1000);                 // Initialize PWM
    PWM1_Start();                    // Start PWM
    PWM1_Set_Duty(duty);             // Set current Duty for PWM

    while(1)
    {
      if(RD0_bit && duty<250)         // if button RD0 pressed
      {
        Delay_ms(100);
        if(RD0_bit && duty<250)
        {
          duty=duty+10;              // Increment duty
          PWM1_Set_Duty(duty);       // change the duty cycle
        }
      }
      if(RD1_bit && duty>0)         // if button RD1 pressed
      {
        Delay_ms(100);
        if(RD1_bit && duty>0)
        {
          duty=duty-10;              // Decrement duty
          PWM1_Set_Duty(duty);
        }
      }
      Delay_ms(10);
    }
}