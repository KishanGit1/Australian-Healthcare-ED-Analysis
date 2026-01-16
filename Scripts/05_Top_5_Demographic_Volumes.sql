USE Healthcare_Project;
GO

--Query 5: Top 5 Age_group presentations as percentage of total national volume, for each gender.

	-- Illustrate largest demographic groups from dataset for insights.
SELECT TOP 5 
    Age_group,
    Sex,
    SUM(NSW + VIC + QLD + WA + SA + TAS + ACT + NT) AS Total_Presentations,

    -- Reusing percentage logic from earlier query:
    CAST(SUM(NSW + VIC + QLD + WA + SA + TAS + ACT + NT) * 100.0 / 
         SUM(SUM(NSW + VIC + QLD + WA + SA + TAS + ACT + NT)) OVER() 
         AS DECIMAL(5,2)) AS Percent_of_Total_National_Volume

FROM ED_Presentations_By_Age_Sex
GROUP BY Age_group, Sex
ORDER BY Total_Presentations DESC;