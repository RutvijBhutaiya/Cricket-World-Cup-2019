import pandas as pd

wc_data = pd.read_excel('WC_train.xlsx', index_col=None)
wc_data.to_csv('WC_train.csv', encoding='utf-8', index=False)
import pandas_profiling
wc_data.keys()
wc_data.shape

from numpy import array
from numpy import argmax
from sklearn.preprocessing import LabelEncoder

label_encoder = LabelEncoder()
#wc_data['Month'] = label_encoder.fit_transform(wc_data['Month'])
#wc_data['Year'] = label_encoder.fit_transform(wc_data['Year'])
#wc_data['Team A'] = label_encoder.fit_transform(wc_data['Team A'])
#wc_data['Team B'] = label_encoder.fit_transform(wc_data['Team B'])
#wc_data['Ground'] = label_encoder.fit_transform(wc_data['Ground'])

df_encoded = wc_data.apply(label_encoder.fit_transform)

print(df_encoded)

X = df_encoded.iloc[:, :5]
Y = df_encoded.iloc[:, 5:]

from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, Y)

from matplotlib import pyplot as plt
from sklearn import datasets, linear_model

print(X_train.shape, y_train.shape)
print(X_test.shape, y_test.shape)

#lm = linear_model.LinearRegression()
#model = lm.fit(X_train, y_train)
#predictions = lm.predict(X_test)

from sklearn.preprocessing import StandardScaler
scaler = StandardScaler()

scaler.fit(X_train)

X_train = scaler.transform(X_train)
X_test = scaler.transform(X_test)

from sklearn.neural_network import MLPClassifier

mlp = MLPClassifier(hidden_layer_sizes=(30,30,30))

mlp.fit(X_train,y_train)

predictions = mlp.predict(X_test)

from sklearn.metrics import classification_report,confusion_matrix
print(confusion_matrix(y_test,predictions))

print(classification_report(y_test,predictions))
