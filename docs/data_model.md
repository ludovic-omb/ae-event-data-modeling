# Data Model – Analytics Engineering Project

## Overview
This project follows an analytics engineering approach to transform
raw event-level data into analytics-ready datasets.

The model is designed to:
- ensure clear granularity
- separate concerns between facts and dimensions
- support scalable and reliable business analytics

The final schema follows a star-like model
with event-level fact tables and shared dimensions.

---

## Source Data – raw_events

The source dataset contains raw event-level data.
Each row represents a single user interaction.

### Granularity
- 1 row = 1 event
- Events are linked to a user and a session

### Main columns
- event_timestamp
- event_name
- user_id
- session_id
- device
- country
- source
- event_value

Raw data is not queried directly by analytics or BI tools.

---

## Staging Layer

### stg_events
The staging layer is responsible for cleaning and standardizing raw data.
No business logic is applied at this stage.

Responsibilities:
- standardize column names
- normalize event names
- handle missing values
- cast data types
- extract event_date from event_timestamp

Granularity:
- 1 row = 1 event

---

## Dimension Tables

### dim_users
The user dimension contains stable user-level attributes.

Granularity:
- 1 row = 1 user

Attributes:
- user_id
- first_event_date
- primary_device
- primary_country

Primary attributes are derived from user behavior
using frequency-based logic.

---

### dim_date
The date dimension centralizes all time-related attributes
to avoid repeated calculations across fact tables.

Granularity:
- 1 row = 1 date

Attributes:
- date
- year
- month
- year_month
- week_of_year
- day_of_week
- day_name
- is_weekend

---

## Fact Tables

### fct_events
The central fact table containing all events.

Granularity:
- 1 row = 1 event

Keys:
- event_id (surrogate key)
- user_id (FK to dim_users)
- event_date (FK to dim_date)

Metrics:
- event_value

This table serves as the foundation for funnels,
usage metrics, and behavioral analysis.

---

### fct_conversions
A derived fact table focusing on business-critical events.

Granularity:
- 1 row = 1 conversion event

Conversion types include:
- purchase
- signup

Keys:
- conversion_id
- event_id
- user_id
- event_date

This table simplifies KPI calculation and conversion analysis
without impacting the core event dataset.

---

## Relationships

- fct_events.user_id → dim_users.user_id
- fct_events.event_date → dim_date.date
- fct_conversions.event_id → fct_events.event_id

Dimensions are joined at query time
to preserve flexibility and avoid data duplication.

---

## Design Principles

- Clear separation between staging, dimensions, and facts
- Stable granularity for each table
- No business logic in staging
- Minimal duplication of attributes
- Analytics-ready tables optimized for BI and self-service

---

## Usage

This data model supports:
- KPI computation
- conversion funnel analysis
- segmentation by user attributes
- time-based trend analysis
- BI dashboards and self-service analytics
