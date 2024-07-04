%% Original image
% Original image
a1 = imread('E:\Dataset DDSM Normal_2\Right_Normal_2_Extra\Right_1 N\Right_1 N CC\A_1960_1.RIGHT_CC.LJPEG.png');
[m,n] = size (a1);
figure(1)
imshow(a1);
title('Original Image')
% Cropping image
a = imread('E:\Dataset DDSM Normal_2\Right_Normal_2_Extra\Right_1 N\Right_1 N CC\A_1960_1.RIGHT_CC.LJPEG.png');
a([1:49,m-50:m],:) = [];
figure(2)
imshow(a);
title('Cropped Original Image')
%% Binary image
b1 = imbinarize(a);
se = strel('line',40,40);
b = imdilate(b1,se);
figure(3)
imshow (b);
title('Original Binary Image')
%% Label removal
c = bwareafilt(b, 1);
figure (4)
imshow (c);
title('Breast Image without label B&W')
d = a;
d(~c) = 0;
figure(5)
imshow(d);
title('Breast Image without label')
%% Noise removal
[g,noise_out] = wiener2(d,[5 5]);
g( :, ~any(g,1) ) = [];
figure(6)
imshow(g);
title('Noise Removed Image')
%% Contrast enhancement
h = adapthisteq(g);
figure (7)
imshowpair(g,h,'montage');
title('Original Image (left) and Contrast Enhanced Image (right)');
figure (8)
imshow(h);
title('Contrast Enhanced Image');
%% Longest horizontal and vertical line
im_bw = imbinarize(h);
figure (9)
imshow(im_bw)
title('Binary image 3')
im_bw1 = imcomplement (im_bw);
figure (10)
imshow(im_bw1)
title('Binary image 4')

% Sum over all the columns for each row
row_sums = sum(im_bw1, 2);

% Find row with min sum
[~,row_max] = min(row_sums);

h(row_max,:);
c = size(h,2);
mid = round(c/2);
h(:, mid);
figure (11)
imshow(h)
title('Centre point and FGD region')
impixelinfo;
hold on;
axis on;
plot(mid,row_max, 'r+', 'MarkerSize', 10, 'LineWidth', 2);
r = rectangle('Position',[mid+100, row_max-512, 1024, 1024],'EdgeColor', 'r','LineWidth', 2,'LineStyle','-');
ROI = imcrop(h, [mid+100 row_max-512 1024 1024]);
figure (12)
imshow(ROI);
title('Extracted FGD region')
meanIntensityValue = mean(ROI(:));
% imwrite(ROI, '1968_FGD_MLO.png')