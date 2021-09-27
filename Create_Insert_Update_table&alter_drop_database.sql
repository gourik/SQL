CREATE DATABASE db_1

USE db_1 

create table employee(id int)

insert into [dbo].[employee](id) values(1),(2)

select * from employee

update employee set id = 3 where id=2 

select * from employee

update employee set id=1 

create table product(p_name VARCHAR(30))

insert into product values ('Pro 1') 

select * from product

alter database db_1 modify name = database_1

alter table employee add pro_id int identity(1,1)

insert into employee(id) values (2),(3)

alter table product alter column p_name varchar(12)

drop database database_1_copy
