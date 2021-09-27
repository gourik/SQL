create table exercise_logs(id int primary key identity(1,1), type text, time_taken integer,calories int, heart_rate integer)
alter table exercise_logs alter column type varchar(20)
insert into exercise_logs values('cardio',10,50,110)
insert into exercise_logs values('cardio',20,70,115)
insert into exercise_logs values('cycling',30,80,114)
insert into exercise_logs values('muscle training',10,20,75)
insert into exercise_logs values('hiking',19,89,120)
select * from exercise_logs

--in which exercise most calories is being burnt the most:
select * from exercise_logs where calories > 50 order by calories desc
select * from exercise_logs where calories > 50 AND time_taken < 30
select * from exercise_logs where calories > 50 OR heart_rate > 100 

--IN, NOT IN: 
select * from exercise_logs where type IN ('cardio','muscle training','cycling')
select * from exercise_logs where type NOT IN ('cardio','muscle training','cycling')

create table dr_recommendation(id int primary key, type varchar(20), reason varchar(30))
alter table dr_recommendation alter column type varchar(200) 
alter table dr_recommendation alter column reason varchar(300)
insert into dr_recommendation values(1,'cycling','increases endurance and flexibility')
insert into dr_recommendation values(2,'hiking','increases cardio vascular health')
select * from dr_recommendation

-- to retrieve details about type of activities in my exercise log, which are recommended by doctor:
select * from exercise_logs where type IN(select type from dr_recommendation)

--to retrieve details about type of exercise that are for cardio vascular reason:
select * from exercise_logs where type in (select type from dr_recommendation where reason='increases cardio vascular health')
select * from exercise_logs where type in (select type from dr_recommendation where reason like '% cardio vascular%')

--To find how much calories have been burnt for each type of activity:
select type, sum(calories) from exercise_logs group by type
select * from exercise_logs
select type, sum(calories) as total_calories_burnt from exercise_logs group by type

--to filter activities where more than 150 calories are burnt in total for that particular exercise:
select type, sum(calories) as total_calories_burnt from exercise_logs group by type having sum(calories) > 80
select type, avg(calories) as avg_calories from exercise_logs group by type having avg(calories) > 80
select type, max(calories) as max_calories from exercise_logs group by type having max(calories) > 50
select type, count(type) as frequency from exercise_logs group by type having avg(calories) >= 60
select type from exercise_logs group by type having count(*) >=2
select type, count(type) as frequency from exercise_logs group by type having count(*) >=2
select type from exercise_logs group by type having sum(calories) > 80

--aggregate function applied to individual row:220-age is max heart rate
select count(*) from exercise_logs where heart_rate > 220-29

select count(*) from exercise_logs where heart_rate >= (0.50 * (220-29)) and heart_rate <= (0.90 * (220-29))

--Using Case:
select type, heart_rate,
case
when heart_rate > (220-29) then 'above max'
when heart_rate > (0.90 * (220-29)) then 'above target'
when heart_rate > (0.50 * (220-29)) then 'within target'
else 'below target'
end as heart_rate_zone
from exercise_logs

--to count based on heart_rate_zone:
select count(*), 
case
when heart_rate > (220-29) then 'above max'
when heart_rate > (0.90 * (220-29)) then 'above target'
when heart_rate > (0.50 * (220-29)) then 'within target'
else 'below target'
end as heart_rate_zone
from exercise_logs
group by heart_rate_zone