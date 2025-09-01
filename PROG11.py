11. Drug Sales – Time Series Forecasting (Python)
import pandas as pd
from statsmodels.tsa.holtwinters import ExponentialSmoothing
import matplotlib.pyplot as plt

df = pd.read_csv("C:/Users/HP/Downloads/AusAntidiabeticDrug.csv", parse_dates=['ds'])

df.set_index('ds', inplace=True)
df.index.freq = 'MS'

model = ExponentialSmoothing(df['y'], trend="add", seasonal="add", seasonal_periods=12)
fit = model.fit()

forecast = fit.forecast(24)

plt.figure(figsize=(12,6))
plt.plot(df['y'], label="Actual")
plt.plot(fit.fittedvalues, label="Fitted")
plt.plot(forecast, label="Forecast", color='red')
plt.legend()
plt.show()