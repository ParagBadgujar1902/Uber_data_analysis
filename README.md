
# 🚕 Uber Trip Data Analysis

## 📌 Overview

This project provides an in-depth SQL-based analysis of an Uber trip dataset to uncover trends and insights related to:

- Trip frequency (daily, hourly, monthly)
- Peak usage times
- Trip duration and distance
- Business vs Personal trip patterns
- Most common routes and locations

All queries are written in **SQL** and stored in the script:  
📄 `uber_trip_analysis.sql`

> 🧹 **Note**: The dataset has been cleaned prior to analysis using tools like Python (e.g., `pandas`) to remove duplicates, fix data types, and handle missing values.

---

## 📊 Dataset Description

The dataset used (`uber_dataset_clean`) includes the following columns:

| Column Name     | Description                                      |
|------------------|--------------------------------------------------|
| `START_DATE`     | Date and time when the trip started              |
| `END_DATE`       | Date and time when the trip ended                |
| `START`          | Pickup location                                  |
| `STOP`           | Drop-off location                                |
| `MILES`          | Distance traveled in miles                       |
| `DURATION_MIN`   | Trip duration in minutes                         |
| `PURPOSE`        | Purpose of the trip (e.g., Meeting, Meal)        |
| `CATEGORY`       | Business or Personal classification              |

---

## 🧠 Key Analyses Performed

The SQL script includes queries and views for:

- ✅ Total trips per day and per month  
- ⏰ Hour of the day with the highest ride volume  
- 🧭 Top 5 most common pickup and drop-off combinations  
- 📅 Average trip duration by day of the week  
- 🔄 Longest average trip purpose  
- 📈 Monthly ride trend  
- 🔁 Trips that started and ended at the same location  
- ⚡ Peak hour distance statistics  

---

## 🗂 File Structure

```plaintext
uber-trip-data-analysis/
├── uber_trip_analysis.sql   # Main SQL queries and views
└── README.md                # Project overview and documentation
