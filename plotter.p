set terminal png
set output "n_100.png"
set title "ab -n 100"
set size 1,0.9
set grid y
set xlabel "Request"
set ylabel "Response Time (ms)"
plot "n_100_c_1.csv" using 9 smooth sbezier with lines title "C:1", "n_100_c_5.csv" using 9 smooth sbezier with lines title "C:5"
