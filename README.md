# SQL Server POS Scripts

A collection of **SQL Server scripts** designed to solve common issues in POS (Point of Sale) systems, including product management, bilingual item names, pricing, style codes, subcategories, and customer setup.

---

## 📌 Features

- 🛒 Product queries with:
  - Arabic & English names
  - Prices
  - Style_Code
- 🗂 Subcategory mapping for products
- 🔁 Duplicate handling using `ROW_NUMBER()`
- 👤 Automatic creation of **Cash Customer** if not exists
- 🏷 Bulk update of `Style_Code` based on item order
- ⚙ Optimized for **SQL Server**

---

## 📂 Scripts Overview

### 1️⃣ Product Name & Price Query
- Retrieves:
  - Arabic name
  - English name (fallback to Arabic if missing)
  - Price
  - Style_Code
- Removes duplicates using CTE + `ROW_NUMBER()`

---

### 2️⃣ Product with Subcategories
- Includes:
  - Arabic & English product names
  - Subcategory name
  - Price
  - Style_Code
- Cleaned using `LTRIM / RTRIM`
- Filters invalid or empty items

---

### 3️⃣ Cash Customer Auto Insert
- Checks if customer **"عميل نقدي"** exists
- Inserts it automatically if missing
- Safe to run multiple times (no duplicates)

---

### 4️⃣ Bulk Style_Code Update
- Maps a predefined list of `Style_Code` values to products
- Uses:
  - `ROW_NUMBER()` on selected product IDs
  - Ordered assignment to ensure correct mapping
- Ideal for fixing or initializing Style Codes in bulk

---

## 🛠 Requirements

- Microsoft SQL Server
- Existing tables:
  - `TblProductItem`
  - `prices_items`
  - `select_sub_men_items`
  - `select_sub_men`
  - `TblCustData`

---

## ⚠ Notes & Best Practices

- Always test scripts on a **backup or staging database**
- Review `UPDATE` statements before execution
- Scripts are modular — you can run each one independently
- No credentials or sensitive data included

---

## 🎯 Use Cases

- POS system data cleanup
- Migrating or fixing product data
- Preparing bilingual menus
- Standardizing Style Codes
- Quick setup for new branches

---

## 👤 Author

**Mostafa Mahmoud**  
Software Engineer – Computer Science  
SQL Server & POS Systems

---

## 📄 License

This project is provided as-is for educational and internal business use.
