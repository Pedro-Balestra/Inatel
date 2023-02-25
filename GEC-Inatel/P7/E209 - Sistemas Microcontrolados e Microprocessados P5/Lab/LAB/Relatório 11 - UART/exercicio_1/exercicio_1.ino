#include <stdio.h>
#include <stdlib.h>

#define FOSC 16000000U // Clock Speed
#define BAUD 9600 // velocidade de comunicao
#define MYUBRR FOSC / 16 / BAUD - 1
#define botao (1 << PD2)

char msg_tx[20];
char msg_rx[32];
int pos_msg_rx = 0;
int tamanho_msg_rx = 1;
unsigned int x = 0, valor = 0;

//Prototipos das funcoes
void UART_Init(unsigned int ubrr);
void UART_Transmit(char *dados);

int main(void)
{
  UART_Init(MYUBRR); // inicializa a comunicacao serial
  EICRA |= (1 << ISC01); //Configura interrupcao por transição de subida e descida
  EIMSK |= (1 << INT0); // Configura uso do INT0
  sei(); // habilita a interrupcao 
  PORTD |= botao; // pullup

  x = 0;
  UART_Transmit("Aperte o botao:\n");
  
  
  // Super-loop
  while (1) {

    UART_Transmit("Digite 'z':\n");
    if (msg_rx[0] == 'z')
    {
      x = 0;
    }
  }
}


ISR(USART_RX_vect)
{
  // Escreve o valor recebido pela UART na posição pos_msg_rx do buffer msg_rx
  msg_rx[pos_msg_rx++] = UDR0;
  if (pos_msg_rx == tamanho_msg_rx)
    pos_msg_rx = 0;
}

ISR(INT0_vect)
{
      // Se sim, envia mensagem
      //UART_Transmit("Hello World!\n");
      x++;
      UART_Transmit("num vezes botao press: ");
      itoa(x, msg_tx, 10);
      UART_Transmit(msg_tx);
      UART_Transmit("\n");
      _delay_ms(500); // Aguarda um tempo para evitar o bounce
}


void UART_Transmit(char *dados)
{
  // Envia todos os caracteres do buffer dados ate chegar um final de linha
  while (*dados != 0)
  {
    while (!(UCSR0A & (1 << UDRE0))); // Aguarda a transmissão acabar
    // Escreve o caractere no registro de tranmissão
    UDR0 = *dados;
    // Passa para o próximo caractere do buffer dados
    dados++;
  }
}


void UART_Init(unsigned int ubrr)
{
  // Configura a baud rate 
  UBRR0H = (unsigned char)(ubrr >> 8);
  UBRR0L = (unsigned char)ubrr;
  // Habilita a recepcao, tranmissao e interrupcao na recepcao 
  UCSR0B = (1 << RXEN0) | (1 << TXEN0) | (1 << RXCIE0);
  // Configura o formato da mensagem: 8 bits de dados e 1 bits de stop 
  UCSR0C = (1 << UCSZ01) | (1 << UCSZ00);
}
