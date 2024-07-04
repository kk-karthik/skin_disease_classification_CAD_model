% Convert I to grayscale if required.
I = imread('D:\Amrita_College\Amrita Semester 3 (Project Work)\Shrinithi Project\Final review sem_3\Dataset\Phase_1 Sem 3\Left_N\Left_1,2,3,4_Train_Size\Left_1 Train_size\A_1960_1.LEFT_MLO.LJPEG.png');
figure (1)
imshow(I);
[height,width,numChannels] = size(I);
if numChannels > 1
    grayImage = rgb2gray(I);
else
    grayImage = I;
end

%% Step 2: Select Point Locations for Feature Extraction
% Here, a regular spaced grid of point locations is created over I. This
% allows for dense SURF feature extraction. 

% Define a regular grid over I.
gridStep = 8; % in pixels
gridX = 1:gridStep:width;
gridY = 1:gridStep:height;

[x,y] = meshgrid(gridX, gridY);

gridLocations = [x(:) y(:)];

%%
% Concatenate multiple SURFPoint objects at different scales to achieve
% multiscale feature extraction.
% multiscaleGridPoints = cornerPoints(gridLocations); 
% multiscaleGridPoints1 = cornerPoints([2 3; 50 45]); 
multiscaleGridPoints2 = [SURFPoints(gridLocations, 'Scale', 1.6)]; 
% [features, valid_points] = extractFeatures(I, multiscaleGridPoints, "Method","SURF");
[features1, valid_points1] = extractFeatures(I, multiscaleGridPoints2, "Method","SURF");
imshow(I); hold on;
plot(multiscaleGridPoints2);
% featureMetric_1 = var(features,[],2);
% featureMetric_2 = var(single(features.Features),[],2);

% multiscaleGridPoints2 = [BRISKPoints(gridLocations, 'Scale', 1.6)]; 
%                        BRISKPoints(gridLocations, 'Scale', 3.2);
%                        BRISKPoints(gridLocations, 'Scale', 4.8);
%                        BRISKPoints(gridLocations, 'Scale', 6.4)];