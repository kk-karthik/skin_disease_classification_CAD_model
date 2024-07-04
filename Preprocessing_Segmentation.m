%% Breast Density Classification Model
%% Pre-processing and Segmentation
%% Left Image CC View
% Original Input Image
A = imread('E:\Dataset DDSM Abnormal_2\Dataset DDSM Benign_2\Left_Benign\Left_1B\Left_1 BMF CC (WB)\A_1545_1.LEFT_CC.LJPEG.png');
[m,n] = size (A);
figure(1)
imshow(A);
title('Original Image')
% Cropped Image
A([1:49,m-50:m],:) = [];
figure(2)
imshow(A);
title('Cropped Original Image')
% Binary Image
B = imbinarize(A);
se = strel('line',40,40);
B = imdilate(B,se);
figure(3)
imshow (B);
title('Binary Image')
%% Label removal
C = bwareafilt(B, 1);
figure (4)
imshow (C);
title('Breast Image without label B&W')
D = A;
D(~C) = 0;
figure(5)
imshow(D);
title('Breast Image without label')
%% Noise removal
[G,noise_out] = wiener2(D,[5 5]);
D( :, ~any(D,1) ) = [];
figure(6)
imshow(D);
title('Noise Removed Image')
%% Contrast enhancement
H = adapthisteq(G);
figure (7)
imshowpair(G,H,'montage');
title('Original Image (left) and Contrast Enhanced Image (right)');
figure (8)
imshow(H);
title('Contrast Enhanced Image');
%% Extraction of ROI from FGD region
im_bw = imbinarize(H);
im_bw1 = imcomplement (im_bw);

% Sum over all the columns for each row
row_sums = sum(im_bw1, 2);

% Find row with min sum
[~,row_max] = min(row_sums);

H(row_max,:);
Ca = size(H,2);
mid = round(Ca/2);
H(:, mid);
figure (9)
imshow(H)
title('Centre point and FGD region')
impixelinfo;
hold on;
axis on;
plot(mid,row_max, 'r+', 'MarkerSize', 10, 'LineWidth', 2);
R = rectangle('Position',[mid-1000, row_max-512, 1024, 1024],'EdgeColor', 'r','LineWidth', 2,'LineStyle','-');
ROI = imcrop(H, [mid-1000 row_max-512 1024 1024]);
figure (10)
imshow(ROI);
title('Extracted FGD region')
imwrite(ROI, '1968_Left_CC.png')
%% Right Image CC View
% Original Input Image
A1 = imread('E:/Dataset DDSM Normal_2/Right_Normal_2_Extra/Right_1 N/Right_1 N CC/A_1968_1.RIGHT_CC.LJPEG.png');
[m1,n1] = size (A1);
figure(11)
imshow(A1);
title('Original Image')
% Cropped Image
A1([1:49,m1-50:m1],:) = [];
figure(12)
imshow(A1);
title('Cropped Original Image')
% Binary Image
B1 = imbinarize(A1);
se = strel('line',40,40);
B1 = imdilate(B1,se);
figure(13)
imshow (B1);
title('Binary Image')
%% Label removal
C1 = bwareafilt(B1, 1);
figure (14)
imshow (C1);
title('Breast Image without label B&W')
D1 = A1;
D1(~C1) = 0;
figure(15)
imshow(D1);
title('Breast Image without label')
%% Noise removal
[G1,noise_out1] = wiener2(D1,[5 5]);
D1( :, ~any(D1,1) ) = [];
figure(16)
imshow(D1);
title('Noise Removed Image')
%% Contrast enhancement
H1 = adapthisteq(G1);
figure (17)
imshowpair(G1,H1,'montage');
title('Original Image (left) and Contrast Enhanced Image (right)');
figure (18)
imshow(H1);
title('Contrast Enhanced Image');
%% Extraction of ROI from FGD region
im_bw1 = imbinarize(H1);
im_bw11 = imcomplement (im_bw1);

% Sum over all the columns for each row
row_sums1 = sum(im_bw11, 2);

% Find row with min sum
[~,row_max1] = min(row_sums1);

H1(row_max1,:);
Cb = size(H1,2);
mid1 = round(Cb/2);
H1(:, mid1);
figure (19)
imshow(H1)
title('Centre point and FGD region')
impixelinfo;
hold on;
axis on;
plot(mid1,row_max1, 'r+', 'MarkerSize', 10, 'LineWidth', 2);
R1 = rectangle('Position',[mid1+100, row_max1-512, 1024, 1024],'EdgeColor', 'r','LineWidth', 2,'LineStyle','-');
ROI1 = imcrop(H1, [mid1+100 row_max1-512 1024 1024]);
figure (20)
imshow(ROI1);
title('Extracted FGD region')
imwrite(ROI1, '1968_Right_CC.png')
%% Left Image MLO View
% Original image
A2 = imread('E:/Dataset DDSM Normal_2/Left_Normal_2_Extra/Left_1 N/Left_1 N MLO/A_1968_1.LEFT_MLO.LJPEG.png');
[m2,n2] = size (A2);
figure(21)
imshow(A2);
title('Original Image')
% Cropping the top and bottom rows
A2([1:299,m2-300:m2],:) = [];
figure(22)
imshow(A2);
title('Cropped Original Image')
%% Binary image
B2 = imbinarize(A2);
se = strel('line',40,40);
B2 = imdilate(B2,se);
figure(23)
imshow (B2);
title('Binary Image')
%% Label removal
C2 = bwareafilt(B2, 1);
D2 = A2;
D2(~C2) = 0;
figure(24)
imshow(D2);
title('Breast and Muscle Image')
%% Pectoral muscle removal
E2 = imcomplement(C2);
imshow(E2);
F2 = ~bwconvhull(E2);
D2(F2) = 0;
figure(25)
imshow(D2);
title('Breast image')
%% Noise removal
[G2,noise_out2] = wiener2(D2,[5 5]);
% g( :, ~any(g,1) ) = [];
figure(26)
imshow(G2);
title('Noise Removed Image')
%% Contrast enhancement
H2 = adapthisteq(G2);
figure (27)
imshowpair(G2,H2,'montage');
title('Original Image (left) and Contrast Enhanced Image (right)');
figure (28)
imshow(H2);
title('Contrast Enhanced Image');
%% Longest horizontal and vertical line
im_bw2 = imbinarize(H2);
im_bw12 = imcomplement (im_bw2);

% Sum over all the columns for each row
row_sums2 = sum(im_bw12, 2);
% Sum over all the rows for each column
col_sums2 = sum(im_bw12);

% Find row with min sum
[~,row_max2] = min(row_sums2);
% Find column with min sum
[~,col_max2] = min(col_sums2);

H2(row_max2,:);
H2(:, col_max2);
figure (29)
imshow(H2)
title('Centre point and FGD region')
impixelinfo;
hold on;
axis on;
plot(col_max2,row_max2, 'r+', 'MarkerSize', 10, 'LineWidth', 2);
rectangle('Position',[col_max2-512, row_max2-512, 1024, 1024],'EdgeColor', 'r','LineWidth', 2,'LineStyle','-');
ROI2 = imcrop(H2, [col_max2-512 row_max2-512 1024 1024]);
figure (30)
imshow(ROI2);
title('Extracted FGD region')
imwrite(ROI2, '1968_Left_MLO.png')
%% Right Image MLO View
% Original image
A3 = imread('E:/Dataset DDSM Normal_2/Right_Normal_2_Extra/Right_1 N/Right_1 N MLO/A_1968_1.RIGHT_MLO.LJPEG.png');
[m3,n3] = size (A3);
figure(31)
imshow(A3);
title('Original Image')
% Cropping the top and bottom rows
A3([1:299,m3-300:m3],:) = [];
figure(32)
imshow(A3);
title('Cropped Original Image')
%% Binary image
B3 = imbinarize(A3);
se = strel('line',40,40);
B3 = imdilate(B3,se);
figure(33)
imshow (B3);
title('Binary Image')
%% Label removal
C3 = bwareafilt(B3, 1);
D3 = A3;
D3(~C3) = 0;
figure(34)
imshow(D3);
title('Breast and Muscle Image')
%% Pectoral muscle removal
E3 = imcomplement(C3);
imshow(E3);
F3 = ~bwconvhull(E3);
D3(F3) = 0;
figure(35)
imshow(D3);
title('Breast image')
%% Noise removal
[G3,noise_out3] = wiener2(D3,[5 5]);
% g( :, ~any(g,1) ) = [];
figure(36)
imshow(G3);
title('Noise Removed Image')
%% Contrast enhancement
H3 = adapthisteq(G3);
figure (37)
imshowpair(G3,H3,'montage');
title('Original Image (left) and Contrast Enhanced Image (right)');
figure (38)
imshow(H3);
title('Contrast Enhanced Image');
%% Longest horizontal and vertical line
im_bw3 = imbinarize(H2);
im_bw13 = imcomplement (im_bw3);

% Sum over all the columns for each row
row_sums3 = sum(im_bw13, 2);
% Sum over all the rows for each column
col_sums3 = sum(im_bw13);

% Find row with min sum
[~,row_max3] = min(row_sums3);
% Find column with min sum
[~,col_max3] = min(col_sums3);

H3(row_max3,:);
H3(:, col_max3);
figure (39)
imshow(H3)
title('Centre point and FGD region')
impixelinfo;
hold on;
axis on;
plot(col_max3,row_max3, 'r+', 'MarkerSize', 10, 'LineWidth', 2);
rectangle('Position',[col_max3-512, row_max3-512, 1024, 1024],'EdgeColor', 'r','LineWidth', 2,'LineStyle','-');
ROI3 = imcrop(H3, [col_max3-512 row_max3-512 1024 1024]);
figure (40)
imshow(ROI3);
title('Extracted FGD region')
% imwrite(ROI3, '1968_Right_MLO.png')