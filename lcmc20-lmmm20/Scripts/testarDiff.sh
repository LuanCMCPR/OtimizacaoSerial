#!/bin/bash

PONTOS="64 100 128 200 " #256 512 600 900 1024 2000 2048 3000 4000"
for i in ${PONTOS}
do
    echo "Testando $i"
    ./semOtimizacao/matmult $i>> res1.txt
    ./Otimizado/matmultOtimizado $i >> res2.txt

    diff res1.txt res2.txt

done