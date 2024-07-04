tic
% trainingSet = imageDatastore('D:/Amrita_College/Amrita Semester 3 (Project Work)/Shrinithi Project/Final review sem_3/Dataset/Phase_1 Sem 3/Right_N/Right_1,2,3,4_Train_Size','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
trainingSet = imageDatastore('E:/Dataset DDSM_ROI/Density_wise/Density_4_Mass_model_phase_1+2/N+AN_D4_Train','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
tbl = countEachLabel(trainingSet);
extractorFcn = @exampleBagOfFeaturesExtractorSURF;
bag = bagOfFeatures(trainingSet,'VocabularySize',500, 'StrongestFeatures', 0.8, 'CustomExtractor',extractorFcn);
A_train = encode(bag, trainingSet);
% testSet = imageDatastore('D:/Amrita_College/Amrita Semester 3 (Project Work)/Shrinithi Proje ct/Final review sem_3/Dataset/Phase_1 Sem 3/Right_N/Right_1,2,3,4_Test_Size','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
testSet = imageDatastore('E:/Dataset DDSM_ROI/Density_wise/Density_4_Mass_model_phase_1+2/N+AN_D4_Test','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
tbl_1 = countEachLabel(testSet);
B_test = encode(bag, testSet);
toc