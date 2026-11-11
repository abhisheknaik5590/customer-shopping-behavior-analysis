# Customer Shopping Behavior Analysis

An end-to-end data analytics project that cleans a retail customer dataset with **Python**, analyzes it with **PostgreSQL**, and visualizes the results in an interactive **Power BI** dashboard.

## Objective

Understand how customers shop and which factors drive revenue, by answering questions such as:

- How much revenue comes from male vs. female customers?
- Which customers use a discount and still spend more than the average?
- Which products have the highest ratings, and which are discounted most often?
- Do subscribers spend more than non-subscribers?
- How do shipping type and customer loyalty relate to spending?

## Dataset

- **File:** `customer_shopping_behavior.csv`
- **Size:** 3,900 rows × 18 columns
- **Key columns:** Customer ID, Age, Gender, Item Purchased, Category, Purchase Amount (USD), Location, Size, Color, Season, Review Rating, Subscription Status, Shipping Type, Discount Applied, Promo Code Used, Previous Purchases, Payment Method, Frequency of Purchases

## Tools Used

| Stage | Tools |
|---|---|
| Data cleaning & feature engineering | Python, Pandas, Jupyter Notebook |
| Database | PostgreSQL, SQLAlchemy, psycopg2 |
| Analysis | SQL (aggregations, CTEs, window functions) |
| Visualization | Power BI |

## Project Workflow

### 1. Data Cleaning and Feature Engineering (Python)
- Loaded the CSV and checked its structure with `describe()` and `isnull()`
- Filled 37 missing `Review Rating` values with the **median rating of each product category**
- Standardized column names (lowercase, underscores, `purchase_amount_(usd)` renamed to `purchase_amount`)
- Created `age_group` (Young Adult, Adult, Middle-Aged, Senior) using quartile binning
- Created `purchase_frequency_days` by converting purchase frequency text (Weekly, Monthly, etc.) to days
- Dropped the `promo_code_used` column
- Loaded the cleaned data into a PostgreSQL table named `customer`

### 2. SQL Analysis (PostgreSQL)
The queries in `queries.sql` cover:

1. Total revenue by gender
2. Discount users who spent more than the average purchase amount
3. Top 5 products by average review rating
4. Average spend: Standard vs. Express shipping
5. Subscribers vs. non-subscribers (customer count, average spend, total revenue)
6. Top 5 products by discount rate
7. Customer segmentation: New, Returning, Loyal
8. Top 3 most-ordered products in each category (using `ROW_NUMBER()`)

### 3. Power BI Dashboard
`customer.pbix` contains a one-page interactive dashboard with:

- KPI cards (e.g. Average Purchase Amount)
- Customers and spend by age group
- Subscription status split (donut chart)
- Purchases by category
- Slicers for Gender, Subscription Status, Shipping Type, and Category

## Key Findings

> Replace these placeholders with your own results.

- **Insight 1:** e.g. Male customers generated X% of total revenue
- **Insight 2:** e.g. Subscribers spend more/less on average than non-subscribers
- **Insight 3:** e.g. The Clothing category has the highest number of orders

## Dashboard Preview

> Add a screenshot of your dashboard to an `images/` folder, then uncomment the line below.

<!-- ![Dashboard](images/dashboard.png) -->

## Repository Structure

```
├── README.md
├── data/
│   └── customer_shopping_behavior.csv
├── notebooks/
│   └── customer_analysis.ipynb
├── sql/
│   └── queries.sql
├── dashboard/
│   └── customer.pbix
└── images/
    └── dashboard.png
```

## How to Run

1. Clone the repository
   ```bash
   git clone https://github.com/abhisheknaik5590/YOUR-REPO.git
   ```
2. Install dependencies
   ```bash
   pip install pandas sqlalchemy psycopg2-binary jupyter
   ```
3. Create a PostgreSQL database named `customer_behavior`
4. Open the notebook, update the CSV path and your database credentials, and run all cells to clean the data and load it into PostgreSQL
5. Run the queries from `sql/queries.sql` in pgAdmin or `psql`
6. Open `dashboard/customer.pbix` in Power BI Desktop and refresh the data source

## Author

**Abhishek Manjunath Naik**
[GitHub](https://github.com/abhisheknaik5590)
