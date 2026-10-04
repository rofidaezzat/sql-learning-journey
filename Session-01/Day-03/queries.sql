---------------------------JOINS------------
-- 1--> CROSS JOIN(Cartisian Product)
-----------Cartisian Product ------------
------------joinحاصل ضرب ال 2 عمود في بعض وغالبا لا نحتاج هذا النوع من 
select st_fname ,Dept_Name
from Student ,Department

-----way 2------
select st_fname ,Dept_Name
from Student cross join Department
--------------------------------------------------------------------------------------------------------------------


--2--> INNER JOIN 
select st_fname ,Dept_Name
from Student ,Department
where Department.Dept_Id=Student.Dept_Id

-----   طريقه اخرى  بعمل حاجه اسمها elias name -------
----------بدى لكل عمود حرف بدلا من كتابته كامل ----

select st_fname ,Dept_Name
from Student S ,Department D
where D.Dept_Id=S.Dept_Id

select st_fname ,Dept_Name, D.Dept_Id
from Student S ,Department D
where D.Dept_Id=S.Dept_Id

select st_fname ,D.*-------اسماء الطلبه وكل ما يخصهم في اجدو ل الاخر
from Student S ,Department D
where D.Dept_Id=S.Dept_Id

select st_fname ,Dept_Name-------اسماء الطلبه وكل ما يخصهم في اجدو ل الاخر
from Student S ,Department D 
where D.Dept_Id=S.Dept_Id and St_Address='alex'
order by Dept_Name


------------------------------OUTER JOIN-----------
---LEFT OUTER JOIN-------
select st_fname,Dept_Name
from Student S left outer join Department D
on D.Dept_Id=S.Dept_Id

----RIGHT OUTER JOIN
select st_fname,Dept_Name
from Student S right outer join Department D
on D.Dept_Id=S.Dept_Id

-----Full Outer Join
select st_fname,Dept_Name
from Student S full  outer join Department D
on D.Dept_Id=S.Dept_Id

---------------------------- JOIN BETWEEN MULTI TABLES --------------
select st_fname,crs_Name,Grade
from Student S,Course CO ,Stud_Course SC
where S.St_Id=SC.St_Id and SC.Crs_Id=CO.Crs_Id
 
 --INNER JOIN------
select st_fname,crs_Name,Grade,Dept_Name
from Student S inner join Stud_Course SC
     on S.St_Id=SC.St_Id 
     inner join
     Course CO
     on SC.Crs_Id=CO.Crs_Id
     inner join 
     Department D 
     on D.Dept_Id=S.Dept_Id

-----------------join DML----------
--JOIN UPDATE--

update Stud_course
      set grade +=10

select grade
from Student S,Stud_Course sc
where s.St_Id=sc.St_Id and St_Address='cairo'

---update ---
update Stud_course
      set grade +=10
from Student S,Stud_Course sc
where s.St_Id=sc.St_Id and St_Address='cairo'
------------------------------------------------------------
select st_fname 
from student
where st_Fname is not null

-----replace null-------------------------------
USE ITI;
GO
---is null --بتاخد العمود لو فيه قيمه بيعرضها لو مفيش قيمه بيعمل ريبلايس
select isnull(St_Fname,'')--عملت تبديل بسترينج فارغه
from student 
------
--مش شرط الريبلايس باسترنج فارغه لا عادىى ممكن اي حاجه
select isnull(st_Fname,'has no name ')
from Student
--------------------------------------
------ممكن اعمل احلال بقيم عمود اخر 
select isnull(st_Fname,st_Lname)
from Student
---------------------------------------
----------افرض معنديش لا اسم اول ولا ثاني 
--------اعمل multiple replacment 
--------coalesce-----
select coalesce(st_Fname,st_Lname,st_address,'no Data')
from Student
--------------------------------------------------------------
---------------ازاى اعرض عمودين مع بعض كعمود واحد-------------
--لكن الداتا تايب مختلفه فهظر اعمل تحويل مثال 
select st_Fname+ ' ' +convert(varchar(2),st_age)
from student

------
select 'student name= '+st_Fname+'        &age=   '+convert(varchar(2),st_age)
from student       ----  if nulllllllllll
-----------------------الحل فانكشن اسمها concat
-----بتحول كله لاسترنج وتشيل اي نل وتحط مكانها استرنج فاضيه
select concat (st_Fname,  ''  ,st_age)
from student 
-----------------------------------------------------------------

select *
from student 
where st_Fname='ahmed'

--- طريقه اخرى بدل = احط like 
select *
from student 
where st_Fname like'ahmed'   --- like لو انا عارفه جزء من الكلمه اللي ببحث عنها

-----------------مصطلحات --------------------------
-----    _    one character
-----    %    zero or more character

select *
from student 
where st_Fname like 'a%'    -- هات كل الاسماء اللى بتبدا بالحرف دا 

select *
from student 
where st_Fname like '%a'    -- هات كل الاسماء اللى بتنتهي بالحرف دا 

select *
from student 
where st_Fname like '%a%'    --  هات كل الاسماء اللى بتحتوى على الحرف دا 

select *
from student 
where st_Fname like '_a%' --الاسماء اللى فيها حرف قبل ال A


select st_Fname,st_lname,st_age,dept_id
from student 
order by St_Address

select st_Fname,st_lname,st_age,dept_id
from student 
order by 1

select st_Fname,st_lname,st_age,dept_id
from student 
order by dept_id,st_age      --ثم العمر department id برتب الاول ب 
