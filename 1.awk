BEGIN { a=0; b=0; i=1;j=2 }

{ if (i%4!=0) a+=$1; else a=0  }

{ if (j>2 && (j+1%4!=0) ) b+=$1; else b=0  }

{ print i, $1, a, b }

{ i++; j++ }

END { print i }
