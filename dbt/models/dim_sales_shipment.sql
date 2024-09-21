{{ config(materialized='table') }}


with t_data as (
SELECT distinct 
  `Ship-service-level` as ship_service_level,
  `Courier Status` as courier_status,
  `ship-city` as ship_city,
  `ship-state` as ship_state,
  `ship-postal-code` as ship_postal_code,
  `ship-country` as ship_country
FROM `true-winter-418305.dibimbing.amazon_sale_report` 
)

select 
{{ dbt_utils.generate_surrogate_key([
          'ship_service_level',
          'courier_status',
          'ship_city',
          'ship_state',
          'ship_postal_code',
          'ship_country'
          ])}} as sales_shipment_id, *
from t_data