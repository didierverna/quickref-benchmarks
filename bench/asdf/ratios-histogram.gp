# ASDF load/compile time ratio histogram.
# Values between 0.00 and 190.
# Intervals of 1/2, that is, 380 intervals.

reset

n=380
min=0.00
max=190

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
set xlabel "ASDF load/compile time ratio"
set ylabel "Number of libraries per 1/2 range"

plot "ratios.dat" \
     using (hist($2/$3,width)):(1.0) \
     smooth freq \
     with boxes lc rgb"green" \
     notitle
