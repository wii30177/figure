reset
set terminal pngcairo size 1000,750 enhanced font "Times-Roman,28"
set output "BW80-95-percent.png"

# 外觀
# set tics out nomirror
set border lw 2
set size 1,1
set bmargin 3
set tmargin 3

# 座標軸
set yrange [0:40]
set ylabel "95% Latency (ms)" font ",32" offset 1.0
set ytics 0,5 font ",28"
set xlabel "Locations (BW80)" font ",32" offset 0,0.5
set xtics scale 0
set xtics ("E2" 0, "E4" 1, "E5" 2, "E8" 3, "E11" 4) font ",28" offset 0, 0.2
set x2tics ("" 0, "" 1, "" 2, "" 3, "" 4, "" 5) 

# 圖例放上方、橫向排列
# set key above horizontal samplen 2.0 spacing 1.0 font ",20"
set key above font ",28"

# 直方圖
set style data histogram
set style histogram clustered gap 2
set boxwidth 0.85

# 繪圖（同一資料檔連續使用三次）
# BW160.txt 每列對應一個點（E1/E2/E3/E4/E5/E6）
# 欄位：CSI | HTT | RTK | Minstrel
plot \
  "BW80.txt" u 1 w hist fs pattern 5  lc rgb "#36a2b5"  t "CSI", \
  ""         u 2 w hist fs pattern 0  lc rgb "#ba2323"  t "HTT", \
  ""         u 3 w hist fs pattern 5  lc rgb "#2ca02c"  t "RTK", \
  ""         u 4 w hist fs pattern 0  lc rgb "#f0ad00"  t "Minstrel"

unset output

# 輸出 EPS 版本
set terminal postscript eps enhanced color "Times-Roman" 28
set output "BW80-95-percent.eps"
replot
unset output
