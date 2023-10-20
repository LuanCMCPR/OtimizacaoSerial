#!/usr/bin/gnuplot -c

#Uso: Gnuplot -c plotarGrafico.gp <arquivo1> <arquivo2> <metrica> <nome> <unidade eixo y>

# variáveis para comparar não otimizado com otimizado
arqSemOtz = ARG1
arqComOtz = ARG2
metrica = ARG3
nome = ARG4
unidade = ARG5

print "O valor do argumento é:", arqSemOtz
print "O valor do argumento é:", arqComOtz
print "O valor do argumento é:", metrica
print "O valor do argumento é:", nome

# Configurações do gráfico
set terminal pngcairo enhanced font "arial,10" size 800,600
set output nome

# Títulos e rótulos
set title metrica
set xlabel "pontos"
set ylabel unidade

plot arqSemOtz using 1:2 with linespoints title "sem otimizacao", \
     arqComOtz using 1:2 with linespoints title "com otimizacao"

# plot arqSemOtz using 1:2:3 with linespoints title "sem otimizacao", \
#  arqComOtz using 1:3:3 with linespoints title "com otimizacao"

