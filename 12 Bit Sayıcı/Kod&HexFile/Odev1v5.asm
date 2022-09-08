;KODLAMA SABLONU

	list		p=16f877A	; hangi pic
	#include	<p16f877A.inc>	; SFR register 'lar?n tan?mland??? kutuphane
	
	__CONFIG H'3F31'

; WDT, ossilat�r gibi register ayarlar?

	
;KULLANILACAK DEGISKENLER

GECIKME1	EQU	0x20    ;GEC?KME 1. DONGU
GECIKME2	EQU	0x21    ;GECIKME 2. DONGU
GECIKME3	EQU	0x22    ;GECIKME 3.DONGU


	ORG     0x000             	; Baslama vektoru

	nop			  			  	; ICD ozelliginin aktif edilmesi icin gereken bekleme 
  	goto    BASLA              	; baslama etiketine gir

	
;**********************************************************************************************
	ORG     0x004             	; kesme vektoru


GECIKME				; (herbir komut 4mhz de 1mikrosn) = 1 sn GEC?KME (yakla??k)
	MOVLW	0x0F
	MOVWF	GECIKME1	; Bu gecikme degiskeni eger daha uzun s�reler laz?m olursa kullan?lacak bu ornekte 1 kez yeterli 
	MOVLW	0xAF
	MOVWF	GECIKME2
	MOVLW	0x01
	MOVWF	GECIKME3
DONGU1
	DECFSZ	GECIKME1,1
	GOTO	$+2
	DECFSZ	GECIKME2,1
	GOTO	$+2
	DECFSZ	GECIKME3,1
	GOTO	DONGU1
	RETURN
	
PORTA_AYARLA
	MOVLW	B'00000000'
	MOVWF	PORTA
	BANKSEL	TRISA
	MOVLW	0x06
	MOVWF	ADCON1
	MOVLW	B'00110000'
	MOVWF	TRISA
	BANKSEL	PORTA
	RETURN
	
PORTB_AYARLA
	MOVLW	B'00000000'
	MOVWF	PORTB
	BANKSEL	TRISB
	CLRF	TRISB
	BANKSEL	PORTB
	RETURN
	
BASLA
	CALL	PORTA_AYARLA
	CALL	PORTB_AYARLA
	CALL	KONTROL
	
KONTROL
	BTFSC	PORTA,4
	CALL	ARTIS
	BTFSC	PORTA,5
	CALL	AZALMA
	GOTO	KONTROL

	
ARTIS
	CALL	ARTIS_KONTROLU
	RETURN
	
ARTIS_KONTROLU
	BTFSS	PORTA,0
	GOTO	PORTA0
	BTFSS	PORTA,1
	GOTO	PORTA0
	BTFSS	PORTA,2
	GOTO	PORTA0
	BTFSS	PORTA,3
	GOTO	PORTA0
	GOTO	PORTA1
	
PORTA0
	INCFSZ	PORTB,1
	GOTO	B_ARTIS
	GOTO	A_ARTIS
	
PORTA1
	INCFSZ	PORTB,1
	GOTO	B_ARTIS
	GOTO	SON_ARTIS
	
B_ARTIS
	CALL	GECIKME
	RETURN
	
A_ARTIS
	INCF	PORTA,1
	CALL	GECIKME
	RETURN
	
SON_ARTIS
	CLRF	PORTA
	CALL	GECIKME
	RETURN
	
	
	
AZALMA
	CALL	KONTROL_SIFIR
	RETURN
	
KONTROL_SIFIR
	BTFSC	PORTA,0
	GOTO	KONTROL_B_SIFIR
	BTFSC	PORTA,1
	GOTO	KONTROL_B_SIFIR
	BTFSC	PORTA,2
	GOTO	KONTROL_B_SIFIR
	BTFSC	PORTA,3
	GOTO	KONTROL_B_SIFIR
	INCF	PORTB,1
	DECFSZ	PORTB,1
	GOTO	B_AZALMA
	MOVLW	0xFF
	MOVWF	PORTA
	MOVWF	PORTB
	CALL	GECIKME
	RETURN
	
KONTROL_B_SIFIR
	INCF	PORTB,1
	DECFSZ	PORTB,1
	GOTO	B_AZALMA
	GOTO	A_AZALMA
	
	

B_AZALMA
	DECF	PORTB,1
	CALL	GECIKME
	RETURN
	
A_AZALMA
	DECF	PORTA,1
	COMF	PORTB,1
	CALL	GECIKME
	RETURN
	
	

	END                       ; Program sonu


