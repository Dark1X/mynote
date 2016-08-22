# mysql 修改数据库存放位置

mysql 默认数据存放在 `/var/lib/mysql/` 目录下，
我想把这个默认目录修改到指定目录，因为我的 /var 目录所在的磁盘分区太小

```
# 停止数据库
systemctl stop  mysqld

# 创建目录,假设没有的话
mkdir /home/user/DB

# 拷贝默认数据库到新的位置
# -a 命令是将文件属性一起拷贝,否则各种问题
cp -rap /var/lib/mysql /home/user/DB/
chown mysql.mysql /home/user/DB/mysql

# 备份原来的数据
cp -a /etc/mysql/my.cnf /etc/mysql/my.cnf.bak

# 在配置文件/etc/mysql/my.cnf中的 [mysqld]项后添加 datadir 变量
[mysqld]
datadir=/home/user/DB/mysql

# 启动数据库
systemctl start mysqld
```

