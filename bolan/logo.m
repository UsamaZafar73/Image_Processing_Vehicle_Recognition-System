logo = (imread('20.jpeg'));
car = (imread('18_logo.JPG'));
montage({car,logo})

 
c = normxcorr2(car,logo);
surf(c)
shading flat


[ypeak,xpeak] = find(c==max(c(:)));

yoffSet = ypeak-size(car,1);
xoffSet = xpeak-size(car,2);

imshow(logo)
drawrectangle(gca,'Position',[xoffSet,yoffSet,size(car,2),size(car,1)], ...
    'FaceAlpha',0);