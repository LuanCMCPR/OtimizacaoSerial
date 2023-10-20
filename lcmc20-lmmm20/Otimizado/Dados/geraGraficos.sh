#!/bin/bash

# Uso: ./geraGraficos.sh <diretorio_de_entrada_nao_otimizado > <diretorio_de_entrada_otimizado > <diretorio_de_saida>

# Testa se possui argumentos
if [ $# -lt 2 ]
then
    echo "Modo de Uso: ./geraGraficos.sh <diretorio_de_entrada> <diretorio_de_saida>"
    exit 1
fi

# Diretório de entrada e saída
IN_NOT_OPT=$1
IN_OPT=$2
OUTPUT_DIR=$3
mkdir -p $OUTPUT_DIR

# Metrica e Unidades
METRICAS=("L3" "L2CACHE" "ENERGY" "FLOPS DP")
UNIDADES=("Mbytes/s" "Miss ratio" "Joules" "Mflops/s")
TAM=4

# Arquivos de entrada
ARQMULTMAT=("$IN_NOT_OPT/multmatMatL3.dat" "$IN_NOT_OPT/multmatMatL2CACHE.dat" "$IN_NOT_OPT/multmatMatENERGY.dat" "$IN_NOT_OPT/multmatMatFLOPS_DP.dat")
ARQMULTVET=("$IN_NOT_OPT/multmatVetL3.dat" "$IN_NOT_OPT/multmatVetL2CACHE.dat" "$IN_NOT_OPT/multmatVetENERGY.dat" "$IN_NOT_OPT/multmatVetFLOPS_DP.dat") 
ARQMULTMAT_OTZ=("$IN_OPT/multmatMatOTZL3.dat" "$IN_OPT/multmatMatOTZL2CACHE.dat" "$IN_OPT/multmatMatOTZENERGY.dat" "$IN_OPT/multmatMatOTZFLOPS_DP.dat")
ARQMULTVET_OTZ=("$IN_OPT/multmatVetOTZL3.dat" "$IN_OPT/multmatVetOTZL2CACHE.dat" "$IN_OPT/multmatVetOTZENERGY.dat" "$IN_OPT/multmatVetOTZFLOPS_DP.dat") 

# Iteração sobre os pares de arquivos 
for ((i=0; i < ${TAM}; i++))
do
    K=${METRICAS[i]}
    U=${UNIDADES[i]}
    NOME1="COMPARACAO-MAT-${K}"
    NOME2="COMPARACAO-VET-${K}"

    # Executa o script Gnuplot para o par de arquivos
    gnuplot -c plotarGrafico.gp "${ARQMULTMAT[i]}" "${ARQMULTMAT_OTZ[i]}" "MATRIZ X MATRIZ - $K" "$NOME1.png" "$U"
    gnuplot -c plotarGrafico.gp "${ARQMULTVET[i]}" "${ARQMULTVET_OTZ[i]}" "MATRIZ X VETOR - $K" "$NOME2.png" "$U"
done    

mv *.png $OUTPUT_DIR
