clear
unset label
reset

filename = "95-percent"
output_file = sprintf("./%s.eps", filename)

set output output_file
set terminal postscript eps enhanced color  "Times-Roman" 28
set size 1,1
set bmargin 3

set xlabel "# Interference" font ",36" offset 0,0.5
set xtics ("1" 0, "3" 1, "5" 2) font ",32" offset 0,0.3
set ylabel "95% Latency (ms)" font ",36" offset 1.7
set yrange[0:50]
set ytics 0,5 font ",32" offset 0.4

set style data histogram
set style histogram cluster errorbars gap 2
set boxwidth 0.95

set key above
set border lw 2

set style arrow 1 nohead empty front lc rgb "dark-gray" lw 2 dashtype 2 
set arrow from -1,20 to 3,20 as 1

plot \
"95-percent.txt" u 5:6:7 title "RTK" lc rgb "black" fs pattern 0, \
"" u 8:9:10 title "Hybrid" lc rgb "#ba2323" fs pattern 4, \
"" u 2:3:4 title "IRALAX" lc rgb "#36a2b5" fs pattern 5, \
