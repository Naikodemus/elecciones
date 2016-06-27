# script para el estudio de las elecciones
# fuente principal de los datos:
# https://es.wikipedia.org/wiki/Anexo:Elecciones_en_Espa%C3%B1a

set title "Parlamento"
set border 1

set rmargin at screen 0.975

set key right
set grid back lc rgb 'gray' dt 5
set yrange [0:100]

set xdata time
timeformat = "%Y-%m"
set format x "%Y-%m"
T(N) = timecolumn(N,timeformat)

set xtics scale 0.75,0.25 nomirror
set mxtics 6
set ytics 10 scale 0.75,0.25 nomirror
set mytics 2

set style fill transparent solid 0.25 noborder

set style line 1 lw 5.0 lc rgb 'gray' dt 2 pt 5 ps 1.25
set style line 2 lw 1.5 lc rgb 'green' dt 1 pt 5 ps 1.25
set style line 3 lw 1.5 lc rgb 'red' dt 1 pt 5 ps 1.25
set style line 4 lw 1.5 lc rgb 'brown' dt 1 pt 5 ps 1.25
set style line 5 lw 1.5 lc rgb 'blue' dt 1 pt 5 ps 1.25
set style line 6 lw 1.5 lc rgb '#228B22' dt 1 pt 5 ps 1.25
set style line 7 lw 1.5 lc rgb '#4B0082' dt 1 pt 5 ps 1.25
set style line 8 lw 1.5 lc rgb 'orange' dt 1 pt 5 ps 1.25

set style line 10 lw 5.0 lc rgb '#778899' dt 2 pt 5 ps 1.25
set style line 11 lw 5.0 lc rgb '#778899' dt 2 pt 10 ps 1.25

set style arrow 1 heads size screen 0.0075, 90 lw 1.5 lc rgb '#C0C0C0' dt 1

set termoption enhanced
save_encoding = GPVAL_ENCODING
set encoding utf8

set terminal postscript eps size 10.0,5.0 enhanced color background rgb 'white'
set output "elecciones.eps"

# # # #

plot \
     './evolucion.dat' using (T(1)) : ($4/$2)*100 with impulses ls 1 title "", \
     './evolucion.dat' using (T(1)) : ($4/$2)*100 with lines ls 1 title " % VOTOS/POB", \
     './evolucion.dat' using (T(1)) : ($2) smooth csplines ls 10 title "POBLACIÓN (en mill.)", \
     './evolucion.dat' using (T(1)) : ($5/$2)*100 with lines ls 2 title "UCD/CDS", \
     './evolucion.dat' using (T(1)) : ($5/$2)*100 with points ls 2 title "", \
     './evolucion.dat' using (T(1)) : ($6/$2)*100 with lines ls 3 title "PSOE", \
     './evolucion.dat' using (T(1)) : ($6/$2)*100 with points ls 3 title "", \
     './evolucion.dat' using (T(1)) : ($7/$2)*100 with lines ls 4 title "PCE", \
     './evolucion.dat' using (T(1)) : ($7/$2)*100 with points ls 4 title "", \
     './evolucion.dat' using (T(1)) : ($8/$2)*100 with lines ls 5 title "AP/PP", \
     './evolucion.dat' using (T(1)) : ($8/$2)*100 with points ls 5 title "", \
     './evolucion.dat' using (T(1)) : ($9/$2)*100 with lines ls 6 title "IU/UP", \
     './evolucion.dat' using (T(1)) : ($9/$2)*100 with points ls 6 title "", \
     './evolucion.dat' using (T(1)) : ($10/$2)*100 with lines ls 7 title "PODEMOS", \
     './evolucion.dat' using (T(1)) : ($10/$2)*100 with points ls 7 title "", \
     './evolucion.dat' using (T(1)) : ($11/$2)*100 with lines ls 8 title "CIUDADANOS", \
     './evolucion.dat' using (T(1)) : ($11/$2)*100 with points ls 8 title "", \
     './presidentes.dat' using (T(1)) : (70) : (T(2))-(T(1)) : (0.0) with vector as 1 title "", \
     './presidentes.dat' using (T(1)) : (70) : 3 with labels left offset 0.75,-0.75 tc rgb '#999999' rotate by 0 title "", \
     './presidentes.dat' using (T(1)) : (70) : 4 with labels left offset 1.0,0.5 tc rgb '#999999' rotate by 45 title "", \
     './eventos.dat' using (T(1)) : (70) with points ls 11 title "", \
     './eventos.dat' using (T(1)) : (70) : 2 with labels right offset 0.0,-1.25 tc rgb '#778899' rotate by 90 title ""