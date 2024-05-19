# Makefile
.PHONY: run clean

CFLAGS= -g -O2

run: fibbonacci
	./$<

fibbonacci: fibbonacci.o fun.o
	$(CC) $(CFLAGS) -o $@ $?

%.o : %.c
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -rf *.o *~ fibbonacci
asm:
	gcc -S fibbonacci.s fibbonacci.c -O2

