{{ config(materialized='table') }}

with t_data as(
SELECT DISTINCT 
  `Sales Channel ` as sales_channel
 FROM `true-winter-418305.dibimbing.amazon_sale_report`
)

select 
{{ dbt_utils.generate_surrogate_key([
          'sales_channel',
          ])}} as sales_channel_id, *
from t_data
