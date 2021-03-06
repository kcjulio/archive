;/////////////////////////////////////////////////////////////////////////////////
;// Code Generator: BoostC Compiler - http://www.sourceboost.com
;// Version       : 6.95
;// License Type  : Lite License (Unregistered)
;// Limitations   : PIC12,PIC16 max code size:2048 words, max RAM banks:2, Non commercial use only
;/////////////////////////////////////////////////////////////////////////////////

	include "P16F870.inc"
; Heap block 0, size:86 (0x00000029 - 0x0000007E)
__HEAP_BLOCK0_BANK               EQU	0x00000000
__HEAP_BLOCK0_START_OFFSET       EQU	0x00000029
__HEAP_BLOCK0_END_OFFSET         EQU	0x0000007E
; Heap block 1, size:32 (0x000000A0 - 0x000000BF)
__HEAP_BLOCK1_BANK               EQU	0x00000001
__HEAP_BLOCK1_START_OFFSET       EQU	0x00000020
__HEAP_BLOCK1_END_OFFSET         EQU	0x0000003F
; Heap block 2, size:0 (0x00000000 - 0x00000000)
__HEAP_BLOCK2_BANK               EQU	0x00000000
__HEAP_BLOCK2_START_OFFSET       EQU	0x00000000
__HEAP_BLOCK2_END_OFFSET         EQU	0x00000000
; Heap block 3, size:0 (0x00000000 - 0x00000000)
__HEAP_BLOCK3_BANK               EQU	0x00000000
__HEAP_BLOCK3_START_OFFSET       EQU	0x00000000
__HEAP_BLOCK3_END_OFFSET         EQU	0x00000000
gbl_status                       EQU	0x00000003 ; bytes:1
gbl_indf                         EQU	0x00000000 ; bytes:1
gbl_tmr0                         EQU	0x00000001 ; bytes:1
gbl_pcl                          EQU	0x00000002 ; bytes:1
gbl_fsr                          EQU	0x00000004 ; bytes:1
gbl_porta                        EQU	0x00000005 ; bytes:1
gbl_portb                        EQU	0x00000006 ; bytes:1
gbl_portc                        EQU	0x00000007 ; bytes:1
gbl_pclath                       EQU	0x0000000A ; bytes:1
gbl_intcon                       EQU	0x0000000B ; bytes:1
gbl_pir1                         EQU	0x0000000C ; bytes:1
gbl_pir2                         EQU	0x0000000D ; bytes:1
gbl_tmr1l                        EQU	0x0000000E ; bytes:1
gbl_tmr1h                        EQU	0x0000000F ; bytes:1
gbl_t1con                        EQU	0x00000010 ; bytes:1
gbl_tmr2                         EQU	0x00000011 ; bytes:1
gbl_t2con                        EQU	0x00000012 ; bytes:1
gbl_ccpr1l                       EQU	0x00000015 ; bytes:1
gbl_ccpr1h                       EQU	0x00000016 ; bytes:1
gbl_ccp1con                      EQU	0x00000017 ; bytes:1
gbl_rcsta                        EQU	0x00000018 ; bytes:1
gbl_txreg                        EQU	0x00000019 ; bytes:1
gbl_rcreg                        EQU	0x0000001A ; bytes:1
gbl_adresh                       EQU	0x0000001E ; bytes:1
gbl_adcon0                       EQU	0x0000001F ; bytes:1
gbl_option_reg                   EQU	0x00000081 ; bytes:1
gbl_trisa                        EQU	0x00000085 ; bytes:1
gbl_trisb                        EQU	0x00000086 ; bytes:1
gbl_trisc                        EQU	0x00000087 ; bytes:1
gbl_pie1                         EQU	0x0000008C ; bytes:1
gbl_pie2                         EQU	0x0000008D ; bytes:1
gbl_pcon                         EQU	0x0000008E ; bytes:1
gbl_pr2                          EQU	0x00000092 ; bytes:1
gbl_txsta                        EQU	0x00000098 ; bytes:1
gbl_spbrg                        EQU	0x00000099 ; bytes:1
gbl_adresl                       EQU	0x0000009E ; bytes:1
gbl_adcon1                       EQU	0x0000009F ; bytes:1
gbl_eedata                       EQU	0x0000010C ; bytes:1
gbl_eeadr                        EQU	0x0000010D ; bytes:1
gbl_eedath                       EQU	0x0000010E ; bytes:1
gbl_eeadrh                       EQU	0x0000010F ; bytes:1
gbl_eecon1                       EQU	0x0000018C ; bytes:1
gbl_eecon2                       EQU	0x0000018D ; bytes:1
gbl_contador                     EQU	0x00000023 ; bytes:1
gbl_segundo                      EQU	0x00000024 ; bytes:1
gbl_effect                       EQU	0x00000025 ; bytes:1
CompTempVar579                   EQU	0x00000026 ; bytes:1
CompTempVar580                   EQU	0x00000027 ; bytes:1
delay_ms_00000_arg_del           EQU	0x00000028 ; bytes:1
Int1Context                      EQU	0x0000007F ; bytes:1
Int1BContext                     EQU	0x00000020 ; bytes:3
	ORG 0x00000000
	GOTO	_startup
	ORG 0x00000004
	MOVWF Int1Context
	SWAPF STATUS, W
	BCF STATUS, RP0
	BCF STATUS, RP1
	MOVWF Int1BContext
	SWAPF PCLATH, W
	MOVWF Int1BContext+D'1'
	SWAPF FSR, W
	MOVWF Int1BContext+D'2'
	BCF PCLATH,3
	BCF PCLATH,4
	GOTO	interrupt
	ORG 0x00000010
delay_ms_00000
; { delay_ms ; function begin
	MOVF delay_ms_00000_arg_del, F
	BTFSS STATUS,Z
	GOTO	label1
	RETURN
label1
	MOVLW 0xF9
label2
	ADDLW 0xFF
	BTFSS STATUS,Z
	GOTO	label2
	NOP
	DECFSZ delay_ms_00000_arg_del, F
	GOTO	label1
	RETURN
; } delay_ms function end

	ORG 0x0000001C
effect_00000
; { effect ; function begin
	MOVLW 0x01
	BCF STATUS, RP0
	BCF STATUS, RP1
	ANDWF gbl_portb, W
	MOVWF CompTempVar579
	DECF CompTempVar579, W
	BTFSS STATUS,Z
	GOTO	label3
	MOVLW 0x0A
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	INCF gbl_effect, F
label3
	MOVLW 0x01
	ANDWF gbl_portb, W
	MOVWF CompTempVar580
	DECF CompTempVar580, W
	BTFSC STATUS,Z
	GOTO	label3
	RETURN
; } effect function end

	ORG 0x0000002F
main
; { main ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	CLRF gbl_trisa
	MOVLW 0x01
	MOVWF gbl_trisb
	BCF STATUS, RP0
	CLRF gbl_effect
	MOVLW 0x85
	BSF STATUS, RP0
	MOVWF gbl_option_reg
	MOVLW 0x83
	BCF STATUS, RP0
	MOVWF gbl_tmr0
	BSF gbl_intcon,5
	BSF gbl_intcon,7
label4
	CALL effect_00000
	GOTO	label4
; } main function end

	ORG 0x00000040
_startup
	BCF PCLATH,3
	BCF PCLATH,4
	GOTO	main
	ORG 0x00000043
interrupt
; { interrupt ; function begin
	BTFSS gbl_intcon,2
	GOTO	label7
	MOVLW 0x83
	BCF STATUS, RP0
	BCF STATUS, RP1
	MOVWF gbl_tmr0
	INCF gbl_contador, F
	MOVF gbl_contador, W
	XORLW 0x7D
	BTFSS STATUS,Z
	GOTO	label6
	INCF gbl_segundo, F
	MOVF gbl_segundo, W
	XORLW 0x02
	BTFSC STATUS,Z
	CLRF gbl_segundo
label6
	BCF gbl_intcon,2
label7
	BCF STATUS, RP0
	BCF STATUS, RP1
	SWAPF Int1BContext+D'2', W
	MOVWF FSR
	SWAPF Int1BContext+D'1', W
	MOVWF PCLATH
	SWAPF Int1BContext, W
	MOVWF STATUS
	SWAPF Int1Context, F
	SWAPF Int1Context, W
	RETFIE
; } interrupt function end

	END
