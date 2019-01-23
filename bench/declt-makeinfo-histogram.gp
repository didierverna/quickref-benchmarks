# Declt/Makeinfo ratio histogram.
# Values between 0.00 and 31.
# Intervals of 1/10, that is, 310 intervals.

reset

n=310
min=0.00
max=31.0

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
set xlabel "Declt/Makeinfo time ratios"
set ylabel "Number of libraries per 1/10 range"

plot "declt-makeinfo.dat" \
     using (hist($2/$3,width)):(1.0) \
     smooth freq \
     with boxes lc rgb"green" \
     notitle
