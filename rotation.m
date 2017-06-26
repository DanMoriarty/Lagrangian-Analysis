%Advanced Dynamics Project, Group 8. Pendulum on Spring.
%Utility function, handles rotation of rotational matrix R (input).

function [xf,yf,zf]=rotation(xi,yi,zi,R)

I=size(xi,1);
J=size(xi,2);

xf=zeros(I,J);
yf=zeros(I,J);
zf=zeros(I,J);

for ii=1:I
    for jj=1:J
        vector=[xi(ii,jj);yi(ii,jj);zi(ii,jj)];
        vector=R*vector;
            xf(ii,jj)=vector(1);
            yf(ii,jj)=vector(2);
            zf(ii,jj)=vector(3);
    end
end