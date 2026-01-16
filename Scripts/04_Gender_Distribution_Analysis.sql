USE Healthcare_Project;
GO

--Query 4: Presentation Distribution by Gender

SELECT 
    Age_group,
    Sex,
    SUM(NSW + VIC + QLD + WA + SA + TAS + ACT + NT) AS Group_Total,
    -- This is the Window Function (The 'Advanced' stuff)
    SUM(SUM(NSW + VIC + QLD + WA + SA + TAS + ACT + NT)) OVER(PARTITION BY Sex) AS Total_For_That_Gender,
    -- Calculating Percentage
    CAST(SUM(NSW + VIC + QLD + WA + SA + TAS + ACT + NT) * 100.0 / 
         SUM(SUM(NSW + VIC + QLD + WA + SA + TAS + ACT + NT)) OVER(PARTITION BY Sex) AS DECIMAL(5,2)) AS Percentage_Of_Gender
FROM ED_Presentations_By_Age_Sex
GROUP BY Age_group, Sex;
