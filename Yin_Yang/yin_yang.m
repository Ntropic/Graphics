%yin_yang.m
clc;
clear all;
close all;

%First layer
h=figure();

%Background circle
l=linspace(0,2*pi,100);
circle=[cos(l);sin(l)];

%Add yin yang symbol
phi1=linspace(0,-4*pi,200);
for phi=phi1
    l1=linspace(phi,phi+pi,100);
    l2=linspace(pi+phi,2*pi+phi,100);
    c1=[cos(l1);sin(l1)];
    c2=[cos(l2);sin(l2)];
    fill(c1(1,:),c1(2,:),'w','EdgeColor','none')
    hold on;
    fill(c2(1,:),c2(2,:),'k','EdgeColor','none')

    c12=circle/2;
    c13=c12/2.5;
    c12(1,:)=c12(1,:)+cos(phi)/2;
    c12(2,:)=c12(2,:)+sin(phi)/2;
    c13(1,:)=c13(1,:)+cos(phi)/2;
    c13(2,:)=c13(2,:)+sin(phi)/2;
    c22=circle/2;
    c23=c22/2.5;
    c22(1,:)=c22(1,:)-cos(phi)/2;
    c22(2,:)=c22(2,:)-sin(phi)/2;
    c23(1,:)=c23(1,:)-cos(phi)/2;
    c23(2,:)=c23(2,:)-sin(phi)/2;

    fill(c12(1,:),c12(2,:),'w','EdgeColor','none')
    fill(c22(1,:),c22(2,:),'k','EdgeColor','none')
    fill(c13(1,:),c13(2,:),'k','EdgeColor','none')
    fill(c23(1,:),c23(2,:),'w','EdgeColor','none')
    plot(circle(1,:),circle(2,:),'k')
    hold off;
    axis equal;
    set(gca,'visible','off');
    drawnow()
end