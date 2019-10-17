clear all;clc;close all;
N=[50 100 150 200 250 300 350 400];
for i=1:8
    a=N(i)^3;
    ID_SN=uint8(ceil(2^7*rand));
    K_s=uint8(ceil(2^7*rand));
    TC_SN=typecast([ID_SN K_s],'uint16');
    ID_i=uint8(ceil(2^7*rand));
    PW_i=uint8(ceil(2^7*rand));
    RPW_i=typecast([ID_i PW_i],'uint16');
    ID_GWN=uint8(ceil(2^7*rand));
    RID_i=typecast([ID_i K_s],'uint16');
    TC_Ui=typecast([ID_i ID_GWN],'uint16');
    c=0;
    tic;
    while a>0
        k=ceil(2^7*rand);
        l=ceil(2^15*rand);
        if k==ID_SN
            c=c+1;
        end
        if k==K_s
            c=c+1;
        end
        if l==TC_SN
            c=c+1;
        end
        if  k==ID_i
            c=c+1;
        end
        if k==PW_i
            c=c+1;
        end
        if l==RPW_i
            c=c+1;
        end
        if k==ID_GWN
            c=c+1;
        end
        if l==RID_i
            c=c+1;
        end
        if l==TC_Ui
            c=c+1;
        end
        a=a-1;
    end
    toc;
    msg_over(i)=7*c/N(i);
    msg_throu(i)=msg_over(i)/toc;
    att(i)=c/N(i)^3;
end