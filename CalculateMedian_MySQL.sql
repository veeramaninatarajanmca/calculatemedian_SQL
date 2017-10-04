use veera;
create table employees(salary int);

insert into employees values(8);
insert into employees values(23);
insert into employees values(45);
insert into employees values(123);
insert into employees values(93);
insert into employees values(2342);
insert into employees values(2238);

select * from employees;

Select salary from employees  order by salary;

set @rowid=0;
set @cnt=(select count(*) from employees);
set @middle_no=ceil(@cnt/2);
set @odd_even=null;

select AVG(salary) from 
(select salary,@rowid:=@rowid+1 as rid, (CASE WHEN(mod(@cnt,2)=0) THEN @odd_even:=1 ELSE @odd_even:=0 END) as odd_even_status  from employees  order by salary) as tbl where tbl.rid=@middle_no or tbl.rid=(@middle_no+@odd_even);
