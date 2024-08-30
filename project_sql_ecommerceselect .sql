use `mavenfuzzyfactory`;

select 
     year(website_sessions.created_at) as yr,
     month(website_sessions.created_at) as mo,
     count(distinct website_sessions.website_session_id) as sessions,
     count(distinct orders.order_id) as orders
from website_sessions
     left join orders
        on orders.website_session_id = website_sessions.website_session_id
where website_sessions.created_at < '2012-11-27'
    and website_sessions.utm_source ='gsearch'
    group by 1,2;
    
    
    