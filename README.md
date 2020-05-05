# SQL Injection Demo
This repository is designed to complement the tutorial on [SQL injection attacks](https://securingninja.com/7-types-of-cyber-attacks-that-could-be-targeting-you-right-now/) at SecuringNinja.com.

This repository contains the demo database and queries for demonstrating how a SQL injection attack works. These are simple examples but the principal remains the same in more complex real-world situations.

# Setup
To follow along with the tutorial, download clone the repository and install the database.
```
git clone https://github.com/SecuringNinja-Code/sql-inject-demo.git
cd sql-inject-demo
mysql -uroot -p sqlinjectdemo < database.sql
```

Now open the queries in your favorite MySQL environment and try some SQL injection attacks.

# What is a SQL Injection Attack?
A SQL injection vulnerability occurs when an application allows user input, and uses that input to form database queries without proper sanitization. As shown in the example below such a vulnerability allows the execution of arbitrary SQL code.

# How does SQL injection work?
Lets take a look at a simple example. Below is the code that our ficticious app would execute when a user attempts to login. This query verifies the user's username and password. We will assume the application does not apply any sanitization to the username and password fields.

```sql
SELECT * FROM users
  WHERE user_name LIKE '<user_name>'
  AND user_pass LIKE '<user_password>';
```

When a well behaved user logs in we get the following query. Shame on John for using such a weak password!

```sql
SELECT * FROM users
  WHERE user_name LIKE 'john'
  AND user_pass LIKE 'johnspassword';
```

The query returns our user and the John can log in. But what happens if a malicious user decides to exploit the SQL injection vulnerability?

```sql
SELECT * FROM users
  WHERE user_name LIKE 'admin'
  AND user_pass LIKE '' OR 1=1;-- ';
```

This suddenly results in a very different query! This is just one of the dangers of SQL injection. You could theoretically drop the entire users table too! Now that you have an understanding of how SQL injection attacks work, I'll leave it up to you to devise more attacks using the provided demo database.

# Contributing
Want to share more SQL injection examples and demos? Please feel free to submit a pull request!

# Credit
This tutorial was developed by [SecuringNinja.com](https://securingninja.com).
