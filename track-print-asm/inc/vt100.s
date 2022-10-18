
.macro vt100_colour fx col
	movb \col, %al
	movb %al, vt100_colour+5
	movb \fx, %al
	movb %al, vt100_colour+2
	print $vt100_colour,$7
.endm

.macro vt100_position x1 x2 y1 y2
	movb	\y1, %al
	movb	\y2, %ah
#	add	$0x30, %ax
	movw	%ax, y
	movb	\x1, %al
	movb	\x2, %ah
#	add	$0x30, %ax
	movw	%ax, x
	call vt100_pos
.endm

vt100_clr:
	print $vt100_clear,$4
	ret

vt100_pos:
	print $vt100_position,$8
	ret

.data

vt100_clear:
	.byte	0x1b
	.ascii	"[2J"

vt100_position:
	.byte	0x1b
	.ascii	"["
y:	.ascii	"00"
	.ascii	";"
x:	.ascii	"00"
	.ascii	"H"

vt100_colour:
	.byte	0x1b
	.ascii	"[0;32m"
