#!/usr/bin/gnuplot -c

# variáveis para comparar não otimizado com otimizado
# arquivo1 = ARG1
# arquivo2 = ARG2
# nome1 = system(sprintf("echo %s | cut -d. -f1", arquivo1))
# nome2 = system(sprintf("echo %s | cut -d. -f1", arquivo2))
# metrica = ARG3
# output_file = ARG4

# variáveis para gerar gráfico de não otimizado ou de otimizado
arquivo = ARG1
nome = system(sprintf("echo %s | cut -d. -f1", arquivo))
metrica = ARG2
output_file = ARG3

# Configurações do gráfico
set terminal pngcairo enhanced font "arial,10" size 800,600
set output output_file

# Configurações do estilo de linhas
set style line 1 lc rgb '#0060ad' lt 1 lw 2 pt 7 ps 1.5   # blue
set style line 2 lc rgb '#dd181f' lt 1 lw 2 pt 5 ps 1.5   # red

# Títulos e rótulos
# set title sprintf("Comparação entre %s e %s", arquivo1, arquivo2)
set title nome
#set xlabel pontos
set ylabel metrica

# Plote os dados
#plot arquivo1 using 1:2 with points ls 1 title  arquivo1, \
#     arquivo2 using 1:2 with points ls 2 title  arquivo2

#
# ALTERNATIVA 1: Tabelas em arquivos separados (2 colunas)
#
#set terminal qt 0 title "<campo[marcador 1]>"
 plot arquivo using 1:2 with linespoints title nome
# with linespoints, \
# arquivo2 title arquivo2 with linespoints
