import pandas as pd

# Load dataset
df = pd.read_csv("../data/ecommerce_sales.csv")

# -----------------------------
# 1. Basic Dataset Information
# -----------------------------

print("Dataset Shape:", df.shape)

print("\nColumn Names:")
print(df.columns.tolist())

print("\nFirst 5 Records:")
print(df.head())


# -----------------------------
# 2. Data Cleaning
# -----------------------------

# Check missing values
print("\nMissing Values:")
print(df.isnull().sum())

# Remove duplicate records
df = df.drop_duplicates()

# Convert order_date to datetime
df["order_date"] = pd.to_datetime(df["order_date"])


# -----------------------------
# 3. Sales KPIs
# -----------------------------

total_sales = df["sales"].sum()
total_profit = df["profit"].sum()
total_orders = df["order_id"].nunique()
average_order_value = total_sales / total_orders

print("\n--- Business KPIs ---")
print("Total Sales:", total_sales)
print("Total Profit:", total_profit)
print("Total Orders:", total_orders)
print("Average Order Value:", round(average_order_value, 2))


# -----------------------------
# 4. Category Analysis
# -----------------------------

category_sales = (
    df.groupby("category")["sales"]
    .sum()
    .sort_values(ascending=False)
)

print("\n--- Sales by Category ---")
print(category_sales)


# -----------------------------
# 5. Regional Analysis
# -----------------------------

region_sales = (
    df.groupby("region")["sales"]
    .sum()
    .sort_values(ascending=False)
)

print("\n--- Sales by Region ---")
print(region_sales)


# -----------------------------
# 6. Product Analysis
# -----------------------------

product_sales = (
    df.groupby("product_name")["sales"]
    .sum()
    .sort_values(ascending=False)
)

print("\n--- Top Products ---")
print(product_sales.head(10))


# -----------------------------
# 7. Monthly Sales Analysis
# -----------------------------

monthly_sales = (
    df.groupby(df["order_date"].dt.to_period("M"))["sales"]
    .sum()
)

print("\n--- Monthly Sales ---")
print(monthly_sales)


# -----------------------------
# 8. Profit Analysis
# -----------------------------

profit_by_category = (
    df.groupby("category")["profit"]
    .sum()
    .sort_values(ascending=False)
)

print("\n--- Profit by Category ---")
print(profit_by_category)


print("\nAnalysis completed successfully! 🚀")
