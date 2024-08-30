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
    
    
select 
      year(website_sessions.created_at) as yr,
      month(website_sessions.created_at) as mo,
      count(distinct case when utm_campaign ='nonbrand' then website_sessions.website_session_id else null end ) as nonbrand_sess,
      count(distinct case when utm_campaign ='nonbrand' then orders.order_id else null end ) as nonbrand_order,
      count(distinct case when utm_campaign ='brand' then website_sessions.website_session_id else null end ) as brand_sessions,
      count(distinct case when utm_campaign ='brand' then orders.order_id else null end) as brand_orders
from website_sessions
     left join orders
        on orders.website_session_id=website_sessions.website_session_id
where website_sessions.created_at < '2012-11-27'  
      and website_sessions.utm_source ='gsearch'
      and website_sessions.utm_campaign='nonbrand'
group by 1,2;      
      
      
      
  select 
       year(website_sessions.created_at) as yr,
       month(website_sessions.created_at) as mo,
       count(distinct case when device_type ='desktop' then website_sessions.website_session_id else null end)  as desktop_sessions,
       count(distinct case when device_type ='desktop' then orders.order_id else null end) as desktop_order,
       count(distinct case when device_type ='mobile' then website_sessions.website_session_id else null end) as mobile_session,
       count(distinct case when device_type ='mobile' then orders.order_id else null end) as mobile_order
  from website_sessions
     left join orders
        on orders.website_session_id = website_sessions.website_session_id
  where website_sessions.created_at < '2012-11-27'
     and website_sessions.utm_source ='gsearch'
     and website_sessions.utm_campaign ='nonbrand'
     
  group by 1,2;   
     
      
    select 
         year(website_session.cretaed_at) as yr,
         month(website_sessions.created_at) as mo,
         count(distinct website_sessions.website_session_id) as sessions,
         count(distinct orders.order_id) as orders,
         count(distinct orders.order_id)/count(distinct website_sessions.website_session_id) as conver_rate
    from website_sessions
       left join orders
            on orders.website_session_id = website_sessions.website_session_id
     where website_sessions.created_at < '2012-11-27'
     group by 1,2;
    
      
      
    select 
         year(website_sessions.created_at) as yr,
         quarter(website_sessions.created_at) as qtr,
         count(distinct website_sessions.website_session_id) as sessions,
         count(distinct orders.order_id) as orders
     from website_sessions
        left join orders
            on website_sessions.website_session_id =orders.website_session_id
     group by 1,2
     order by 1,2;
     
     
     
     
	select 
          year(website_sessions.created_at) as yr,
          quarter(website_sessions.created_at) as qtr,
          count(distinct orders.order_id)/count(distinct website_sessions.website_session_id) as session_to_conv_order,
          sum(price_usd)/count(distinct orders.order_id) as revenue_per_order,
          sum(price_usd)/count(distinct website_sessions.website_session_id) as revenue_per_session
     from website_sessions
          left join orders
               on website_sessions.website_session_id = orders.website_session_id
     group by 1,2
     order by 1,2 ;
          
          
      
      select 
           year(website_sessions.created_at) as yr,
           quarter(website_sessions.created_at) as qtr,
           count(distinct case when utm_source ='gsearch' and utm_campaign ='nonbrand' then orders.order_id else null end) 
			/count(distinct case when utm_source ='gsearch' and utm_campaign ='nonbrand' then website_sessions.website_session_id else null end) as gsearch_nonbrand_convt,
           count(distinct case when utm_source ='bsearch' and utm_campaign ='nonbrand' then orders.order_id else null end) 
			/count(distinct case when utm_source ='bsearch' and utm_campaign ='nonbrand' then website_sessions.website_session_id else null end) as bsearch_nonbrand_convt,
		   count(distinct case when utm_source ='brand'  then orders.order_id else null end)  
           /count(distinct case when utm_campaign ='brand' then website_sessions.website_session_id else null end) as brand_seach_convt,
           count(distinct case when utm_source is null and http_referer is not null then orders.order_id else null end) 
           /count(distinct case when utm_source is null and http_referer is not null then website_sessions.website_session_id else null end) as organic_search_conv,
           count(distinct case when utm_source is null and http_referer is  null then orders.order_id else null end) 
           /count(distinct case when utm_source is null and http_referer is  null then website_sessions.website_session_id else null end) as  direct_type_order
       from website_sessions
          left join orders
             on website_sessions.website_session_id=orders.website_session_id
       group by 1,2
       order by 1,2;
           
           
     
     
     select 
          year(created_at) as yr,
          month(created_at) as mo,
          sum(case when product_id =1 then price_usd else null end ) as mrfuzzy_rev,
          sum(case when product_id =1 then price_usd-cogs_usd else null end ) as mrfuzzy_marg,
          sum(case when product_id =2 then price_usd else null end) as lovebear_rev,
          sum(case when product_id =2 then price_usd-cogs_usd else null end) as lovebear_marg,
          sum(case when product_id =3 then price_usd else null end) as birthdaybear_rev,
          sum(case when product_id =3 then price_usd-cogs_usd else null end) as birthdaybear_marg,
          sum(case when product_id =4 then price_usd else null end) as minibear_rev,
          sum(case when product_id =4 then price_usd-cogs_usd else null end) as minibear_marg,
          sum(price_usd) as total_revenue,
          sum(price_usd-cogs_usd) as total_margin
      from order_items
      group by 1,2
      order by 1,2;
      
       
         
    
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
      
      
      
      
      