%% Region Growing

%read image
%I = im2double(imread('./images/coins.png'));
I = im2double(imread('./images/lena.png'));
if size(I,3) > 1
    I = rgb2gray(I);
end
figure(1);
imshow(I);
% Select region by click
[y,x] = getpts;
x_start = round(x);
y_start = round(y);
S = region_growing(I,x_start,y_start,0.15);

imshow(S);
imwrite(S,'./images/segment_lena.png');
%hold on;
%contour(S,'b');


