# US Airline Flight Delay Analysis (2015)

## 📌 Project Overview

Analyzed 5.8M+ U.S. domestic flight records from 2015 to identify
delay patterns, root causes, and airline/airport performance trends.

Built an end-to-end data analytics pipeline using MySQL and Power BI.

---

## 🛠️ Tools & Technologies

- MySQL
- SQL
- Power BI
- DAX
- Power Query

---

## 📊 Dashboard

![Dashboard](dashboard/dashboard.png)

---

## 🎯 Business Objectives

- Identify airlines with the highest delay rates
- Analyze monthly delay patterns
- Identify the worst and best days for delays
- Analyze major causes of flight delays
- Compare airline performance
- Analyze cancellation rates
- Monitor overall flight performance

---

## 🔄 Project Workflow

Raw Data
   ↓
MySQL
   ↓
Data Cleaning
   ↓
SQL Analysis
   ↓
Pre-Aggregation
   ↓
Power BI
   ↓
DAX
   ↓
Interactive Dashboard

---

## 🗄️ Data Engineering

Designed a normalized MySQL schema consisting of:

- flights
- airlines
- airports

Loaded approximately 5.8M flight records and handled
real-world data import issues.

---

## 🔎 SQL Analysis

The analysis includes:

- JOINs
- CTEs
- Window Functions
- RANK()
- Conditional Aggregation
- CASE WHEN
- Delay-rate analysis
- Cancellation-rate analysis
- Root-cause analysis

---

## 📈 Power BI Dashboard

The dashboard contains:

- Total Flights
- Total Delayed
- Total Cancelled
- On-Time Flights
- Delay Rate
- Cancellation Rate
- Average Delay
- Delay Rate by Airline
- Average Delay by Month
- Delay Rate by Day of Week
- Average Delay by Cause
- Flight Status Breakdown

---

## 📌 Key Findings

- Overall delay rate: 17.59%
- Cancellation rate: 1.54%
- On-time performance: 80.87%
- Worst-performing airline: Spirit Air Lines
- Worst day: Thursday
- Best day: Saturday
- Worst month by average delay: June

---

## 📂 Repository Structure

```text
us-airline-flight-delay-analysis/
│
├── README.md
├── data/
├── sql/
├── powerbi/
├── dashboard/
├── documentation/
└── .gitignore