# Real time histogram for values between 0.00 and 355
# We use 0.1 wide intervals, that is, 3550 intervals.

reset

n=3550
min=0.00
max=355

width=(max-min)/n
hist(x,width)=width*floor(x/width)+width/2.0
set xrange [min:max]

#set logscale y
#set mxtics 20

set boxwidth width*0.8
set style fill solid 0.5
set tics out
set xtics nomirror
set xlabel "ASDF load time (seconds)"
set ylabel "Number of libraries per 10 milliseconds interval"

plot "real-time.dat" \
     using (hist($2/$3,width)):(1.0) \
     smooth freq \
     with boxes lc rgb"green" \
     notitle
