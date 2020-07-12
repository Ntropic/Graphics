%yin_yang.m
clc;
clear all;
close all;

how_deep=7;
how_many=400;
save=1;

filename=['yin_yang_n_' num2str(how_deep) '_m_' num2str(how_many) '.mp4'];
%First layer
h=figure('Position',[100 100 1000 1000]);

%Background circle
l=linspace(0,2*pi,100);
circle=[cos(l);sin(l)];

%Add yin yang symbol
phi1=linspace(0,2*pi,how_many);
if save==1
    v=VideoWriter(filename,'MPEG-4');
    open(v);
end
for phi=phi1
    l1=linspace(phi,phi+pi,100);
    l2=linspace(pi+phi,2*pi+phi,100);
    c1=[cos(l1);sin(l1)];
    c2=[cos(l2);sin(l2)];
    fill(c1(1,:),c1(2,:),'w','EdgeColor','none')
    hold on;
    fill(c2(1,:),c2(2,:),'k','EdgeColor','none')

    for i=1:how_deep
        how_long=2^i; %How many circles (and half circles) to do
        
        for j=1:how_long
            signs=mod(floor((j-1)./(2.^(0:i))),2)*2-1; %Signs of the specific steps
            
            if i~=how_deep %Add half circles
              	l1=linspace(phi*(-1)^i,phi*(-1)^i+pi,100);
                l2=linspace(pi+phi*(-1)^i,2*pi+phi*(-1)^i,100);
                c1=[cos(l1);sin(l1)];
                c2=[cos(l2);sin(l2)];
                for l=1:2
                    if l==1
                        c=c1;
                    else
                        c=c2;
                    end
                    curr_circ=c/how_long;
                    x=0;
                    y=0;
                    for k=1:i
                        x=x+signs(i+1-k)*cos(phi)/2^k;
                        y=y+signs(i+1-k)*sin((-1)^(k-1)*phi)/2^k;
                    end
                    curr_circ(1,:)=curr_circ(1,:)+x;
                    curr_circ(2,:)=curr_circ(2,:)+y;
                    if (-1)^(l-1)==1%(-1)^i
                        fill(curr_circ(1,:),curr_circ(2,:),'w','EdgeColor','none') %Add circles
                    else
                        fill(curr_circ(1,:),curr_circ(2,:),'k','EdgeColor','none')
                    end
                end
            else 
                curr_circ=circle/how_long;
                curr_circ2=circle/how_long/2.5;
                x=0;
                y=0;
                for k=1:i
                    x=x+signs(i+1-k)*cos(phi)/2^k;
                    y=y+signs(i+1-k)*sin((-1)^(k-1)*phi)/2^k;
                end
                curr_circ(1,:)=curr_circ(1,:)+x;
                curr_circ(2,:)=curr_circ(2,:)+y;
                curr_circ2(1,:)=curr_circ2(1,:)+x;
                curr_circ2(2,:)=curr_circ2(2,:)+y;
                if signs(1)==(-1)^i
                    fill(curr_circ(1,:),curr_circ(2,:),'w','EdgeColor','none') %Add circles
                    fill(curr_circ2(1,:),curr_circ2(2,:),'k','EdgeColor','none')
                else
                    fill(curr_circ(1,:),curr_circ(2,:),'k','EdgeColor','none')
                    fill(curr_circ2(1,:),curr_circ2(2,:),'w','EdgeColor','none')
                end
            end
        end
        if i~=how_deep %Add half circles
            
        end
    end
    plot(circle(1,:),circle(2,:),'k')
    hold off;
    axis equal;
    set(gca,'visible','off');
    drawnow()
    F=getframe(gcf);
    if save==1
        writeVideo(v,F);
    end
    %error()
end
if save==1
    close(v);
end