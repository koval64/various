.text
.macro	hex2ascii dest
	mov	%al, %bl
#	and	$0xf0, %al
	shr	$4, %al
	mov	hex(,%eax), %al

	mov	%al, \dest

	and	$0x0f, %bl
	mov	hex(,%ebx), %al

	mov	%al, \dest+1
.endm

.macro	convert	mess
	push	%eax
	push	%ebx
	push	%ecx
	push	%edx

	mov	%cl, %al
	hex2ascii \mess
	shr	$8, %ecx
	mov	%cl, %al
	hex2ascii \mess+2
	shr	$8, %ecx
	mov	%cl, %al
	hex2ascii \mess+4
	shr	$8, %ecx
	mov	%cl, %al
	hex2ascii \mess+6

	pop	%edx
	pop	%ecx
	pop	%ebx
	pop	%eax
.endm

.macro	pattdec	mess
	push	%eax
	push	%ebx
	push	%ecx
	push	%edx

#	mov	$0, %eax
#	mov	$0, %ebx

	mov	%cl, %al
#.macro	hex2ascii
	mov	%al, %bl
	shr	$4, %al
	mov	hex(,%eax), %al

	mov	%al, \mess+4
#.endm
	shr	$8, %ecx
#	mov	%cl, %al
#	hex2ascii \mess+2
	shr	$8, %ecx
	mov	%cl, %al
	hex2ascii \mess+5
	shr	$8, %ecx
	mov	%cl, %al
	hex2ascii \mess+7

	pop	%edx
	pop	%ecx
	pop	%ebx
	pop	%eax
.endm

.data
hex:	.ascii	"0123456789abcdef"
.text
