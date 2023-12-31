#!/bin/bash

EX1="matmult"
EX2="matmultOtimizado"
D1="semOtimizacao"
D2="Otimizado"
CORE=3

#Uso: ./testarDiff.sh

PONTOS="64 100 128 200 256 512 600 900 1024 2000 2048 3000 4000"


make -BC $D1
cp "$D1/$EX1" ./

make -BC $D2
cp "$D2/$EX2" ./

echo "performance" > /sys/devices/system/cpu/cpufreq/policy${CORE}/scaling_governor

for i in ${PONTOS}
do
    echo "Testando $i"
    "./$EX1" $i >> res1.txt
    "./$EX2" $i >> res2.txt
done

echo "powersave" > /sys/devices/system/cpu/cpufreq/policy${CORE}/scaling_governor

diff res1.txt res2.txt
rm  ers1.txt res2.txt