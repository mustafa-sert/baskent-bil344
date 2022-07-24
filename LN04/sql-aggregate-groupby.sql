select * from sailors
insert into sailors(sid, sname, rating)
values (101, 'Veli', 8)

select count(distinct sname)
from sailors

delete from sailors where sid=101

select sname
from sailors s
where s.age <=ALL (select age from sailors)

-- find youngest sailor
select sname, age
from sailors
where age = (select min(age) from sailors)

-- find oldest sailor
select sname, age
from sailors
where age = (select max(age) from sailors)

-- find average age in each rating level
select rating, avg(age)
from sailors
group by rating, sname

-- Grouping on multiple columns
create table temp
(
  a number,
  b number,
  c number,
  d number,
 primary key(a,b,c,d)
)

insert into temp
values(1,2,3,7)

select * from temp

select a,b,c, count(*)
from temp
group by a, b, c

-- find ratings and avg age of each rating that have at least 2 sailors
select rating, avg(age)
from sailors
group by rating
having count(*) >=2

