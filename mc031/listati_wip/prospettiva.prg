(
 � ******************************** f � PROGRAMMA  PER DISEGNARE  FIGURE SOLIDE  IN PROSPETTIVA � � CONFIGURAZIONE:COMMODORE 64 E REGISTRATORE � � OPTIONAL:PLOTTER COMMODORE 1520 � � **********************************  	 �52,92:�56,92:�55,0:�:� ABBASSA  PUNTATORI FINE BASIC d	 �K�49152�49222:�P:�K,P:�:� CARICA ROUTINE L.M.PER CLEAR GRAFICA �	1 � ***** SCELTE INIZIALI *********** �	2 �"�PROGRAMMA PER DISEGNARE FIGURE SOLIDE IN PROSPETTIVA" �	3 �"PROCEDURE:" 
4 �"A : INPUT SPIGOLI" 
5 �"B : CUBO" ,
6 �"C : TETRAEDRO" A
7 �"D : PIRAMIDE" [
< �"";:�I�1�23:�"";:� �
= �"PREMERE UNO DEI TASTI INDICATI":�I�0�200:� �
> �"�PREMERE UNO DEI TASTI INDICATI":�I�0�200:� �
F �A$:�A$�""�60 �
G �A$�"A"�100 �
H �A$�"B"�5000 I �A$�"C"�6000 J �A$�"D"�7000 Fc � ******* PROCEDURA A:INPUT SPIGOLI ********* fd �"�":�"NOME DEL SOLIDO";NS$ �g �:�"NUMERO DEGLI SPIGOLI DA COLLEGARE";NS �i �MS(NS�1,2):� MP(NS�1,1) �n �"SPIGOLI"�13)"X"�23)"Y"�33)"Z" �x � I�0 � NS�1 �� �I�1 	� �"�"�11):�X:MS(I,0)�X #� �"�"�21):�Y:MS(I,1)�Y =� �"�"�31):�Z:MS(I,2)�Z M� X�0:Y�0:Z�0 U� � I b� �:�:�950 v� �A$�"N"� �:�100 �� � **** INPUT PARAMETRI DELLA PROSPETTIVA DEL SOLIDO ****** �� �"�PARAMETRI PER IL CALCOLO DELLA PROSPETTIVA DEL SOLIDO:";NS$ � DI�0:TR�0:SC�0:AX�0:AY�0:AZ�0 D� �"DISTANZA DEL PUNTO DI FUGA";:� DI k� �"ALTEZZA DELL'OSSERVATORE";:� TR � �"SCALA";:� SC �� �"ROTAZIONI (IN GRADI) ATTORNO AGLI ASSI:" �� �"ROT ASSE X";AX �� �"ROT ASSE Y";AY �� �"ROT ASSE Z";AZ � RX�AX�2���360:RY�AY�2���360:RZ�AZ�2���360 %� �950 5� �A$�"N"�200 i� �"�VUOI IL DISEGNO SU VIDEO O SU PLOTTER?" �� �"PREMERE V OPPURE P" ��Z$:�Z$�""�260 ��Z$�"V"��"ATTENDERE":�310  �Z$�"P"� �"SCEGLIERE IL COLORE DELLA PENNA DEL PLOTTER" +"�"NERO:0","BLU:1","VERDE:2","ROSSO:3" @'� CL%:�CL%�3�295 \)�"          ATTENDERE" �,� **** PROCEDURA DI CALCOLO DEI PUNTI DA DISEGNARE E MEMORIZZARE **** �6� I�0 � NS�1 �@XP�MS(I,0):YP�MS(I,1):ZP�MS(I,2) �JZZ�ZP�TR TXX�XP��(RZ)�YP��(RZ):YY�XP��(RZ)�YP��(RZ) EUYT�YY��(RX)�ZZ��(RX):ZT�YY��(RX)�ZZ��(RX) UVYY�YT:ZZ�ZT �XXT�XX��(RY)�ZZ��(RY):ZT�XX��(RY)�ZZ��(RY) �ZXX�XT:YY�YT:ZZ�ZT �^XX�XX�SC:YY�YY�SC:ZZ�ZZ�SC �hMP(I,0)�DI�XX�(YY�DI):MP(I,1)�DI�ZZ�(YY�DI) �r�I |�Z$�"P"�700  :� PASSAGGIO AL PLOTTER >�� ***** DISEGNO SUL VIDEO ******* H��2000 b�X1�MP(0,0):Y1�MP(0,1) j�I�1 ��X2�MP(I,0):Y2�MP(I,1) ���P�0�1 �.05 ��XD�(X2�X1)�P�X1:XD�XD�160 ��YD�(Y2�Y1)�P�Y1:YD�YD�100 ��CH��(XD�8):RO��((200�YD)�8):LN�(200�YD)�7 6�BY�BASE�RO�320�8�CH�LN:BI�7�(XD�7):�BY,�(BY)�(2�BI) =��P S�I�I�1:�I�NS�1�500 c�X1�X2:Y1�Y2 l��407 ��CH��(XD�8):RO��((200�YD)�8):LN�(200�YD)�7 ��BY�BASE�RO�320�8�CH�LN:BI�7�(XD�7):�BY,�(BY)�(2�BI) ���P ��I�I�1:�I�NS�1�500 ��X1�X2:Y1�Y2 ��407 0��23552,0    :� SEGNALE FINE DISEGNO C��A$:�A$�""�510 x�2500      :� RITORNO IN PAGINA TESTO E MESSEGGI �&�"�PER TORNARE ALLE SCELTE INIZIALI:I" �+�"PER CAMBIARE I PARAMETRI DEL SOLIDO:P" ,�"PER TERMINARE PREMERE UN QUALUNQUE ALTRO TASTO" '0�A$:�A$�""�560 8:� A$�"I" � � HD�A$�"P"�200 NX� ��� ***** PROCEDURA PER IL DISEGNO CON PLOTTER ***** ���4,6       :� PRINT ASCII DATA ���1,6,1     :� PLOT X,Y DATA ���2,6,2     :� SELECT COLOR �� ***** STAMPA PARAMETRI DELLA PROSPETTIVA ***** 6��4,"PROSPETTIVA ";NS$ J��4,"PARAMETRI:" n��4,"DISTANZA PUNTO DI FUGA:";DI ���4,"ALTEZZA OSSERVATORE:";TR ���4,"SCALA:";SC ���4,"ROT X:";AX ���4,"ROT Y:";AY ���4,"ROT Z:";AZ ���4,�(13)    :� RETURN HOME �� ***** DISEGNO ***** 7��2,CL%      :� SET COLOR PENNA X��1,"H"      :� PENNA IN HOME ��1,"M",240,�250:� MUOVE LA PENNA ALLA NUOVA ORIGINE DEGLI ASSI ��1,"I"      :� NUOVA ORIGINE FISSATA �X1��(MP(0,0)):Y1��(MP(0,1))  �1,"R",X1,Y1:� SET PENNA AL PRIMO PUNTO *I�1 84X2��(MP(I,0)):Y2��(MP(I,1)) I>�1,"J",X2,Y2 _HI�I�1:�I�NS�1�870 hR�820 �f�1,"H"      :� PENNA IN HOME �p�1,"M",0,�500:� PENNA IN FONDO ALLO SPAZIO DEL DISEGNO �u�7,6,7        :� RESET PLOTTER �z�7 ���4:�1:�2:�7 ��550 +�� ***** LAMPEGGIO SCRITTE ***** E��"";:�I�1�23:�"";:� i��"TUTTO O.K.? S/N�":�I�0�200:� ���"�TUTTO O.K.? S/N":�I�0�200:� ��� A$:�A$�""�950 ��� ��� **** DATA PER SUBROUTINE IN L.M.***** ��� 173,24,208,9,120,141,24,208 �� 173,17,208,9,32,141,17,208 8�� 169,0,133,251,169,96,133,252 Z�� 160,0,169,0,145,251,200,192 ~�� 0,208,249,230,252,169,128,197 ��� 252,208,239,169,0,133,251,169 ��� 92,133,252,160,0,169,3,145 ��� 251,200,192,0,208,249,230,252 �� 169,96,197,252,208,239,96 E�� ***** SUBROUTINE DI ACCENSIONE E CLEAR GRAFICA HR ***** \�� 56578,�(56578)�3 v��56576,�(56576)�252�2 ��BASE�24576:�53272,�(53272)�7�120 ��� 53265,�(53265)�32 ���49152 ��� ��	� ***** CHIUSURA MODO GRAFICO ***** �	� 56578,�(56578)�3 �	� 56576,�(56576)�252�3 8�	� 53272,�(53272)�7�16 Q�	� 53265,�(53265)�223 W�	� ��� ***** PROCEDURA READ/DATA PER CUBO ***** ���:�I�0�70:�A:�:NS$�"CUBO" ���NS:�MS(NS�1,2):�MP(NS�1,1) ��I�0 ��J�0 ���A:MS(I,J)�A ��J�J�1 ���J��2�5040 �I�I�1 ��I��NS�1�5030 $�� 200 U|� 16,-40,-40,40,40,-40,40,40,40,40,-40,40,40 �}� -40,-40,40,-40,-40,-40,40,-40,-40,40,40,-40 �~� 40,40,40,40,40,-40,-40,40,-40,-40,40,40 �� -40,40,-40,-40,-40,-40,40,-40,-40,40,-40,40 p� ***** PROCEDURA READ/DATA PER TETRAEDRO ***** ?z�:�I�0�119:�A:�:NS$�"TETRAEDRO" I��5010 od�8,-50,0,0,50,0,0,0,-50,0,-50,0,0 �e� 0,0,-50,50,0,0,0,-50,0,0,0,-50 �X� ***** PROCEDURA READ/DATA PER PIRAMIDE ***** �b�:�I�0�144:�A:�:NS$�"PIRAMIDE" �l�5010 "L� 11,0,0,50,-50,-50,-50,50,-50,-50,0,0,50 RM� 50,50,-50,50,-50,-50,50,50,-50,-50,50,-50 vN� 0,0,50,-50,50,-50,-50,-50,-50 �'� ***** USCITA MODO GRAFICO PER HELP ***** �'� 56578,�(56578)�3 �'� 56576,�(56576)�252�3 �'� 53272,�(53272)�7�16 
'� 53265,�(53265)�223 #'� 53270,�(53270)�239 )'�   