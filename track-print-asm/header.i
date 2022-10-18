
#	.ascii	"sample name..(22 char)"
#	.word	0		# samplelength
#	.byte	0		# finetune (only lower four bits)
#	.byte	0		# volume
#	.word	0		# repeat start
#	.word	0		# repeat length

.equ	module, .
.equ	title, .
				# song title "main title.........."
.equ	smp01, title+20
.equ	smp02, smp01+30
.equ	smp03, smp02+30
.equ	smp04, smp03+30
.equ	smp05, smp04+30
.equ	smp06, smp05+30
.equ	smp07, smp06+30
.equ	smp08, smp07+30
.equ	smp09, smp08+30
.equ	smp10, smp09+30
.equ	smp11, smp10+30
.equ	smp12, smp11+30
.equ	smp13, smp12+30
.equ	smp14, smp13+30
.equ	smp15, smp14+30
.equ	smp16, smp15+30
.equ	smp17, smp16+30
.equ	smp18, smp17+30
.equ	smp19, smp18+30
.equ	smp20, smp19+30
.equ	smp21, smp20+30
.equ	smp22, smp21+30
.equ	smp23, smp22+30
.equ	smp24, smp23+30
.equ	smp25, smp24+30
.equ	smp26, smp25+30
.equ	smp27, smp26+30
.equ	smp28, smp27+30
.equ	smp29, smp28+30
.equ	smp30, smp29+30
.equ	smp31, smp30+30

.equ	songlength, smp31+30
.equ	useless, songlength+1

.equ	songpositions, useless+1
					# 128 bytes - songpositions
.equ	identifier, songpositions+128
				    	# four bytes "M.K."
.equ	patt00, identifier+4
.equ	patt01, patt00+1024
.equ	patt02, patt01+1024
.equ	patt03, patt02+1024
.equ	patt04, patt03+1024
.equ	patt05, patt04+1024
.equ	patt06, patt05+1024
.equ	patt07, patt06+1024
.equ	patt08, patt07+1024
.equ	patt09, patt08+1024
.equ	patt10, patt09+1024
.equ	patt11, patt10+1024
.equ	patt12, patt11+1024
.equ	patt13, patt12+1024
.equ	patt14, patt13+1024
.equ	patt15, patt14+1024
.equ	patt16, patt15+1024
.equ	patt17, patt16+1024
.equ	patt18, patt17+1024
.equ	patt19, patt18+1024
.equ	patt20, patt19+1024
.equ	patt21, patt20+1024
.equ	patt22, patt21+1024
.equ	patt23, patt22+1024
.equ	patt24, patt23+1024
.equ	patt25, patt24+1024
.equ	patt26, patt25+1024
.equ	patt27, patt26+1024
.equ	patt28, patt27+1024
.equ	patt29, patt28+1024
.equ	patt30, patt29+1024
.equ	patt31, patt30+1024
.equ	patt32, patt31+1024
