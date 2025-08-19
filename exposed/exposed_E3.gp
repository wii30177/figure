reset
set terminal pngcairo size 1000,750 enhanced font "Times-Roman,28"
set output "exposed_E3.png"

# 外觀
set border lw 2
set size 1,1
set bmargin 3
set tmargin 3

# 座標軸
set yrange [0:80]
set ylabel "95% Latency (ms)" font ",32" offset 1.0
set ytics 0,10 font ",28"
set grid ytics lc rgb "#cccccc"
set xlabel "Interference Traffic (BW160, E3)" font ",32" offset 0,0.5
set xtics ("0M" 0, "120M" 1, "240M" 2) font ",28" offset 0, 0.2 scale 0

# 圖例放上方、橫向排列
set key above font ",28"
set x2tics ("" 0, "" 1, "" 2) 

# 直方圖
set style data histogram
set style histogram clustered gap 2
set boxwidth 0.85

# 虛線參考線
# set style line 99 lc rgb "#aaaaaa" dt 2 lw 2
# set arrow 1 from -1,35 to 3,35 nohead ls 99 front

# 繪圖（同一資料檔連續使用三次）
# BW160.txt 每列對應一個點（E1/E2/E3/E4/E5/E6）
# 欄位：CSI | HTT | RTK | Minstrel
plot \
  "exposed_E3.txt" u 1  w hist fs pattern 5  lc rgb "#36a2b5"  t "CSI", \
  ""          u 2 w hist fs pattern 0  lc rgb "#ba2323"  t "HTT", \
  ""          u 3 w hist fs pattern 5  lc rgb "#2ca02c"  t "RTK", \
  ""          u 4 w hist fs pattern 0  lc rgb "#f0ad00"  t "Minstrel"

unset output

# 輸出 EPS 版本
set terminal postscript eps enhanced color "Times-Roman,28"
set output "exposed_E3.eps"
replot
unset output
