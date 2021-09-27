use AdventureWorks2019

select * from employee
select * from [dbo].[Employee] where Gender='M' AND VacationHours > 40
select JobTitle, MaritalStatus, Gender, VacationHours from [dbo].[Employee] where Gender='M' AND VacationHours > 40 order by VacationHours desc
select JobTitle, MaritalStatus, Gender, VacationHours from [dbo].[Employee] where (Gender='M' OR Gender='F') AND VacationHours > 40 order by VacationHours desc
select JobTitle, MaritalStatus, Gender, VacationHours from [dbo].[Employee] where Gender IN ('M','F') AND VacationHours > 40 order by VacationHours desc
select JobTitle, MaritalStatus, Gender, VacationHours from [dbo].[Employee] where VacationHours Between 40 AND 50
select BusinessEntityId, OrganizationNode from Employee where OrganizationNode IS NULL

select BusinessEntityId, BirthDate, HireDate, JobTitle from employee where JobTitle like 'Production__________________'
select BusinessEntityId, BirthDate, HireDate, JobTitle from employee where JobTitle like 'Production%'
select BusinessEntityId, BirthDate, HireDate, JobTitle from employee where JobTitle like '%ction%'
select Distinct JobTitle from employee 

select distinct JobTitle as JobProfile from Employee
select top 50 JobTitle from employee
select top 50 BusinessEntityId, JobTitle from Employee 

--Output Seggregation using case:
Select BusinessEntityId, NationalIdNumber, VacationHours,
Case 
when VacationHours between 20 and 50 then 'Good'
when VacationHours >50 then 'Better'
else 'Not Specified'
end as Status
from employee