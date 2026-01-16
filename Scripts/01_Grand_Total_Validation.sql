USE Healthcare_Project;
GO

-- Query 1: Check grand Australia-wide total

SELECT 
    SUM(NSW + VIC + QLD + WA + SA + TAS + ACT + NT) AS National_Grand_Total
FROM ED_Presentations_By_Age_Sex;