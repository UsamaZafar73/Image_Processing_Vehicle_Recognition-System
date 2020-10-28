
a=imread("F:\project dip_t\Compressed\OwnCollection\vehicles\MiddleClose\image0473.png");

a(r,c)=size(a)
for i=1:1:r
    for j=1:1:c
result(i, j)= 0.59 * R(i, j) + 0.30*G(i, j)+0.11*B(i, j)
    end
end
 
imshow(r);

