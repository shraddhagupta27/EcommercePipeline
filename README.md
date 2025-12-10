# EcommercePipeline

## E-Commerce Analytics Pipeline
Cloud-based analytics pipeline using Python, BigQuery, and Looker Studio to transform raw e-commerce data into interactive dashboards that identify seller performance gaps, customer demand trends, and delivery inefficiencies.

## Overview
This project builds an end-to-end cloud analytics solution for an e-commerce platform. Raw transactional data (orders, customers, sellers, and delivery details) is ingested, modeled, and analyzed in BigQuery, with Python used for data preparation and automation. The final output is an interactive Looker Studio dashboard that provides decision-makers with clear visibility into seller performance, customer demand patterns, and delivery operations.

## Problem Statement

E-commerce businesses often struggle to answer core performance questions: Which sellers are driving revenue vs. causing issues (delays, cancellations, refunds)? Which products and categories have the highest demand and profitability? Where are delivery bottlenecks occurring (regions, carriers, or sellers)? How do customer behavior and purchase patterns vary by segment?
Raw data is typically siloed, noisy, and difficult to interpret without a proper analytics layer. This project solves that by delivering a centralized, analytics-ready data model and dashboard that surfaces actionable KPIs for operations, category management, and marketplace teams.

## Dataset

Source: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce/data?select=olist_customers_dataset.csv
https://www.kaggle.com/datasets/olistbr/marketing-funnel-olist?select=olist_closed_deals_dataset.csv

## Tools & Technologies

- Google Cloud Platform (GCP) - Cloud Storage (for raw data landing), BigQuery (data warehouse & SQL analytics)
- Python (pandas, numpy, google-cloud-bigquery)
- Looker Studio (formerly Data Studio) for dashboards & visualization

## Methods

- Data Ingestion - Store raw CSV files in Google Cloud Storage or upload directly via BigQuery UI.
- Create BigQuery external tables or load into native BigQuery tables for faster querying.
- Data Modeling & Cleaning (Python + BigQuery)
- Use Python + BigQuery for data preparation, Feature Engineering & Aggregations
- SQL Analytics in BigQuery
- Connect Looker Studio to BigQuery for Dashboard Development (Looker Studio)

## Key Insights 

- Identified low-performing sellers despite large company size.
- 77% of customers pay using credit card.
- Identified delivery accross interstate and intrastate.

## Dashboard 

https://lookerstudio.google.com/reporting/bbef79b6-3eeb-4842-9997-f741e3261dcb

