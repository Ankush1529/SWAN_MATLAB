clear all;clc;close all;
%N=350;
%n=20;
arr=[50 100 150 200 250 300 350 400];
arr2=[10 20 30 40 50];
k1=1;
for x=1:8
    for y=1:5
        N=arr(x);
        n=arr2(y);
    s=0;
    m=0;
    max_sec=0;
    adja=0;
    lar=n*log(N+1)/log(2);
    %for i = 1:n
     %   node(i)= i;
    %end
    pos_x = randi(500,N,1);
    pos_y= randi(500,N,1);
    comm_range = 150;
    r=zeros(N);
    %figure(1);
     %hold on;
     %for i = 1:n
      %   plot(pos_x(i),pos_y(i),'o','MarkerFaceColor','r','MarkerEdgeColor','k');
         %plot(pos_x(i),pos_y(i),'i','MarkerFaceColor','b','MarkerEdgeColor','b');
     %end
    %disp "test";
    start=tic;
    for i=1:N
        for j=1:N
            %X=[pos_x(i),pos_y(i);pos_x(j),pos_y(j)];
            %d=pdist(X,'euclidean');
            d=sqrt((pos_x(j)-pos_x(i))^2+(pos_y(j)-pos_y(i))^2);
            if d<comm_range
                r(i,j)=randi(n);
                adja=adja+1;
            end
        end
    end
    elapsed=toc(start);
    tic;
    for i = 1:N
        for j = 1:N
            e(i,j) = dijkstra(r,i,j);
            %m=min(m,e(i,j));
        end
    end
    toc;
    c=zeros(N);
    %start=tic;
    for i=1:N
        for j=1:N
            t=N;
            if(i==j)
                continue;
           end
           while t>0 
                k=ceil(lar*rand);
                if e(i,j)==k
                    c(i,j)=c(i,j)+1;
                    s=s+c(i,j);
                    m=min(m,c(i,j));
                end
                t=t-1;
           end
        end
        max_sec=(max_sec+m)/N^2;
    end
    %elapsed=toc(start);
    attack_prob=s/N^3;
%     no_msgs=adja;
%     %com_time=toc/N^2+elapsed/N^3;
%     s_1=0.5*(1-no_msgs/(1-max_sec));
%     s_2=0.25*(1-no_msgs/(1-max_sec));
    through(k1)=adja/elapsed;
    k1=k1+1;
    end
end