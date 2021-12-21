								/* AN INTERNSHIP TASK */
								
						/* QUESTION 1 */
			/* Create a db in SQL about the Amazon dataset */

create table AmazonBooks(
	name varchar,
	author varchar,
	user_ratings decimal(3,2),
	reviews int,
	price int,
	year int,
	genre varchar
);

select * from amazonbooks;
							/* UPLOAD THE CSV FILE CONTAINING OUR DATA INTO THE TABLE */
copy amazonbooks from 'C:\Users\daneg\OneDrive\Desktop\SQL-AmazonBooks.csv' delimiter ',' csv header;

						/* QUESTION 2 */
		/* Categorize the 550 books to fiction and non-fiction.*/
select count(*) from amazonbooks
where genre in ('Fiction');

select * from amazonbooks
where genre in ('Fiction');


select count(*) from amazonbooks
where genre in ('Non Fiction');

select * from amazonbooks
where genre in ('Non Fiction');


						/* QUESTION 3 */
				/* Query the top 50 best sellers and show the following: 
a.	Title of Book 
b.	Author
c.	Year
d.	Review  */

select distinct name as "Title of Book",author as "Author",year as "Year",reviews as "Reviews" 
from amazonbooks
order by reviews desc
limit 50;

						/* QUESTION 4 */
	/* Query the books which have a rating greater than 4 released last 2019 */
select name as "Title of Book", user_ratings as "Rating Over 4", year as "Since 2019"
from amazonbooks
where user_ratings > 4 and year > 2018
order by year desc;

						/* QUESTION 5 */
		/* Query the books which have greater than 10k reviews last 2018 */ 
select name as "Title of Book", reviews as "Review Greater than 10k", year as "Since 2018"
from amazonbooks
where reviews > 10000 and year > 2018
order by reviews desc

						/* QUESTION 6 */
				/* AUTHOR WITH THE HIGHEST RATING */
select count(distinct name)
from amazonbooks
where user_ratings > 4.5;

select distinct name as "Title of Book",author as "Author",user_ratings as "Rating",reviews as "Total Reviews"
from amazonbooks
where user_ratings = 4.90
order by user_ratings desc;


						/* QUESTION 7 */
					/* BOTTOM 10 AUTHOR BY RATINGS GOTTEN */
select distinct name as "Title of Book",author as "Author",user_ratings as "Rating",reviews as "Total Reviews"
from amazonbooks
order by user_ratings asc
limit 10;
						/* QUESTION 8 */
					/* AVERAGE PRICE FOR FICTION BOOKS */
select avg(distinct price)::numeric(10,2)	
from amazonbooks
where genre in ('Fiction');

select avg(distinct price)::numeric(10,2)	
from amazonbooks
where genre in ('Non Fiction');

						/* QUESTION 9 */
					/* AUTHOR WITH THE HIGHEST NO OF BOOKS*/
select count(distinct author)
from amazonbooks;

select distinct author, name
from amazonbooks
group by author,name;

select count(distinct author), name	
from amazonbooks
group by name;

select count(distinct name)	
from amazonbooks;

select distinct author as "Author",name as "Title of Books"
from amazonbooks;

select distinct name as "Title of Books",author as "Author"
from amazonbooks;

						/* QUESTION 10 */
					/* AVERAGE NO OF BOOKS PER YEAR */
select distinct year as "Years",avg(distinct price)::numeric(10,2) as "Average Price per Year"
from amazonbooks
group by year;
