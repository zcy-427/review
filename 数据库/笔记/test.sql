1. SELECT Sno,Sname FROM Student

2. SELECT Sno,Sname FROM Student WHERE Dept='软件工程'

3. SELECT Sno,Cno,Grade FROM SC WHERE Grade>=60

4. SELECT SC.Sname From SC,Student WHERE SC.Sno=Student.Sno AND SC.Grade>=60