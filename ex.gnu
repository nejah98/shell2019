set style data histogram
set style fill solid border -1
plot for [i=2:3] '/dev/stdin' using i:xtic(1) title col
