í CONTROLLO ERRORI DRIVE ~í  1 :  1,8,15,"I0" :  60804 :  APRE IL FILE PER CHIEDERE AL DRIVE IL MESSAGGIO DI ERRORE Óí  3 :  3,8,3,"#" :  60804 :  APRE IL FILE PER CONTROLLARE IL BUFFER DEL DRIVE đí :  ESCE DALLA ROUTINE Kí1,CO,ME$,T,S :  LEGGE IL CODICE , IL MESSAGGIO , LA TRACCIA , IL SETTORE DELL'ERRORE í CO ˛ 0 §  :  ESEGUE IL RETURN SE L'ERRORE NON SUSSISTE żí ME$ :  SCRIVE IL MESSAGGIO DI ERRORE SU VIDEO ăí  1 :   3 :  CHIUDE I DUE FILE í 198,0 :  198,1 :  ASPETTA LA PRESSIONE DI UN TASTO Yí 1,8,15,"I0" : 1,CO,ME$,T,S :  RIAPRE IL PRIMO FILE ¸í CO łą 0 § 60806 :  CONTROLLA IL CODICE DI ERRORE DOPO AVER RILETTO LE QUATTRO VARIABILI Ţí 60804 :  TORNA ALLA RIGA 60804 äí ęí +í ********************************************************** kí ELENCO VARIABILI DELLA ROUTINE 'CONTROLLO ERRORI DRIVE' : Źí ********************************************************** ˛í ¸í Ďí CO , ME$ , S , T   