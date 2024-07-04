%% Original image
I = imread('E:\Dataset DDSM_ROI\Density_wise\Density_3_Mass_model_phase_1+2\N+AN_D3_Train\AN_D3_Train\A_1622_1.LEFT_MLO.ROI.01.png');
% I1 = imread('E:\Dataset DDSM_ROI\Density_wise\Density_1_Mass_model_phase_1+2\N+AN_D1_Train\N_D1_Train\A_0013_1.LEFT_CC.ROI.01.png');
% I2 = imread('E:\Dataset DDSM_ROI\Density_wise\Density_1_Mass_model_phase_1+2\N+AN_D1_Train\N_D1_Train\A_0013_1.LEFT_CC.ROI.01.png');
% I3 = imread('E:\Dataset DDSM_ROI\Density_wise\Density_1_Mass_model_phase_1+2\N+AN_D1_Train\N_D1_Train\A_0013_1.LEFT_CC.ROI.01.png');
% I4 = imread('E:\Dataset DDSM_ROI\Density_wise\Density_1_Mass_model_phase_1+2\N+AN_D1_Train\N_D1_Train\A_0013_1.LEFT_CC.ROI.01.png');
% I5 = imread('E:\Dataset DDSM_ROI\Density_wise\Density_1_Mass_model_phase_1+2\N+AN_D1_Train\N_D1_Train\A_0013_1.LEFT_CC.ROI.01.png');
figure (1)
imshow(I);
% figure (2)
% imshow(I1);
% figure (3)
% imshow(I2);
% figure (4)
% imshow(I3);
% figure (5)
% imshow(I4);
% figure (6)
% imshow(I5);
[height,width] = size(I);
%% Keypoints detection 
gridStep = 8; % in pixels
gridX = 1:gridStep:width;
gridY = 1:gridStep:height;
[x,y] = meshgrid(gridX, gridY);
gridLocations = [x(:) y(:)];

% % SURF Points
% % SURF_Points = detectSURFFeatures(I, 'MetricThreshold',100, 'NumOctaves', 3, 'NumScaleLevels', 5);
% SURF_Points = [SURFPoints(gridLocations)];
% 
% %SIFT
% SIFT_Points = [SIFTPoints(gridLocations)]; 
% 
% %KAZE
% KAZE_Points = [KAZEPoints(gridLocations)]; 
% 
% %BRISK
% BRISK_Points = [BRISKPoints(gridLocations)]; 
% 
% %BRIEF
% BRIEF_Points = [cornerPoints(gridLocations)]; 

%ORB
ORB_Points = [ORBPoints(gridLocations)]; 
%% Feature description
% features = extractFeatures(I, SURF_Points, 'Method', 'SURF');
% features1 = extractFeatures(I1, SIFT_Points, 'Method', 'SURF');
% features2 = extractFeatures(I2, KAZE_Points, 'Method', 'SURF');
% features3 = extractFeatures(I3, BRISK_Points, 'Method', 'SURF');
% features4 = extractFeatures(I4, BRIEF_Points, 'Method', 'SURF');
features5 = extractFeatures(I, ORB_Points, 'Method', 'ORB');
%% Display keypoints
% figure(1)
% imshow(I); hold on;
% plot(SURF_Points);
% 
% figure(2)
% imshow(I1); hold on;
% plot(SIFT_Points);
% 
% figure(3)
% imshow(I2); hold on;
% plot(KAZE_Points);
% 
% figure(4)
% imshow(I3); hold on;
% plot(BRISK_Points);
% 
% figure(5)
% imshow(I4); hold on;
% plot(BRIEF_Points);

figure(6)
imshow(I); hold on;
plot(ORB_Points);