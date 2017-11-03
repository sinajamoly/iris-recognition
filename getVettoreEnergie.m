function e=getVettoreEnergie(t1,t2)

%ottengo i pacchetti terminali di entrambi gli alberi
tnodes1 = wtreemgr('tnodes',t1);
tnodes2 = wtreemgr('tnodes',t2);

%salvo in un vettore v i pacchetti terminali comuni ad entrambi gli alberi
k=1;
for i=1:size(tnodes1,1)
    for j=1:size(tnodes2,1)
       if tnodes1(i)==tnodes2(j)
           v(k)=tnodes1(i);
           k=k+1;
       end
    end
end

%estraggo ogni pacchetto terminale (i coefficienti) da entrambi gli alberi
%e ne calcolo l'energia
for i=1:size(v,2)
    cfs1=read(t1,'data',v(i));
    cfs2=read(t2,'data',v(i));
    energia1=0;
    for j=1:size(cfs1,1)
        for k=1:size(cfs1,2)
            energia1=energia1+(cfs1(j,k)^2);
        end
    end
    energia2=0;
    for j=1:size(cfs2,1)
        for k=1:size(cfs2,2)
            energia2=energia2+(cfs2(j,k)^2);
        end
    end
    %creo un vettore e in cui il primo elemento è il numero del pacchetto,
    %il secondo è la media tra le sue energie per entrambi i pacchetti
    e(i,1)=v(i);
    e(i,2)=(energia1+energia2)/2;
    %fprintf(1,'Energie pacchetto %d per le due foto = %f e %f\n',e(i,1),energia1,energia2)
    %fprintf(1,'Energia media pacchetto %d = %f\n',e(i,1),e(i,2))
end

%faccio il sorting del vettore e in ordine decrescente di energia
e=sortrows(e,[-2]);
    
            
