// Na interrupção PCINT0
ISR(PCINT2_vect)
{
    PORTD |= 0b10000000;
    _delay_ms(1000);
    PORTD &= ~(0b10000000);
}

// Na interrupção PCINT2
ISR(PCINT0_vect)
{
    PORTB |= 0b00000010;
    _delay_ms(2000);
    PORTB &= ~(0b00000010);
    
}

int main(void)
{
    // Configura GPIO
    DDRD |= 0b11101111;  // Pinos do PD em entrada
    PORTD |= 0b00010000; // PULL-UP nos pinos de entrada

    DDRB |= 0b11111110;
    PORTB |= 0b00000001;

    // Habilita interrupção no grupo PCINT2 e PCINT0
    PCICR |= 0b00000101;

    // Habilita PCINT no pino PD4 -> PCINT20
    PCMSK2 |= 0b00010000;
    PCMSK0 |= 0b00000001;

    // Habilita Interrupções globais
    sei();

    for (;;)
    {
        
    }
}
