		/* USING SQL TO ANSWER QUESTIONS FROM DIFFERENT DEPARTMENTS ABOUT SALES PEFORMANCE */
									/* START */
select * from customer;
select * from product;
select * from sales;


				/* QUESTION FROM THE MARKETING DEPARTMENT */

Hi John,
For my new marketing campaign, please help me find the number of customer who belong to the this three categories in all the four regions
a) Less than 36 years
b) Between 36 to 56 years
c) Above 54 years

						ANSWER
select region, case when age>54 then 'Category 3'
		    when age<36 then 'Category 1'
		    else 'Category 2' end as age_group
         	   ,count (*)
	from customer group by region, age_group
	order by region,count desc;

				/* QUESTION FROM SUPPLY CHAIN MANAGER */
Hi John, 
I am facing issues in managing the inventory in the south and east warehouse. Please help me with the following information
a) Top 5 selling products in East region
b) 5 least selling product in South region

						ANSWER
					/* FOR EAST REGION */
select c.product_id,d.product_name,c.total_qty_sold
from (select e.product_id,sum(e.quantity) as total_qty_sold from(
	select a.*,b.region
	from sales as a
	left join customer as b
	on a.customer_id=b.customer_id) as e where e.region = 'East' group by e.product_id) as c
left join product as d
on c.product_id=d.product_id
order by total_qty_sold desc
limit 5;

					/* FOR SOUTH REGION */
select c.product_id,d.product_name,c.total_qty_sold
from (select e.product_id,sum(e.quantity) as total_qty_sold from(
	select a.*,b.region
	from sales as a
	left join customer as b
	on a.customer_id=b.customer_id) as e where e.region = 'South' group by e.product_id) as c
left join product as d
on c.product_id=d.product_id
order by total_qty_sold asc
limit 5;	

		/* to get names from the customer table where the customer name is only 4 letter words using ____*/
select *
from customer
where customer_name like '% ____';

	/* from the sales table display discounts greater than 0 and order them in desc and show the first 10*/
select * 
from sales
where discount > 0 
order by discount desc
limit 10;


	/* USING 'AS' TO CHANGE THE COLUMN HEADER FROM IT ORIGINAL TITLE, WE USE "" TO SHOW IT AS WE WANT IT */
select customer_id as "Customer Number",
customer_name as "Name",
age as "Age"
From customer;

											/*COUNT*/

							/* COUNT(*) SHOWS US THE TOTAL NUMBER OF SALES*/
SELECT COUNT(*) FROM SALES;
/* IN ALL 9994 ITEMS WHERE SOLD*/

						/* ANOTHER WAY OF KNOWING THE TOTAL NUMBER OF SALES*/
select 
count(order_id) as "Total Number of Order ID"
from sales;
/* WE ALSO GET 9994 ITEMS*/

							/* TO GET THE TOTAL NUMBER OF INVOICES MADE*/
select 
count(distinct order_id) as "Total Number of Invoices"
from sales;
/* A TOTAL OF 5009 INVOICES WHERE MADE*/

				/* THE SAME WAY THE LAST TWO CODES WHERE GOTTEN BUT TOGETHER AND A DIFFERENT EXPLANATION*/
select 
count(order_line) as "Total Number of Goods Bought", 
count(distinct order_id) as "Number of Times This Goods Were
Bought" from sales;

/* WE CAN USE THE CODE TO FILTER FURTHER TO KNOW THE ORDER OF A CUSTOMER BY ADDING WHERE CUSTOMER_ID =.... TO GET THE CUSTOMERS BUYING*/
select 
count(order_line) as "Total Number of Goods Bought", 
count(distinct order_id) as "Number of Times This Goods Were
Bought" from sales where customer_id = 'CG-12520';
/* WE CAN SEE THE CUSTOMER WITH ID 'CG-12520' HAS BOUGHT 5 ITEMS IN 3 INVOICES*/

									/*SUM*/

						/* TO SUM UP THE TOTAL PROFIT*/
select sum(profit) as "Total Profit" from sales;
					/* WE HAVE A PROFIT OF 286,397 AS PROFIT*/

				/* TO KNOW THE TOTAL NUMBER OF A PARTICULAR GOODS BOUGHT*/
select sum(quantity) as "Total Quantity of Goods Bought" from sales where product_id = 'FUR-TA-10000577'
			/* IT SHOW THAT THIS PARTICULAR GOODS WITH ID FUR-TA-10000577 WAS SOLD 29 TIMES*/

								/*AVERAGE*/
select avg(age) as "Average Customer Age" from customer;
					/* the average customer age is 44.4678*/

select avg(sales *.10) as "Average Commission Value" from sales;
				/* the average commission value is 22.98*/

							/*MAX AND MIN*/
select sales
from sales
where order_date between '2015-06-01' and '2015-06-30' order by sales asc;
/* TO GET SALES OF EACH INVOICE WITHIN A MONTH AND DISPLAY IN ASCENDING ORDER*/

select sales
from sales
where order_date between '2015-06-01' and '2015-06-30' order by sales desc;
/* TO GET SALES OF EACH INVOICE WITHIN A MONTH AND DISPLAY IN DESCENDING ORDER*/

select min(sales) as "Minimum Sales Value"
from sales
where order_date between '2015-06-01' and '2015-06-30';
				/* WE GOT THE MIN SALES VALUE AS 0.984*/

select max(sales) as "Maximum Sales Value"
from sales
where order_date between '2015-06-01' and '2015-06-30';
			/* WE GOT THE MAX SALES VALUE AS 3050.376*/

				/* COUNT OF CUSTOMERS IN SOUTH REGION AND BETWEEN THE AGE OF 20 AND 30*/
select count(distinct customer_name) as "Number of Customers in South Region between age 20 and 30"
from customer
where age between 20 and 30 and region in ('South');
				/* WE HAVE 27 CUSTOMERS IN THE SOUTH BETWEEN THE AGE OF 20 AND 30*/

				/* AVERAGE AGE OF CUSTOMERS IN THE EAST REGION*/
select avg(age) as "The Average Age of Customers in the East is"
from customer
where region in ('East');
			/* AVERAGE AGE OF CUSTOMERS IN THE EAST REGION is 44.3363*/

			/* FIND THE MINIMUM AGE OF CUSTOMERS IN PHILADELPHIA*/
select min(age) as "The Minimum Age of Customers in Philadelphia is"
from customer
where city in ('Philadelphia');
			/* The Minimum Age of Customers in Philadelphia is 18 */

			/* FIND THE MAXIMUM AGE OF CUSTOMERS IN PHILADELPHIA*/
select max(age) as "The Maximum Age of Customers in philadelphia is"
from customer
where city in ('Philadelphia');
			/* THE MAXIMUM AGE OF CUSTOMERS IN PHILADELPIA IS 70*/

								/*GROUP BY*/
select * from customer;
/* we use group by to select more than one column and order by any of the columns*/
select region, count(customer_id) as "Customer in Each Region"
from customer
group by region;

/* to find out the sum of each item that was sold, group by the product_id and sort in desc by the quantity sold*/
select product_id, sum(quantity) as "quantity_sold"
from sales
group by product_id
order by quantity_sold desc;

/* to find out the sales performance of each customer, we want their minimum,maximum,average and total sales from the highest to the lowest*/
select customer_id, 
min(sales) as Minimum_sales, 
max(sales) as Maximum_Sales, 
avg(sales) as Average_Sales, 
sum(sales) as totalsales
from sales
group by customer_id
order by totalsales desc
limit 5;

/* WE CAN ALSO GROUP IN TWOS and shows the region and state with the highest orders*/
select region, 
state, 
avg(age) as Age, 
count(customer_id) as "customer_count"
from customer
group by region, state
order by customer_count desc;

/*HAVING*/
select region, count(customer_id) as customer_count
from customer
group by region
having count(customer_id)>200;
/* THIS WILL RETURN REGION WITH CUSTOMERS MORE THAN 200*/

select region, count(customer_id) as customer_names_starting_with_A
from customer
where customer_name like 'A%'
group by region;
/* THIS SHOWS US THE COUNT OF HOW MANY PEOPLE IN EACH REGION WHERE THEIR NAME STARTS WITH 'A'*/

select region, count(customer_id) as customer_names_starting_with_A_greater_than_15
from customer
where customer_name like 'A%'
group by region
having count(customer_id)>15;
/* SAME CODE AS ABOVE BUT THIS TIME WE INCLUDING HAVING COUNTS GREATER THAN 15*/

								/*CASE*/

select *, case
when age<30 then 'Young'
when age>60 then 'Senior Citizen'
else 'Middle Aged'
end as Age_Category
from customer;
/* WE USE CASE TO APPLY MULTIPLE CONDITIONS*/

										/*JOINS*/
			/* FIRST WE CREATE A TWO TABLES CALLED 'SALES_2015' AND 'CUSTOMER_20_60*/

/*FIRST TABLE*/
create table sales_2015 as
select * from sales where ship_date between '2015-01-01' and '2015-12-31';
/* sales_2015 table created */

select count(*)from sales_2015;
/* WE HAVE 2131 ROWS IN SALES_2015*/

select count(distinct customer_id) from sales_2015;
/* WE HAVE 578 UNIQUE CUSTOMER IN SALES_2015*/

/*SECOND TABLE*/
create table customer_20_50 as
select * from customer where age between 20 and 60;
/* customer_20_50 created */

select count(*) from customer_20_50;
/* WE HAVE 597 ROWS IN CUSTOMER_20_50 TABLE*/

select customer_id from sales_2015 order by customer_id;
select customer_id from customer_20_50 order by customer_id;

/* USING INNER JOIN */
select
	a.order_line,
	a.product_id,
	a.customer_id,
	a.sales,
	b.customer_name,
	b.age
from sales_2015 as a
inner join customer_20_50 as b
on a.customer_id = b.customer_id
order by customer_id;
/* WE USE INNER JOIN TO FINE OUT ITEMS THAT ARE PRESENT IN BOTH TABLES*/

select customer_id from sales_2015 order by customer_id;
select customer_id from customer_20_50 order by customer_id;

/* USING LEFT JOIN */
 select
	a.order_line,
	a.product_id,
	a.customer_id,
	a.sales,
	b.customer_name,
	b.age
from sales_2015 as a
left join customer_20_50 as b
on a.customer_id = b.customer_id
order by customer_id;
/* AA-10315 NOT PRESENT IN CUSTOMER_20_50 TABLE
   AA-10375 PRESENT IN BOTH
   AA-10480 NOT PRESENT IN SALES_2015 TABLE*/
   
select customer_id from sales_2015 order by customer_id;
select customer_id from customer_20_50 order by customer_id;

 /* RIGHT JOIN */
 select
	a.order_line,
	a.product_id,
	a.customer_id,
	a.sales,
	b.customer_name,
	b.age
from sales_2015 as a
right join customer_20_50 as b
on a.customer_id = b.customer_id
order by customer_id;

/*FULL JOIN*/

select a.order_line,
	a.product_id,
	a.customer_id,
	a.sales,
	b.customer_id,
	b.age,
	b.customer_id
from sales_2015 as a
full join customer_20_50
on a.customer_id = b.customer_id
order by a.customer_id, b.customer_id;

/* CROSS JOIN*/

/* WE CREATE TWO TABLES, A MONTH AND A YEAR TABLE */
create table month_value (MM integer);
create table year_value (YYYY integer);

insert into month_value values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12);
insert into year_value values (2011),(2012),(2013),(2014),(2015),(2016),(2017),(2018),(2019);

select * from month_value;
select * from year_value;

/* TO JOIN BOTH TABLES */
select a.YYYY, b.MM
from year_value as a, month_value as b
order by a.YYYY, b.MM;
/* ORDER BY THE ARRANGE THEM ACCORDINGLY*/

delete from month_value;

/* EXCEPT */

select customer_id from sales_2015
except
select customer_id from customer_20_50
order by customer_id;

/* UNION just like DISTINCIT*/
select customer_id
from sales_2015
union
select customer_id
from customer_20_50
order by customer_id;


select * from sales
where customer_id
in (select customer_id from customer where age > 60);
/* WE ARE GETTING A REPORT FROM TWO TABLES, WE WANT ALL SALES MADE TO PEOPLE OVER 60 FROM THE SALES AND CUSTOMER TABLE*/
/* IF YOU REMEMBER IN THE SALES TABLE, WE DO NOT HAVE THE CUSTOMER AGE, SO WE POINTING TO THE CUSTOMER TABLE TO GET
   THE AGES THEN THEIR TRANSACTIONS*/
   
select 
a.product_id, 
a.product_name, 
a.category, 
b.quantity
from product as a
left join (select product_id, sum(quantity) as quantity from sales group by product_id) as b
on a.product_id = b.product_id
order by b.product_id desc;
/* WE HAVE BEEN ABLE TO EXRACT DATA FROM TWO TABLES */

select 
customer_id, order_line, (select customer_name from customer where customer.customer_id = sales.customer_id)
from sales
order by customer_id;

/*VIEW*/
/* WE USE VIEW JUST TO DISPLAY THE CONTENT AND ALSO CAN BE USED AS MEANS OF PRIVACY */
/* SUPPOSE WE WANT GET A LIST OF ORDER ACROSS TO THE LOGISTICS DEPARTMENT WE CAN CREATE A VIEW */

create view logistics1 as
select a.order_line,
	   a.order_id,
	   b.customer_name,
	   b.city,
	   b.state,
	   b.country
from sales as a
left join customer as b
on a.customer_id = b.customer_id
order by a.order_line;

select * from logistics1;

/* to delete we use drop */
drop view logistics;
drop view logistics1;
