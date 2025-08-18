clear
unset label
reset

filename = "cdf"
output_file = sprintf("./%s.eps", filename)

set output output_file
set terminal postscript eps enhanced color  "Times-Roman" 28
# set terminal pngcairo
set size 1,1
set bmargin 3

set ylabel "CDF" font ",40" offset 1.7
set yrange [0:1]
set ytics 0,0.2 font ",34" offset 0.4
set xlabel "Latency (ms)" font ",40" offset 0,0.5
set xrange [0:100]
set xtics (0,10,20,40,60,80,100) font ",34" offset 0,0.3

set key samplen 2.5 font ",34"
set key right bottom
set border lw 2
set style arrow 1 nohead empty front lc rgb "dark-gray" lw 2 dashtype 2 
set arrow from 20,0 to 20,1 as 1

plot \
"rtk_1" using 1:2 title 'RTK-1 inter' with lines lw 3 dashtype 1 lt 2 lc rgb "black", \
"rtk_3" using 1:2 title 'RTK-3 inter' with lines lw 3 dashtype 3 lt 2 lc rgb "black", \
"rtk_5" using 1:2 title 'RTK-5 inter' with lines lw 3 dashtype 5 lt 2 lc rgb "black", \
"hyb_1" using 1:2 title 'Hybrid-1 inter' with lines lw 3 dashtype 1 lt 2 lc rgb "#ba2323", \
"hyb_3" using 1:2 title 'Hybrid-3 inter' with lines lw 3 dashtype 3 lt 2 lc rgb "#ba2323", \
"hyb_5" using 1:2 title 'Hybrid-5 inter' with lines lw 3 dashtype 5 lt 2 lc rgb "#ba2323", \
"nems_1" using 1:2 title 'NYCU-1 inter' with lines lw 3 dashtype 1 lt 2 lc rgb "#36a2b5", \
"nems_3" using 1:2 title 'NYCU-3 inter' with lines lw 3 dashtype 3 lt 2 lc rgb "#36a2b5", \
"nems_5" using 1:2 title 'NYCU-5 inter' with lines lw 3 dashtype 5 lt 2 lc rgb "#36a2b5", \
