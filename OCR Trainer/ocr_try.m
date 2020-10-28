x = imread('C:\Users\DELL\Desktop\mehran\m (1).JPEG');

%y=imcrop(x,[930 200 900 300]); corolla

%y=imcrop(x,[830 200 400 200]);
y=imcrop(x,[730 100 500 300]);      %mehran

x=rgb2gray(y);      

imshow(x)
 

txt = ocr(x,'Language','F:\project dip_t\CODE\mehran\tessdata\mehran.traineddata');
 disp(txt.Words);

 
%x = imread('C:\Users\DELL\Desktop\mehran\mehr.JPG');

%y=imcrop(x,[930 200 900 300]); corolla

%y=imcrop(x,[830 200 300 900]);
%x=im2bw(x);
%BW1 = edge(x,'sobel');
%x=rgb2gray(x);
%imshow(x)
 


%txt = ocr(x,'Language','F:\project dip_t\CODE\mehran\tessdata\mehran.traineddata');
%disp(txt.Words);

 
 
 