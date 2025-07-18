
CREATE OR REPLACE VIEW `sales-project-465303.ecommerce.delivery_performance` AS
SELECT order_id, customer_state, seller_state, order_delivered_customer_date, order_estimated_delivery_date,
  -- Calculate delivery delay
  DATE_DIFF(order_estimated_delivery_date, order_delivered_customer_date, DAY) AS delivery_delay_days,
  -- Classify delivery status
  CASE 
    WHEN date(order_delivered_customer_date) > date(order_estimated_delivery_date) THEN 'Late'
    WHEN date(order_delivered_customer_date) < date(order_estimated_delivery_date) THEN 'Early'
    ELSE 'On Time'
  END AS delivery_status,
  -- New: Inter vs. Intra state shipping
  CASE 
    WHEN customer_state = seller_state THEN 'Intrastate'
    ELSE 'Interstate'
  END AS shipping_type
FROM `sales-project-465303.ecommerce.ecomm`
WHERE order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL;

SELECT shipping_type, delivery_status, count(order_id), avg(delivery_delay_days)
FROM `sales-project-465303.ecommerce.delivery_performance`
GROUP BY shipping_type, delivery_status;


CREATE OR REPLACE VIEW `sales-project-465303.ecommerce.lead_type_performance` AS
SELECT lead_type, count(order_id) as orders, avg(review_score) as avg_score
FROM `sales-project-465303.ecommerce.ecomm`
WHERE lead_type IS NOT NULL
GROUP BY lead_type;

SELECT * FROM `sales-project-465303.ecommerce.lead_type_performance`;


CREATE OR REPLACE VIEW `sales-project-465303.ecommerce.prod_cat` AS
SELECT
  *,
  CASE
    -- Pet
    WHEN product_category_name_english IN ('pet_shop') THEN 'Pet'

    -- Garden
    WHEN product_category_name_english IN ('garden_tools', 'costruction_tools_garden') THEN 'Garden'

    -- Electronics
    WHEN product_category_name_english IN ('signaling_and_security', 'electronics', 'air_conditioning', 'computers') THEN 'Electronics'

    -- Telephony
    WHEN product_category_name_english IN ('fixed_telephony', 'telephony') THEN 'Telephony'

    -- Games
    WHEN product_category_name_english IN ('consoles_games') THEN 'Games'

    -- Gifts
    WHEN product_category_name_english IN ('watches_gifts') THEN 'Gifts'

    -- Baby Products
    WHEN product_category_name_english IN ('baby') THEN 'Baby_Products'

    -- Stationary
    WHEN product_category_name_english IN ('stationery') THEN 'Stationary'

    -- Perfumes
    WHEN product_category_name_english IN ('perfumery') THEN 'Perfumes'

    -- Sports
    WHEN product_category_name_english IN ('sports_leisure') THEN 'Sports'

    -- Home Appliance
    WHEN product_category_name_english IN (
      'housewares', 'home_appliances', 'home_construction', 'construction_tools_safety',
      'costruction_tools_tools', 'small_appliances', 'construction_tools_construction',
      'home_appliances_2', 'construction_tools_lights', 'kitchen_dining_laundry_garden_furniture',
      'small_appliances_home_oven_and_coffee'
    ) THEN 'Home_Appliance'

    -- Beauty
    WHEN product_category_name_english IN ('health_beauty') THEN 'Beauty'

    -- Furniture
    WHEN product_category_name_english IN (
      'furniture_bedroom', 'bed_bath_table', 'office_furniture', 'furniture_living_room'
    ) THEN 'Furniture'

    -- Toys
    WHEN product_category_name_english IN ('toys') THEN 'Toys'

    -- Art
    WHEN product_category_name_english IN ('art', 'arts_and_craftmanship') THEN 'Art'

    -- Food
    WHEN product_category_name_english IN ('drinks', 'food', 'food_drink') THEN 'Food'

    -- Books
    WHEN product_category_name_english IN ('books_technical', 'books_general_interest', 'books_imported') THEN 'Books'

    -- Automotive
    WHEN product_category_name_english IN ('auto') THEN 'Automotive'

    -- Party
    WHEN product_category_name_english IN ('party_supplies', 'christmas_supplies') THEN 'Party'

    -- Luggage
    WHEN product_category_name_english IN ('luggage_accessories') THEN 'Luggage'

    -- Accessories
    WHEN product_category_name_english IN ('fashion_bags_accessories') THEN 'Accessories'

    -- Music
    WHEN product_category_name_english IN ('audio', 'dvds_blu_ray', 'music', 'musical_instruments') THEN 'Music'

    -- Cool Stuffs
    WHEN product_category_name_english IN (
      'cool_stuff', 'computers_accessories', 'market_place', 'furniture_decor',
      'industry_commerce_and_business', 'cine_photo', 'agro_industry_and_commerce'
    ) THEN 'Cool_Stuffs'

    ELSE 'Other'
  END AS product_category
FROM `sales-project-465303.ecommerce.ecomm`;


