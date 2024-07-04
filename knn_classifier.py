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

