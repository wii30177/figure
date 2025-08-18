# file: per_100ms.gp
reset
set term pngcairo size 1400,800 enhanced font "Times-Roman,26"
set output "per_100ms_E11_BW80.png"

set title "PER per 100ms (E11, BW80)"
set xlabel "Elapsed Time (s)"
set ylabel "PER (%)"         # %% 避免 enhanced 將 % 當格式字
set xrange [0:12]
set yrange [0:1.0]
set xtics 0,2
set ytics 0,0.2
set grid xtics ytics lc rgb "#dddddd" lw 1
set border lw 2
set tics out nomirror

# 圖例：放內部右上、有白底外框，避免被網格干擾
set key inside right top box opaque spacing 1.4 samplen 2.5 noinvert Left font ",20"

# 線+點樣式（顏色與粗細、圓點）
set style line 1 lc rgb "#1f77b4" lw 2 pt 7 ps 0.9    # HTT  (blue)
set style line 2 lc rgb "#ff7f0e" lw 2 pt 7 ps 0.9    # RTK  (orange)
set style line 3 lc rgb "#2ca02c" lw 2 pt 7 ps 0.9    # Minstrel (green)
set style line 4 lc rgb "#d62728" lw 3 pt 7 ps 0.9    # CSI RA (red,稍粗)

# 資料：第1欄=時間(秒)，第2~5欄=各方法的 PER(%)
plot "per_100ms.txt"  using 1:2 with linespoints ls 1 title "  HTT", \
     ""               using 1:3 with linespoints ls 2 title "  RTK", \
     ""               using 1:4 with linespoints ls 3 title "  Minstrel", \
     ""               using 1:5 with linespoints ls 4 title "  CSI RA (PER THR 10%)"

unset output

# 輸出 EPS 版本
set terminal postscript eps enhanced color "Times-Roman,26"
set output "per_100ms_E11_BW80.eps"
replot
unset output