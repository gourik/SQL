create table groceries(id int primary key, name text, quantity int,aisle integer)
insert into groceries values(1,'Bread',10,2)
insert into groceries values(2,'Pasta',20,3)
insert into groceries values(3,'Peanut Butter',39,4)
insert into groceries values(4,'Chocolates',30,5)
insert into groceries values(5,'Ice Cream',29,6)
update groceries set quantity=20 where id=1
insert into groceries values(6,'Milk',10,2)
insert into groceries values(7,'Fruits',20,5)
select * from groceries

--Aggregate Functions:Sum(),max(),goupby
select sum(quantity) from groceries

select max(quantity) from groceries

-- To calulate aggreagte functions by grouping column's data:
select aisle, sum(quantity) as total from groceries group by aisle

