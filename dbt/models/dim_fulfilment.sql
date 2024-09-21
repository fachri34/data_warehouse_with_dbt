{{ config(materialized='table') }}


with t_data as (
SELECT distinct 
  Fulfilment as fulfilment, 
  `fulfilled-by` as fulfilled_by
 FROM `true-winter-418305.dibimbing.amazon_sale_report` 
)

select 
{{ dbt_utils.generate_surrogate_key([
          'fulfilment',
          'fulfilled_by',
          ])}} as fulfilment_id, *
from t_data

