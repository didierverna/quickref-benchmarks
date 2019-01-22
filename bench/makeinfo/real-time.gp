# Makeinfo time histogram.
# Values between 0.000 and 100.000.
# Intervals of .25s, that is, 400 intervals.

reset

n=400
min=0.0
max=100.0

width=(max-min)/n
hist(x,width)=width*floor(x/width)+width/2.0

set xrange [min:max]
set logscale y

set xtics 5
set mxtics 5
set boxwidth width*0.8
set style fill solid 0.5
set tics out
set xtics nomirror
set xlabel "HTML generation / Makeinfo run time (seconds)"
set ylabel "Number of libraries per 1/4 seconds intervals"

plot "real-time.dat" \
     using (hist($2,width)):(1.0) \
     smooth freq \
     with boxes lc rgb"green" \
     notitle
