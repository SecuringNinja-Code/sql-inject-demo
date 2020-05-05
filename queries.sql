USE sqlinjectdemo;

-- Base query used by our ficticious application
SELECT * FROM users
  WHERE user_name LIKE '<user_name>'
  AND user_pass LIKE '<user_password>';

-- Query with normal field values
SELECT * FROM users
  WHERE user_name LIKE 'admin'
  AND user_pass LIKE 'adminpassword';

-- Query with malicious field values
SELECT * FROM users
  WHERE user_name LIKE 'admin'
  AND user_pass LIKE '' OR 1=1;-- ';

-- Query with malicious field values and escaping applied.
SELECT * FROM users
  WHERE user_name LIKE 'admin'
  AND user_pass LIKE '\' OR 1=1;-- ';
