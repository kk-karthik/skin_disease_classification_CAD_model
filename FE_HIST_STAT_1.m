tic
files = dir('E:/Dataset DDSM_ROI/Density_wise/Density_4_Mass_model_phase_1+2/N+AN_D4_Test/AN_D4_Test/*.png');
Ex_1 = zeros(numel(files), 5);
for i=1:numel(files)
    filename = fullfile(files(i).folder, files(i).name);
    A = imread(filename);
    figure (1)
    imshow (A)
    A1 = histogram (A);
    B = imhist(A);
    B1 = B./sum(B);
    C = mean2(A);
    D = std (B1);
    E = var (B1);
    F = skewness(B1);
    G = kurtosis(B1);
    thisFeatureVector = [C, D , E, F, G];
    Ex_1(i, 1 : length(thisFeatureVector)) = thisFeatureVector;
end
toc
load handel
sound(y,Fs)
% if numel(files) > 0
%    writematrix('D:/Amrita_College/Amrita Semester 3 (Project Work)/Shrinithi Project/Work/Matlab codes/Trial codes/Feature extraction/HIST_STAT Features/FE_HIST_Right_4N (WB).csv', Ex_1);
% end