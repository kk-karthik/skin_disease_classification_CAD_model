import pandas as pd
data_train = pd.read_csv("C:/Users\hemak\OneDrive\Desktop\KAZE_SIFT_0.9_200_LBP_HISTO_TRAIN.csv")
d=data_train.shape
X_train = data_train.drop('CLASS', axis=1)
Y_train = data_train['CLASS']
a = pd.Series(Y_train).value_counts()
print(a)
data_test = pd.read_csv("C:/Users\hemak\OneDrive\Desktop\KAZE_SIFT_0.9_200_LBP_HISTO_TEST.csv")
d=data_test.shape
X_test = data_test.drop('CLASS', axis=1)
Y_test = data_test['CLASS']
b = pd.Series(Y_test).value_counts() 
print(b)

from sklearn.feature_selection import SelectKBest
from sklearn.feature_selection import f_classif
fs = SelectKBest(score_func=f_classif, k=300)
fs.fit(X_train, Y_train)
X_train_fs = fs.transform(X_train)
X_test_fs = fs.transform(X_test)
Z= fs.scores_

#NORMALIZATIPON OF THE VALUES IN THE EXCEL SHEET
from sklearn.preprocessing import MinMaxScaler
scaler = MinMaxScaler()
X_train_a = scaler.fit_transform(X_train_fs)
X_test_a = scaler.transform(X_test_fs)


# # SVM Classifier
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
                      cv=10)
result = gd_sr.fit(X_train_a, Y_train)
best_parameters = result.best_params_
print(best_parameters)
best_result = result.best_score_
print(best_result)

from sklearn.svm import SVC 
from sklearn.metrics import confusion_matrix, accuracy_score, classification_report, roc_auc_score
SVM_classifier = SVC(C=0.1, kernel='poly', degree=3, gamma=0.1, probability=True)
SVM_classifier.fit(X_train_a, Y_train)
Y_pred_1 = SVM_classifier.predict(X_test_a)
Y_pred_2 = SVM_classifier.predict_proba(X_test_a)[:,1]
Confusion_matrix_1 = confusion_matrix(Y_test, Y_pred_1)
print('SVM Confusion Matrix_1', '\n', Confusion_matrix_1)
Accuracy_1 = round(accuracy_score(Y_test, Y_pred_1)*100)
print('SVM model accuracy_1 is: ', Accuracy_1,'%')
Classification_report_1 = classification_report(Y_test, Y_pred_1)
print(Classification_report_1)

Roc_auc_1 = roc_auc_score(Y_test, Y_pred_2)
print('AUC = %0.2f' % Roc_auc_1)

# # KNN Classifier
from sklearn.neighbors import KNeighborsClassifier
KNN_classifier = KNeighborsClassifier(n_neighbors = 5, weights='uniform', metric='euclidean')
from sklearn.model_selection import cross_val_score
all_accuracies = cross_val_score(estimator=KNN_classifier, X=X_train_a, y=Y_train, cv=10)
print(all_accuracies)
print(all_accuracies.mean())
print(all_accuracies.std())

from sklearn.neighbors import KNeighborsClassifier
KNN_classifier = KNeighborsClassifier()
grid_param2 = {'n_neighbors':[3,5,7,11],
                'weights':['uniform','distance'],
                'metric':['euclidean','manhattan'],
}
from sklearn.model_selection import GridSearchCV
gd_sr2 = GridSearchCV(estimator=KNN_classifier,
                      param_grid=grid_param2,
                      scoring='accuracy',
                      cv=10)
results2 = gd_sr2.fit(X_train_a, Y_train)
best_parameters2 = results2.best_params_
print(best_parameters2)
best_result2 = results2.best_score_
print(best_result2)

from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import confusion_matrix, accuracy_score, classification_report
KNN_classifier = KNeighborsClassifier(n_neighbors = 3, weights='distance', metric='euclidean')
KNN_classifier.fit(X_train_a, Y_train)
Y_pred_3 = KNN_classifier.predict(X_test_a)
Confusion_matrix_3 = confusion_matrix(Y_pred_3,Y_test)
print('KNN Confusion Matrix_1', '\n', Confusion_matrix_3)
Accuracy_3 = accuracy_score(Y_pred_3, Y_test)*100
print('KNN model accuracy_1 is: ', Accuracy_3,'%')
Classification_report_3 = classification_report(Y_pred_3,Y_test)
print(Classification_report_3)


from sklearn.metrics import roc_auc_score, roc_curve, auc
import matplotlib.pyplot as plt

false_positive_rate1, true_positive_rate1, threshold1 = roc_curve(Y_test, Y_pred_2)
roc_auc_1 = auc(false_positive_rate1, true_positive_rate1)
print('AUC = %0.2f' % roc_auc_1)
plt.subplots(1, figsize=(8,8))
plt.title('Receiver Operating Characteristic Curve')
plt.plot(false_positive_rate1, true_positive_rate1, label = 'AUC = %0.2f' % roc_auc_1)
plt.legend(loc = 'lower right')
plt.plot([0, 1], [0, 1], ls="--")
plt.ylabel('True Positive Rate')
plt.xlabel('False Positive Rate')
plt.show()


# Random Forest Classifier
from sklearn.ensemble import RandomForestClassifier
Random_forest_classifier = RandomForestClassifier(n_estimators = 100, max_features = 'auto', min_samples_leaf = 50, criterion = 'gini', bootstrap = 'True', random_state = 0)
from sklearn.model_selection import cross_val_score
all_accuracies = cross_val_score(estimator=Random_forest_classifier, X=X_train_a, y=Y_train, cv=3)
print(all_accuracies)
print(all_accuracies.mean())
print(all_accuracies.std())

from sklearn.ensemble import RandomForestClassifier
Random_forest_classifier = RandomForestClassifier()
grid_param4 = {
    'n_estimators': [100, 300, 500],
    'max_features': ['auto'],
    'min_samples_leaf':[50, 100, 150],
    'criterion': ['gini', 'entropy'],
    'bootstrap': ['True'],
    'random_state':[0,1,2,3,42]    
}
from sklearn.model_selection import GridSearchCV
gd_sr4 = GridSearchCV(estimator=Random_forest_classifier,
                      param_grid=grid_param4,
                      scoring='accuracy',
                      cv=10)
results4=gd_sr4.fit(X_train_a, Y_train)
best_parameters4 = results4.best_params_
print(best_parameters4)
best_result4 = results4.best_score_
# print(best_result4)

from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import confusion_matrix, accuracy_score, classification_report
Random_forest_classifier = RandomForestClassifier(n_estimators = 500, max_features = 'auto', min_samples_leaf = 50, criterion = 'gini', bootstrap = 'True', random_state = 1)
Random_forest_classifier.fit(X_train_a, Y_train)
Y_pred_1 = Random_forest_classifier.predict(X_test_a)
Confusion_matrix_3 = confusion_matrix(Y_pred_1,Y_test)
print('Random forest Confusion Matrix_1', '\n', Confusion_matrix_3)
Accuracy_3 = accuracy_score(Y_pred_1, Y_test)*100
print('Random forest accuracy_2 is: ', Accuracy_3,'%')
Classification_report_3 = classification_report(Y_pred_1,Y_test)
print(Classification_report_3)

# GradiantBoost Classifier
from sklearn.ensemble import GradientBoostingClassifier
GB_classifier = GradientBoostingClassifier()
from sklearn.model_selection import cross_val_score
all_accuracies = cross_val_score(estimator=GB_classifier, X=X_train_a, y=Y_train, cv=3)
print(all_accuracies)
print(all_accuracies.mean())
print(all_accuracies.std())

from sklearn.ensemble import GradientBoostingClassifier
Grad_Boost_classifier = GradientBoostingClassifier()
grid_param4 = {
    'n_estimators':[100,200,300],
    'random_state':[0,1,2,3,42],
}
from sklearn.model_selection import GridSearchCV
gd_sr4 = GridSearchCV(estimator=Grad_Boost_classifier,
                      param_grid=grid_param4,
                      scoring='accuracy',
                      cv=5 )
results4=gd_sr4.fit(X_train_a, Y_train)
best_parameters4 = results4.best_params_
print(best_parameters4)
best_result4 = results4.best_score_
print(best_result4)


from sklearn.ensemble import GradientBoostingClassifier
from sklearn.metrics import confusion_matrix, accuracy_score, classification_report
Grad_boost_classifier = GradientBoostingClassifier(n_estimators=200, random_state=2)
Grad_boost_classifier.fit(X_train_a, Y_train)
Y_pred_3 = Grad_boost_classifier.predict(X_test_a)
Confusion_matrix_3 = confusion_matrix(Y_pred_3,Y_test)
print('Grad Boost Confusion Matrix_1', '\n', Confusion_matrix_3)
Accuracy_3 = accuracy_score(Y_pred_3, Y_test)*100
print('Grad Boost accuracy_2 is: ', Accuracy_3,'%')
Classification_report_3 = classification_report(Y_pred_3,Y_test)
print(Classification_report_3)


# AdaBoost Classifier
from sklearn.ensemble import AdaBoostClassifier
AB_classifier = AdaBoostClassifier()
from sklearn.model_selection import cross_val_score
all_accuracies = cross_val_score(estimator=AB_classifier, X=X_train_a, y=Y_train, cv=3)
print(all_accuracies)
print(all_accuracies.mean())
print(all_accuracies.std())

from sklearn.ensemble import AdaBoostClassifier
Ada_Boost_classifier = AdaBoostClassifier()
grid_param4 = {
    'n_estimators':[100,300,500],
    'random_state':[0,1,2,3,42],
}
from sklearn.model_selection import GridSearchCV
gd_sr4 = GridSearchCV(estimator=Ada_Boost_classifier,
                      param_grid=grid_param4,
                      scoring='accuracy',
                      cv=10)
results4=gd_sr4.fit(X_train_a, Y_train)
best_parameters4 = results4.best_params_
print(best_parameters4)
best_result4 = results4.best_score_
print(best_result4)


from sklearn.ensemble import AdaBoostClassifier
from sklearn.metrics import confusion_matrix, accuracy_score, classification_report
Ada_boost_classifier = AdaBoostClassifier(n_estimators = 500, random_state = 0)
Ada_boost_classifier.fit(X_train_a, Y_train)
Y_pred_1 = Ada_boost_classifier.predict(X_test_a)
Confusion_matrix_3 = confusion_matrix(Y_pred_1,Y_test)
print('Ada Boost Confusion Matrix_1', '\n', Confusion_matrix_3)
Accuracy_3 = accuracy_score(Y_pred_1, Y_test)*100
print('Ada Boost accuracy_2 is: ', Accuracy_3,'%')
Classification_report_3 = classification_report(Y_pred_1,Y_test)
print(Classification_report_3)