function [D]=media_mes(archivo,anio1,anio2)
%Valentina Iturra Rosales

load (archivo);

time = datevec(time);
C = [];

    count=0;
for k = 1:12
    for j = 1:31
    count=0;
        for i= anio1:anio2
            A = find(time(:,3) == j & time(:,2)== k & time(:,1)==i);
            B = isempty(A);
            count= count+1;
                if B == 1
                    C(count,j) = NaN;
                else
                    C(count,j) = value(A);
                end
        end
    end
    for f = 1:31
        media(f,k) = nanmean(C(:,f));
    end
end
n=0;
for j=1:12
    for i=1:31
        n=n+1;
        D(n,1)=media(i,j);
    end
end

D(find(isnan(D) == 1)) = [];

