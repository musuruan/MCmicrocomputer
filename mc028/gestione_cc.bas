start tok64 gestione-cc.prg
10 rem **************************
20 rem ***    gestione cc     ***
30 rem *** roberto ceccarelli ***
46 rem **************************
47 rem digitato da saver71 il 2 luglio 2011
48 :
50 gosub 50000
99 :
100 rem      menu' principale
101 :
120 print"{clear}{down}{G}estione c/c",,"indice":printl$
140 print"{down}{reverse on}[1]{reverse off} {L}ista operazioni"
160 print"{down}{reverse on}[2]{reverse off} {I}nserimento operazioni"
180 print"{down}{reverse on}[3]{reverse off} {C}alcolo interessi"
200 print"{down}{reverse on}[4]{reverse off} {S}alvataggio dati"
220 print"{down}{reverse on}[5]{reverse off} {C}aricamento dati"
240 print"{down}{reverse on}[6]{reverse off} {F}ine lavoro"
260 print"{down*4}{space*3}{S}cegli {reverse on}[ ]"
280 geta$:ifa$<"1"ora$>"6"goto280
300 onval(a$)gosub1000,2000,3000,4000,5000,6000
320 goto120
999 :
1000 rem     lista operazioni
1001 :
1020 forj=0tondstep16:print"{clear}{down}",,"lista operazioni"
1040 print"{cm a}{sh asterisk*6}{cm r}{sh asterisk*18}{cm r}{sh asterisk*12}{cm s}";
1060 print"{sh -}data{space*2}{sh -}{space}causale{space*10}{sh -}{space*2}importo{space*3}{sh -}";
1080 print"{cm q}{sh asterisk*6}{sh +}{sh asterisk*18}{sh +}{sh asterisk*12}{cm w}";:y=j+15
1100 fork=jtoy:ifk>ndthenprint"{cm z}{sh asterisk*6}{cm e}{sh asterisk*18}{cm e}{sh asterisk*12}{cm x}":k=y:goto1180
1120 d$=right$(str$(v%(k)),2)+" "+m$(int(v%(k)/100))
1140 nn=i(k):gosub10000:x=12-len(x$)
1160 print"{sh -}"d$"{sh -}"left$(c$(k)+sp$,18)"{sh -}";tab(pos(0)+x)x$"{sh -}";
1180 next:gosub10100:next
1200 print"{clear}{down}",,"{R}iepilogo totali":printl$
1220 nn=ta:gosub10000:print"{down*3} totale avere{space*2}="tab(30-len(x$))x$
1240 nn=td:gosub10000:print"{down*2} totale{space*2}dare{space*2}="tab(30-len(x$))x$
1260 nn=ta-td:gosub10000:print"{down*4} saldo attuale ="tab(30-len(x$))x$
1280 goto10100
1999 :
2000 rem     input dati
2001 :
2020 nd=nd+1:print"{clear}{down} {I}ngresso operazione n."nd+1:printl$
2040 ch=1
2060 input"{down*3} {D}ata (gg,mm)";g,m
2080 v%=g+m*100
2100 forj=0tond:ifv%<v%(j)thenk=j:j=nd:next:goto2500
2120 next:k=nd
2140 v%(k)=v%
2160 input"{down} {C}ausale";c$(k)
2180 input"{down} {I}mporto";i(k):ifi(k)<0thentd=td-i(k):goto2220
2200 ta=ta+i(k)
2220 print"{down*5} {reverse on}[f1]{reverse off} = altro dato{space*3}{reverse on}[f3]{reverse off} = menu'"
2240 geta$:ifa$="{f3}"thenreturn
2260 ifa$<>"{f1}"then2240
2280 goto2000
2500 forj=nd-1tokstep-1
2520 v%(j-1)=v%(j):c$(j+1)=c$(j):i(j+1)=i(j)
2540 next:goto2140
2999 :
3000 rem     valutazione interessi
3001 :
3020 print"{clear}{down}",,"{C}alcolo interessi":printl$
3040 j=1:print"{down}"
3060 input"{down} interesse %";in:in(j)=in/100
3080 printtab(20)"{up}";:input"fino al";g,m:d%(j)=g%(m)+g
3100 ifd%(j)<365thenj=j+1:goto3060
3120 print"{clear}{down}"tab(16)"{R}iepilogo di fine anno":printl$
3140 nn=ta:gosub10000:print"{down*2} {T}ot. movimento avere"tab(39-len(x$))x$
3160 nn=td:gosub10000:print"{down} {T}ot. movimento dare"tab(39-len(x$))x$
3180 printtab(25)"{down}{sh asterisk*14}"
3200 nn=ta-td:gosub10000:print" {S}aldo al 31-12"tab(39-len(x$))x$
3220 nn=0:k=1:sa=0:forj=0tond
3240 d=g%(v%(j)/100)+val(right$(str$(v%(j)),2))
3260 ifd>d%(k)thengosub3800
3280 sa=sa+i(j):nn=nn+i(j)*in(k)/365*(366-d):next
3290 gosub3840
3300 nn=int(nn+.5):gosub10000:print"{down} {I}nteressi maturati"tab(39-len(x$))x$
3320 printtab(25)"{down}{sh asterisk*14}"
3340 nn=ta-td+nn:gosub10000:print" {S}aldo al 1 - 1"tab(39-len(x$))x$
3360 goto10100
3800 di=(in(k+1)-in(k))*sa*(366-d%(k))/365
3820 nn=nn+di:k=k+1:return
3840 ifd%(k)=365thenreturn
3860 gosub3800:goto3840
3999 :
4000 rem     salvataggio dati
4001 :
4020 print"{clear}{down}",,"{S}alvataggio dati":printl$
4040 nf$="":input"{down*2} {C}odice conto";nf$
4060 gosub10100:print"{up}"sp$;:ifpeek(1)and16=0goto4100
4080 print"{home}{down*9} {P}remi {reverse on}[record]{reverse off} e {reverse on}[play]{reverse off}":wait1,16,16
4100 open1,1,2,nf$
4120 print#1,nd;t$;ta;t$;td
4140 forj=0tond:print#1,v%(j);t$;c$(j);t$;i(j):next
4160 close1
4180 print"{up} {P}remi {reverse on}[stop]{reverse off} sul registratore":wait1,16
4200 ch=0:return
4999 :
5000 rem     lettura archivio
5001 :
5010 ifch=1thensb=1:gosub6000:sb=0
5020 print"{clear}{down}",,"{L}ettura archivio":printl$
5040 nf$="":input"{down*2} {C}odice conto";nf$
5060 gosub10100:print"{up}"sp$;:ifpeek(1)and16=0goto5100
5080 print"{home}{down*9} {P}remi {reverse on}[play]{reverse off} sul registratore":wait1,16,16
5100 open1,1,0,nf$
5120 input#1,nd,ta,td
5140 forj=0tond:input#1,v%(j),c$(j),i(j):next
5160 close1
5180 print"{up} {P}remi {reverse on}[stop]{reverse off} sul registratore":wait1,16
5200 ch=0:return
5999 :
6000 rem     fine programma
6001 :
6020 ifch=0then6200
6040 print"{up}{up}"tab(15)"{reverse on}{A}{T}{T}{E}{N}{Z}{I}{O}{N}{E}{reverse off}"
6060 print"{down*2} {I} dati dell' archivio attualmente"
6080 print"{down} in memoria sono variati dall' ultimo"
6100 print"{down} salvataggio sulla cassetta."
6120 print"{down*6}{space*3}{reverse on}[f1]{reverse off} non interessa{space*2}{reverse on}[f3]{reverse off} salva"
6140 ifa$="{f1}"goto6190
6160 ifa$<>"{f3}"goto6140
6170 ifsb=1goto4000
6180 gosub4000
6190 ifsb=1thenreturn
6200 print"{clear}{down} {G}estione c/c bancari"
6220 print"{down} [c] 1984 {C}eccarelli {R}oberto"
6240 print"{down*3} {reverse on}***{reverse off} {C}{I}{A}{O}! {reverse on}***{reverse off}"
6260 end
9999 :
10000 rem formattazione importi
10001 :
10020 n$=str$(nn):x$="":l=len(n$)-2:ifl<3theni=l:goto10060
10040 fori=lto3step-3:x$="."+mid$(n$,i,3)+x$:next
10060 x$=left$(n$,i+2)+x$:return
10099 :
10100 rem    attesa per continuare
10101 :
10120 print"{home}{down*21}{space*4}premi {reverse on}[spazio]{reverse off} per continuare"
10130 print"{down}{space*4}premi{space*2}{reverse on}[ {H} ]{reverse off}{space*3}per hardcopy"
10140 geta$:ifa$="h"thengosub60000
10150 ifa$<>" "then10140
10160 return
49999 :
50000 rem     inizializzazioni
50001 :
50020 dimv%(300),i(300),c$(300),g%(12),m$(12)
50040 poke53280,3:poke53281,6:printchr$(14)
50060 print"{clear}{down}","{reverse on}{G}{E}{S}{T}{I}{O}{N}{E} {C}/{C} {B}{A}{N}{C}{A}{R}{I}{reverse off}"
50080 print"{down*6} [c] copyright 1984{space*2}{C}eccarelli {R}oberto"
50100 l$="{sh asterisk*40}"
50120 sp$="{space*40}"
50140 forx=1to12:readg%(x):next
50160 data0,31,59,90,120,151,181,212,243,273,304,334
50170 rem negli anni bisestili la linea 50160 deve essere:
50175 rem data0,31,60,91,121,152,182,213,244,274,305,335
50180 forx=1to12:readm$(x):next
50200 datagen,feb,mar,apr,mag,giu,lug,ago,set,ott,nov,dic
50240 t$=chr$(44):nd=-1:goto10100
60000 rem *** hardcopy ***
60010 g1$=chr$(17)
60020 open4,4:print#4:g1=984
60030 forg0=0to24:g0$=g1$:g1=g1+40
60040 forg2=g1tog1+39:g3=peek(g2)
60050 ifg3>128theng3=g3-128:g4=1:g0$=g0$+chr$(18)
60060 if(g3>0)*(g3<32)theng3=g3+64:goto60100
60070 if(g3>31)*(g3<64)then60100
60080 if(g3>63)*(g3<96)theng3=g3+128:goto60100
60090 if(g3>95)*(g3<128)theng3=g3+64:goto60100
60100 g0$=g0$+chr$(g3)
60110 ifg4=1theng0$=g0$+chr$(146):g4=0
60120 nextg2:print#4,g0$:nextg0
60130 print#4:close4
60140 return
60533 :
60534 rem ****** gestione{space*2}C/c ******
60535 rem [c] 1984 ceccarelli roberto
stop tok64
(bastext 1.04)