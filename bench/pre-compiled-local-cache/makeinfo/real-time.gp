# Real time histogram for values between 0.000 and 113.000.
# We use .5s wide intervals, that is, 226 intervals.

reset

n=226
min=0.0
max=113.0

width=(max-min)/n
hist(x,width)=width*floor(x/width)+width/2.0
set xrange [min:max]

#set logscale y
set mxtics 10

set boxwidth width*0.8
set style fill solid 0.5
set tics out
set xtics nomirror
set xlabel "Makeinfo run (HTML generation) time (seconds)"
set ylabel "Number of libraries (.5 seconds interval)"

plot "real-time.dat" \
     using (hist($2,width)):(1.0) \
     smooth freq \
     with boxes lc rgb"green" \
     notitle
