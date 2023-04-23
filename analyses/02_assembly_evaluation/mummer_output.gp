set terminal png tiny size 800,800
set output "mummer_output.png"
set xtics rotate ( \
 "ENA|OBMB01000001|OBMB01000001.1" 1.0, \
 "ENA|OBMB01000002|OBMB01000002.1" 2569357.0, \
 "" 2610531 \
)
set ytics ( \
 "tig00000001" 1.0, \
 "tig00000002" 2566160.0, \
 "" 2617214 \
)
set size 1,1
set grid
unset key
set border 0
set tics scale 0
set xlabel "REF"
set ylabel "QRY"
set format "%.0f"
set mouse format "%.0f"
set mouse mouseformat "[%.0f, %.0f]"
set xrange [1:2610531]
set yrange [1:2617214]
set style line 1  lt 1 lw 3 pt 6 ps 1
set style line 2  lt 3 lw 3 pt 6 ps 1
set style line 3  lt 2 lw 3 pt 6 ps 1
plot \
 "mummer_output.fplot" title "FWD" w lp ls 1, \
 "mummer_output.rplot" title "REV" w lp ls 2
