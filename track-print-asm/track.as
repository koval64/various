.include "inc/include.i"
.include "inc/convert.i"

.macro	NextLine
	Write	$STDOUT $next_line $1
.endm

.text
    .align	4
.globl _start
_start:
	cld

#	push	%ebp
	mov	%esp, %ebp
	mov	$SYS_BRK, %eax
	xor	%ebx, %ebx
	Syscall
	add	$5000000,%eax
	mov	%eax, %ebx
	mov	$SYS_BRK, %eax
	Syscall			# Get some memory

	Open	$modfile, $O_RDONLY, %ebx
	ErrJmp	error_quit
	Read	%ebx, $module, $132156
	ErrJmp	error_quit

#****** Decode title & samples ******

	Print	$title $20
	NextLine

	mov	$smp01, %eax
	mov	%eax, licznik
drukuj:
	Write	$STDOUT licznik $22
	NextLine

	addl	$30, licznik
	cmpl	$smp31+30, licznik
	jne	drukuj

	Print	$identifier $4
	NextLine

#****** Decode pattern ******

	mov	$0, %edx
decode:	mov	patt01(,%edx), %ecx
	PattDec	pattern_line
	add	$4, %edx

	mov	patt01(,%edx), %ecx
	PattDec	pattern_line+16
	add	$4, %edx

	mov	patt01(,%edx), %ecx
	PattDec	pattern_line+32
	add	$4, %edx

	mov	patt01(,%edx), %ecx
	PattDec	pattern_line+48
	add	$4, %edx

	push	%edx
	push	%ecx
	push	%ebx
	push	%eax
	Print	$pattern_line, $65
	pop	%eax
	pop	%ebx
	pop	%ecx
	pop	%edx

	cmp	$1024, %edx
	jne	decode

#****** Exit ******
	Exit	$0
error_quit:
	Exit	$1

.data
licznik:	.long	0
pattern_line:
 .ascii	"--- -----  ||   --- -----  ||   --- -----  ||   --- -----  ||   \n"
next_line:
 .asciz	"\n"
modfile:
	.asciz	"data/mod1.mod"

.include "header.i"
