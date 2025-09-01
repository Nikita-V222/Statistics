9. Spearman Scores – SMIP vs DBMS Students (Python)
import pandas as pd
from scipy.stats import spearmanr

SMIP = [70, 46, 94, 34, 20, 86, 18, 12, 56, 64, 42]
DBMS = [60, 66, 90, 46, 16, 98, 24, 8, 32, 54, 62]

df = pd.DataFrame({'SMIP': SMIP, 'DBMS': DBMS})

corr, p_value = spearmanr(df['SMIP'], df['DBMS'])

print("Spearman Rank Correlation Coefficient:", corr)
print("P-value:", p_value)

if corr > 0:
    relation = "positive"
elif corr < 0:
    relation = "negative"
else:
    relation = "no"

print(f"Interpretation: The Spearman correlation ({corr:.3f}) indicates a {relation} association between SMIP and DBMS scores.")