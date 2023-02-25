// Na interrupção PCINT0
ISR(PCINT0_vect)
{
    /* CÓDIGO QUE VAI RODAR
    NA INTERRUPÇÃO DO PCINT0 */
}

// Na interrupção PCINT1
ISR(PCINT1_vect)
{
    /* CÓDIGO QUE VAI RODAR
    NA INTERRUPÇÃO DO PCINT1 */
}

// Na interrupção PCINT2
ISR(PCINT2_vect)
{
    /* CÓDIGO QUE VAI RODAR
    NA INTERRUPÇÃO DO PCINT2 */
}

int main(void)
{

    // Habilita interrupção no grupo PCINT2
    PCICR |= 0b00000100;

    // Habilita PCINT no pino PD4 -> PCINT20
    PCMSK2 |= 0b00010000;

    // Habilita Interrupções globais
    sei();

    for (;;)
    {
        /* CÓDIGO QUE VAI RODAR
        SEMPRE / SUPER-LOOP  */
    }
}

// -> EXEMPLO UTILIZANDO MULTIPLOS PINOS NO MESMO PORTAL


// Na interrupção PCINT2
ISR(PCINT2_vect)
{
    if (PIND & 0b00010000)
    {
        // VAI RODAR AO ACIONAR PD4
    }
    else if (PIND & 0b01000000)
    {
        // VAI RODAR AO ACIONAR PD6
    }
}

int main(void)
{
    // Configura GPIO
    DDRD |= 0b10000000;  // Pinos do PD em entrada
    PORTD |= 0b01010000; // PULL-UP nos pinos de entrada

    DDRB |= 0b00000010;

    // Habilita interrupção no grupo PCINT2
    PCICR |= 0b00000100;

    // Habilita PCINT no pino PD4 e PD6 -> PCINT20 e PCINT22
    PCMSK2 |= 0b01010000;

    // Habilita Interrupções globais
    sei();

    for (;;)
    {
        /* CÓDIGO QUE VAI RODAR
        SEMPRE / SUPER-LOOP  */
    }
}