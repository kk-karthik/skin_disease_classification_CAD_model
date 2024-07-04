tic
% trainingSet = imageDatastore('D:/Amrita_College/Amrita Semester 3 (Project Work)/Shrinithi Project/Final review sem_3/Dataset/Phase_1 Sem 3/Right_N/Right_1,2,3,4_Train_Size','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
trainingSet = imageDatastore('E:/Dataset DDSM_ROI/Density_wise/Density_4_Mass_model_phase_1+2/N+AN_D4_Train','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
% trainingSet_less = imageDatastore('E:/Dataset DDSM_ROI/Density_wise/Density_3_Mass_model_phase_1+2/N+AN_D3_Train_Less','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
tbl = countEachLabel(trainingSet);
extractorFcn = @exampleBagOfFeaturesExtractororbtwice;
bag = bagOfFeatures(trainingSet,'GridStep',[8 8],'VocabularySize',150, 'StrongestFeatures', 1, 'CustomExtractor',extractorFcn);
A_train = encode(bag, trainingSet);
% testSet = imageDatastore('D:/Amrita_College/Amrita Semester 3 (Project Work)/Shrinithi Proje ct/Final review sem_3/Dataset/Phase_1 Sem 3/Right_N/Right_1,2,3,4_Test_Size','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
testSet = imageDatastore('E:/Dataset DDSM_ROI/Density_wise/Density_4_Mass_model_phase_1+2/N+AN_D4_Test','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
tbl_1 = countEachLabel(testSet);
B_test = encode(bag, testSet);
toc
load handel
sound(y,Fs)

% tic
% % trainingSet = imageDatastore('D:/Amrita_College/Amrita Semester 3 (Project Work)/Shrinithi Project/Final review sem_3/Dataset/Phase_1 Sem 3/Right_N/Right_1,2,3,4_Train_Size','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
% trainingSet1 = imageDatastore('E:/Dataset DDSM_ROI/Density_wise/Density_4_Mass_model_phase_1+2/N+AN_D4_Train','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
% % trainingSet_less = imageDatastore('E:/Dataset DDSM_ROI/Density_wise/Density_3_Mass_model_phase_1+2/N+AN_D3_Train_Less','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
% tbl1 = countEachLabel(trainingSet1);
% extractorFcn = @exampleBagOfFeaturesExtractororbtwice;
% bag1 = bagOfFeatures(trainingSet1,'GridStep',[8 8],'VocabularySize',150, 'StrongestFeatures', 0.8, 'CustomExtractor',extractorFcn);
% A_train1 = encode(bag1, trainingSet1);
% % testSet = imageDatastore('D:/Amrita_College/Amrita Semester 3 (Project Work)/Shrinithi Project/Final review sem_3/Dataset/Phase_1 Sem 3/Right_N/Right_1,2,3,4_Test_Size','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
% testSet1 = imageDatastore('E:/Dataset DDSM_ROI/Density_wise/Density_4_Mass_model_phase_1+2/N+AN_D4_Test','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
% tbl_11 = countEachLabel(testSet1);
% B_test1 = encode(bag1, testSet1);
% toc
% load handel
% sound(y,Fs)
% 
% tic
% % trainingSet = imageDatastore('D:/Amrita_College/Amrita Semester 3 (Project Work)/Shrinithi Project/Final review sem_3/Dataset/Phase_1 Sem 3/Right_N/Right_1,2,3,4_Train_Size','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
% trainingSet2 = imageDatastore('E:/Dataset DDSM_ROI/Density_wise/Density_4_Mass_model_phase_1+2/N+AN_D4_Train','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
% % trainingSet_less = imageDatastore('E:/Dataset DDSM_ROI/Density_wise/Density_3_Mass_model_phase_1+2/N+AN_D3_Train_Less','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
% tbl2 = countEachLabel(trainingSet2);
% extractorFcn = @exampleBagOfFeaturesExtractororbtwice;
% bag2 = bagOfFeatures(trainingSet2,'GridStep',[8 8],'VocabularySize',150, 'StrongestFeatures', 0.9, 'CustomExtractor',extractorFcn);
% A_train2 = encode(bag2, trainingSet2);
% % testSet = imageDatastore('D:/Amrita_College/Amrita Semester 3 (Project Work)/Shrinithi Project/Final review sem_3/Dataset/Phase_1 Sem 3/Right_N/Right_1,2,3,4_Test_Size','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
% testSet2 = imageDatastore('E:/Dataset DDSM_ROI/Density_wise/Density_4_Mass_model_phase_1+2/N+AN_D4_Test','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
% tbl_12 = countEachLabel(testSet2);
% B_test2 = encode(bag2, testSet2);
% toc
% load handel
% sound(y,Fs)


% A = imread('D:\Amrita_College\Amrita Semester 3 (Project Work)\Shrinithi Project\Final review sem_3\Dataset\Phase_1 Sem 3\Left_N\Left_1,2,3,4_Train_Size\Left_1 Train_size\A_1960_1.LEFT_MLO.LJPEG.png');
% figure (1)
% imshow(A);
% B = detectFASTFeatures(A);
% C = cornerPoints(B.Location);
% [features, valid_points] = extractFeatures(A, B, "Method","SURF");
% [features1, valid_points1] = extractFeatures(A, C, "Method","SURF");
% C = features.Features;
% C1 = single(C);
% C2 = double (C);
% imshow(A); hold on;
% plot(B);