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
SELECT event_date, COUNT(DISTINCT user_id)
FROM fct_events
GROUP BY event_date;

## Dataset Structure

### raw_events schema
| Column           | Type      | Description |
|------------------|-----------|-------------|
| event_timestamp  | TIMESTAMP | Event timestamp |
| event_name       | STRING    | Name of event |
| user_id          | STRING    | User identifier |
| session_id       | STRING    | Session identifier |
| page_url         | STRING    | Page URL |
| device           | STRING    | Device type |
| source           | STRING    | Acquisition channel |
| country          | STRING    | Country |
| event_value      | FLOAT     | Value associated with event |

## Final Output

The project produces the following analytics-ready tables:

- stg_events: cleaned and standardized events
- dim_users: user dimension with core attributes
- dim_date: date dimension
- fct_events: event-level fact table
- fct_conversions: business-important events only

These tables can be directly used for business KPIs and dashboards.
