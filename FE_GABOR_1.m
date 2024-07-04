%For one image
% A = imread('E:\Dataset DDSM_ROI\Density_wise\Density_1_Mass_model_phase_1+2\N+AN_D1_Train\N_D1_Train\A_0013_1.LEFT_CC.ROI.01_d1.png');
% wavelength = [3 4 5 6];
% orientation = [0 45 90 135];
% g = gabor(wavelength,orientation);
% outMag = imgaborfilt(A,g);
% B = mean2(outMag);
% C = std2(outMag);

%For group of iamges
tic
files = dir("C:\final dataset\squamous cell carinoma\training_squa\G_Texture_squa_train/*.jpg");
Ex_21 = zeros(numel(files), 2);
for i=1:numel(files)
    filename = fullfile(files(i).folder, files(i).name);
    A = imread(filename);
    figure (1)
    imshow (A)
    wavelength = [3 4 5 6];
    orientation = [0 45 90 135];
    G= gabor(wavelength,orientation);
    outMag = imgaborfilt(A,G);
    B = mean2(outMag);
    C = std2(outMag);
    thisFeatureVector = [B, C];
    Ex_21(i, 1 : length(thisFeatureVector)) = thisFeatureVector;
end
% toc
% load handel
% sound(y,Fs)
if numel(files) > 0
 	writematrix(Ex_21,"C:\final dataset\squamous cell carinoma\training_squa\GABOR_feature_squa_train.csv");
end