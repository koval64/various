STRIP=strip -R .note -R .comment
LD=ld
RM=rm -f
AS=as
PRG=track

all: $(PRG) del

$(PRG): $(PRG).as
	${AS} $(PRG).as -o $(PRG).o --32
	${LD} $(PRG).o -o $(PRG) -m elf_i386

clean:
	${RM} *~ $(PRG) *.o core

del:
	${RM} *.o
