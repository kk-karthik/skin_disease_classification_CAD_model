
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
                      cv=5)
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