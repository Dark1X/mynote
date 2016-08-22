# postgresql 数据库模板


默认：
```
create database mydb template template0;
```

将mydb数据库设定为模板：

```
update pg_database set datistemplate=true where datname='mydb';
```
