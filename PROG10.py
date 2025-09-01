10. Linear Regression – TV Ads vs Sales (Python)
import pandas as pd
import statsmodels.api as sm
import matplotlib.pyplot as plt
import warnings

warnings.filterwarnings("ignore")

data = {
    'TV': [1, 2, 4, 7, 9, 11, 15],
    'Sales': [2, 4, 6, 9, 12, 34, 45]
}
df = pd.DataFrame(data)

X = df['TV']
Y = df['Sales']

X = sm.add_constant(X)

model = sm.OLS(Y, X).fit()
print(model.summary())

plt.scatter(df['TV'], df['Sales'], color='blue', label='Actual Data')
plt.plot(df['TV'], model.predict(X), color='red', label='Fitted Line')
plt.title("Linear Regression: Sales vs TV Advertising Budget")
plt.xlabel("TV Advertising Budget")
plt.ylabel("Sales")
plt.legend()
plt.show()

