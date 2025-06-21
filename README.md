# 🏡 Airbnb Analytics Engineering Project (San Diego)

This project uses dbt, Snowflake, and Tableau to transform and analyze real-world Airbnb data for San Diego. The data is sourced from [Inside Airbnb](http://insideairbnb.com/get-the-data.html) and ingested into Snowflake for modeling and dashboarding.

---

## 🚀 Project Overview

The goal of this project is to build an end-to-end analytics pipeline using the modern data stack:

- ✅ Load raw Airbnb datasets into **Snowflake**
- ✅ Clean and transform the data with **dbt**
- ✅ Model key business metrics for **availability**, **pricing**, and **reviews**
- ✅ Visualize insights in **Tableau**

---

## 🧰 Tech Stack

| Tool      | Purpose                          |
|-----------|----------------------------------|
| **Snowflake** | Cloud data warehouse for storage |
| **dbt Cloud** | Data modeling and transformation |
| **SQL**       | Core transformation language     |
| **Tableau**   | Dashboards and data visualization |

---

## 📂 Project Structure

airbnb-analytics-dbt/
├── models/
│ ├── staging/ # Cleans raw data
│ └── marts/ # Business-level metrics
├── snapshots/ # (optional)
├── dbt_project.yml
└── README.md

---

## 🔍 Key Metrics Modeled

- 💵 **Average nightly price by neighborhood**
- 🛏️ **Availability and occupancy rates over time**
- ⭐ **Review volume and sentiment analysis**
- 🧑‍💼 **Top-performing hosts by activity and listing count**

---

## 📊 Dashboard (Coming Soon)
A Tableau dashboard will be created to visualize pricing, availability, and review trends across San Diego.

*Link to Tableau Public (when ready)*

---

## 📦 Data Source

- Data from [Inside Airbnb – San Diego](http://insideairbnb.com/get-the-data.html)
- Includes:
  - `listings.csv.gz` – Metadata for each listing
  - `calendar.csv.gz` – Daily availability and pricing
  - `reviews.csv.gz` – Guest reviews and review dates

  
## 🧠 Future Improvements

- Add dbt macros for reusable logic
- Expand dashboard with host-level analytics
- Schedule dbt models to run daily or weekly