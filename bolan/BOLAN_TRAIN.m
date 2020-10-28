x = imread('C:\Users\DELL\Desktop\mehran\mehrrr.JPG');

%y=imcrop(x,[930 200 900 300]); corolla

%y=imcrop(x,[930 400 800 400]);
x=rgb2gray(x);

imshow(x)
 

txt = ocr(x,'Language','F:\project dip_t\CODE\mehran\tessdata\mehran.traineddata');
 disp(txt.Words);
