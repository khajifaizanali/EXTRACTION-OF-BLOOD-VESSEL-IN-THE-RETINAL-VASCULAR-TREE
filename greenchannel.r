clear all;
close all;
clc;
I=imread;
figure,imshow(I);
I=imresize(I,[500 700]);
greenc=I(:,:,2);
ginv=imcomplement(greenc);
adahist=adapthisteq(ginv);
se=strel(’ball’,8,8);
gopen=imopen(adahist,se);
godisk=adahist-gopen;
medfilt=medfilt2(godisk);
background=imopen(medfilt,strel(’disk’,15));
I2=medfilt-background;
I3=imadjust(I2);
level=graythresh(I3);
bw=im2bw(I3,level);
bw=bwareaopen(bw,30);
figure,imshow(bw);
wname=’sym4’;
CA,CH,CV,CD=dwt2(bw,wname,’mode’,”per”);
figure,imshow(CA),title(’Approximate’);
b=bwboundaries(bw);
figure,imshow(I)
hold on
11
for k=1:numel(b)
plot(bk(:,2),bk(:,1),’b’,’Linewidth’,1)
end
