Lost & Found Management System (University)

A web-based Lost & Found Management System designed for University, built using JSP, Oracle Database, HTML, CSS, and JavaScript.
This system allows students to report lost items, view approved items, contact finders, and allows admins to manage reports, messages, and claims efficiently.

📌 Project Features (Facilities)
👨‍🎓 Student Features
  User registration & login
  Report lost items
  View approved lost items
  Send contact messages for found items
  Submit claims for lost items
  View claim status
  Secure logout
  
👨‍💼 Admin Features
Admin login
View all reported items
Approve or reject lost item reports
View contact messages
Mark messages as reviewed
Manage claims (approve/reject)
Dashboard access


Project Directory Structure:
Lost-and-Found/
│
├── css/
│   ├── login.css
│   ├── signup.css
│   ├── dashboard.css
│   ├── report_admin.css
│   ├── contact_admin.css
│   ├── approved_items.css
│   ├── report.css
│   └── contact.css
│
├── js/
│   ├── login.js
│   ├── report_admin.js
│   ├── contact_admin.js
│   ├── approved_items.js
│   └── form_validation.js
│
├── html/
│   ├── index.html
│   ├── login.html
│   ├── signup.html
│   ├── report.html
│   ├── contact.html
│   └── claims.html
│
├── jsp/
│   ├── login.jsp
│   ├── signup.jsp
│   ├── logout.jsp
│   ├── admin_dashboard.jsp
│   ├── student_dashboard.jsp
│   ├── report.jsp
│   ├── report_admin.jsp
│   ├── approved_items.jsp
│   ├── contact.jsp
│   ├── contact_admin.jsp
│   └── claims.jsp
│
├── database/
│   └── database.sql
│
├── README.md
└── LICENSE



🧰 Technologies Used


🖥 Frontend
HTML5
CSS3
JavaScript (Vanilla JS)

⚙ Backend
  JSP (Java Server Pages)
  JDBC
  
🗄 Database
Oracle Database 21c Express Edition (XE)

🧪 Tools & Software
  Apache Tomcat 10.1+
  Oracle SQL*Plus
  Oracle JDBC Driver (ojdbc11.jar)
  VS Code / Eclipse
  Git & GitHub

🗄 Database Tables
| Table Name        | Description                    |
| ----------------- | ------------------------------ |
| `Users`           | Stores student and admin users |
| `Report`          | Lost item reports              |
| `ContactMessages` | Messages about found items     |
| `Claim`           | Claims for lost items          |
| `Sequences`       | Auto-generate IDs              |
| `Triggers`        | Handle primary key insertion   |


🔐 User Roles
  Student
  Can report lost items
  Can view approved items
  Can contact admin/finders
  Can submit claims

Admin
  Can approve/reject reports
  Can view & manage contact messages
  Can manage claims
  Can monitor system activity

🔄 Workflow Overview
  User registers & logs in
  Student submits a lost item report
  Admin reviews and approves/rejects report
  Approved reports become visible to students
  Students contact admin if they found an item
  Admin reviews messages
  Students submit claims
  Admin approves or rejects claims

⚠️ Error Handling & Security
  Input validation (HTML & JS)
  JDBC prepared statements (SQL Injection safe)
  Role-based access control
  Proper session handling
  Database constraints & triggers


🚀 How to Run the Project
Install Oracle 21c XE
Create database using database/database.sql
Copy ojdbc11.jar to:
  Tomcat/lib/
Deploy project in:
  Tomcat/webapps/
Start Apache Tomcat
Access in browser:
  http://localhost:8080/Lost-and-Found/

📌 Future Improvements
  Password encryption (BCrypt)
  Email notifications
  File/image upload for items
  Search & filter options
  Pagination
  Mobile responsive UI
  REST API version

👨‍💻 Author
Jehin Tajowar Masud
