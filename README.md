<img width="1288" height="728" alt="image" src="https://github.com/user-attachments/assets/a6a1cfaa-af7c-4668-95c3-00a9099da87c" />




Why I built this:

This project was undertaken to demonstrate my interest in healthcare settings and ability to uncover significant industry KPIs.  I found that the 1.18%  national variance between males : females was concerning and warranted particular examination.  This whole process from Extraction to visualisaion of this key anomaly was quite rewading and what I enjoy about dealing with data.    

Project Spotlight:

Identifying Paediatric Demographic Anomalies
Using T-SQL window functions and Power BI, I engineered a pipeline to analyse 9.09M healthcare records. Key Discovery: Identified a 1.18% national variance in the 0–4 age group, where male presentations (500k) significantly outpace females (392k) repeating in the 5–14 age bracket with a 0.98% national variance (467k male vs. 378k female presentations — a finding featured in the final dashboard.



Analysis of Emergency Department (ED) presentation statistics from Australian Institute for Health and Welfare (AIHW) 
dataset: 'Emergency department care 2024�25 data tables' sheet 3.1,  https://www.aihw.gov.au/hospitals/topics/emergency-departments)




1. Data Extraction & SQL Engineering

Initial EDA was performed in T-SQL to ensure data integrity and calculate various benchmarks prior to visualisation.

Key metrics:

Window Functions (OVER, PARTITION BY) - Used to calculate percentages of the national total without collapsing the data rows.

Data Validation - A data validation script was developed to confirm the Grand Total of 9,091,154 presentations, which served as the anchor for all subsequent comparisons and visuals.

Segmented Analysis - Calculated gender percentages to understand how age distributions differ between males and females.


2. Visualisation:

The processed data was loaded into and transformed in Power BI to create an interactive dashboard:

Dashboard features include:

KPI anchor: A Card visual displaying the validated total of 9.09M cases.

Interactive slicers: "Tile Style" gender filters that allow users to toggle between Male and Female views instantly.

Contextual analysis: A clustered bar chart ranking age groups and comparing genders side-by-side.

Analytics line: A vertical average dotte line to identify which demographics exceed typical volume thresholds.




3. Key insights found:

The following insights were derived from the SQL calculations and are featured in the dashboard's executive summary:

Gender footprint: Females represent 48.9% of the national total, with a distinct peak in the 25-34 age demographic.

Paediatric variance: A significant 1.18% national variance was discovered in the 0-4 age group, where male presentations (approximately 500k) significantly outpace females (approximately 392k).

Volume spike: The 25-34 age bracket holds the highest presentation-volume nationally, primarily driven by female presentations peaking at 694k.



4. Design decisions

The "Key Insights" tile was kept static to provide a constant benchmark for reference while interacting with the filtered data.

Visual display: 10% transparency, grey background for a modern, professional feel.


Tools Used in this project:

Database: Microsoft SQL Server (T-SQL)
BI Tool: Power BI Desktop
Techniques: Window Functions, Data Modelling, UX/UI Design


```sql
SELECT 
    Age_group,
    Sex,
    SUM(NSW + VIC + QLD + WA + SA + TAS + ACT + NT) AS Group_Volume,
    CAST(SUM(NSW + VIC + QLD + WA + SA + TAS + ACT + NT) * 100.0 / 
         SUM(SUM(NSW + VIC + QLD + WA + SA + TAS + ACT + NT)) OVER() 
         AS DECIMAL(5,2)) AS Percent_of_National
FROM ED_Presentations_By_Age_Sex
GROUP BY Age_group, Sex
ORDER BY Sex, Age_group;
```
