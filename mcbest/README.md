# SX64
Come descritto a [pag. 24 di MC 57](https://archive.org/details/MC_microcomputer-057/page/n23/mode/2up), 
il programma MENU presente sui floppy non è compatibile con il Commodore SX64 
(cosa che si può facilmente verificare con VICE, selezionando questo modello).

Se non si usa il programma MENU, i programmi possono essere caricati 
direttamente digitando il loro nome.

Il motivo di questa incompatibilità è dovuto al fatto che premendo SHIFT+RUN/STOP 
sull'SX64 viene messo nel buffer di tastiera `LOAD":*",8` invece di `LOAD` come
avviene sugli altri modelli di C64. Pertanto, scegliendo un qualsiasi programma
dal MENU, verrà sempre caricato il programma MENU stesso.
