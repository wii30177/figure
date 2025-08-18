# file: data_rate_cdf_from_table.gp
reset
set term pngcairo size 1400,800 enhanced font "Times-Roman,26"
set output "data_rate_CDF.png"

set datafile commentschars "#"

set title "Data Rate CDF (E11, BW80)"
set xlabel "Data Rate (2SS)"
set ylabel "CDF"
set xrange [0:12]
set yrange [-0.1:1.1]
set xtics 0,2
set ytics 0,0.2
set grid xtics ytics lc rgb "#dddddd" lw 1
set border lw 2
set tics out nomirror
set key inside right bottom box opaque font ",20" spacing 1.4 samplen 2.5

# 依序：HTT、RTK、Minstrel、CSI RA
plot \
  "data_rate_cdf.txt" u 1:2 w fsteps lw 2 lc rgb "#1f77b4" t " ｀｀HTT", \
  ""                   u 1:3 w fsteps lw 2 lc rgb "#ff7f0e" t " RTK", \
  ""                   u 1:4 w fsteps lw 2 lc rgb "#2ca02c" t " Minstrel", \
  ""                   u 1:5 w fsteps lw 2 lc rgb "#d62728" t " CSI RA (PER THR 10%)"

unset output

# 輸出 EPS 版本
set terminal postscript eps enhanced color "Times-Roman,26"
set output "data_rate_CDF.eps"
replot
unset output