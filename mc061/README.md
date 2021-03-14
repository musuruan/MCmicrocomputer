# TOD-Basic

Per farlo funzionare correttamente, bisogna digitare il seguente comando prima del RUN.

`POKE 56334,PEEK(56334) OR 128`

La locazione 56334 ($DC0E) è il CIA Control Register A. Il bit 7 controlla la frequenza dell'orologio TOD (1=50 Hz, 0=60 Hz).

