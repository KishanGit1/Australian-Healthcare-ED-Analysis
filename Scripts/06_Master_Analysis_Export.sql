USE Healthcare_Project;
GO


-- Query 6: Master table for export into visualisation tool.

SELECT 
    Age_group,
    Sex,
    -- 1.Total volume per category
    SUM(NSW + VIC + QLD + WA + SA + TAS + ACT + NT) AS Group_Volume,

    -- 2. % of the National Total (9,091,154)
    CAST(SUM(NSW + VIC + QLD + WA + SA + TAS + ACT + NT) * 100.0 / 
         SUM(SUM(NSW + VIC + QLD + WA + SA + TAS + ACT + NT)) OVER() 
         AS DECIMAL(5,2)) AS Percent_of_National,

    -- 3. Parittion for their specific Gender (as %)
    CAST(SUM(NSW + VIC + QLD + WA + SA + TAS + ACT + NT) * 100.0 / 
         SUM(SUM(NSW + VIC + QLD + WA + SA + TAS + ACT + NT)) OVER(PARTITION BY Sex) 
         AS DECIMAL(5,2)) AS Percent_Within_Gender

FROM ED_Presentations_By_Age_Sex
GROUP BY Age_group, Sex
ORDER BY Sex, Age_group;