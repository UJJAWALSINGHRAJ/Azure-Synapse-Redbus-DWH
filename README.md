# Azure Synapse Redbus Data Warehouse Project

## Project Overview

This project demonstrates the implementation of an End-to-End Data Warehouse solution using Azure Synapse Analytics and Azure Data Lake Storage Gen2.

The objective of this project is to load raw Redbus booking data from a CSV file, transform it into a structured Data Warehouse model, and perform reporting and analytics using Fact and Dimension tables.

---

## Technologies Used

* Azure Synapse Analytics
* Azure Dedicated SQL Pool
* Azure Data Lake Storage Gen2
* SQL
* Data Warehouse
* Star Schema
* ETL Process
* Git & GitHub

---

## Architecture

```text
REDBUS_CLEAN.csv
        |
        v
Azure Data Lake Storage Gen2
        |
        v
External Table (ext_redbus)
        |
        v
Managed Table (s_redbus)
        |
        +-------------------+
        |                   |
        v                   v
Dimension Tables      Fact Table
(dim_customer)        (fact_booking)
(dim_route)
(dim_bus)
(dim_payment)
        |
        v
Reporting & Analytics
```

---

## Project Workflow

### Step 1: Data Ingestion

The Redbus dataset was uploaded into Azure Data Lake Storage Gen2.

File:

```text
REDBUS_CLEAN.csv
```

Storage Components:

* Storage Account
* Container
* CSV Dataset

---

### Step 2: External Table Creation

An External Table was created to read data directly from Azure Storage without loading it into the database.

Table:

```sql
ext_redbus
```

Purpose:

* Read CSV data
* Validate source records
* Access storage data through Synapse

---

### Step 3: Managed Table Creation

A managed table was created inside Dedicated SQL Pool.

Table:

```sql
s_redbus
```

Purpose:

* Store data inside Synapse
* Improve query performance
* Prepare data for Data Warehouse modeling

---

### Step 4: Dimension Table Creation

Dimension tables were created using distinct values from the source table.

#### DimCustomer

Stores customer information.

Columns:

* customer_key
* first_name
* last_name
* age

---

#### DimRoute

Stores route information.

Columns:

* route_key
* city_from
* city_to

---

#### DimBus

Stores bus details.

Columns:

* bus_key
* bus_type
* seat_type

---

#### DimPayment

Stores payment information.

Columns:

* payment_key
* payment_method
* booking_type

---

### Step 5: Fact Table Creation

Fact table stores measurable business data.

Table:

```sql
fact_booking
```

Columns:

* booking_id
* customer_key
* route_key
* bus_key
* payment_key
* ticket_fare

Purpose:

* Store booking transactions
* Connect all dimensions
* Support business reporting

---

## Data Warehouse Model

### Star Schema

```text
                dim_customer
                       |
                       |
dim_route ---- fact_booking ---- dim_bus
                       |
                       |
                 dim_payment
```

---

## Keys Used

### Primary Keys

* customer_key
* route_key
* bus_key
* payment_key
* booking_id

### Foreign Keys

* customer_key
* route_key
* bus_key
* payment_key

### Surrogate Keys

Identity columns generated inside Dimension Tables:

```sql
customer_key
route_key
bus_key
payment_key
```

---

## Reporting Queries

The following reports were generated:

### Customer Booking Report

* Customer Name
* Route
* Bus Type
* Payment Method
* Ticket Fare

### Revenue Analysis

* Revenue by Route
* Revenue by Bus Type

### Booking Analysis

* Total Bookings by City
* Total Bookings by Payment Method

### Fare Analysis

* Average Ticket Fare

---

## Learning Outcomes

Through this project I learned:

* Azure Synapse Analytics
* Dedicated SQL Pool
* Azure Storage Integration
* External Tables
* Managed Tables
* Data Warehouse Design
* Star Schema Modeling
* Fact and Dimension Tables
* Surrogate Keys
* SQL Joins
* Reporting Queries
* GitHub Project Management

---

## Author

**Ujjawal Kumar**

Data Engineering Intern

Azure Synapse | SQL | Data Warehouse | ETL | Cloud Data Engineering
