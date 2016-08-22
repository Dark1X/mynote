# mysql 远程访问设置

## 修改配置文件

在默认配置文件中：

* /etc/my.conf
* /etc/mysql/my.cnf
* SYSCONFDIR/my.cnf
* $MYSQL_HOME/my.cnf
* defaults-extra-file
* ~/my.conf

注释掉 `[mysqld]` 节中的 `skip-networking` 和 `bind-address`：

```
[mysqld]
    ...
    #skip-networking
    ...
    #bind-address = <some ip-address>
    ...
```

## 对远程用户授权


查看当前远程用户设置：

```
SELECT User, Host FROM mysql.user WHERE Host <> 'localhost';
```

对用户 `root@192.168.100.0/24` 授权访问：

```
GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.100.%' IDENTIFIED BY 'my-new-password' WITH GRANT OPTION;
```

其中：`%` 是一个通配符。
