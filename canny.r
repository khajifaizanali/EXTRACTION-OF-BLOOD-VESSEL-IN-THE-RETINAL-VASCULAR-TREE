clc;
clear all;
close all;
I=imread;
grayeye1=rgb2gray(I);
dgrayeye1=imadjust(grayeye1,[0.1 0.9],[]);
se=strel(’disk’,1);
cannyeye=edge(dgrayeye1,’canny’,0.15);
dilate=imdilate(cannyeye,se);
figure,imshow(dilate);
title(’Extracted Blood Vessels’);