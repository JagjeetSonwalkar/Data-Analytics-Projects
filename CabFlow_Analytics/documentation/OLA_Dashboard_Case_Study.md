# OLA Ride Booking Analytics Dashboard (July 2024)

## Overview
Built a 5-page interactive Power BI dashboard analyzing 103,024 OLA ride bookings for July 2024, covering overall performance, vehicle-type economics, revenue, cancellations, and ratings — a full operational view of a ride-hailing business for a single month.

**Tools used:** Excel/CSV, Power BI
**Dataset:** OLA ride bookings — July 2024 (103,024 records)
**Dashboard:** [PASTE_PUBLISHED_LINK_HERE]

---

## Process

### 1. Data Preparation (Excel/CSV)
- Cleaned and structured raw booking-level data (fields: booking ID, customer ID, vehicle type, booking value, distance, payment method, booking status, cancellation reason, driver/customer ratings)
- Verified date range (01-07-2024 to 31-07-2024) and checked for consistent formatting before loading into Power BI

### 2. Data Modeling & DAX (Power BI)
- Imported the cleaned dataset directly into Power BI
- Built DAX measures for booking value, success rate, cancellation rate, and average distance
- Created calculated fields to categorize cancellation reasons separately for customer-initiated vs driver-initiated cancellations

### 3. Dashboard — 5 pages
- **Overall:** KPI cards (Total Bookings, Total Booking Value), Booking Status Breakdown (pie chart), Ride Volume Over Time (line chart), date range filter
- **Vehicle Type:** Table comparing Total Booking Value, Success Booking Value, Avg. Distance Travelled, and Total Distance Travelled across 7 vehicle categories (Prime Sedan, Prime SUV, Prime Plus, Mini, Auto, Bike, E-Bike)
- **Revenue:** Revenue by Payment Method (bar chart), Top 5 Customers by booking value (table), Daily Ride Distance Trend (bar chart)
- **Cancellation:** KPI cards (Total/Success/Cancelled Bookings, Cancellation Rate), separate pie charts for Cancelled Rides by Customers vs by Riders, each broken down by specific reason
- **Ratings:** Side-by-side comparison of average Driver Ratings and Customer Ratings across all 7 vehicle types

---

## Key Findings

- **Total bookings:** 103,024, worth ₹35M in total booking value
- **Success rate:** 62.09% of bookings completed successfully (63,967 rides); the remaining 37.91% failed for various reasons
- **Cancellation breakdown:** 17.89% cancelled by driver, 10.19% cancelled by customer, 9.83% ended in "Driver Not Found" — meaning driver-side issues (cancellations + no driver found) account for more failed bookings than customer cancellations
- **Overall cancellation rate:** 28.08% (28,933 of 103,024 bookings)
- **Top cancellation reason (by customers):** "Driver is not moving toward pickup" (30.24% of customer cancellations), followed by "Driver asked to cancel" (25.43%)
- **Top cancellation reason (by riders/drivers):** "Personal & car-related issues" (35.49%), followed by "Customer related issue" (29.36%)
- **Vehicle type economics:** Booking value is fairly evenly spread (₹7.9M–8.3M) across all 7 vehicle types, but **Auto has a much shorter average distance (10.04 km) than every other category (~25 km)** — Auto rides are short-trip/local, while other vehicle types serve longer trips
- **Payment method:** Cash and UPI dominate revenue, together far outweighing Credit Card and Debit Card combined — most riders aren't paying by card
- **Ratings:** Extremely consistent across the board — both driver and customer ratings sit tightly around 4.0 for every vehicle type (range: 3.98–4.01), suggesting no single vehicle category has a notable satisfaction problem
- **Ride volume:** Fairly stable through the month (~3,200–3,400 daily bookings) with a sharp uptick near July 28 before a drop at month-end (likely a partial last day of data)

---

## Data Quality Notes
- The sharp single-day drop in "Ride Volume Over Time" right at the end of the date range (July 31) is likely a partial day of data rather than a genuine demand collapse — worth flagging rather than over-interpreting as a trend
- Cancellation reason labels were truncated in the source visuals (e.g., "Driver is not moving t...", "Customer was coughi...") — full text should be verified against the raw dataset before quoting these reasons externally

---

## Resume Bullet (ready to use)
> Built a 5-page Power BI dashboard analyzing 103K+ OLA ride bookings, covering booking performance, vehicle-type economics, revenue by payment method, and a 28% cancellation rate broken down by root cause (customer vs. driver-initiated); surfaced insights such as Auto rides averaging 60% shorter distances than other vehicle types and driver-side issues outweighing customer cancellations.
