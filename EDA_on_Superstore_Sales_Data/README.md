# Superstore Sales — Exploratory Data Analysis

## 📌 Project Overview

This project performs an **Exploratory Data Analysis (EDA)** on Superstore sales data to understand sales performance, profitability, customer segments, product categories, regional performance, relationships between numerical variables, and potential areas of business improvement.

The project includes data cleaning, exploratory analysis, statistical investigation, data visualization, automated profiling, and documentation of the findings.

---

## 🎯 Project Objectives

The main objectives of this project are:

* Understand the structure and quality of the Superstore dataset.
* Clean and prepare the data for analysis.
* Identify missing values and duplicate records.
* Analyze sales and profit across different categories and sub-categories.
* Analyze sales performance across customer segments and regions.
* Understand the relationship between sales, profit, discount, and quantity.
* Identify negative-profit orders and potential loss-making areas.
* Detect potential outliers in important numerical variables.
* Generate visualizations to communicate important findings.
* Identify areas for further business analysis.

---

## 📂 Dataset

The project uses the **Superstore Sales dataset**.

The dataset contains order-level information covering the period:

**January 2016 – December 2019**

The main data includes information related to:

* Orders
* Customers
* Products
* Categories
* Sub-Categories
* Sales
* Quantity
* Discount
* Profit
* Regions
* States
* Customer Segments

Additional tables/files include:

* People
* Returns

### Dataset Size

The Orders dataset contains:

* **9,994 rows**
* **21 columns**

---

## 🧹 Data Cleaning

The data was inspected and cleaned before performing exploratory analysis.

### Missing Values

The Orders dataset contained **11 missing Postal Code values**.

These records were associated with Burlington/East. Since postal codes were inconsistent in other parts of the dataset, the Postal Code column was removed rather than filling the missing values with potentially misleading values.

### Duplicate Records

**8 duplicate order rows** were identified and removed from the Orders dataset.

The Returns dataset originally contained **801 rows**. After removing **504 exact duplicate records**, **297 unique returned-order records** remained.

### Region Data

Three `NorthEast` labels were identified in the Region column for New York City orders.

These should be standardized to the appropriate `East` region before performing the final regional analysis.

---

## 📊 Exploratory Data Analysis

The analysis covers the following areas:

### 1. Category Analysis

Sales were analyzed across the major product categories:

* Technology
* Furniture
* Office Supplies

Technology generated the highest category-level sales, followed by Furniture and Office Supplies.

### 2. Sub-Category Analysis

Sub-category sales were analyzed to identify products contributing significantly to overall sales.

**Phones** and **Chairs** were among the highest-selling sub-categories, with each generating more than approximately **$325K in sales**.

### 3. Customer Segment Analysis

The three major customer segments were analyzed:

* Consumer
* Corporate
* Home Office

The **Consumer** segment generated approximately **$1.16M in sales**.

### 4. Regional Analysis

Sales were analyzed across different regions.

The analysis showed approximately:

* West: **$725K**
* East: **$679K**
* Central: **$501K**
* South: **$392K**

The regional analysis also identified inconsistent `NorthEast` labels that should be corrected before final conclusions are made.

### 5. Sales and Profit Analysis

Sales and profit distributions were analyzed to understand their spread and identify extreme observations.

Sales showed a long-tailed distribution, with individual sales values reaching approximately **$22,600**.

Profit ranged approximately from:

* **-$6,600**
* to **+$8,400**

### 6. Negative Profit Analysis

The dataset contained approximately **1,871 negative-profit orders**.

These orders are important areas for further investigation because high sales do not necessarily result in high profitability.

### 7. Discount and Profit Analysis

The relationship between discount and profit was investigated.

The dataset contains observations with discounts reaching approximately **60–80%**, making the relationship between discounting and profitability an important area for further analysis.

### 8. Correlation Analysis

Correlation analysis was performed on relevant numerical variables to understand relationships between:

* Sales
* Quantity
* Discount
* Profit

### 9. Outlier Analysis

Outlier detection was performed to identify unusual observations in important numerical variables.

These observations can be investigated further to determine whether they represent genuine business cases or unusual transactions.

---

## 🔍 Key Findings

Some important findings from the analysis include:

* Technology generated the highest category-level sales.
* Phones and Chairs were among the highest-selling sub-categories.
* Consumer was the largest customer segment by sales.
* West and East generated higher sales than Central and South.
* The dataset contains a significant number of negative-profit orders.
* Sales and profit have long-tailed distributions.
* High discounts require further investigation because of their potential relationship with profitability.
* Several data-quality issues were identified and addressed during cleaning.
* Regional labels require standardization before final regional conclusions.
* High-sales but low-profit transactions are an important area for further investigation.

---

## 📈 Visualizations

The project includes visualizations for:

* Sales by Category
* Sales by Sub-Category
* Sales by Segment
* Sales by Region
* Sales vs Profit
* Discount vs Profit
* Sales Distribution
* Profit Distribution
* Quantity Distribution
* Discount Distribution
* Correlation Heatmap
* Outlier Detection

---

## 🛠️ Tools & Technologies

The project was developed using:

* **Python**
* **Pandas**
* **NumPy**
* **Matplotlib**
* **Seaborn**
* **Excel**
* **Jupyter Notebook**
* **YData Profiling**
* **Git & GitHub**

---

## 📁 Project Structure

```text
EDA_on_Superstore_Sales_Data/
│
├── .gitignore
│
├── 01_data_cleaning_and_eda.ipynb
├── 02_automated_profiling.ipynb
│
├── Data/
│   ├── sample_superstore.xlsx
│   └── cleaned Data/
│       └── cleaned_sample_superstore.xlsx
│
├── images/
│   ├── download1.png
│   ├── download2.png
│   ├── download3.png
│   ├── download4.png
│   └── outlier.png
│
└── reports/
    ├── Superstore_EDA_Report.pdf
    └── ydata_profiling_output/
        ├── orders_df_Data_profiling.html
        ├── people_df_Data_profiling.html
        └── return_df_Data_profiling.html
```

---

## 🚀 How to Run the Project

### 1. Clone the repository

```bash
git clone https://github.com/JagjeetSonwalkar/EDA_on_Superstore_Sales_Data.git
```

### 2. Navigate to the project directory

```bash
cd EDA_on_Superstore_Sales_Data
```

### 3. Install the required Python libraries

```bash
pip install pandas numpy matplotlib seaborn openpyxl jupyter ydata-profiling
```

### 4. Open Jupyter Notebook

```bash
jupyter notebook
```

### 5. Run the notebooks

Start with:

```text
01_data_cleaning_and_eda.ipynb
```

Then review:

```text
02_automated_profiling.ipynb
```

---

## 📄 Project Report

A detailed project report is available in:

```text
reports/Superstore_EDA_Report.pdf
```

The report contains the data-cleaning process, exploratory analysis, visualizations, findings, and areas for further investigation.

---

## 🔎 Future Analysis

The current project focuses primarily on exploratory data analysis. The following areas can be explored in future work:

* Investigate negative-profit orders.
* Analyze the relationship between discount and profit in more detail.
* Identify high-sales but low-profit sub-categories.
* Perform detailed state-level profitability analysis.
* Analyze consistently loss-making customers and products.
* Investigate regional profitability.
* Perform detailed outlier investigation.
* Add time-based sales and profit analysis.
* Join the Returns data with Orders data to analyze the effect of returned orders.
* Develop an interactive dashboard using Power BI or Tableau.

---

## 👨‍💻 Author

**Jagjeet Sonwalkar**

Aspiring Data Analyst | Python | SQL | Excel | Power BI | Tableau

GitHub:
https://github.com/JagjeetSonwalkar

---

## ⭐ Project Purpose

This project was created as a practical **Data Analytics portfolio project** to demonstrate skills in:

* Data Cleaning
* Exploratory Data Analysis
* Data Visualization
* Statistical Analysis
* Business Insights
* Python for Data Analysis
* Analytical Thinking
* Data Quality Assessment
