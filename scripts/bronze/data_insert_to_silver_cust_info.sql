with table1 as
(
select
    cst_id,
    count(cst_id) 
from 
    datawarehouse.bronze.crm_cust_info
group by
    cst_id
having
    count(cst_id)
)  
select
  cst_id,
  counts
from 
    table1
where
    counts >1
;

select
    cst_id,
    count(cst_id) 
from 
    datawarehouse.bronze.crm_cust_info
group by
    cst_id
having
    count(cst_id) >1 or count(cst_id) is null 


select
    *
from 
    datawarehouse.bronze.crm_cust_info
where 
    cst_id = 29466


select
    *
from
(
select
    *,
    ROW_NUMBER() over (partition by cst_id order by cst_create_date desc) as flag_rank
from 
    bronze.crm_cust_info
) t
where 
    flag_rank = 1 and cst_id is not null


