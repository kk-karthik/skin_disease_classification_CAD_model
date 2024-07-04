import pandas as pd
data_train = pd.read_csv("E:\REAL\GLCM\GLCM_Train.csv")
d=data_train.shape
X_train = data_train.drop('CLASS', axis=1)
Y_train = data_train['CLASS']
a = pd.Series(Y_train).value_counts()
print(a)
data_test = pd.read_csv("E:\REAL\GLCM\GLCM_Test.csv")
d=data_test.shape
X_test = data_test.drop('CLASS', axis=1)
Y_test = data_test['CLASS']
b = pd.Series(Y_test).value_counts()
print(b)

# from sklearn.feature_selection import SelectKBest
# from sklearn.feature_selection import f_classif
# fs = SelectKBest(score_func=f_classif, k=500)
# fs.fit(X_train, Y_train)
# X_train_fs = fs.transform(X_train)
# X_test_fs = fs.transform(X_test)
# Z= fs.scores_

#NORMALIZATION OF THE VALUES IN THE EXCEL SHEET
from sklearn.preprocessing import MinMaxScaler
scaler = MinMaxScaler()
X_train_a = scaler.fit_transform(X_train)
X_test_a = scaler.transform(X_test)


# # # # SVM Classifier
from sklearn.svm import SVC
SVM_classifier = SVC()
grid_param = {'C':[0.001,0.01,0.1,1,10,100],
                'kernel':['rbf','poly','sigmoid','linear'],
                'degree':[1,2,3],
                'gamma': [1, 10, 0.1, 0.01, 0.001],
}
from sklearn.model_selection import GridSearchCV
gd_sr = GridSearchCV(estimator=SVM_classifier,
                      param_grid=grid_param,
                      scoring='accuracy',
                      cv=5)
result = gd_sr.fit(X_train_a, Y_train)
best_parameters = result.best_params_
print(best_parameters)
best_result = result.best_score_
print(best_result)

# from sklearn.svm import SVC 
# from sklearn.metrics import confusion_matrix, accuracy_score, classification_report, roc_auc_score
# SVM_classifier = SVC(C=0.01, kernel='poly', degree=1, gamma=10, probability=True)
# SVM_classifier.fit(X_train_a, Y_train)
# Y_pred_1 = SVM_classifier.predict(X_test_a)
# Y_pred_2 = SVM_classifier.predict_proba(X_test_a)[:,1]
# Confusion_matrix_1 = confusion_matrix(Y_test, Y_pred_1)
# print('SVM Confusion Matrix_1', '\n', Confusion_matrix_1)
# Accuracy_1 = round(accuracy_score(Y_test, Y_pred_1)*100)
# print('SVM model accuracy_1 is: ', Accuracy_1,'%')
# Classification_report_1 = classification_report(Y_test, Y_pred_1)
# print(Classification_report_1)
