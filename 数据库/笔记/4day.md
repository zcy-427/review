# 事务

## 概念
事务 Transaction 是数据库中一个完整的操作单位。

例子：

```
转账：A 给 B 转 100 元
```

这个事务包含两步：

```
UPDATE Account SET balance = balance - 100 WHERE name = 'A';
UPDATE Account SET balance = balance + 100 WHERE name = 'B';
```

这两步必须作为一个整体：

```
要么都成功；
要么都失败。
```

不能 A 扣钱成功，B 加钱失败。

## 事务的ACID特性

|特性|英文|含义|
|---|---|---|
|原子性|Atomicity|事务中的操作要么全做，要么全不做|
|一致性|Consistency|事务执行前后数据库都要保持一致状态|
|隔离性|Isolation|多个事务并发执行时，互不干扰|
|持久性|Durability|事务一旦提交，对数据库的改变永久保存|