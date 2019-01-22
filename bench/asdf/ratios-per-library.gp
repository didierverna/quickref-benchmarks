# ASDF log (compile/load) times.

reset

#set logscale y

#set xtics 5
#set mxtics 5
set boxwidth 0.8
set style fill solid 0.5
set tics out
set xtics nomirror
set xlabel "Libraries"
set ylabel "ASDF log (compile/load) times"

plot "ratios.dat" \
     using (column(0)):(log($3/$2)) \
     with boxes lc rgb"green" \
     notitle
