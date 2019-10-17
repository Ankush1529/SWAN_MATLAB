N=250;
n=10;
c=0;
tic;
for i=1:N^3
    s=randi(n);
    P=randi(n);
    PK=s*P;
    r=randi(n);
    R=r*P;
    h=randi(n);
    D=r*h+h*mod(s,n);
    if PK==R*h
        %+h*mod(PK,n)
        c=c+1;
    end 
end
toc;
at=c/N^3;
msg_throu=c/toc;

