### 📱 **Playstore Data Analysis (SQL Case Study)**

This project is a complete **SQL case study** based on Google Play Store app data. It demonstrates how to clean, analyze, and extract insights using MySQL, including real-world business problems, triggers, procedures, and SQL functions.

---

### 📦 Dataset Overview

The dataset includes information about apps from the Playstore, with fields like:

* App Name
* Category
* Rating
* Reviews
* Installs
* Price
* Genres
* Content Rating
* Last Updated
* Current Version
* Android Version

The data was initially cleaned using Python and then imported into MySQL for deeper analysis.

---

### 🛠️ Tools & Technologies

* **Python (pandas)** – for data cleaning
* **MySQL 8.0** – for database creation and query execution
* **MySQL Workbench** – for query interface and data inspection

---

### 🔍 Business Problems Solved

1. Identify the top 5 categories for launching free apps based on average rating.
2. Find the top 3 revenue-generating categories from paid apps.
3. Calculate the percentage of gaming apps in each category.
4. Decide whether to build Free or Paid apps based on category ratings.
5. Track price changes using SQL triggers and log them.
6. Restore original prices using historical logs.
7. Find the correlation between app rating and number of reviews.
8. Split multiple genres into two separate columns using SQL functions.
9. Create a procedure to find underperforming apps in a given category.
10. Explain the difference between Duration Time and Fetch Time in SQL.

---

### 📁 Files Included

* `Playstore_Case_Study_Clean.sql` – Full SQL queries and logic
* `playstore.csv` – Cleaned dataset (to be uploaded manually)
* `README.md` – This file

---

### 🚀 How to Run

1. Upload your CSV file (`playstore.csv`) into MySQL secure upload path (e.g., `C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/`)
2. Import data using `LOAD DATA INFILE` as shown in the SQL script.
3. Run the `Playstore_Case_Study_Clean.sql` in MySQL Workbench.
4. Explore queries and analysis.

---

### 👨‍💻 Author

**Prince Yadav**
SQL & Python Enthusiast
Database: `new_project_analysis`

---

### 🪪 License

This project is open-source under the [MIT License](https://opensource.org/licenses/MIT).

---

Let me know if you want a `GitHub thumbnail image`, `cover banner`, or `SQL ER diagram` as well!
