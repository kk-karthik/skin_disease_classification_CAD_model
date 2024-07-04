tic
files = dir('E:/Dataset DDSM_ROI/Density_wise/Density_4_Mass_model_phase_1+2/N+AN_D4_Test/AN_D4_Test/*.png');
Ex = zeros(numel(files), 20);
for i=1:numel(files)
    filename = fullfile(files(i).folder, files(i).name);
    a = imread(filename);
    figure (1)
    imshow (a)
    glcm = graycomatrix(a,'Offset',[0 1;-1 1;-1 0;-1 -1]);
    glcm1 = graycomatrix(a,'Offset',[0 1]);
    glcm2 = graycomatrix(a,'Offset',[-1 1]);
    glcm3 = graycomatrix(a,'Offset',[-1 0]);
    glcm4 = graycomatrix(a,'Offset',[-1 -1]);
    stats = graycoprops(glcm,{'contrast','correlation','energy','homogeneity'});
    Contrast = stats.Contrast;
    Correlation = stats.Correlation;
    Energy = stats.Energy;
    Homogeneity = stats.Homogeneity;
    Entropy_1 = entropy(glcm1);
    Entropy_2 = entropy(glcm2);
    Entropy_3 = entropy(glcm3);
    Entropy_4 = entropy(glcm4);
    thisFeatureVector = [Contrast, Correlation, Energy, Homogeneity, Entropy_1,Entropy_2,Entropy_3,Entropy_4];
    Ex(i, 1 : length(thisFeatureVector)) = thisFeatureVector;
    A = mean(Ex(:,[1 2 3 4]),2);
    B = mean(Ex(:,[5 6 7 8]),2);
    C = mean(Ex(:,[9 10 11 12]),2);
    D = mean(Ex(:,[13 14 15 16]),2);
    E = mean(Ex(:,[17 18 19 20]),2);
    thisFeatureVector_1 = [A,B,C,D,E];
end
toc
% load handel
% sound(y,Fs)
if numel(files) > 0
	writematrix('D:/Amrita_College/Amrita Semester 3 (Project Work)/Shrinithi Project/Work/Matlab codes/Trial codes/Feature extraction/GLCM Features/FE_GLCM_Right_4(WB).csv', thisFeatureVector_1);
end