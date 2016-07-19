Which Account owns the most Address Books?
Which Address Book contains the most Entries?
Exercise 2

How many Address Book Entries have phones starting with area code 3XX?
How many Address Book Entries have home phones not containing the digit 5?
How many Address Book Entries are work phones starting with a country code?



mysql> SELECT COUNT(*), accountId from AddressBook group by accountId order by count(*) desc limit 1;
+----------+-----------+
| COUNT(*) | accountId |
+----------+-----------+
|       38 |         5 |
+----------+-----------+
1 row in set (0.00 sec)



mysql> SELECT COUNT(*), addressBookId from Entry group by accountId order by count(*) desc limit 1;   
ERROR 1054 (42S22): Unknown column 'accountId' in 'group statement'
mysql> SELECT COUNT(*), addressBookId from Entry group by addressBookId order by count(*) desc limit 1;
+----------+---------------+
| COUNT(*) | addressBookId |
+----------+---------------+
|       52 |            37 |
+----------+---------------+
1 row in set (0.00 sec)




mysql> SELECT COUNT(id) FROM Entry WHERE subtype = "phone" and contentLineOne LIKE '(3%';
+-----------+
| COUNT(id) |
+-----------+
|        39 |
+-----------+
1 row in set (0.00 sec)



mysql> SELECT COUNT(id) FROM Entry WHERE type = "home" and subtype = "phone" and contentLineOne NOT LIKE '%5%';                                        
+-----------+
| COUNT(id) |
+-----------+
|        76 |
+-----------+
1 row in set (0.00 sec)



mysql> SELECT COUNT(*) FROM Entry WHERE type = "work" and subtype = "phone" and contentLineOne LIKE '1-%';                                             
+----------+
| COUNT(*) |
+----------+
|       60 |
+----------+
1 row in set (0.00 sec)
