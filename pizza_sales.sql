create table pizza_sales(
	pizza_id int,
    order_id int,
	pizza_name_id varchar(50),
	quantity int,
	order_date date,
	order_time time,
	unit_price float,
	total_price float,
	pizza_size varchar(50),
	pizza_category varchar(50),
	pizza_ingredients varchar(200),
	pizza_name varchar(50)
);
select * from pizza_sales;
select sum(total_price) as Total_Revenue from pizza_sales;
select sum(total_price)/count(distinct order_id) as Avg_Order_value from pizza_sales;

select sum(quantity) as Total_pizzas_sold from pizza_sales;

select count(distinct order_id) as Total_orders from pizza_sales;
select cast (cast (sum(quantity)as decimal(10,2))/ 
	cast (count(distinct order_id)as decimal(10,2)) as decimal(10,2)) as avg_pizzas_sold from pizza_sales;  


select to_char(order_date,'day')as order_day, count(distinct order_id) as total_orders from pizza_sales 
group by to_char(order_date,'day') 

select extract(hour from order_time)as order_hours, count(distinct order_id) as total_orders
from pizza_sales group by extract(hour from order_time)
	order by extract(hour from order_time) ;

select pizza_category,sum(total_price)as total_sales,
	sum(total_price)*100/(select sum(total_price) from pizza_sales) as sales_percent 
	from pizza_sales
 group by pizza_category;


select pizza_category,sum(total_price)as total_sales,
sum(total_price)*100/(select sum(total_price) from pizza_sales where extract (month from order_date)=1)
as sales_percent   
from pizza_sales where extract (month from order_date)=1
 group by pizza_category;


select pizza_size,sum(total_price)as total_sales,
sum(total_price)*100/(select sum(total_price) from pizza_sales where extract(quarter from order_date)=1)
as sales_percent   
from pizza_sales where extract(quarter from order_date)=1
 group by pizza_size order by sales_percent;


select pizza_category, sum(quantity) as total_pizzas_sold from pizza_sales 
group by pizza_category;

select pizza_name, sum(quantity) as total_pizzas_sold from pizza_sales 
group by pizza_name
	order by total_pizzas_sold limit 5;
