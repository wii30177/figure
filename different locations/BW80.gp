reset
set terminal pngcairo size 1000,720 enhanced font "Times-Roman,26"
set output "BW80-95-percent.png"

# 外觀
set border lw 2
set tics out nomirror
set grid ytics lc rgb "#cccccc"

# 座標軸
set ylabel "95% Latency (ms)" font ",20" offset 1.4
set yrange [0:40]
set ytics 0,5 font ",20"
set xlabel "Locations (BW80)" font ",20" offset 0,0.8
set xtics ("E2" 0, "E4" 1, "E5" 2, "E7" 3, "E8" 4, "E11" 5) font ",20"

# 圖例放上方、橫向排列
set key outside center top horizontal samplen 2.0 spacing 0.4 font ",16"

# 直方圖
set style data histogram
set style histogram clustered gap 2
set boxwidth 0.85

# 虛線參考線
# set style line 99 lc rgb "#aaaaaa" dt 2 lw 2
# set arrow 1 from -1,6 to 6,6 nohead ls 99 front

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
set terminal postscript eps enhanced color "Times-Roman,26"
set output "BW80-95-percent.eps"
replot
unset output
