use project;
Select * from churn_analysis;
select count(*) from churn_analysis;

#1.Overall Business KPI
###No_of_Churned Customers
Select Count(*)as Total_Customers,
       Sum(Case When churn = "Yes" then 1 else 0
       End) as Churned_Customers
 from Churn_analysis;
 
 ##Churn_Rate%
 Select Count(*) as Total_Customers,
        Round(Sum(Case When churn = "Yes" Then 1 Else 0
			End)*100.0 / count(*),2) as Churn_Rate
         from Churn_analysis;   
         
##2: Contract-wise Churn
SELECT
    Contract,
    COUNT(*) AS Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM Churn_Analysis
GROUP BY Contract
ORDER BY Churn_Rate DESC;             

##3: Payment Method Analysis
SELECT
    PaymentMethod,
    COUNT(*) AS Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM Churn_Analysis
GROUP BY PaymentMethod
ORDER BY Churn_Rate DESC;

##4: Internet Service
SELECT
    InternetService,
    COUNT(*) AS Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM Churn_Analysis
GROUP BY InternetService;


##5: Tech Support
SELECT
    TechSupport,
    COUNT(*) AS Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM Churn_Analysis
GROUP BY TechSupport;


##6.Contract + Payment Method Churn
SELECT
    Contract,
    PaymentMethod,
    COUNT(*) AS Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned
FROM Churn_Analysis
GROUP BY Contract, PaymentMethod
ORDER BY Contract;

##7.Tenure Group Wise Churn
SELECT 
    `Tenure Group`,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM Churn_Analysis
GROUP BY `Tenure Group`;
