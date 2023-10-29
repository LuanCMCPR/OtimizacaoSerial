#   Luan Carlos Maia Cruz - GRR20203891
#   Leonardo Marin Mendes Martin - GRR20205675

OBJS=matriz.o matmult.o
OUT=matmult
CC=gcc
# LIKWID_INCLUDE = /usr/local/include/ # Máquina Pessoal
# LIKWID_LIB = /usr/local/lib/ # Máquina Pessoal
LIKWID_INCLUDE = /home/soft/likwid/include # Máquina DINF
LIKWID_LIB = /home/soft/likwid/lib # Máquina DINF
FLAGS = -Wall -std=gnu99 -O3 -mavx2 -march=native
CFLAGS = -I$(LIKWID_INCLUDE) #-DLIKWID_PERFMON # Opção caso queira usar os marcadores do likwid
LFLAGS = -L$(LIKWID_LIB) -llikwid
FILES = *.c *.h *.sh LEIAME* Makefile 
DIR = lcmc20-lmmm20

all: matmult

matmult: $(OBJS)
	$(CC) $(FLAGS) $(CFLAGS) $(OBJS) -o $(OUT) $(LFLAGS) -lm

matriz.o: matriz.c matriz.h
	$(CC) $(FLAGS) -c matriz.c

matmult.o: matmult.c
	$(CC) $(FLAGS) $(CFLAGS) -c matmult.c

# Remove arquivos objeto, temporários e executável
clean:
	rm -f matmult *.o *~

purge: clean
	rm -f $(OUT) $(DISTDIR).tar.gz

# Gera um arquivo compactado com os arquivos necessários para execução do programa
compact:
	@echo "Compactando arquivos..."
	tar -czvf $(DIR).tar.gz $(addprefix ../$(DIR)/, $(FILES))

# Ativa flags de debug
debug: FLAGS += -DDEBUG -D_DEBUG_
debug: all

# Ativa flag de debug que mostra o resultado da operação
results: FLAGS += -DDEBUG
results: all