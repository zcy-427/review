# SQL-select查询

| 类型  | 作用      | 常见命令                        |
| --- | ------- | --------------------------- |
| DDL | 定义数据库对象 | CREATE、ALTER、DROP           |
| DML | 查询和更新数据 | SELECT、INSERT、UPDATE、DELETE |
| DCL | 权限控制    | GRANT、REVOKE                |

## 1.SQL单表查询

已知：

```text
Student(Sno, Sname, Dept)
SC(Sno, Cno, Grade)
Course(Cno, Cname, Credit)
```

---

### 模板 1：查询所有列

题目：

> 查询所有学生信息。

SQL：

```sql
SELECT *
FROM Student;
```

`*` 表示所有列。

---

### 模板 2：查询指定列

题目：

> 查询所有学生的学号和姓名。

SQL：

```sql
SELECT Sno, Sname
FROM Student;
```

---

### 模板 3：带条件查询

题目：

> 查询软件工程系学生的学号和姓名。

SQL：

```sql
SELECT Sno, Sname
FROM Student
WHERE Dept = '软件工程';
```

---

### 模板 4：比较条件查询

题目：

> 查询成绩大于等于 60 分的学生学号和课程号。

SQL：

```sql
SELECT Sno, Cno
FROM SC
WHERE Grade >= 60;
```

## 2.SQL多表连接查询

### 写法一：WHERE 连接写法

这是最适合初学和考试的写法。

```sql
SELECT 输出列
FROM 表1, 表2
WHERE 表1.公共列 = 表2.公共列
  AND 其他条件;
```

---

### 写法二：JOIN 写法

```sql
SELECT 输出列
FROM 表1
JOIN 表2 ON 表1.公共列 = 表2.公共列
WHERE 其他条件;
```

---
# SQL-聚合函数，GROUP BY，HAVING

**常用聚合函数**

|函数|含义|
|---|---|
|COUNT(*)|统计行数|
|COUNT(列名)|统计该列非空值个数|
|SUM(列名)|求和|
|AVG(列名)|求平均值|
|MAX(列名)|求最大值|
|MIN(列名)|求最小值|

## GROUP BY

作用：**按某列分组，然后对每组统计。**

题目：

> 查询每门课程的平均成绩。

SQL：

```sql
SELECT Cno, AVG(Grade)
FROM SC
GROUP BY Cno;
```

意思是：

```text
按 Cno 分组，每个 Cno 算一个 AVG(Grade)
```

---
## HAVING

作用：**对分组后的结果进行筛选。**

题目：

> 查询平均成绩大于等于 80 的课程号。

SQL：

```sql
SELECT Cno
FROM SC
GROUP BY Cno
HAVING AVG(Grade) >= 80;
```
---
## WHRER和GROUP BY的区别

| 项目        | WHERE               | HAVING                    |
| --------- | ------------------- | ------------------------- |
| 作用对象      | 表中的原始记录             | 分组后的结果                    |
| 位置        | GROUP BY 前          | GROUP BY 后                |
| 能否直接用聚合函数 | 一般不能                | 可以                        |
| 例子        | `WHERE Grade >= 60` | `HAVING AVG(Grade) >= 80` |

---

## 模板

```sql
-- 总数
SELECT COUNT(*)
FROM 表;

-- 最大值
SELECT MAX(列)
FROM 表;

-- 平均值
SELECT AVG(列)
FROM 表
WHERE 条件;

-- 每组平均值
SELECT 分组列, AVG(统计列)
FROM 表
GROUP BY 分组列;

-- 分组后筛选
SELECT 分组列
FROM 表
GROUP BY 分组列
HAVING 聚合函数(列) 条件;
```

---
# SQL-嵌套查询IN

## 核心模板

```sql
SELECT 外层要查的列
FROM 外层表
WHERE 外层列 IN (
    SELECT 内层列
    FROM 内层表
    WHERE 内层
```