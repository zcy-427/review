1. SELECT Sno,Sname FROM Student

2. SELECT Sno,Sname FROM Student WHERE Dept='软件工程'

3. SELECT Sno,Cno,Grade FROM SC WHERE Grade>=60

4. SELECT Student.Sname From SC,Student WHERE SC.Sno=Student.Sno AND SC.Cno='C2'

5. SELECT Student.Sname,SC.Grade FROM SC,Student WHERE SC.Sno=Student.Sno AND SC.Cno='C2' AND SC.Grade>=60