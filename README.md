# Analytics Engineering – Event Data Modeling

## Project Objective
The goal of this project is to transform raw event-level data
into analytics-ready datasets that can be reliably used
for business analysis and decision-making.

## Dataset & Data Sources
The project uses simulated GA4-like event data
representing user interactions on an e-commerce website.
Each row represents a single event at event-level granularity.

## Data Modeling
The data model follows analytics engineering best practices:
- staging layer for cleaned data
- dimension tables for stable attributes
- fact tables for business events and metrics

Main tables:
- stg_events
- dim_users
- dim_date
- fct_events
- fct_conversions

## SQL Transformations – Examples
```sql
SELECT event_date, COUNT(DISTINCT user_id)
FROM fct_events
GROUP BY event_date;
