files = dir('E:/Dataset DDSM Cancer/Right_Cancer/Right_4 C/Right_4 CMF MLO/*.png');
for i=1:numel(files)
    %% Read original image
    filename = fullfile(files(i).folder, files(i).name);
    a = imread(filename);
    % Original image
    [m,n] = size (a);
    % Cropping the top and bottom rows
    a([1:299,m-300:m],:) = [];
    figure(1)
    imshow(a);
    title('Cropped Original Image')
    %% Binary image
    b1 = imbinarize(a);
    se = strel('line',40,40);
    b = imdilate(b1,se);
    figure(2)
    imshow (b);
    title('Original Binary Image')
    %% Label removal
    c = bwareafilt(b, 1);
    d = a;
    d(~c) = 0;
    figure(3)
    imshow(d);
    title('Breast and Muscle Image')
    %% Pectoral muscle removal
    e = imcomplement(c);
    figure(4)
    imshow(e);
    title('Binary Image 2')
    f = ~bwconvhull(e);
    d(f) = 0;
    figure(5)
    imshow(d);
    title('Breast image')
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
    % Sum over all the rows for each column
    col_sums = sum(im_bw1);

    % Find row with min sum
    [~,row_max] = min(row_sums);
    % Find column with min sum
    [~,col_max] = min(col_sums);

    h(row_max,:);
    h(:, col_max);
    imshow(h)
    title('Centre point and FGD region')
    impixelinfo;
    hold on;
    axis on;
    plot(col_max,row_max, 'r+', 'MarkerSize', 10, 'LineWidth', 2);
    rectangle('Position',[col_max-212, row_max-512, 1024, 1024],'EdgeColor', 'r','LineWidth', 2,'LineStyle','-');
    ROI = imcrop(h, [col_max-212 row_max-512 1024 1024]);
    figure (12)
    imshow(ROI);
    title('Extracted FGD region')
    %% Save images
    newfilename=fullfile('E:/Dataset DDSM Cancer/Right_Cancer/Right_4 C/Right_4 CMF MLO/Right_4 CMF MLO (FGD)/',files(i).name);
    imwrite(ROI,newfilename,'png');
end