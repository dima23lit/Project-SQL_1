--- Q1 ---


select user_city as city, count(distinct user_id) as user
from users_sql_project usp 
group by user_city
order by count(distinct user_id) desc;


--- Q2 ---


select order_id as order_num, sum(quantity) as quantity 
from order_items_sql_project
group by order_id
order by sum(quantity) desc
limit 1


--- Q3 ---

select count(distinct order_id) as total_orders
from payments_sql_project
where payment_status <> 'Відхилено' and (payment_method = 'Картка' or payment_method = 'Банківський переказ')



--- Q4 ---


select user_id as user , count(user_id) as count_user
from orders_sql_project
group by user_id
having count(user_id) > 5
order by count(user_id) desc


--- Q5 ---


select sum(quantity) as quantity, count(order_id) as order_num
from order_items_sql_project 
where product_id IN (11, 23)


--- Q6 ---


select order_id as order_id, tracking_number as track_num, coalesce(delivery_date::text, 'в роботі') as delivery_date
from shipments_sql_project


--- Q7 ---


select case 
	when user_age < 25 then 'молоді'
	when user_age >= 25 and user_age < 40 then 'середній вік'
	else 'старший вік'
end as age_group,
    count(*) as user_count
from users_sql_project
group by 
    case 
	    when user_age < 25 then 'молоді'
	    when user_age >= 25 and user_age < 40 then 'середній вік'
	    else 'старший вік'
    end;


--- Q8 ---


select user_city as city, count(distinct loyalty_status) as status
from users_sql_project
group by user_city
having count(distinct loyalty_status) >= 3
order by count(distinct loyalty_status) asc


--- Q9 ---


select * 
from users_sql_project
where split_part(user_email, '@' , 2) = 'gmail.com'



--- Q10 ---



