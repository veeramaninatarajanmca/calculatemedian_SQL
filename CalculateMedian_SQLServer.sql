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

declare @odd_even int;
declare @cnt int;
declare @middle_no int;

set @cnt=(select count(*) from employees);
set @middle_no=(@cnt/2)+1;
select @odd_even=case when (@cnt%2=0) THEN -1 ELse 0 END ;
 
select @odd_even,@cnt,@middle_no;

 select AVG(tbl.salary) from
 (select  salary,ROW_NUMBER() over (order by salary) as rno from employees group by salary) tbl
 where tbl.rno=@middle_no or tbl.rno=@middle_no+@odd_even;