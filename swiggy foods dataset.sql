use swiggy;
show tables;
select * from items;

#taking first 100
select * from items limit 100;

#checking how many unique names are present
select count(distinct name) from items;

#how many veg/non-veg items 
select is_veg, count(name) as foods_item from items group by is_veg;

#anomaly
select * from items where is_veg=2;

#how many unique orders
select count(distinct order_id) from items;

#show chicken items only
select name from items where name like "%chicken%";

#show paratha only
select * from items where name like "%paratha%";

#average items per order
select count(name)/count(distinct order_id) as AvgItemsPerOrder from items;

#in each order what items were ordered 
select a.name, a.is_veg, b.restaurant_name, b.order_id, b.order_time from items a 
join orders b
on a.order_id = b.order_id;

#concat
select a.name, b.order_id, concat(a.name,'-',b.order_id) as concatenation from items a
join orders b on a.order_id=b.order_id;




