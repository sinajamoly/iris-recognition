% irisRecognition - prende in ingresso due foto di occhi ed effettua 
% il riconoscimento dell'iride, identificando se si tratta o meno della 
% stessa persona. Restituisce la distanza di Hamming, da interpretare 
% secondo il seguente schema:
%
% se   0<HD<=0.2   => stessa iride
%      0.4<=HD<=1 => iridi differenti
%      0.3<=HD<=0.4 => troppa incertezza, meglio cambiare foto :-) 
%
% Usage: 
% hd = irisRecognition(foto1,foto2)
%
% Arguments:
%	foto1   - file contenente la prima foto
%	foto2   - file contenente la seconda foto
%
% Output:
%	hd		    - distanza di Hamming tra le due foto
%
% Author: 
% Fazio Giacomo Antonino
% giacomofazio@tiscali.it
% Università di Catania
% Febbraio 2007

function hd=irisRecognition(file1,file2)

%devo prima estrarre l'iride da entrambi i file. Uso una versione adattata
%della funzione createiristemplate di Libor Masek
estraiIride(file1);
estraiIride(file2);

%carico l'immagine "unwrapped" della prima iride, ne faccio la wavelet
%packet decomposition e calcolo il best tree
x=double(imread([substr(file1,0,-4),'-polar.jpg'])); %uso la funzione substr.m di Peter Acklam
t1=wpdec2(x,3,'bior1.3','shannon');
t1=besttree(t1);

%idem per la seconda iride
x=double(imread([substr(file2,0,-4),'-polar.jpg'])); %uso la funzione substr.m di Peter Acklam
t2=wpdec2(x,3,'bior1.3','shannon');
t2=besttree(t2);

%stabilisco quali pacchetti considerare, ma per fare questo devo avere una
%stima delle energie dei vari pacchetti. Con la funzione getVettoreEnergie
%per ogni pacchetto terminale (per entrambe le foto) avrò l'energia
e=getVettoreEnergie(t1,t2);

%estraggo i coefficienti dei 3 pacchetti a maggiore energia, non
%considerando il primo (info DC) e il secondo (spesso info fuorvianti)
%operazioni svolte per entrambe le foto
pp1=read(t1,'data',e(3,1));
pp2=read(t2,'data',e(3,1));
sp1=read(t1,'data',e(4,1));
sp2=read(t2,'data',e(4,1));
tp1=read(t1,'data',e(5,1));
tp2=read(t2,'data',e(5,1));

%ottengo la stringa binaria per il primo pacchetto  e calcolo la distanza
%di Hamming. Operazioni svolte per entrambe le foto
stringpp1=getBinaryString(pp1);
stringpp2=getBinaryString(pp2);
hdp=getHammingDistance(stringpp1,stringpp2);

%idem per il secondo pacchetto
stringsp1=getBinaryString(sp1);
stringsp2=getBinaryString(sp2);
hds=getHammingDistance(stringsp1,stringsp2);

%idem per il terzo pacchetto
stringtp1=getBinaryString(tp1);
stringtp2=getBinaryString(tp2);
hdt=getHammingDistance(stringtp1,stringtp2);

%media tra le distanze di Hamming
hd=(hdp+hds+hdt)/3;