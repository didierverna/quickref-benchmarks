# Real time histogram for values between 0.000 and 78.000.
# We use 0.25s wide intervals, that is, 312 intervals.

reset

n=312
min=0.0
max=78.0

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
set xlabel "ASDF load/compile time in seconds"
set ylabel "Number of libraries per 0.25 seconds interval"

plot "real-time.dat" \
     using (hist($2,width)):(1.0) \
     smooth freq \
     with boxes lc rgb"green" \
     notitle
