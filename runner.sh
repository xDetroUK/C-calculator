bison -d rpcalc.y
flex rpcalc.l
gcc -lm rpcalc.tab.c lex.yy.c -o boolcalc
./boolcalc
