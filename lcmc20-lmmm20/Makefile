#   Luan Carlos Maia Cruz - GRR20203891
#   Leonardo Marin Mendes Martin - GRR20205675

EX1="matmult"
EX2="matmultOtimizado"
DIR1="semOtimizacao"
DIR2="Otimizado"
SCRIPTS="compara.sh comparaTodas.sh gerarGrafico.sh perfctr_pontos" 

all:
	@echo "Compilando..."
	@make -sBC $(DIR1)
	@make -sBC $(DIR2)
	@cp "$(DIR1)/$(EX1)" .
	@cp "$(DIR2)/$(EX2)" .
	@echo "Pronto!"

clean:
	@echo "Limpando sujeira..."
	@make clean -sC $(DIR1)
	@make clean -sC $(DIR2)

purge: clean
	@echo "Faxina..."
	@make purge -sC $(DIR1)
	@make purge -sC $(DIR2)
	@rm -f $(EX1) $(EX2) $(SCRIPTS)

comparaTodas:
	@cp Scripts/comparaTodas.sh .
	@chmod u+x comparaTodas.s

compara:
	@cp Scripts/compara.sh .
	@chmod u+x compara.sh