# ASDF load real time histogram.
# Values between 0.000s and 18.000s.
# Intervals of 0.05s, that is, 360 intervals.

reset

n=360
min=0.0
max=18.0

width=(max-min)/n
hist(x,width)=width*floor(x/width)+width/2.0

set xrange [min:max]
set logscale y

set xtics 1
set mxtics 10
set boxwidth width*0.8
set style fill solid 0.5
set tics out
set xtics nomirror
set xlabel "ASDF load real time (seconds)"
set ylabel "Number of libraries per 50 milliseconds intervals"

plot "timings.dat" \
     using (hist($2,width)):(1.0) \
     smooth freq \
     with boxes lc rgb"green" \
     notitle
