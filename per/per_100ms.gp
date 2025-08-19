# file: per_100ms.gp
reset
set terminal pngcairo size 1000,750 enhanced font "Times-Roman,28"
set output "per_100ms_E11_BW80.png"

set border lw 2
set size 1,1
set bmargin 3
set tmargin 3

set title "PER per 100ms (E11, BW80)"

set xrange [0:12]
set yrange [0:100]
set xlabel "Elapsed Time (s)" font ",32" offset 0,0.5
set ylabel "PER (%)" font ",32" offset 1.0
set xtics scale 0 font ",28" offset 0, 0.2
set ytics 0,20 font ",28"
set grid xtics ytics lc rgb "#dddddd" lw 1

# 圖例：放內部右上、有白底外框，避免被網格干擾
set key inside right top box opaque spacing 1.4 samplen 2.5 noinvert Left font ",20"

# 線+點樣式（顏色與粗細、圓點）
set style line 1 lc rgb "#ba2323" lw 2 pt 7 ps 0.9    # HTT 
set style line 2 lc rgb "#2ca02c" lw 2 pt 7 ps 0.9    # RTK  
set style line 3 lc rgb "#f0ad00" lw 2 pt 7 ps 0.9    # Minstrel 
set style line 4 lc rgb "#36a2b5" lw 2 pt 7 ps 0.9    # CSI RA 

# 資料：第1欄=時間(秒)，第2~5欄=各方法的 PER(%)
plot "per_100ms.txt"  using 1:2 with linespoints ls 1 title "  HTT", \
     ""               using 1:3 with linespoints ls 2 title "  RTK", \
     ""               using 1:4 with linespoints ls 3 title "  Minstrel", \
     ""               using 1:5 with linespoints ls 4 title "  CSI RA (PER THR 10%)"

unset output

# 輸出 EPS 版本
set terminal postscript eps enhanced color "Times-Roman,28"
set output "per_100ms_E11_BW80.eps"
replot
unset output