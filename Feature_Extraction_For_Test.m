tic
trainingSet = imageDatastore('D:/Amrita_College/Amrita Semester 3 (Project Work)/Shrinithi Project/Final review sem_3/Dataset/Phase_1 Sem 3/Left_N/Left_1,2,3,4_Train_Size','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
tbl = countEachLabel(trainingSet);
extractorFcn = @exampleBagOfFeaturesExtractorSURF;
bag_1 = bagOfFeatures(trainingSet,'VocabularySize',500, 'StrongestFeatures', 0.8, 'CustomExtractor',extractorFcn);
A_train = encode(bag_1, trainingSet);
% Test_image = imread('D:/Amrita_College/Amrita Semester 3 (Project Work)/Shrinithi Project/Final review sem_3/Dataset/Phase_1 Sem 3/Left_N/Left_1,2,3,4_Test_Size/Left_1 Test_size/A_1960_1.LEFT_CC.LJPEG.png');
Test_image = imread('D:/Amrita_College/Amrita Semester 3 (Project Work)/Shrinithi Project/Final review sem_3/Dataset/Phase_1 Sem 3/Left_N/Left_1,2,3,4_Test_Size/Left_1 Test_size/A_1995_1.LEFT_CC.LJPEG.png');
A_test = encode(bag_1, Test_image);
toc
load handel
sound(y,Fs)

tic
trainingSet1 = imageDatastore('D:/Amrita_College/Amrita Semester 3 (Project Work)/Shrinithi Project/Final review sem_3/Dataset/Phase_1 Sem 3/Right_N/Right_1,2,3,4_Train_Size','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
tbl1 = countEachLabel(trainingSet);
extractorFcn1 = @exampleBagOfFeaturesExtractorSURF;
bag_11 = bagOfFeatures(trainingSet1,'VocabularySize',500, 'StrongestFeatures', 0.8, 'CustomExtractor',extractorFcn);
A_train1 = encode(bag_11, trainingSet1);
% Test_image1 = imread('D:/Amrita_College/Amrita Semester 3 (Project Work)/Shrinithi Project/Final review sem_3/Dataset/Phase_1 Sem 3/Right_N/Right_1,2,3,4_Test_Size/Right_1 Test_size/A_1960_1.RIGHT_CC.LJPEG.png');
Test_image1 = imread('D:/Amrita_College/Amrita Semester 3 (Project Work)/Shrinithi Project/Final review sem_3/Dataset/Phase_1 Sem 3/Right_N/Right_1,2,3,4_Test_Size/Right_1 Test_size/A_1995_1.RIGHT_CC.LJPEG.png');
A_test1 = encode(bag_11, Test_image1);
toc
load handel
sound(y,Fs)