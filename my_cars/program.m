x = imread('C:\Users\DELL\Desktop\toyota\12 (4).JPEG');

%y=imcrop(x,[930 200 900 300]); corolla

%y=imcrop(x,[830 200 400 200]);
%x=imcrop(x,[730 100 500 200]);      %mehran

x=rgb2gray(x);      

imshow(x)
 

txt = ocr(x,'Language','C:\Users\DELL\Desktop\suzuki\tessdata\suzuki.traineddata');
 disp(txt.Words);