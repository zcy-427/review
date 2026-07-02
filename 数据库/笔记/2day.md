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

## 模板 3：带条件查询

题目：

> 查询软件工程系学生的学号和姓名。

SQL：

```sql
SELECT Sno, Sname
FROM Student
WHERE Dept = '软件工程';
```

---

## 模板 4：比较条件查询

题目：

> 查询成绩大于等于 60 分的学生学号和课程号。

SQL：

```sql
SELECT Sno, Cno
FROM SC
WHERE Grade >= 60;
```