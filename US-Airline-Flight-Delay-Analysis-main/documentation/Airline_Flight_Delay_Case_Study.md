# US Airline Flight Delay Analysis (2015)

## Overview
Analyzed 5.8M+ (6M) U.S. domestic flight records from 2015 to identify delay patterns, root causes, and airline/airport performance trends. Built a full pipeline from raw data to an interactive executive dashboard.

**Tools used:** MySQL, Power BI
**Dataset:** U.S. DOT — 2015 Flight Delays and Cancellations (Kaggle)
**Dashboard:** [PASTE_PUBLISHED_LINK_HERE]

---

## Process

### 1. Data Engineering (MySQL)
- Designed a normalized schema with 3 tables (`flights`, `airlines`, `airports`) to support proper relational joins
- Loaded 5.8M+ rows via `LOAD DATA INFILE`, resolving real-world import issues along the way:
  - Fixed Windows `secure_file_priv` restrictions blocking bulk file loads
  - Handled blank-string-to-NULL conversion for numeric delay columns using session variables + `NULLIF()`
  - Diagnosed and corrected a partial/truncated import (connection timeout mid-load) by adjusting MySQL timeout settings and verifying row counts before proceeding
- Result: a clean, fully-loaded table of ~5.8M flight records ready for analysis

### 2. SQL Analysis
Wrote analytical queries covering:
- **JOINs** — mapping airline/airport codes to readable names
- **Window functions** — `RANK() OVER (PARTITION BY ...)` to rank airlines by delay, per month
- **CTEs** — busy-airport delay percentage analysis with `HAVING` filters
- **Conditional aggregation** — `CASE WHEN` logic for delay-rate and cancellation-rate calculations
- **Root cause breakdown** — average delay time by cause (air system, security, airline, late aircraft, weather)

### 3. Dashboard (Power BI)
- Connected Power BI directly to MySQL using a pre-aggregated import query (avoiding a 5.8M-row raw import)
- Built 7 DAX measures: Total Flights, Total Delayed, Total Cancelled, On Time Flights, % Delayed, Cancellation Rate %, Avg Delay
- Designed an interactive single-page dashboard with:
  - KPI cards (Total Flights, % Delayed, Avg Delay, Total Delayed, Total Cancelled, Cancellation Rate %)
  - Delay Rate by Airline (bar chart)
  - Average Delay by Month (line chart)
  - Delay Rate by Day of Week (column chart)
  - Average Delay by Cause (table — Late Aircraft, Airline, Air System, Weather, Security)
  - Flight Status Breakdown — On Time / Delayed / Cancelled (donut chart)
  - Airline and Month slicers for interactive filtering

---

## Key Findings

- **Overall delay rate:** 17.59% of flights were delayed more than 15 minutes (avg delay: 4.88 min across all flights)
- **Cancellation rate:** 1.54% (89.88K of ~5.8M flights cancelled)
- **On-time performance:** 80.87% of flights arrived on time
- **Worst-performing airline:** Spirit Air Lines (28.3% delayed) — notably worse than the next closest, Frontier Airlines (25.2%)
- **Most reliable among top carriers:** United Air Lines (19.6% delayed) — lowest delay rate among the airlines with the most volume
- **Worst day of week:** Thursday (18.9% delayed), closely followed by Monday (18.5%) and Friday (18.2%)
- **Best day of week:** Saturday (15.1% delayed) — notably better than every weekday
- **Worst month:** June (10.3 min average delay), with a smaller secondary peak in February (9.1 min)
- **Best month:** October, which actually ran ahead of schedule on average (-0.8 min), alongside September (-0.4 min)
- **Seasonal pattern:** delays climb sharply into summer (Apr→Jun) and again around year-end holiday travel (Oct→Dec)
- **Primary delay causes (avg minutes among delayed flights):** Late Aircraft Delay (23.47 min) and Airline Delay (18.97 min) are by far the largest contributors — together dwarfing Air System Delay (13.48 min), Weather Delay (2.92 min), and Security Delay (0.08 min). This shows most delays are operational/airline-caused, not weather-driven as commonly assumed.

---

## Data Quality Notes (real-world messiness handled)
- Discovered that `ORIGIN_AIRPORT`/`DESTINATION_AIRPORT` values in this dataset version are inconsistently formatted (some numeric IDs, some IATA codes) — documented as a known limitation rather than silently producing misleading joins
- Recovered from a partial/interrupted bulk load (5.8M-row import cut short mid-transfer by a connection timeout) by validating row counts before trusting downstream aggregates — a data-integrity habit worth flagging in interviews

---


