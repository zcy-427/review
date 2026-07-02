# ER模型第1讲

## 概念

ER 模型解决的是：

> **在建数据库之前，先把现实世界中的对象和它们之间的关系画清楚。**

ER 模型，即实体-联系模型，是一种概念数据模型，用实体、属性和联系来描述现实世界中的数据及其关系。

## ER 转关系模式模板

### 1. 实体转换

每个实体转换成一个关系模式：

```text
实体名(主键, 属性1, 属性2, ...)
```

例如：

```text
Student(Sno, Sname, Dept)
Course(Cno, Cname, Credit)
```

---

### 2. 1:n 联系转换

把 1 端的主键加入 n 端作为外键。

例：

> 一个系有多个学生，一个学生属于一个系。

实体：

```text
Department(Dno, Dname)
Student(Sno, Sname)
```

转换：

```text
Department(Dno, Dname)
Student(Sno, Sname, Dno)
```

其中：

```text
Student.Dno 是外键，引用 Department.Dno
```

---

### 3. m:n 联系转换

多对多联系必须转换成一个新的关系模式。

例：

> 学生选修课程，成绩是联系属性。

转换：

```text
Student(Sno, Sname, Dept)
Course(Cno, Cname, Credit)
SC(Sno, Cno, Grade)
```

其中：

```text
SC 的主键通常是 (Sno, Cno)
SC.Sno 是外键，引用 Student.Sno
SC.Cno 是外键，引用 Course.Cno
```

---

### 4. 1:1 联系转换

1:1 联系通常可以把任意一方的主键加入另一方作为外键，也可以单独建表。考试中一般写清即可。

例：

> 一个学生对应一个校园卡，一个校园卡属于一个学生。

可以转换为：

```text
Student(Sno, Sname, CardNo)
Card(CardNo, Balance)
```

其中：

```text
Student.CardNo 是外键，引用 Card.CardNo
```

# 函数依赖