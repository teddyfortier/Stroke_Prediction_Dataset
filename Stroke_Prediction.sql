Stroke Prediction Dataset

-- Selecting id, gender, and age columns from the personal attributes table

select id, gender, age
from projectdb.personal_attributes
order by age desc;

-- Counting the total number of females in the dataset who are under 60 years old

select count(id) as females_below_60
from projectdb.personal_attributes
where gender = 'Female' and age < 60;

-- Selecting the highest BMI in the medical attributes table

select max(bmi) as max_bmi
from projectdb.medical_attributes;

-- select all records of people with BMI's between 20 and 30

select * 
from projectdb.medical_attributes
where bmi between 28 and 30;

-- What is the average glucose level of a person who's had a stroke

select avg(avg_glucose_level) as average_stroke_glucose_level
from projectdb.medical_attributes
where stroke = '1';


-- Display all members of this dataset who have had a stroke and their age

select personal_attributes.id, personal_attributes.age, medical_attributes.stroke
from projectdb.personal_attributes
left join projectdb.medical_attributes
on personal_attributes.id = medical_attributes.id
where medical_attributes.stroke = '1';


-- What is the youngest case of a stroke in this dataset

select personal_attributes.id, personal_attributes.age, medical_attributes.stroke
from projectdb.personal_attributes
left join projectdb.medical_attributes
on personal_attributes.id = medical_attributes.id
where medical_attributes.stroke = '1'
order by age;


-- Display all married people who have had a stroke

select personal_attributes.id, personal_attributes.ever_married, medical_attributes.stroke
from projectdb.personal_attributes
inner join projectdb.medical_attributes on personal_attributes.id = medical_attributes.id
where personal_attributes.ever_married = 'Yes' and medical_attributes.stroke = '1';

