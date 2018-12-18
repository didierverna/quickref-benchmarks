# Declt / Makeinfo ratios

reset

set style fill solid 0.5
set tics out
set xtics nomirror
set xlabel "Libraries"
set ylabel "Ratio Declt / Makeinfo"

plot "real-time.dat" using (column(0)):($2/$3) with boxes lc rgb"green" notitle
