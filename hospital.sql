									/* AN INTERNSHIP TASK */

/* FIRST TABLE */
create table hospital1(
	hospital_id int,
	hospital_name varchar,
	bed_count int
);

select * from hospital1

copy hospital1 from 'C:\hospital1.csv' delimiter ',' csv header;

/* SECOND TABLE */
create table doctor(
	doctor_id int,
	doctor_name varchar,
	hospital_code int,
	date_joined date,
	specialty varchar,
	salary int,
	experience varchar
);

select * from doctor

copy doctor from 'C:\doctor.csv' delimiter ',' csv header;

								/* TASK */

							/* QUESTION 1 */
			/* Fetch Hospital and Doctor Information using hospital Id and doctor Id */
select
	a.hospital_id,
	a.hospital_name,
	b.doctor_name,
	b.doctor_id,
	b.specialty
from hospital1 as a
inner join doctor as b
on a.hospital_id = b.hospital_code
order by hospital_id;

							/* QUESTION 2 */
			/* Get the list of the doctors as per given specialty and salary */
select 
doctor_name as "Name of Doctor",
specialty as "Specialty",
salary as "Salary"
from doctor
order by salary desc
;

								/* QUESTION 3 */
					/* Get the list of the doctors from a given hospital */
select 
	a.hospital_id as "Hospital_ID",
	a.hospital_name as "Name of Hospital",
	b.doctor_name as "Name of Doctor"
from hospital1 as a
inner join doctor as b
on a.hospital_id = b.hospital_code
order by a.hospital_id,b.hospital_code
;

								/* QUESTION 4 */
						/* Update doctor experience in years */
select 
doctor_name as "Name of Doctor",
specialty as "Specialty",
experience as "Years of Experience"
from doctor
order by experience desc;

