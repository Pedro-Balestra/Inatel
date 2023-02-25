//Definindo variaves 
#define led_vermelho (1 << PD7)
#define led_verde (1 << PD5)
#define botao_transmissao (1 << PD2)
#define botao_reset (1 << PD3)

//Definindo valores iniciais de TX e RX
int tx = 0b000001111;
int rx = 0b00000000;

//Verificando se foi feita uma transmissão
ISR(INT0_vect){
  //Se sim acenderemos o led Verde
  if(tx & 0b00000001){

    PORTD |= led_verde;
    _delay_ms(200);
    PORTD &= ~led_verde;
    
    tx >>= 1;
    rx <<= 1;
    rx |= 1;
  }

  //Se não acenderemos o led vermelho
  else{

    PORTD |= led_vermelho;
    _delay_ms(200);
    PORTD &= ~led_vermelho;

    tx >>= 1;
  }
}

//Quando o Botão de reset for acionado o TX tera seu valor alterado para 0b01010101
ISR(INT1_vect){

  tx = 0b01010101;
  
}


//Main
int main() {
  
  DDRD |= (1 << PD7) | (1 << PD5); // Configura os pinos PD4 e PD5 como saída
  PORTD |= (1 << PD2) | (1 << PD3); // Habilita resistor interno nos pinos de entrada (PD2 e PD3)
  EICRA |= (1 << ISC01); // Configura interrupcao por transicao de descida 
  EICRA |= (1 << ISC11); // Configura interrupcao por transicao de descida
  EIMSK |= (1 << INT0) | (1 << INT1); // Habilitando INT0 e INT1
  sei(); // Habilita interrupcao global

  while(1){
    
  }
}
