# 📊 E-Commerce Conversion Funnel & Retention Analytics Engine

> An end-to-end data engineering and business intelligence solution leveraging **Google BigQuery** and **Looker Studio** to analyze multi-million event streams from Google Analytics 4 (GA4).

[![BigQuery](https://img.shields.io/badge/Google_BigQuery-SQL_Data_Warehouse-4285F4?style=flat&logo=googlecloud)](https://cloud.google.com/bigquery)
[![Looker Studio](https://img.shields.io/badge/Looker_Studio-Interactive_Dashboards-4285F4?style=flat&logo=googlelookerstudio)](https://lookerstudio.google.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

## 🔗 Quick Links
- **Live Dashboard:** [Link to your Looker Studio Dashboard]
- **SQL Transformations:** [`/sql`](./sql)

---

## 📌 Project Overview & Business Value

E-commerce organizations face continuous drop-offs across their sales funnel and struggle to track long-term user retention. Raw web analytics data (such as Google Analytics 4 event logs) is highly nested, complex, and unoptimized for direct reporting.

**This project solves these challenges by:**
1. Transforming raw, nested GA4 event logs into 3 clean, highly-structured **Data Mart views** in **BigQuery**.
2. Calculating critical e-commerce metrics including **Funnel Conversion Rates**, **Cart Abandonment Rates**, **Product Revenue Contribution**, and **30-Day Cohort Retention Rates**.
3. Delivering an interactive, executive-ready **Looker Studio Dashboard** built for marketing, sales, and product stakeholders.

---

## 🏗️ Architecture & Data Pipeline

```text
  [ Raw GA4 Event Stream ]
             │
             ▼  (BigQuery Standard SQL & UNNEST transformations)
  ┌────────────────────────────────────────────────────────┐
  │                 BigQuery Data Marts                    │
  ├──────────────────────┬─────────────────────────────────┤
  │ vw_ecommerce_funnel  │ Aggregated user journey steps   │
  │ vw_product_perf      │ Item-level sales & revenue      │
  │ vw_user_retention    │ 1-day, 7-day, & 30-day cohorts  │
  └──────────────────────┴─────────────────────────────────┘
             │
             ▼  (Direct BI Engine Connection)
  ┌────────────────────────────────────────────────────────┐
  │               Looker Studio Dashboard                  │
  ├────────────────────────────────────────────────────────┤
  │ Page 1: Executive Overview & Conversion Funnel        │
  │ Page 2: Product Performance & Retention Matrix         │
  └────────────────────────────────────────────────────────┘
