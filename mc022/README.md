# BASAL

Nell'articolo si afferma che "l'adattamento su altri computer non dovrebbe essere molto difficile". Infatti, una [versione per C64](http://claudiolarini.altervista.org/pdf/BASAL21.pdf) è stata realizzata da Claudio Larini.

La versione per C64 si ottiene modificando le seguenti righe:

    10100 POKE56,127:POKE53281,1:GOTO10430
    11230 S=40704:Z=0:PRINT"(CLR)":FORI=1TON
    11320 I=40704
    11360 POKE40703,I/256
    11370 POKE40702,(I/256-PEEK(40703))*256
    11410 I=PEEK(40703)*256+PEEK(40702):GOTO11330

