% A = imread('E:\Dataset DDSM_ROI\Density_wise\Density_1_Mass_model_phase_1+2\N+AN_D1_Train\N_D1_Train\A_0013_1.LEFT_CC.ROI.01_d1.png');
% wavelength = [3 4 5 6];
% orientation = [0 45 90 135];

%For group of iamges
files = dir('E:/Dataset DDSM_ROI/Density_wise/Density_1_Mass_model_phase_1+2/N+AN_D1_Train/AN_D1_Train/*.png');
Ex_2 = zeros(numel(files), 64);
for i=1:numel(files)
    filename = fullfile(files(i).folder, files(i).name);
    A = imread(filename);
    figure (1)
    imshow (A)

    g1 = gabor(3,0);
    [Mag1, Phase1] = imgaborfilt(A,g1);
    g2 = gabor(3,45);
    [Mag2, Phase2] = imgaborfilt(A,g2);
    g3 = gabor(3,90);
    [Mag3, Phase3] = imgaborfilt(A,g3);
    g4 = gabor(3,135);
    [Mag4, Phase4] = imgaborfilt(A,g4);
    g5 = gabor(4,0);
    [Mag5, Phase5] = imgaborfilt(A,g5);
    g6 = gabor(4,45);
    [Mag6, Phase6] = imgaborfilt(A,g6);
    g7 = gabor(4,90);
    [Mag7, Phase7] = imgaborfilt(A,g7);
    g8 = gabor(4,135);
    [Mag8, Phase8] = imgaborfilt(A,g8);
    g9 = gabor(5,0);
    [Mag9, Phase9] = imgaborfilt(A,g9);
    g10 = gabor(5,45);
    [Mag10, Phase10] = imgaborfilt(A,g10);
    g11 = gabor(5,90);
    [Mag11, Phase11] = imgaborfilt(A,g11);
    g12 = gabor(5,135);
    [Mag12, Phase12] = imgaborfilt(A,g12);
    g13 = gabor(6,0);
    [Mag13, Phase13] = imgaborfilt(A,g13);
    g14 = gabor(6,45);
    [Mag14, Phase14] = imgaborfilt(A,g14);
    g15 = gabor(6,90);
    [Mag15, Phase15] = imgaborfilt(A,g15);
    g16 = gabor(6,135);
    [Mag16, Phase16] = imgaborfilt(A,g16);
    
    B1 = mean2(Mag1);
    C1 = std2(Mag1);
    D1 = mean2(Phase1);
    E1 = std2(Phase1);
    
    B2 = mean2(Mag2);
    C2 = std2(Mag2);
    D2 = mean2(Phase2);
    E2 = std2(Phase2);
    
    B3 = mean2(Mag3);
    C3 = std2(Mag3);
    D3 = mean2(Phase3);
    E3 = std2(Phase3);
    
    B4 = mean2(Mag4);
    C4 = std2(Mag4);
    D4 = mean2(Phase4);
    E4 = std2(Phase4);
    
    B5 = mean2(Mag5);
    C5 = std2(Mag5);
    D5 = mean2(Phase5);
    E5 = std2(Phase5);
    
    B6 = mean2(Mag6);
    C6 = std2(Mag6);
    D6 = mean2(Phase6);
    E6 = std2(Phase6);
    
    B7 = mean2(Mag7);
    C7 = std2(Mag7);
    D7 = mean2(Phase7);
    E7 = std2(Phase7);
    
    B8 = mean2(Mag8);
    C8 = std2(Mag8);
    D8 = mean2(Phase8);
    E8 = std2(Phase8);
    
    B9 = mean2(Mag9);
    C9 = std2(Mag9);
    D9 = mean2(Phase9);
    E9 = std2(Phase9);
    
    B10 = mean2(Mag10);
    C10 = std2(Mag10);
    D10 = mean2(Phase10);
    E10 = std2(Phase10);
    
    B11 = mean2(Mag11);
    C11 = std2(Mag11);
    D11 = mean2(Phase11);
    E11 = std2(Phase11);
    
    B12 = mean2(Mag12);
    C12 = std2(Mag12);
    D12 = mean2(Phase12);
    E12 = std2(Phase12);
    
    B13 = mean2(Mag13);
    C13 = std2(Mag13);
    D13 = mean2(Phase13);
    E13 = std2(Phase13);
    
    B14 = mean2(Mag14);
    C14 = std2(Mag14);
    D14 = mean2(Phase14);
    E14 = std2(Phase14);
    
    B15 = mean2(Mag15);
    C15 = std2(Mag15);
    D15 = mean2(Phase15);
    E15 = std2(Phase15);
    
    B16 = mean2(Mag16);
    C16 = std2(Mag16);
    D16 = mean2(Phase16);
    E16 = std2(Phase16);

    thisFeatureVector = [B1,C1,D1,E1,B2,C2,D2,E2,B3,C3,D3,E3,B4,C4,D4,E4,B5,C5,D5,E5,B6,C6,D6,E6,B7,C7,D7,E7,B8,C8,D8,E8,B9,C9,D9,E9,B10,C10,D10,E10,B11,C11,D11,E11,B12,C12,D12,E12,B13,C13,D13,E13,B14,C14,D14,E14,B15,C15,D15,E15,B16,C16,D16,E16];
    Ex_2(i, 1 : length(thisFeatureVector)) = thisFeatureVector;
end
% if numel(files) > 0
% 	csvwrite('C:\Users\Shrinithi\Desktop\Gabor_Trial.csv', Ex_2);
% end