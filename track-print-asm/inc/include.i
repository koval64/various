
.equ SYS_EXIT,	1
.equ SYS_FORK,	2
.equ SYS_READ,	3
.equ SYS_WRITE,	4
.equ SYS_OPEN,	5
.equ SYS_BRK,	45
.equ SYS_IOCTL,	54
.equ SYS_FCNTL,	55
.equ SYS_MMAP,	90

.equ TCGETS,	0x5401
.equ TCSETSW,	0x5403

.equ O_RDONLY,	0
.equ O_WRONLY,	1
.equ O_RDWR,	2
.equ O_ACCMODE,	3

.equ STDIN,	0
.equ STDOUT,	1
.equ STDERR,	2

.macro Syscall
	int $0x80
.endm

.macro  Sys4 name arg1 arg2 arg3
	movl	\name, %eax
	movl	\arg1, %ebx
	movl	\arg2, %ecx
	movl	\arg3, %edx
	Syscall
.endm

.macro	IOctl filehandle function addres
	Sys4	$SYS_IOCTL \filehandle \function \addres
.endm

.macro Read filehandle dest_addres buffer_size
	Sys4	$SYS_READ \filehandle \dest_addres \buffer_size
.endm

.macro Write filehandle source_addres data_size
	Sys4	$SYS_WRITE \filehandle \source_addres \data_size
.endm

.macro Print message length
	Write	$STDOUT \message \length
.endm

.macro GetTerm
	push	%ebp
	mov	%esp,%ebp
	lea	-60(%ebp),%edx
	IOctl	$0, $TCGETS, %edx
.endm

.macro SetTerm
	leal	-60(%ebp), %edx
	IOctl	$0, $TCSETSW, %edx
	pop	%ebp
.endm

.macro Open file mode filehandle
	movl	$SYS_OPEN, %eax
	movl	\file, %ebx
	movl	\mode, %ecx
	Syscall
	mov	%eax, \filehandle
.endm

.macro Exit status
	movl	$SYS_EXIT, %eax
	movl	\status, %ebx
	Syscall
.endm

.macro	ErrJmp jump
	test	%eax, %eax
	js	\jump
.endm
