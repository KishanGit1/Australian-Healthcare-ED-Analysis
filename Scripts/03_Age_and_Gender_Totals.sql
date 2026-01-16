USE Healthcare_Project;
GO

--Query 3: Total presentations by age group for each gender

SELECT 
    Age_group,
    Sex,
    SUM(NSW + VIC + QLD + WA + SA + TAS + ACT + NT) AS National_Total
FROM ED_Presentations_By_Age_Sex
GROUP BY Age_group, Sex
ORDER BY Age_group ASC, Sex DESC;