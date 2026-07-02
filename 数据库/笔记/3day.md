# ER模型

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

# 函数依赖与范式

函数依赖解决的是：

> **关系中属性之间能否由一个属性确定另一个属性。**

在关系模式 R 中，若对于 R 的任意两个元组，只要它们在属性集 X 上的值相同，则在属性集 Y 上的值也相同，则称 X 函数决定 Y，或 Y 函数依赖于 X，记作：

```text
X → Y
```

## 候选键

候选键解决的是：

> **哪些属性能唯一标识一条记录。**

候选键是能函数决定关系中所有属性，并且不含多余属性的最小属性集。

也就是：

```text
候选键的闭包 = 全部属性
并且它的任何真子集不能决定全部属性
```

例：
给关系：

```text
R(A, B, C, D)
F = { A → B, B → C, C → D }
```

要求候选键。

**从可能的决定属性开始**

A 可以决定 B：

```text
A → B
```

B 又能决定 C：

```text
B → C
```

C 又能决定 D：

```text
C → D
```

所以：

```text
A+ = {A, B, C, D}
```

A 能决定所有属性，所以 A 是候选键。

---
## 属性闭包

属性集 X 的闭包，记作：

```text
X+
```

表示：

> 由 X 根据函数依赖能够推出的所有属性集合。

求：

```text
A+
```

已知：

```text
F = { A → B, B → C, C → D }
```

步骤：

```text
初始：A+ = {A}
因为 A → B，所以加入 B：A+ = {A, B}
因为 B → C，所以加入 C：A+ = {A, B, C}
因为 C → D，所以加入 D：A+ = {A, B, C, D}
所以 A+ = {A, B, C, D}
```


> [!NOTE] 注
> 如果 A+ 包含关系 R 的全部属性，则 A 是超键；若 A 没有多余属性，则 A 是候选键。


## 范式

范式是关系模式满足某种规范化要求的程度。常见范式包括：

```text
1NF、2NF、3NF、BCNF
```

### 常见概念

- 候选键：能唯一决定全部属性的最小属性集。
- 主属性：出现在某个候选键中的属性。例如：

```text
候选键是 (Sno, Cno)
```

那么：

```text
Sno 和 Cno 是主属性。
```

- 非主属性：不出现在任何候选键中的属性。例如：

```text
R(Sno, Cno, Sname, Cname, Grade)
候选键：(Sno, Cno)
```

那么：

```text
Sname、Cname、Grade 是非主属性。
```

