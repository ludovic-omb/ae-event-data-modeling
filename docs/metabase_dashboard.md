# Metabase Dashboard – Analytics Engineering Project

## Objective
The purpose of this dashboard is to demonstrate how
analytics-engineered datasets can be used to deliver
reliable business insights and self-service analytics.

The dashboard is built exclusively on analytics-ready tables
and does not query raw data directly.

---

## Data Sources

The dashboard relies on the following tables:

- fct_events
- fct_conversions
- dim_users
- dim_date

All metrics and visualizations are derived from
well-defined fact and dimension tables.

---

## Key KPIs

### Global Metrics
The dashboard provides a high-level overview of platform performance:

- Active users
- Total events
- Total conversions
- Global conversion rate

These KPIs are designed to be stable, reproducible,
and aligned with business definitions.

---

## Funnel Analysis

A conversion funnel is built using event-level data
from the `fct_events` table.

### Funnel steps:
1. page_view
2. add_to_cart
3. purchase

The funnel highlights:
- user drop-off between steps
- overall conversion efficiency
- potential friction points in the user journey

---

## Segmentation & Breakdown Analysis

The dashboard allows conversion analysis across
key business dimensions:

### User dimensions:
- Primary device
- Primary country

### Time dimensions:
- Daily trends
- Monthly aggregation

These breakdowns are enabled by joining fact tables
with dimension tables at query time.

---

## Data Quality Monitoring

Basic data quality indicators are included
to monitor dataset reliability:

- Percentage of events without user_id
- Percentage of events without session_id
- Daily event volume trends

These indicators help detect anomalies
and ensure trust in reported KPIs.

---

## Design Choices

Key analytics engineering principles applied:

- No business logic in BI layer
- All metrics rely on pre-modeled datasets
- Clear separation between data preparation and visualization
- BI used as a consumption layer, not a transformation layer

---

## Outcome

This dashboard demonstrates how proper data modeling
enables scalable analytics and reliable self-service reporting.

The focus is not on visualization complexity,
but on data quality, consistency, and usability.
