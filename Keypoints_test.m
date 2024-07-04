% A = imread("E:\Dataset DDSM Normal\Left_Normal\Left_Normal_FGD_Train\Left_N D1 Train\A_1960_1.LEFT_MLO.LJPEG.png");
I = imread("E:\Dataset DDSM_ROI\Density_wise\Density_1_Mass_model_phase_1+2\N+AN_D1_Train\AN_D1_Train\B_3504_1.RIGHT_CC.ROI.01.png");
I1 = imread('E:\Dataset DDSM_ROI\Density_wise\Density_1_Mass_model_phase_1+2\N+AN_D1_Train\AN_D1_Train\B_3504_1.RIGHT_CC.ROI.01.png');
I2 = imread('E:\Dataset DDSM_ROI\Density_wise\Density_1_Mass_model_phase_1+2\N+AN_D1_Train\AN_D1_Train\B_3504_1.RIGHT_CC.ROI.01.png');
I3 = imread('E:\Dataset DDSM_ROI\Density_wise\Density_1_Mass_model_phase_1+2\N+AN_D1_Train\AN_D1_Train\B_3504_1.RIGHT_CC.ROI.01.png');
I4 = imread('E:\Dataset DDSM_ROI\Density_wise\Density_1_Mass_model_phase_1+2\N+AN_D1_Train\AN_D1_Train\B_3504_1.RIGHT_CC.ROI.01.png');
I5 = imread('E:\Dataset DDSM_ROI\Density_wise\Density_1_Mass_model_phase_1+2\N+AN_D1_Train\AN_D1_Train\B_3504_1.RIGHT_CC.ROI.01.png');

B = detectSURFFeatures(I, 'MetricThreshold',80, 'NumOctaves', 3, 'NumScaleLevels', 5);
% B = detectSURFFeatures(I);
[features, valid_points] = extractFeatures(I, B, 'Method', 'SURF', 'Upright',false);
figure(1)
imshow(I); hold on;
plot(B);

C = detectSIFTFeatures(I1, 'ContrastThreshold',0.003, 'EdgeThreshold', 10, 'NumLayersInOctave', 4, 'Sigma', 1.9);
% C = detectSIFTFeatures(I1);
[features1, valid_points1] = extractFeatures(I1, C, 'Method', 'SIFT','Upright',false);
figure(2)
imshow(I1); hold on;
plot(C);

D = detectKAZEFeatures(I2, 'Diffusion','region', 'Threshold', 0.00001, 'NumOctaves', 3, 'NumScaleLevels', 4);
% D = detectKAZEFeatures(I2);
[features2, valid_points2] = extractFeatures(I2, D, 'Method', 'KAZE','Upright',false);
figure(3)
imshow(I2); hold on;
plot(D);

E = detectBRISKFeatures(I3, 'MinContrast',0.001, 'MinQuality', 0.1, 'NumOctaves', 4);
% E = detectBRISKFeatures(I3);
[features3, valid_points3] = extractFeatures(I3, E, 'Method', 'SURF','Upright',false);
figure(4)
imshow(I3); hold on;
plot(E);

F = detectFASTFeatures(I4, 'MinContrast',0.05, 'MinQuality', 0.1);
% F = detectFASTFeatures(I4);
[features4, valid_points4] = extractFeatures(I4, F, 'Method', 'SURF','Upright',false);
figure(5)
imshow(I4); hold on;
plot(F);

G = detectORBFeatures(I5, 'ScaleFactor',1.1, 'NumLevels', 24);
% G = detectORBFeatures(I5);
[features5, valid_points5] = extractFeatures(I5, G, 'Method', 'ORB');
figure(6)
imshow(I5); hold on;
plot(G);

figure(7)
imshow(I);