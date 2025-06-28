# playstore-sql-case-study

readme_content = """# 📱 Playstore Data Analysis (SQL Case Study)

This project is a complete end-to-end **SQL case study** focused on the analysis of Playstore mobile app data. The objective is to solve real-world business problems using data insights and demonstrate proficiency in SQL, data cleaning, and analytics.

---

## 📦 Dataset Overview

The dataset includes app information such as:
- App Name
- Category
- Rating
- Reviews
- Installs
- Price
- Content Rating
- Last Updated
- Current Version
- Android Version
- Genres

The original data was cleaned using Python and imported into MySQL for structured querying and analysis.

---

## 🛠️ Tools & Technologies

- **Python (pandas)** for initial data cleaning
- **MySQL 8.0**
- **MySQL Workbench**
- **Triggers, Procedures, Functions, and CTEs**

---

## 🔍 Key Business Questions Solved

### A. KPI’s
1. Total Revenue
2. Average Order Value
3. Total Pizzas Sold
4. Total Orders
5. Average Pizzas Per Order

### B. Daily Trend for Total Orders  
### C. Monthly Trend for Orders  
### D. % of Sales by Pizza Category  
### E. % of Sales by Pizza Size  
### F. Total Pizzas Sold by Pizza Category  
### G. Top 5 Pizzas by Revenue  
### H. Bottom 5 Pizzas by Revenue  
### I. Bottom 5 Pizzas by Quantity  
### J. Top 5 Pizzas by Total Orders  
### K. Bottom 5 Pizzas by Total Orders  

### 📌 Advanced SQL Implementations
- ✅ Triggers for logging price changes
- ✅ Procedures for dynamic category checks
- ✅ Functions for splitting multi-genre values
- ✅ CTEs for comparative analysis
- ✅ Correlation calculation using raw SQL

---

## 📁 Files Included

- `Playstore_Case_Study_Clean.sql` - Full SQL solution
- `playstore.csv` - Cleaned dataset (not included here, please upload)
- `README.md` - This file

---

## 🚀 How to Use

1. Upload the dataset to MySQL:
   - Place `playstore.csv` in your secure upload directory (e.g., `C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/`)
   - Use `LOAD DATA INFILE` command as shown in the SQL file

2. Execute the `Playstore_Case_Study_Clean.sql` in MySQL Workbench

3. Explore and modify queries to fit your use case

---

## 🙌 Acknowledgments

This project was built for portfolio and interview preparation. It demonstrates real-world SQL project capabilities using structured data.

---

**Author**: Prince Yadav  
**Database**: `new_project_analysis`  
**License**: MIT
