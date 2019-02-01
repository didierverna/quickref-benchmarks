# ASDF load real time per library.

reset

set logscale y

#set xtics 5
#set mxtics 5
set xrange [0:1690]
set boxwidth 0.8
set style fill solid 0.5
set tics out
set xtics nomirror
set xlabel "Libraries"
set ylabel "ASDF load real time (seconds)"

plot "timings.dat" \
     using (column(0)):($2) \
     with boxes lc rgb"green" \
     notitle
