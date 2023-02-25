/**
 * @file    algoritmoBase_Aula14.c
 * @author  Diego Anestor Coutinho
 * @date    Mai 2022
 *
 * O algoritmo base irÃ¡ auxiliÃ¡-lo na resoluÃ§Ã£o do(s) exercÃ­cio(s).
 * EM CASO DE DÃšVIDA PROCURE POR UM MONITOR, FAREMOS O MELHOR PARA LHE AJUDAR.
 */
#define led (1 << PD3) //Controla o PWM do led
#define botao_controle_pwm (1 << PD5) //Botão para controlar o PWM do led
#define botao_sensor_cheio (1 << PD2) //Botão para indicar que o sensor cheio está ativo
#define botao_sensor_vazio (1 << PD6) //Botão para indicar que o sensor vazio está ativo

int potencia_enchimento = 0;

// Variáveis para entrada e saída
char RX_buffer[32];
char RX_index = 0;

// Buffer para estado anterior do RX
char old_rx_hs[32];

// A inicializaçã£o do UART consiste em definir a taxa de transmissÃ£o,
// definir o formato de quadro, e ativar o Transmissor ou o receptor.

// Função de configuração do UART
void UART_init(int baud)
{
    // Calcula a taxa de transmissÃ£o
    int MYUBRR = 16000000 / 16 / baud - 1;

    // Definindo a taxa de transmissÃ£o
    UBRR0H = (unsigned char)(MYUBRR >> 8);
    UBRR0L = (unsigned char)(MYUBRR);

    // Definindo o formato de quadro, 8 bits e 1 stop bit
    UCSR0C = (0 << USBS0) | (1 << UCSZ00) | (1 << UCSZ01);

    // Ativa o Transmissor, receptor e define a interrupção
    UCSR0B = (1 << RXEN0) | (1 << TXEN0) | (1 << RXCIE0);
}

// Função para envio de dados via UART
void UART_send(char *TX_buffer)
{
    // Enquanto tiver caracteres para enviar
    while (*TX_buffer != 0)
    {
        // Prepara o buffer para o envio
        UDR0 = *TX_buffer;

        // Espera o envio ser completado
        while (!(UCSR0A & (1 << UDRE0))){};

        // Avança o ponteiro do buffer
        TX_buffer++;
    }
}

// Limpa o buffer de entrada e saída
void limpa_RX_buffer(void)
{
    unsigned char dummy;

    // Enquanto houver dados no buffer
    while (UCSR0A & (1 << RXC0))
    {
        // Lê o dado
        dummy = UDR0;
    }

    // Reseta o índice
    RX_index = 0;

    // Limpa todos os dados do buffer
    for (int i = 0; i < 32; i++)
    {
        old_rx_hs[i] = RX_buffer[i];
        RX_buffer[i] = 0;
    }
}

// Função ISR que salva um array de dados recebidos via UART
ISR(USART_RX_vect)
{
    // Salva o dado recebido
    RX_buffer[RX_index] = UDR0;
    RX_buffer[RX_index +1] = 0;

    // Adiciona mais 1 na contagem
    RX_index++;
 
}

ISR(INT0_vect)
{
    if(!(PIND & botao_controle_pwm)){

       potencia_enchimento += 10;

       if(potencia_enchimento > 255){
          UART_send("Potência Maxima\n");
       }
    }
    
}
int main()
{   // Configura modo FAST PWM e modo do comparador A
    TCCR0A |= (1 << WGM01) | (1 << WGM00) | (1 << COM0A1);
    TCCR0B = 1; // Seleciona opção para frequência
    EICRA |= (1 << ISC01); // Configura interrupcao por transicao de descida e subida (gerando interrupção)
    EIMSK |= (1 << INT0); // Configura uso do INT0
    
    DDRD |= botao_controle_pwm | botao_sensor_cheio | botao_sensor_vazio;
    PORTD |= botao_controle_pwm | botao_sensor_cheio | botao_sensor_vazio;
    
    // Configuração do UART
    UART_init(9600);

    // Habilitando a interrupção
    sei();

    // Super Loop
    while (1)
    {
       if (RX_buffer[0] == 'L') 
      {
        UART_send("Sistema Ligado\n");
        // Envia o dado recebido
        UART_send(RX_buffer);
        UART_send("\n");
        potencia_enchimento *= (255 * 0.1);

        if(!(PIND & botao_sensor_cheio)){

          PORTD &= ~led;
        }

        if(!(PIND & botao_sensor_vazio)){

          PORTD |= led;
          OCR0A = potencia_enchimento;
          _delay_ms(500);
        }
      }

      if (RX_buffer[0] == 'D') 
      {
        UART_send("Sistema Desligado\n");
        // Envia o dado recebido
        UART_send(RX_buffer);
        UART_send("\n");
        PORTD &= ~led;
        _delay_ms(500);
      }

        // Delay de 1s
        _delay_ms(1000);

        // Envia o dado recebido
        UART_send(RX_buffer);
        UART_send("\n");

        // Limpa o buffer
        limpa_RX_buffer();

        // Delay de 1s
        _delay_ms(1000);
    }
}
