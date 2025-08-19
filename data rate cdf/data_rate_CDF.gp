reset
set terminal pngcairo size 1000,750 enhanced font "Times-Roman,28"
set output "data_rate_CDF.png"

# 外觀
set border lw 2
set size 1,1
set bmargin 3
set tmargin 3

set title "Data Rate CDF (E11, BW80)"
set xlabel "Data Rate (2SS)" font ",32" offset 0,0.5
set ylabel "CDF" font ",32" offset 1.0
set xrange [0:12]
set yrange [-0.05:1.05]
set xtics 0,2 font ",28" offset 0, 0.2
set ytics 0,0.2 font ",28"
set grid xtics ytics lc rgb "#dddddd" lw 1
set key inside right bottom box opaque font ",20" spacing 1.4 samplen 2.5 offset 0, 0.5

# 依序：HTT、RTK、Minstrel、CSI RA
plot \
  "data_rate_CDF.txt"  u 1:2 w fsteps lw 3.5 lc rgb "#ba2323" t  "  HTT", \
  ""                   u 1:3 w fsteps lw 2.5 lc rgb "#2ca02c" t " RTK", \
  ""                   u 1:4 w fsteps lw 2 lc rgb "#f0ad00" t " Minstrel", \
  ""                   u 1:5 w fsteps lw 2 lc rgb "#36a2b5" t " CSI RA (PER THR 10%)"

unset output

# 輸出 EPS 版本
set terminal postscript eps enhanced color "Times-Roman,28"
set output "data_rate_CDF.eps"
replot
unset output