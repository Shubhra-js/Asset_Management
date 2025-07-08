# 🗂️ Asset Management System

A web-based asset management application built with **ASP.NET Web Forms** and **SQL Server**, designed to efficiently track and manage organizational IT assets like laptops, desktops, and support cells.

---

## 🚀 Features

- 🔍 **Search & Filter** assets by name or type
- ➕ **Add new assets** with dropdown selections
- ✏️ **Edit existing assets** with pre-filled forms
- ❌ **Delete assets** from the database with instant GridView refresh
- ✅ Visual status indicators for:
  - **Assigned** (Yes/No)
  - **Usable** (Yes/No)
- 🎨 Clean and responsive UI with custom CSS and Bootstrap

---

## 🛠️ Tech Stack

- **Frontend:** ASP.NET Web Forms (.aspx)
- **Backend:** C# (.aspx.cs)
- **Database:** SQL Server
- **Styling:** CSS3, Bootstrap (optional/custom)
- **IDE:** Visual Studio

---


## 📂 Project Structure

```plaintext
AssetManagement/
├── App_Data/
│   └── AssetDatabase.mdf           # Local SQL DB 
├── Styles/
│   └── StyleSheet2.css             # Custom CSS
├── Asset.aspx                      # Main grid view page
├── EditAsset.aspx                  # Edit asset form
├── AddAsset.aspx                   # Add asset form
├── Web.config                      # DB connection & configuration
└── README.md                       # Project documentation

