{{ config(materialized='table') }}

SELECT INDEX,
    `Order ID` as order_id,
    Date as date,
    Status as status,
    {{ dbt_utils.generate_surrogate_key([
          'SKU',
          ])}} as product_id,
    {{ dbt_utils.generate_surrogate_key([
          'Fulfilment',
          '`fulfilled-by`',
          ])}} as fulfilment_id,
    Qty,
    amount
FROM `true-winter-418305.dibimbing.amazon_sale_report`