#define F_CPU 16000000UL //частота процессора
#include <avr/interrupt.h>
#include <avr/io.h>
#include <util/delay.h>

//volatile uint8_t counter = 0; // Счетчик секунд

int counter = 0;
uint8_t btn_click_counter = 0; // Счетчик нажатий
uint8_t btn_ticks_counter = 0; // Счетчик тиков удержания кнопки
int step = 58000;

ISR(TIMER1_OVF_vect)

{
	
	TCNT1 = step; //выставляем начальное значение TCNT1
	
	if((PINE & (1 << (counter - 1)))) {
		PORTE= 0;
	}
		PORTE |= (1 << counter);	
	
	if (counter == 4) {
		counter = 0;
	} else
		{
			counter++;
		}
	
}


int main ()
{
	//SREG &= ~(1 << 7);
	// Настройка вывода управления светодиодом
	DDRE |= (1 << PE0); // Настройка вывода PB6 на выход
	//PORTE &= ~(1 << PE0); // Выключен на старте МК
	DDRE |= (1 << PE1); // Настройка вывода PB6 на выход
	//PORTE &= ~(1 << PE1); // Выключен на старте МК
	DDRE |= (1 << PE2); // Настройка вывода PB6 на выход
	//PORTE &= ~(1 << PE2); // Выключен на старте МК
	DDRE |= (1 << PE3); // Настройка вывода PB6 на выход
	//PORTE &= ~(1 << PE3); // Выключен на старте МК
	DDRE |= (1 << PE4); // Настройка вывода PB6 на выход
	//PORTE &= ~(1 << PE4); // Выключен на старте МК
	//DDRE |= (1 << PE5); // Настройка вывода PB6 на выход
	DDRE &= ~(1 << PE5); // Выключен на старте МК
	DDRE |= (1 << PE6); // Настройка вывода PB6 на выход
	//PORTE &= ~(1 << PE6); // Выключен на старте МК
	DDRE |= (1 << PE7); // Настройка вывода PB6 на выход
	//PORTE &= ~(1 << PE7); // Выключен на старте МК
	
	// Настройка таймера
	//TCCR1A = 0;
	TCCR1B = (0 << CS12) | (1 << CS11) | (1 << CS10); // Делитель 1024
	//OCR1A = 0x3D09; // 15625 — 1 секунда
	 
	TIMSK1 |= (1 << TOIE1); // разрешаем прерывание по переполнению таймера
	//TCNT1 = 64455; // Обнуление счетчика
	sei();
	//SREG |= (1 << 7);
while (1) {
	
	if (step == 65000) {
		step = 58000;
	}
	
			
	if ((PINE & (1 << PE5)) != 0)
		{
			_delay_ms(10);
			// Короткая пауза для стабилизации
			if (btn_ticks_counter == 0)
			{
				btn_click_counter++; // Увеличиваем на 1 счетчик нажатий
			}
			// Увеличиваем счетчик тиков, пока он не станет равен 10
			if (btn_ticks_counter < 10)
			{
				btn_ticks_counter++; // Увеличиваем на 1 счетчик тиков
			}
		} else
		{
			btn_ticks_counter = 0; // Обнуление счетчика тиков
		}
		
		// Определение количества нажатий
		if (btn_click_counter == 1)
		{ 
			// Выполнение действия, если нажали 2 раза
			// Например: включение напряжения на выводе PE0
			step += 1000;
			btn_click_counter = 0;
			
		} 
		
	}
	
	//TCNT1 = 64455 - btnCounter * 5000; 	
	
		//~ if (counter == 1)
		//~ {
		//~ PORTE |= (1 << PE0);
		//~ _delay_ms(500);
		//~ PORTE |= (1 << PE1);
		//~ _delay_ms(500);
		//~ PORTE |= (1 << PE2);
		//~ _delay_ms(500);
		//~ } else if (counter == 2)
		//~ {
		//~ PORTE &= ~(1 << PE0);
		//~ PORTE &= ~(1 << PE1);
		//~ PORTE &= ~(1 << PE2);
		//~ counter = 0;
		//~ }
		
	return 0;
}

//~ ISR(TIMER1_COMPA_vect)
//~ {
	//~ counter++;
	//~ TCNT1 = 0;
//~ }



//~ ISR(TIMER1_OVF_vect)
//~ {
	//~ counter++;
	//~ TCNT1 = 0;
//~ }
	// ISR(TIMER1_OVF_vect) avr atmega128
	// http://mainloop.ru/avr-atmega/avr-timer-counter.html
	//~ https://narodstream.ru/avr-urok-10-tajmery-schetchiki-preryvaniya/
