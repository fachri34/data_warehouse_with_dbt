{{ config(materialized='table') }}

with t_data as (
SELECT distinct 
  `promotion-ids` as promotion_ids
 FROM `true-winter-418305.dibimbing.amazon_sale_report`
)

select 
{{ dbt_utils.generate_surrogate_key([
          'promotion_ids',
          ])}} as promotion_id, *
from t_data