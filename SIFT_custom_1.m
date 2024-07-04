trainingSet = imageDatastore('E:/Dataset DDSM_ROI/Density_wise/Density_1_Mass_model_phase_1+2/N+AN_D1_Pre_Train','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
tbl = countEachLabel(trainingSet);
extractorFcn = @exampleBagOfFeaturesExtractorsift1;
bag = bagOfFeatures(trainingSet,'GridStep',[8 8],'VocabularySize', 200, 'StrongestFeatures', 0.6, 'CustomExtractor',extractorFcn);
A_train = encode(bag, trainingSet);
testSet = imageDatastore('E:/Dataset DDSM_ROI/Density_wise/Density_1_Mass_model_phase_1+2/N+AN_D1_Pre_Test','IncludeSubfolders',true,'FileExtensions',{'.png'},'LabelSource','foldernames');
tbl_1 = countEachLabel(testSet);
B_test = encode(bag, testSet);