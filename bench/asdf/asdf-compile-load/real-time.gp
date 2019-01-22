# ASDF compile/load time histogram.
# Values between 0.000s and 96.000s.
# Intervals of 0.25s, that is, 384 intervals.

reset

n=384
min=0.0
max=96.0

width=(max-min)/n
hist(x,width)=width*floor(x/width)+width/2.0

set xrange [min:max]
set logscale y

set mxtics 5
set boxwidth width*.8
set style fill solid 0.5
set tics out
set xtics nomirror
set mxtics 10
set xlabel "ASDF compile/load time (seconds)"
set ylabel "Number of libraries per 1/4 secondsq interval"

plot "real-time.dat" \
     using (hist($2,width)):(1.0) \
     smooth freq \
     with boxes lc rgb"green" \
     notitle
