%% Original image
% Original image
a1 = imread('E:\Dataset DDSM Normal_2\Left_Normal_2_Extra\Left_1 N\Left_1 N MLO\A_1968_1.LEFT_MLO.LJPEG.png');
[m,n] = size (a1);
figure(1)
imshow(a1);
title('Original Image')
% Cropping the top and bottom rows
a= imread('E:\Dataset DDSM Normal_2\Left_Normal_2_Extra\Left_1 N\Left_1 N MLO\A_1968_1.LEFT_MLO.LJPEG.png');
a([1:299,m-300:m],:) = [];
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
d = a;
d(~c) = 0;
figure(4)
imshow(d);
title('Breast and Muscle Image')
%% Pectoral muscle removal
e = imcomplement(c);
figure(5)
imshow(e);
title('Binary Image 2')
f = ~bwconvhull(e);
d(f) = 0;
figure(6)
imshow(d);
title('Breast image')
%% Noise removal
[g,noise_out] = wiener2(d,[5 5]);
g( :, ~any(g,1) ) = [];
figure(7)
imshow(g);
title('Noise Removed Image')
%% Contrast enhancement
h = adapthisteq(g);
figure (8)
imshowpair(g,h,'montage');
title('Original Image (left) and Contrast Enhanced Image (right)');
figure (9)
imshow(h);
title('Contrast Enhanced Image');
%% Longest horizontal and vertical line
im_bw = imbinarize(h);
figure (10)
imshow(im_bw)
title('Binary image 3')
im_bw1 = imcomplement (im_bw);
figure (11)
imshow(im_bw1)
title('Binary image 4')

% Sum over all the columns for each row
row_sums = sum(im_bw1, 2);
% Sum over all the rows for each column
col_sums = sum(im_bw1);

% Find row with min sum
[~,row_max] = min(row_sums);
% Find column with min sum
[~,col_max] = min(col_sums);

h(row_max,:);
h(:, col_max);
figure (12)
imshow(h)
title('Centre point and FGD region')
impixelinfo;
hold on;
axis on;
plot(col_max,row_max, 'r+', 'MarkerSize', 10, 'LineWidth', 2);
rectangle('Position',[col_max-512, row_max-512, 1024, 1024],'EdgeColor', 'r','LineWidth', 2,'LineStyle','-');
f = gcf;
exportgraphics(f,'1.png')
ROI = imcrop(h, [col_max-512 row_max-512 1024 1024]);
figure (13)
imshow(ROI);
title('Extracted FGD region')
% imwrite(ROI, '1968_FGD_MLO.png')