/*

Project Spotlight: 

Identifying Paediatric Demographic Anomalies
Using T-SQL window functions and Power BI, I engineered a pipeline to analyse 9.09M healthcare records. Key Discovery: Identified a 1.18% national variance in the 0–4 age group, where male presentations (500k) significantly outpace females (392k)—a finding featured in the final dashboard.



Analysis of Emergency Department (ED) presentation statistics from Australian Institute for Health and Welfare (AIHW) 
dataset: 'Emergency department care 2024�25 data tables' sheet 3.1,  https://www.aihw.gov.au/hospitals/topics/emergency-departments)




1. Data Extraction & SQL Engineering

Initial EDA was performed in T-SQL to ensure data integrity and calculate various benchmarks prior to visualisation.

Key metrics:

Window Functions (OVER, PARTITION BY) - Used to calculate percentages of the national total without collapsing the data rows.

Data Validation - Developed a validation script to confirm the "Grand Total" of 9,091,154 presentations, which served as the anchor for all subsequent comparisons and visuals.

Segmented Analysis - Calculated gender percentages to understand how age distributions differ between males and females.



2. Visualisation:

The processed data was loaded into and transformed in Power BI to create an interactive dashboard.

Dashboard Features:
KPI Anchor: A Card visual displaying the validated total of 9.09M cases.

Interactive Slicers: "Tile Style" gender filters that allow users to toggle between Male and Female views instantly.

Contextual Analysis: A clustered bar chart ranking age groups and comparing genders side-by-side.

Analytics Line: A vertical "Average" reference line to identify which demographics exceed typical volume thresholds.




3. Key Insights

The following insights were derived from the SQL calculations and are featured in the dashboard's Executive Summary:

Gender footprint: Females represent 48.9% of the national total, with a distinct peak in the 25�34 age demographic.

Paediatric variance: A significant 1.18% national variance was discovered in the 0�4 age group, where male presentations (approx. 500k) significantly outpace females (approx. 392k).

Volume spike: The 25�34 age bracket holds the highest presentation-volume nationally - primarily driven by female presentation.




4. Design Decisions

The "Key Insights" tile was intentionally kept static to provide a constant benchmark for reference while interacting with filtered data.

Visual Display: 10% transparency, grey background to create a modern, professional feel.


Tools Used:

Database: Microsoft SQL Server (T-SQL)
BI Tool: Power BI Desktop
Techniques: Window Functions, Data Modeling, UX/UI Design

*/