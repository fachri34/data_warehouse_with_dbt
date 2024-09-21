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
    {{ dbt_utils.generate_surrogate_key([
          '`promotion-ids`',
          ])}} as promotion_id,
    {{ dbt_utils.generate_surrogate_key([
          '`Ship-service-level`',
          '`Courier Status`',
          '`ship-city`',
          '`ship-state`',
          '`ship-postal-code`',
          '`ship-country`'
          ])}} as sales_shipment_id,
    {{ dbt_utils.generate_surrogate_key([
          '`Sales Channel `',
          ])}} as sales_channel_id,
    Qty,
    amount
FROM `true-winter-418305.dibimbing.amazon_sale_report`