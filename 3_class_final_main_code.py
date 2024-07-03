import pandas as pd
data_train = pd.read_csv(r"C:\Users\hemak\OneDrive\Desktop\SKIN_FINAL_CODE_BEST\SIFT_KAZE_LBP_GLCM_HIST_TRAIN_MODIFY.csv")
d=data_train.shape
X_train = data_train.drop('CLASS', axis=1)
Y_train = data_train['CLASS']
a = pd.Series(Y_train).value_counts()
print(a)
data_test = pd.read_csv(r"C:\Users\hemak\OneDrive\Desktop\SKIN_FINAL_CODE_BEST\TEST_VALIDATION_class0.csv")
d=data_test.shape
X_test = data_test.drop('CLASS', axis=1)
Y_test = data_test['CLASS']
b = pd.Series(Y_test).value_counts()
print(b)

from sklearn.feature_selection import SelectKBest
from sklearn.feature_selection import f_classif
fs = SelectKBest(score_func=f_classif, k=800)
fs.fit(X_train, Y_train)
X_train_fs = fs.transform(X_train)
X_test_fs = fs.transform(X_test)
Z= fs.scores_

from sklearn.preprocessing import MinMaxScaler
scaler = MinMaxScaler()
X_train_a = scaler.fit_transform(X_train_fs)
X_test_a = scaler.transform(X_test_fs)

from sklearn.ensemble import GradientBoostingClassifier
from sklearn.metrics import confusion_matrix, accuracy_score, classification_report
Grad_boost_classifier = GradientBoostingClassifier(n_estimators=300, random_state=1)
Grad_boost_classifier.fit(X_train_a, Y_train)
Y_pred_1 = Grad_boost_classifier.predict(X_test_a)
Y_pred_2 = Grad_boost_classifier.predict_proba(X_test_a)
Confusion_matrix_1 = confusion_matrix(Y_pred_1,Y_test)
print('Grad Boost Confusion Matrix_1', '\n', Confusion_matrix_1)
Accuracy_1 = accuracy_score(Y_pred_1, Y_test)*100
print('Grad Boost accuracy_2 is: ', Accuracy_1,'%')
Classification_report_1 = classification_report(Y_pred_1,Y_test)
print(Classification_report_1)

from matplotlib import pyplot as plt
from matplotlib import image as mpimg
 
plt.xlabel("X pixel scaling")
plt.ylabel("Y pixels scaling")
print("The uploaded image is a skin caner of type ")
a=Y_pred_1
if(a==0):
    plt.title("BENIGN")
    print("BENIGN")
elif(a==1):
    plt.title("CARCINOMA")
    print("CARCINOMA")
else:
    plt.title("MELANOMA")
    print("MELANOMA")
    
image = mpimg.imread(r"C:\Users\hemak\Downloads\padma mam.jpeg" )
plt.imshow(image)
plt.show()


if(a==1):
    import pandas as pd
    data_train = pd.read_csv(r"C:\2CLASS_CLASSIFICATION\KAZE_0.8_500_TRAIN_2CLASS.csv")
    d=data_train.shape
    X_train = data_train.drop('CLASS', axis=1)
    Y_train = data_train['CLASS']
    a = pd.Series(Y_train).value_counts()
    print(a)
    data_test = pd.read_csv(r"C:\2CLASS_CLASSIFICATION\2_CLASS_CLASSIFICATION_VALIDATION_0.csv")
    d=data_test.shape
    X_test = data_test.drop('CLASS', axis=1)
    Y_test = data_test['CLASS']
    b = pd.Series(Y_test).value_counts()
    print(b)
#NORMALIZATION OF THE VALUES IN THE EXCEL SHEET
    from sklearn.preprocessing import MinMaxScaler
    scaler = MinMaxScaler()
    X_train_a = scaler.fit_transform(X_train)
    X_test_a = scaler.transform(X_test)

    from sklearn.svm import SVC 
    from sklearn.metrics import confusion_matrix, accuracy_score, classification_report, roc_auc_score
    SVM_classifier = SVC(C=10, kernel='rbf', degree=1, gamma=0.1, probability=True)
    SVM_classifier.fit(X_train_a, Y_train)
    Y_pred_1 = SVM_classifier.predict(X_test_a)
    Y_pred_2 = SVM_classifier.predict_proba(X_test_a)[:,1]
    Confusion_matrix_1 = confusion_matrix(Y_test, Y_pred_1)
    print('SVM Confusion Matrix_1', '\n', Confusion_matrix_1)
    Accuracy_1 = round(accuracy_score(Y_test, Y_pred_1)*100)
    print('SVM model accuracy_1 is: ', Accuracy_1,'%')
    Classification_report_1 = classification_report(Y_test, Y_pred_1)
    print(Classification_report_1)

    from matplotlib import pyplot as plt
    from matplotlib import image as mpimg
 

    plt.xlabel("X pixel scaling")
    plt.ylabel("Y pixels scaling")
    a1=Y_pred_1
    if(a1==0):
        plt.title("BASAL CELL CARCINOMA")
        print("0:BASAL CELL CARCINOMA")
    else:
        plt.title("SQUAMOUS CELL CARCINOMA")
        print("1:SQUA CELL CARCINOMA")
 
    image = mpimg.imread(r"C:\2CLASS_CLASSIFICATION\2class_0.jpg")
    plt.imshow(image)
    plt.show()

