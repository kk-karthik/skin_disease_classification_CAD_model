#Random Forest Classifier
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
print(best_result4)

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
