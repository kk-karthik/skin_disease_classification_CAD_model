tic
trainingSet = imageDatastore("C:\2CLASS_CLASSIFICATION\TRAIN",'IncludeSubfolders',true,'FileExtensions',{'.jpg'},'LabelSource','foldernames');
tbl = countEachLabel(trainingSet);
extractorFcn = @exampleBagOfFeaturesExtractorsurf;
bag = bagOfFeatures(trainingSet,'GridStep',[8 8],'VocabularySize',500, 'StrongestFeatures',0.8, 'CustomExtractor',extractorFcn);
A_train = encode(bag, trainingSet);
%writematrix(A_train,"C:\2CLASS_CLASSIFICATION\SIFT_0.9_200_TRAIN_2CLASS.csv")
testSet = imageDatastore("C:\2CLASS_CLASSIFICATION\TEST\",'IncludeSubfolders',true,'FileExtensions',{'.jpg'},'LabelSource','foldernames');
tbl_1 = countEachLabel(testSet);
B_test = encode(bag, testSet);
writematrix(B_test,"C:\Users\hemak\OneDrive\Desktop\SKIN_FINAL_CODE_BEST\validation_phase.csv")
toc
