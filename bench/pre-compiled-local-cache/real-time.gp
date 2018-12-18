# Real time histogram for values between 0.00 and 30
# We use 0.1 wide intervals, that is, 300 intervals.

reset

n=300
min=0.00
max=30

width=(max-min)/n
hist(x,width)=width*floor(x/width)+width/2.0
set xrange [min:max]

#set logscale y
set mxtics 5

set boxwidth width*0.8
set style fill solid 0.5
set tics out
set xtics nomirror
set xlabel "Ratio Declt/Makeinfo"
set ylabel "Number of libraries per .1 seconds interval"

plot "real-time.dat" \
     using (hist($2/$3,width)):(1.0) \
     smooth freq \
     with boxes lc rgb"green" \
     notitle
