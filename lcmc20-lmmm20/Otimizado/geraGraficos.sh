#!/bin/bash

# Lista de arquivos

METRICAS="FLOPS_DP ENERGY L2CACHE L3"


ARQMULTMAT=("multmatMatL3.dat" "multmatMatL2CACHE.dat" "multmatMatENERGY.dat" "multmatMatFLOPS_DP.dat")
ARQMULTVET=("multmatVetL3.dat" "multmatVetL2CACHE.dat" "multmatVetENERGY.dat" "multmatVetFLOPS_DP.dat") 
ARQMULTMAT_OTZ=("multmatMatOTZL3.dat" "multmatMatOTZL2CACHE.dat" "multmatMatOTZENERGY.dat" "multmatMatOTZFLOPS_DP.dat")
ARQMUTVET_OTZ=("multmatVetOTZL3.dat" "multmatVetOTZL2CACHE.dat" "multmatVetOTZENERGY.dat" "multmatVetOTZFLOPS_DP.dat") 


OUTPUT_DIR="Graficos"
mkdir -p $OUTPUT_DIR


# Iteração sobre os pares de arquivos
for K in $METRICAS 
do
	for((i=0; i<${#ARQMULTMAT[@]}; i++))
	do
    
    # NOME1=$(echo ${ARQMULTMAT[i]} | awk -F'.' '{print $1}')
    NOME1="COMPARACAO_MAT_$K"
    ARQ_OTZ1=${ARQMULTMAT_OTZ[i]}
    # NOME2=$(echo ${ARQMULTVET[i]} | awk -F'.' '{print $1}')
    NOME2="COMPARACAO_VET_$K"
    ARQ_OTZ2=${ARQMULTVET_OTZ[i]}

    # Execute o script Gnuplot para o par de arquivos
    gnuplot -c plotarGrafico.gp ${ARQMULTMAT[i]} ${ARQMULTMAT_OTZ[i]} $K $NOME1.png
    gnuplot -c plotarGrafico.gp ${ARQMULTVET[i]} ${ARQMULTMAT_OTZ[i]} $K $NOME2.png
	done
done

mv *.png $OUTPUT_DIR