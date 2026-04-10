# 🎓 E-Learning Platform Analysis (MySQL)

> **Transforming raw transactional data into actionable business intelligence using MySQL.**

---

## 📌 Project Overview
This project focuses on designing and querying a relational database for a digital education marketplace. The primary goal is to simulate a real-world environment where data is used to drive **marketing strategies**, **catalog optimization**, and **learner retention** efforts.

## 🚀 Key Objectives
*   **Database Design:** Create a normalized schema for learners, courses, and transactions.
*   **Data Analysis:** Use advanced SQL to extract key performance indicators (KPIs).
*   **Strategic Insights:** Translate raw numbers into business recommendations for platform growth.

## 🛠️ Tech Stack
*   **Engine:** MySQL 8.0
*   **Tools:** MySQL Workbench / Command Line
*   **Concepts:** Joins (Inner/Left), Aggregations, Subqueries, Constraints (PK/FK), and Data Normalization.

## 🗂️ Database Schema
The architecture consists of three interconnected tables:
1.  **`learners`**: User profiles (Name, Country).
2.  **`courses`**: Product catalog (Name, Category, Price).
3.  **`purchases`**: Transaction records (Quantity, Date).

## 🔍 Analytical Insights Generated
The project includes optimized SQL queries to address 5 critical business questions:
*   **Revenue Analysis:** Total spending per learner segmented by geography.
*   **Product Performance:** Identifying the top 3 "Hero" courses by sales volume.
*   **Category Profitability:** Comparing revenue and unique learner counts across categories.
*   **Platform Stickiness:** Identifying loyal learners who purchase from multiple categories.
*   **Inventory Audit:** Pinpointing underperforming courses with zero sales.

## 💡 Strategic Recommendations
Based on the data, this project proposes:
*   **Marketing Focus:** Reallocate budget to the top 3 categories to maximize ROI.
*   **Retention Bundles:** Create "Cross-Category" discounts to encourage learners to explore new topics.
*   **Catalog Cleanup:** Refresh or retire courses with zero sales to maintain platform quality.

## 📂 Repository Structure
*   `schema.sql`: Script to create the database and tables.
*   `data.sql`: Sample datasets for testing.
*   `analysis.sql`: All analytical queries (Q1 - Q5).
*   `report.pdf`: Comprehensive project documentation and insights.

## ⚙️ How to Run
1. Clone this repository: `git clone https://github.com`
2. Open **MySQL Workbench**.
3. Run the scripts in the following order: `schema.sql` -> `data.sql` -> `analysis.sql`.

---

**Prepared by:** [N.RAMALAKSHMI]  
**Course:** Data Analytics 

