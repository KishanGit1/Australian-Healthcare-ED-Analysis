USE Healthcare_Project;
GO

-- Query 3: Comparing National_Grand_Total across Gender

SELECT 
    Sex, 
    --  Calculate the sum for each gender
    SUM(NSW + VIC + QLD + WA + SA + TAS + ACT + NT) AS Total_Presentations,

    -- Calculate the Percentage
    -- Multiply by 100.0 first to avoid Integer Division truncation generating zeroes
    -- OVER() to get the total of EVERYTHING in the table to be divided by
    CAST(SUM(NSW + VIC + QLD + WA + SA + TAS + ACT + NT) * 100.0 / 
         SUM(SUM(NSW + VIC + QLD + WA + SA + TAS + ACT + NT)) OVER() 
         AS DECIMAL(5,2)) AS Percentage_of_National_Grand_Total

FROM ED_Presentations_By_Age_Sex
GROUP BY Sex;
         