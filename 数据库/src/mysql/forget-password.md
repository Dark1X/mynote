# mysql 忘记 root 用户密码

有时数据库的登录密码忘记了，这时可以通过以下方式来重新配置数据库密码：

```
systemctl stop mysqld
mysqld_safe --skip-grant-tables &
mysql -u root
mysql> update mysql.user set password=PASSWORD('newpassword') where User='root';
mysql> flush privileges;
mysql> quit
```
