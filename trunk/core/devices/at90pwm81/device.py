# Partname:  AT90PWM81
# generated automatically, do not edit
MCUREGS = {
	'PORTB': '&37',
	'DDRB': '&36',
	'PINB': '&35',
	'PORTD': '&43',
	'DDRD': '&42',
	'PIND': '&41',
	'DACH': '&89',
	  'DACH_DACH': '$FF',
	'DACL': '&88',
	  'DACL_DACL': '$FF',
	'DACON': '&118',
	  'DACON_DAATE': '$80',
	  'DACON_DATS': '$70',
	  'DACON_DALA': '$04',
	  'DACON_DAEN': '$01',
	'PORTE': '&46',
	'DDRE': '&45',
	'PINE': '&44',
	'SPCR': '&55',
	  'SPCR_SPIE': '$80',
	  'SPCR_SPE': '$40',
	  'SPCR_DORD': '$20',
	  'SPCR_MSTR': '$10',
	  'SPCR_CPOL': '$08',
	  'SPCR_CPHA': '$04',
	  'SPCR_SPR': '$03',
	'SPSR': '&56',
	  'SPSR_SPIF': '$80',
	  'SPSR_WCOL': '$40',
	  'SPSR_SPI2X': '$01',
	'SPDR': '&86',
	'WDTCSR': '&130',
	  'WDTCSR_WDIF': '$80',
	  'WDTCSR_WDIE': '$40',
	  'WDTCSR_WDP': '$27',
	  'WDTCSR_WDCE': '$10',
	  'WDTCSR_WDE': '$08',
	'EICRA': '&137',
	  'EICRA_ISC2': '$30',
	  'EICRA_ISC1': '$0C',
	  'EICRA_ISC0': '$03',
	'EIMSK': '&65',
	  'EIMSK_INT': '$07',
	'EIFR': '&64',
	  'EIFR_INTF': '$07',
	'ADMUX': '&40',
	  'ADMUX_REFS': '$C0',
	  'ADMUX_ADLAR': '$20',
	  'ADMUX_MUX': '$0F',
	'ADCSRA': '&38',
	  'ADCSRA_ADEN': '$80',
	  'ADCSRA_ADSC': '$40',
	  'ADCSRA_ADATE': '$20',
	  'ADCSRA_ADIF': '$10',
	  'ADCSRA_ADIE': '$08',
	  'ADCSRA_ADPS': '$07',
	'ADC': '&76',
	'ADCSRB': '&39',
	  'ADCSRB_ADHSM': '$80',
	  'ADCSRB_ADNCDIS': '$40',
	  'ADCSRB_ADSSEN': '$10',
	  'ADCSRB_ADTS': '$0F',
	'DIDR0': '&119',
	  'DIDR0_ADC7D': '$80',
	  'DIDR0_ADC6D': '$40',
	  'DIDR0_ADC5D': '$20',
	  'DIDR0_ADC4D': '$10',
	  'DIDR0_ADC3D': '$08',
	  'DIDR0_ADC2D': '$04',
	  'DIDR0_ADC1D': '$02',
	  'DIDR0_ADC0D': '$01',
	'DIDR1': '&120',
	  'DIDR1_ACMP1MD': '$08',
	  'DIDR1_AMP0POSD': '$04',
	  'DIDR1_ADC10D': '$02',
	  'DIDR1_ADC9D': '$01',
	'AMP0CSR': '&121',
	  'AMP0CSR_AMP0EN': '$80',
	  'AMP0CSR_AMP0IS': '$40',
	  'AMP0CSR_AMP0G': '$30',
	  'AMP0CSR_AMP0GS': '$08',
	  'AMP0CSR_AMP0TS': '$03',
	'AC3CON': '&127',
	  'AC3CON_AC3EN': '$80',
	  'AC3CON_AC3IE': '$40',
	  'AC3CON_AC3IS': '$30',
	  'AC3CON_AC3OEA': '$08',
	  'AC3CON_AC3M': '$07',
	'AC1CON': '&125',
	  'AC1CON_AC1EN': '$80',
	  'AC1CON_AC1IE': '$40',
	  'AC1CON_AC1IS': '$30',
	  'AC1CON_AC1M': '$07',
	'AC2CON': '&126',
	  'AC2CON_AC2EN': '$80',
	  'AC2CON_AC2IE': '$40',
	  'AC2CON_AC2IS': '$30',
	  'AC2CON_AC2M': '$07',
	'ACSR': '&32',
	  'ACSR_AC3IF': '$80',
	  'ACSR_AC2IF': '$40',
	  'ACSR_AC1IF': '$20',
	  'ACSR_AC3O': '$08',
	  'ACSR_AC2O': '$04',
	  'ACSR_AC1O': '$02',
	'AC3ECON': '&124',
	  'AC3ECON_AC3OI': '$20',
	  'AC3ECON_AC3OE': '$10',
	  'AC3ECON_AC3H': '$07',
	'AC2ECON': '&123',
	  'AC2ECON_AC2OI': '$20',
	  'AC2ECON_AC2OE': '$10',
	  'AC2ECON_AC2H': '$07',
	'AC1ECON': '&122',
	  'AC1ECON_AC1OI': '$20',
	  'AC1ECON_AC1OE': '$10',
	  'AC1ECON_AC1ICE': '$08',
	  'AC1ECON_AC1H': '$07',
	'SREG': '&95',
	  'SREG_I': '$80',
	  'SREG_T': '$40',
	  'SREG_H': '$20',
	  'SREG_S': '$10',
	  'SREG_V': '$08',
	  'SREG_N': '$04',
	  'SREG_Z': '$02',
	  'SREG_C': '$01',
	'SP': '&93',
	'MCUCR': '&85',
	  'MCUCR_PUD': '$10',
	  'MCUCR_RSTDIS': '$08',
	  'MCUCR_CKRC81': '$04',
	  'MCUCR_IVSEL': '$02',
	  'MCUCR_IVCE': '$01',
	'MCUSR': '&84',
	  'MCUSR_WDRF': '$08',
	  'MCUSR_BORF': '$04',
	  'MCUSR_EXTRF': '$02',
	  'MCUSR_PORF': '$01',
	'OSCCAL': '&136',
	'CLKPR': '&131',
	  'CLKPR_CLKPCE': '$80',
	  'CLKPR_CLKPS': '$0F',
	'SMCR': '&83',
	  'SMCR_SM': '$0E',
	  'SMCR_SE': '$01',
	'GPIOR2': '&59',
	  'GPIOR2_GPIOR': '$FF',
	'GPIOR1': '&58',
	  'GPIOR1_GPIOR': '$FF',
	'GPIOR0': '&57',
	  'GPIOR0_GPIOR07': '$80',
	  'GPIOR0_GPIOR06': '$40',
	  'GPIOR0_GPIOR05': '$20',
	  'GPIOR0_GPIOR04': '$10',
	  'GPIOR0_GPIOR03': '$08',
	  'GPIOR0_GPIOR02': '$04',
	  'GPIOR0_GPIOR01': '$02',
	  'GPIOR0_GPIOR00': '$01',
	'PLLCSR': '&135',
	  'PLLCSR_PLLF': '$3C',
	  'PLLCSR_PLLE': '$02',
	  'PLLCSR_PLOCK': '$01',
	'PRR': '&134',
	  'PRR_PRPSC2': '$80',
	  'PRR_PRPSCR': '$20',
	  'PRR_PRTIM1': '$10',
	  'PRR_PRSPI': '$04',
	  'PRR_PRADC': '$01',
	'CLKCSR': '&132',
	  'CLKCSR_CLKCCE': '$80',
	  'CLKCSR_CLKRDY': '$10',
	  'CLKCSR_CLKC': '$0F',
	'CLKSELR': '&133',
	  'CLKSELR_COUT': '$40',
	  'CLKSELR_CSUT': '$30',
	  'CLKSELR_CKSEL': '$0F',
	'BGCCR': '&129',
	  'BGCCR_BGCC': '$0F',
	'BGCRR': '&128',
	  'BGCRR_BGCR': '$0F',
	'EEAR': '&62',
	'EEDR': '&61',
	'EECR': '&60',
	  'EECR_NVMBSY': '$80',
	  'EECR_EEPAGE': '$40',
	  'EECR_EEPM': '$30',
	  'EECR_EERIE': '$08',
	  'EECR_EEMWE': '$04',
	  'EECR_EEWE': '$02',
	  'EECR_EERE': '$01',
	'PICR0': '&104',
	'PFRC0B': '&99',
	  'PFRC0B_PCAE0B': '$80',
	  'PFRC0B_PISEL0B': '$40',
	  'PFRC0B_PELEV0B': '$20',
	  'PFRC0B_PFLTE0B': '$10',
	  'PFRC0B_PRFM0B': '$0F',
	'PFRC0A': '&98',
	  'PFRC0A_PCAE0A': '$80',
	  'PFRC0A_PISEL0A': '$40',
	  'PFRC0A_PELEV0A': '$20',
	  'PFRC0A_PFLTE0A': '$10',
	  'PFRC0A_PRFM0A': '$0F',
	'PCTL0': '&50',
	  'PCTL0_PPRE0': '$C0',
	  'PCTL0_PBFM0': '$24',
	  'PCTL0_PAOC0B': '$10',
	  'PCTL0_PAOC0A': '$08',
	  'PCTL0_PCCYC0': '$02',
	  'PCTL0_PRUN0': '$01',
	'PCNF0': '&49',
	  'PCNF0_PFIFTY0': '$80',
	  'PCNF0_PALOCK0': '$40',
	  'PCNF0_PLOCK0': '$20',
	  'PCNF0_PMODE0': '$18',
	  'PCNF0_POP0': '$04',
	  'PCNF0_PCLKSEL0': '$02',
	'OCR0RB': '&68',
	'OCR0SB': '&66',
	'OCR0RA': '&74',
	'OCR0SA': '&96',
	'PSOC0': '&106',
	  'PSOC0_PISEL0A1': '$80',
	  'PSOC0_PISEL0B1': '$40',
	  'PSOC0_PSYNC0': '$30',
	  'PSOC0_POEN0B': '$04',
	  'PSOC0_POEN0A': '$01',
	'PIM0': '&47',
	  'PIM0_PEVE0B': '$10',
	  'PIM0_PEVE0A': '$08',
	  'PIM0_PEOEPE0': '$02',
	  'PIM0_PEOPE0': '$01',
	'PIFR0': '&48',
	  'PIFR0_POAC0B': '$80',
	  'PIFR0_POAC0A': '$40',
	  'PIFR0_PEV0B': '$10',
	  'PIFR0_PEV0A': '$08',
	  'PIFR0_PRN0': '$06',
	  'PIFR0_PEOP0': '$01',
	'PICR2H': '&109',
	  'PICR2H_PCST2': '$80',
	  'PICR2H_PICR21': '$0C',
	  'PICR2H_PICR2': '$03',
	'PICR2L': '&108',
	'PFRC2B': '&103',
	  'PFRC2B_PCAE2B': '$80',
	  'PFRC2B_PISEL2B': '$40',
	  'PFRC2B_PELEV2B': '$20',
	  'PFRC2B_PFLTE2B': '$10',
	  'PFRC2B_PRFM2B': '$0F',
	'PFRC2A': '&102',
	  'PFRC2A_PCAE2A': '$80',
	  'PFRC2A_PISEL2A': '$40',
	  'PFRC2A_PELEV2A': '$20',
	  'PFRC2A_PFLTE2A': '$10',
	  'PFRC2A_PRFM2A': '$0F',
	'PCTL2': '&54',
	  'PCTL2_PPRE2': '$C0',
	  'PCTL2_PBFM2': '$20',
	  'PCTL2_PAOC2B': '$10',
	  'PCTL2_PAOC2A': '$08',
	  'PCTL2_PARUN2': '$04',
	  'PCTL2_PCCYC2': '$02',
	  'PCTL2_PRUN2': '$01',
	'PCNF2': '&53',
	  'PCNF2_PFIFTY2': '$80',
	  'PCNF2_PALOCK2': '$40',
	  'PCNF2_PLOCK2': '$20',
	  'PCNF2_PMODE2': '$18',
	  'PCNF2_POP2': '$04',
	  'PCNF2_PCLKSEL2': '$02',
	  'PCNF2_POME2': '$01',
	'PCNFE2': '&112',
	  'PCNFE2_PASDLK2': '$E0',
	  'PCNFE2_PBFM21': '$10',
	  'PCNFE2_PELEV2A1': '$08',
	  'PCNFE2_PELEV2B1': '$04',
	  'PCNFE2_PISEL2A1': '$02',
	  'PCNFE2_PISEL2B1': '$01',
	'OCR2RB': '&72',
	'OCR2SB': '&70',
	'OCR2RA': '&78',
	'OCR2SA': '&100',
	'POM2': '&111',
	  'POM2_POMV2B': '$F0',
	  'POM2_POMV2A': '$0F',
	'PSOC2': '&110',
	  'PSOC2_POS2': '$C0',
	  'PSOC2_PSYNC2': '$30',
	  'PSOC2_POEN2D': '$08',
	  'PSOC2_POEN2B': '$04',
	  'PSOC2_POEN2C': '$02',
	  'PSOC2_POEN2A': '$01',
	'PIM2': '&51',
	  'PIM2_PSEIE2': '$20',
	  'PIM2_PEVE2B': '$10',
	  'PIM2_PEVE2A': '$08',
	  'PIM2_PEOEPE2': '$02',
	  'PIM2_PEOPE2': '$01',
	'PIFR2': '&52',
	  'PIFR2_POAC2B': '$80',
	  'PIFR2_POAC2A': '$40',
	  'PIFR2_PSEI2': '$20',
	  'PIFR2_PEV2B': '$10',
	  'PIFR2_PEV2A': '$08',
	  'PIFR2_PRN2': '$06',
	  'PIFR2_PEOP2': '$01',
	'PASDLY2': '&113',
	'TIMSK1': '&33',
	  'TIMSK1_ICIE1': '$20',
	  'TIMSK1_TOIE1': '$01',
	'TIFR1': '&34',
	  'TIFR1_ICF1': '$20',
	  'TIFR1_TOV1': '$01',
	'TCCR1B': '&138',
	  'TCCR1B_ICNC1': '$80',
	  'TCCR1B_ICES1': '$40',
	  'TCCR1B_WGM13': '$10',
	  'TCCR1B_CS1': '$07',
	'TCNT1': '&90',
	'ICR1': '&140',
	'SPMCSR': '&87',
	  'SPMCSR_SPMIE': '$80',
	  'SPMCSR_RWWSB': '$40',
	  'SPMCSR_SIGRD': '$20',
	  'SPMCSR_RWWSRE': '$10',
	  'SPMCSR_BLBSET': '$08',
	  'SPMCSR_PGWRT': '$04',
	  'SPMCSR_PGERS': '$02',
	  'SPMCSR_SPMEN': '$01',
	'PSC2_CAPTAddr': '1',
	'PSC2_ECAddr': '2',
	'PSC2_EECAddr': '3',
	'PSC0_CAPTAddr': '4',
	'PSC0_ECAddr': '5',
	'PSC0_EECAddr': '6',
	'ANALOG_COMP_1Addr': '7',
	'ANALOG_COMP_2Addr': '8',
	'ANALOG_COMP_3Addr': '9',
	'INT0Addr': '10',
	'TIMER1_CAPTAddr': '11',
	'TIMER1_OVFAddr': '12',
	'ADCAddr': '13',
	'INT1Addr': '14',
	'SPI__STCAddr': '15',
	'INT2Addr': '16',
	'WDTAddr': '17',
	'EE_READYAddr': '18',
	'SPM_READYAddr': '19'
}