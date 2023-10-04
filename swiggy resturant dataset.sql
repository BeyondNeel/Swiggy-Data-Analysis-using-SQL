use swiggy;
show tables;
select * from orders;

#how many types of rainy weather
select distinct rain_mode from orders;
select count(distinct rain_mode) from orders;

#order was delivered on time everytime or not?
select distinct on_time from orders;

#how many different restaurants are there?
select count(distinct restaurant_name) from orders;

#how many numbers of orders a particular restaurant has?
select restaurant_name, count(*) as QT from orders group by restaurant_name order by QT desc;

#orderDate vs times
select date_format(order_time,'%Y-%m') as dates, count(distinct order_id) as times from orders
group by dates order by times desc;

#latest order 
select max(order_time) from orders;

#totalrevenue vs orderDate 
select date_format(order_time,'%Y-%m') as dates, sum(order_total) as TotalRevenue
from orders group by dates order by TotalRevenue desc;

#year on year change on revenue
with final as(
select date_format(order_time,'%Y') as years, sum(order_total) as TotalRevenue
from orders group by years)

select years, TotalRevenue, lag(TotalRevenue) over (order by years) as PrevRevenue from final;

#restaurant vs Revenue Ranked wise 
with final as(
select restaurant_name as restaurant, sum(order_total) as TotalRevenue
from orders group by restaurant)

select restaurant, TotalRevenue, dense_rank() over (order by TotalRevenue desc) as ranking
from final;

#rainMode vs revenue 
select rain_mode, sum(order_total) as revenue from orders group by rain_mode;
