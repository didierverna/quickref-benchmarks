# Declt real time histogram.
# Values between 0 and 320.
# Intervals of .5s, that is, 640 intervals.

reset

n=640
min=0.0
max=320.0

width=(max-min)/n
hist(x,width)=width*floor(x/width)+width/2.0

set xrange [min:max]
set yrange [0:*]
set logscale y
set logscale x

set mxtics 5
set boxwidth width*0.8
set style fill solid 0.5
set tics out
set xtics nomirror
set xlabel "Texinfo generation / Declt real time (seconds)"
set ylabel "Number of libraries per 1/2 seconds intervals"

plot "timings.dat" \
     using (hist($2,width)):(1.0) \
     smooth freq \
     with boxes lc rgb"green" \
     notitle
