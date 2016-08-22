# mysql 备份

* 逻辑备份：生成 SQL 语句，不同版本、数据库迁移
* 物理备份：复制文件、文件夹，只能在同一版本、数据库


## mysqldump

```
mysqldump [options] db_name [tbl_name ...]
mysqldump [options] --databases db_name ...
mysqldump [options] --all-databases
mysqldump db_name > backup-file.sql

mysql db_name < backup-file.sql
```

