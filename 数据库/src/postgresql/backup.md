# postgresql 备份、升级

postgresql 数据备份有三种方式：

* sql 转储
* 冷备份
* 热备份


## sql 转储

pg_dump 命令：

```
# 备份
pg_dump -h host -U user databasename > databasename.bak
pg_dump -h host -U user databasename -t tablename1 -t tablename2 > databasetables.bak

# 恢复
createdb databasename2
psql -h host -U user -d databasename2 < databasename.bak
```

pg_dumpall 命令：

```
# 备份
pg_dumpall -h host -U user > alldatabases.bak

# 恢复
psql -h host -U user -f alldatabases.bak postgres
```


## 文件系统备份(冷备份)

```
# 备份
pg_ctl stop -D /var/lib/postgres/data
tar –jcvf filesystem.bak.tar.bz2 /var/lib/postgres/data

# 恢复
tar –jxvf filesystem.bak.tar.bz2
pg_ctl start -D /var/lib/postgres/data
```


## 在线备份(热备份)

待补


## postgresql数据库升级

步骤：

* pg_dumpall 命令备份所有数据
* 升级 postgres
* 恢复数据
