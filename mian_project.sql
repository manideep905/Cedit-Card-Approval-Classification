# Group the customers based on their income type and find the average of their annual income.
drop view if exists Avg_Annul_Income;
create view Avg_Annul_Income as 
select Type_Income,count(Ind_ID) as 'Coustmer_Count',round(avg(Annual_income),2) as average from data
 group by Type_Income order by Coustmer_Count ;

select * from avg_annul_income;

# Find the female owners of cars and property.
drop view if exists Female_car_Property;
create view Female_car_Property as
select Ind_ID,GENDER,Car_Owner,Propert_Owner from data where GENDER='F' and Car_Owner='Y' and Propert_Owner='Y' ;

select * from Female_car_Property;

#Find the male customers who are staying with their families.
drop view if exists male_With_parents;
create view male_With_parents as
select Ind_ID,GENDER,Housing_type  from data where GENDER='M'and Housing_type='With parents';

select * from male_With_parents;

#Please list the top five people having the highest income.
drop view if exists Top_5_income;
create view Top_5_income as
select Ind_ID,Annual_income from data group by Ind_ID,Annual_income  order by Annual_income desc limit 5 ;

select * from Top_5_income;

# How many married people are having bad credit?
drop view if exists married_bad_credit;
create view married_bad_credit as
select  Marital_status,count(Ind_ID) as bad_creadit_count from data where Marital_status='Married' and label=1  ;

select * from married_bad_credit;

# What is the highest education level and what is the total count?

drop view if exists highest_education;
create view highest_education as
select EDUCATION,count(EDUCATION) as total_count from data group by EDUCATION order by total_count desc;

select * from highest_education;

# Between married males and females, who is having more bad credit?

select GENDER,count(label) as Count,Marital_status,label as bad_credit  from data
 where Marital_status='Married' and label=1 group by GENDER order by Count desc; 