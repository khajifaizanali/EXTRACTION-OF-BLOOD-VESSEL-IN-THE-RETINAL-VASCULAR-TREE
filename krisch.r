clc;
clear all;
close all;
I=imread;
I=rgb2gray(I);
dim=ndims(I);
Threshold=9;
bloodVessels=VesselExtract(I,Threshold);
figure;
imshow(bloodVessels);
title(’Extracted Blood Vessels’);
function bloodVessels=VesselExtract(inImg,threshold)
h1=[5 -3 -3;
5 0 -3;
5 -3 -3]/15;
h2=[-3 -3 5;
-3 0 5;
-3 -3 5]/15;
h3=[-3 -3 -3;
5 0 -3;
5 5 -3]/15;
h4=[-3 5 5;
-3 0 5;
-3 -3 -3]/15;
h5=[-3 -3 -3;
-3 0 -3;
5 5 5]/15;
h6=[5 5 5;
-3 0 -3;
-3 -3 -3]/15;
h7=[-3 -3 -3;
-3 0 5;
-3 5 5]/15;
h8=[5 5 -3;
5 0 3;
-3 -3 -3]/15;
t1=filter(h1,inImg);
t2=filter(h2,inImg);
t3=filter(h3,inImg);
t4=filter(h4,inImg);
t5=filter(h5,inImg);
10
t6=filter(h6,inImg);
t7=filter(h7,inImg);
t8=filter(h8,inImg);
s=size(inImg)
bloodVessels=zeros(s(1),s(2));
temp=zeros(1,8);
for i=1:s(1)
for j=1:s(2)
temp(1)=t1(i,j);temp(2)=t2(i,j);temp3=t3(i,j);temp4=t4(i,j);
temp(5)=t5(i,j);temp(6)=t6(i,j);temp7=t7(i,j);temp8=t8(i,j);
if(max(temp)¿threshold)
bloodvessels(i,j)=max(temp);
end
end
end
end
