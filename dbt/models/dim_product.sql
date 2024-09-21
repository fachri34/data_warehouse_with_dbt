{{ config(materialized='table') }}

with t_data as (
    SELECT DISTINCT
        Style as style,
        SKU as sku,
        Category as category,
        Size as size,
    FROM `true-winter-418305.dibimbing.amazon_sale_report` 
)

select 
{{ dbt_utils.generate_surrogate_key([
          'sku',
          ])}} as product_id, *
from t_data