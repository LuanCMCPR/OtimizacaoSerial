#   Luan Carlos Maia Cruz - GRR20203891
#   Leonardo Marin Mendes Martin - GRR20205675

EX1="matmult"
EX2="matmultOtimizado"
DIR1="semOtimizacao"
DIR2="Otimizado"

all:
	@echo "Compilando..."
	@make -sBC $(DIR1)
	@make -sBC $(DIR2)
	@cp "$(DIR1)/$(EX1)" .
	@cp "$(DIR2)/$(EX2)" .
	@echo "Pronto!"

markers:
	@echo "Compilando com marcadores..."
	@make CFLAGS="-I$LIKWID_INCLUDE -DLIKWID_PERFMON" -sBC $(DIR1)
	@make CFLAGS="-I$LIKWID_INCLUDE -DLIKWID_PERFMON" -sBC $(DIR2)
	@cp "$(DIR1)/$(EX1)" .
	@cp "$(DIR2)/$(EX2)" .
	@echo "Pronto!"

clean:
	@echo "Limpando sujeira..."
	@make clean -sC $(DIR1)
	@make clean -sC $(DIR2)
	rm -f *.sh *.gp

purge: clean
	@echo "Faxina..."
	@make purge -sC $(DIR1)
	@make purge -sC $(DIR2)
	@rm -f $(EX1) $(EX2) *.sh *.gp

comparaTodas:
	@cp Scripts/comparaTodas.sh .
	@chmod u+x comparaTodas.sh

compara:
	@cp Scripts/compara.sh .
	@chmod u+x compara.sh

gerarGrafico:
	@cp Scripts/geraGraficos.sh .
	@cp Scripts/plotarGrafico.gp .
	@chmod u+x plotarGrafico.gp
	@chmod u+x geraGraficos.sh

diff:
	@cp Scripts/testarDiff.sh .
	@chmod u+x testarDiff.sh