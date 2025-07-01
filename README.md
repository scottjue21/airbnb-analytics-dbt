# 🏡 Airbnb Analytics Engineering Project (San Diego)

This project uses **dbt**, **Snowflake**, and **Tableau** to transform and analyze real-world Airbnb data for San Diego. The data is sourced from [Inside Airbnb](http://insideairbnb.com/get-the-data.html) and ingested into **Snowflake** for modeling and dashboarding.

---

## 🚀 Project Overview

The goal of this project was to build an **end-to-end analytics engineering pipeline** using the modern data stack:

- ✅ Load raw Airbnb datasets into **Snowflake**
- ✅ Clean, test, and transform the data with **dbt**
- ✅ Model key business metrics for **availability**, **pricing**, **reviews**, and **occupancy**
- ✅ Visualize insights in **Tableau Public** through interactive dashboards
  
---

## 🧰 Tech Stack

| Tool      | Purpose                          |
|-----------|----------------------------------|
| **Snowflake** | Cloud data warehouse for storage |
| **dbt Cloud** | Data modeling, transformation, testing, and documentation |
| **SQL**       | Core transformation language     |
| **Tableau**   | Dashboards and data visualization |

---

## 📂 Project Structure

```
airbnb-analytics-dbt/
├── models/
│   ├── staging/        # Cleans raw data
│   └── marts/          # Business-level metrics
├── snapshots/          
├── dbt_project.yml
└── README.md
```

---

## 🔍 Key Metrics Modeled

- 💵 **Average nightly price by neighborhood**
- 🏘️ **Top revenue-generating neighborhoods**
- 🛏️ **Occupancy rates over time**
- ⭐ **Monthly review volume as a proxy for demand**
- 🏠 **Revenue contribution by room type**

---

## 📈 Project DAG (Data Lineage Flow)

Below is the full **dbt project DAG (Directed Acyclic Graph)**, showing how raw Inside Airbnb source data flows through each transformation layer:

- ✅ **Source Tables** (green nodes) represent raw data loaded into Snowflake.
- ✅ **Staging Models** clean and standardize raw data.
- ✅ **Dimension and Fact Models** capture key business entities and metrics.
- ✅ **Aggregate Models** summarize data for downstream Tableau dashboards.


![Project DAG](images/project_dag.png)

---

## ❄️ Snowflake Production Schema
Below is a preview of the production schema (`AIRBNB_PROJECT_MARTS`) in **Snowflake**, where all dbt models were deployed. This includes **dimension tables**, **fact tables**, and **aggregate models** that power the Tableau dashboards.

![Snowflake Schema Preview](images/snowflake_schema.png) <br>
*Deployed and orchestrated using dbt Cloud Jobs.*

---
## 📄 Example Snowflake Query: Monthly Revenue by Neighborhood and Room Type

This query joins the `LISTING_MONTHLY_REVENUE` fact table with the `DIM_LISTINGS` dimension table to calculate total revenue by neighborhood and room type:

![Snowflake Query Preview](images/snowflake_query.png)

---

## 📊 Tableau Dashboard
Two **Tableau Public dashboards** were created to visualize revenue, pricing, occupancy, and demand trends:

1. **Revenue & Pricing Trends**
2. **Demand & Occupancy Trends**

👉 [View the Published Tableau Dashboards](https://public.tableau.com/views/AirbnbSanDiegoRevenueDemandandOccupancyTrends/RevenueandPricingTrends?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

---

## 📦 Data Source

- Public data from [Inside Airbnb – San Diego](http://insideairbnb.com/get-the-data.html)
- Datasets used:
  - `listings.csv.gz` – Metadata for each listing
  - `calendar.csv.gz` – Daily availability and pricing
  - `reviews.csv.gz` – Guest reviews and review dates

  
## ✅ Future Improvements

- Add dbt macros for reusable logic
- Schedule dbt models for automated runs
- Automate data ingestion from Inside Airbnb (e.g., with Airflow or dbt jobs)
- Expand Tableau dashboards with booking lead time and cancellation analysis
