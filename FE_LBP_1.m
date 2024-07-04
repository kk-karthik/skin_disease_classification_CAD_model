% % One image
% A = imread("D:/Amrita_College/Amrita Semester 3 (Project Work)/Shrinithi Project/Final review sem_3/Dataset/Phase_1 Sem 3/Left_N/Left_1,2,3,4_Train_Size/Left_4 Train_size/A_1971_1.LEFT_CC.LJPEG.png");
% B = extractLBPFeatures(A, 'NumNeighbors',8,  'Radius',1);

% Group of images
tic
files = dir("C:\project\feature extraction\Basal cell carcinoma\BCC_G_Texture\*.jpg");
Ex_3 = zeros(numel(files), 59); % Preallocate a row for every file.
for i=1:numel(files)
    filename = fullfile(files(i).folder, files(i).name);
    A = imread(filename);
    figure (1)
    imshow (A)
    B = extractLBPFeatures(A, 'NumNeighbors',8,  'Radius',1);
    thisFeatureVector = B;
    Ex_3(i, 1 : length(B)) = B;
end
toc
load handel
sound(y,Fs)

% if numel(files) > 0
%  	writematrix('D:/Amrita_College/Amrita Semester 3 (Project Work)/Shrinithi Project/Work/Matlab codes/Trial codes/Feature extraction/LBP Features/LBP_FGD/LBP_FGD (1,8)/FE_LBP_Left_4N (1,8).csv', Ex_3);
% end