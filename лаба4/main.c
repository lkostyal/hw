#define F_CPU 16000000UL // Директива установки частоты процессора
#include <avr/io.h>
#include <util/delay.h>
// Библиотека для работы с портами ввода-вывода
// Библиотека для работы с паузой
/*-----------------------------------------------------------------------------
Функция чтения конкретного канала АЦП
aADCPort - канал АЦП [0-7]
Возвращает числовое значение
-----------------------------------------------------------------------------*/
uint8_t read_adc(uint8_t aADCPort)
{
	uint8_t valADMUX = ADMUX;
	valADMUX &= ~((1 << MUX5) | (1 << MUX4) | (1 << MUX3) | (1 << MUX2) | (1 << MUX1) | (1 << MUX0));
	// Выбор конретного вывода АЦП
	switch (aADCPort)
	{
	case 0: valADMUX |= (0 << MUX5) | (0 << MUX4) | (0 << MUX3) | (0 << MUX2) | (0 << MUX1) | (0 << MUX0); break;
	case 1: valADMUX |= (0 << MUX5) | (0 << MUX4) | (0 << MUX3) | (0 << MUX2) | (0 << MUX1) | (0 << MUX0); break;
	case 2: valADMUX |= (0 << MUX5) | (0 << MUX4) | (0 << MUX3) | (0 << MUX2) | (0 << MUX1) | (0 << MUX0); break;
	case 3: valADMUX |= (0 << MUX5) | (0 << MUX4) | (0 << MUX3) | (0 << MUX2) | (0 << MUX1) | (0 << MUX0); break;
	case 4: valADMUX |= (0 << MUX5) | (0 << MUX4) | (0 << MUX3) | (0 << MUX2) | (0 << MUX1) | (0 << MUX0); break;
	case 5: valADMUX |= (0 << MUX5) | (0 << MUX4) | (0 << MUX3) | (0 << MUX2) | (0 << MUX1) | (0 << MUX0); break;	
	case 6: valADMUX |= (0 << MUX5) | (0 << MUX4) | (0 << MUX3) | (0 << MUX2) | (0 << MUX1) | (0 << MUX0); break;
	case 7: valADMUX |= (0 << MUX5) | (0 << MUX4) | (0 << MUX3) | (0 << MUX2) | (0 << MUX1) | (0 << MUX0); break;
	}

	ADMUX = valADMUX;
	uint16_t v = 0;
	for (uint8_t id = 0; id < (1 << 4); ++id)
	{
		ADCSRA |= (1<<ADSC); // Старт измерений
		while (ADCSRA & (1<<ADSC)); // Ожидание окончания измерений
		v += (uint16_t)ADC;
	}
	return (uint8_t)(v >> 4); // Результат
}


int main ()
{
	// Настройка вывода управления светодиодом
	DDRE |= (1 << PE3); // Настройка вывода PB6 на выход
	PORTE &= ~(1 << PE3); // Выключен на старте МК
	
	DDRE |= (1 << PE2); // Настройка вывода PB6 на выход
	PORTE &= ~(1 << PE2); // Выключен на старте МК
	
	
	// Инициализация аналого-цифрового преобразователя
	ADMUX = (0 << REFS1) | (1 << REFS0) //1.8v AVDD - Опорное напряжение
	| (0 << ADLAR); // Store 8-bit in ADCH	
	ADCSRA = (1 << ADEN) // Активация АЦП
	| (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0); //Делитель 1/128
	while (ADCSRB & (1 << REFOK)); // wait for Internal ION
	
	// Главный цикл работы МК
	while (1)
	{
		uint8_t val_adc = read_adc(0); // Чтение сигнала, поступающего на вывод АЦП
		if (val_adc < 60)
		{
			PORTE |= (1 << PE3);
			PORTE |= (1 << PE2);
			
		} else
		{
			PORTE &= ~(1 << PE3);
			PORTE &= ~(1 << PE2);
		}
		_delay_ms(10); // Делаем не большую паузу между изменениями
	}
}
