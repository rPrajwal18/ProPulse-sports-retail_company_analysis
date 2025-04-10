# ProPulse Sports Retail company analysis

## Project Background
ProPulse a medium-sized sports retail company, specializing in products such as bikes, accessories, and clothing, containing over 90k records, over 4 years was looking to gain deeper insights into their sales performance and growth, customer segmentation and recency, and product segmentation, performance and growth and profitability drivers to drive data-informed decisions.

Key business objectives:
- Identify key revenue drivers and growth trends.
- Analyze product, segment, and categorical sales performance.
- Recommend strategies to optimize sales and profit margins.

Insights and recommendations are provided on the following key areas:

- **Sales Trend Analysis**: Evaluation of sales patterns of Y-O-Y, cummulative analysis and proportional analysis and data-segmantaion analysis.
- **Product Level Performance**: An analysis of ProPulse various product line and segments, understanding their impact on sales and sales percent.

Targed SQL queries regarding various granular kpi's can be found [here](https://github.com/rPrajwal18/ProPulse-sports-retail_company_analysis/tree/306f4b68cdca6801b40ec9547118b65d184d1947/sql).

## Data Structure & Initial Checks
ProPulse's database as seen below consists of three tables dim_products, dim_customers and fact_sales, with a total row count of 100,000 records.

![model_erd](https://github.com/rPrajwal18/ProPulse-sports-retail_company_analysis/blob/306f4b68cdca6801b40ec9547118b65d184d1947/images/model_ERD.png)

Prior to begining of analysis, a variety of checks were conducted for familiarization with the datasets.

## Executive Summary

### Overview of Findings
- The analysis is based on a dataset of 100,000 records, providing insights into  ProPulse's various product line, customer segments, understanding their impact on sales and revenue over 4 years. This information was visualized into two table reorts of Customer report and Product report, revealed key insights into how sales trends across the range, what products are top performers, and patterns of recency over time. The analysis shows that Max profit year was 2013 where 1,63,44,878 number of products were sold with notable spikes during Q4 due to holidays and gifting seasons. There has also been a steady decline in performance post 2013.
- Successful performing category is Bikes which sold whole 96% of our prodcuts line and holding 30% of total customer percent. ProPulse can benefit from expanding the other two product segments by adding more products lines to accessories and clothing, optimizing quality control, customer satisfaction to increase customer purchase value. Targeted growth in cost ranges of below 100 and 100-500, along with improvements to online payment capabilities (UPI), will strengthen ProPulse's market position and drive sustainable growth.

![Year on Year aggregated image](https://github.com/rPrajwal18/ProPulse-sports-retail_company_analysis/blob/306f4b68cdca6801b40ec9547118b65d184d1947/images/yoy-performance_analysis.png)

## Insights Deep-Dive

### Sales Trend Analysis
- ProPulse's total sales 5 million+ with overall 10K customers per year.
- Sales surged in 2013 due to dip in average price by 60%, returning to steep decline at 2014 whcih also affeted in average prices due reduction of VIP customers by 30%.
- ProPulse shows peak sales in Prize rnges of Below 100 and 100-500 with about 30% and 25%, where Above 1000 sales to 15%.

![change over time](https://github.com/rPrajwal18/ProPulse-sports-retail_company_analysis/blob/306f4b68cdca6801b40ec9547118b65d184d1947/images/change_over_time.png)

![proportional analysis by customers](https://github.com/rPrajwal18/ProPulse-sports-retail_company_analysis/blob/306f4b68cdca6801b40ec9547118b65d184d1947/images/proportional_analysis_by_customers.png)

### Product Level Performance
- The VIP Customers of age group Above 50 has customer percent of 29%.
- More purchases in Bikes category has almost 96% of product share.
- Most sold two products being the Road-150 Red and Mountain-100 Black, Mountain-200 Black has 30% sold over total revenue and Average order revenue of 3300+.

![proportional analysis by category](https://github.com/rPrajwal18/ProPulse-sports-retail_company_analysis/blob/306f4b68cdca6801b40ec9547118b65d184d1947/images/proportional_analysis_per_category.png)

## Recommendations

### Maximizing Product Offerings:
- **Expand High-Performing Item Types**: Increase item line variations in Fruits and Vegetables, Snack Foods, Household Items to meet diverse customer needs by driving repeat purchases and solidifying market presence.
- **Optimize Item Pack**: Optimize by bundle it with gift items, or offer as a promotional offers to increase average order value (AOV) and sales contribution.
