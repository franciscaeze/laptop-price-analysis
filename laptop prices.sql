# create database#
create database laptop_price_analysis;
use laptop_price_analysis;
#decribe data(file)
describe `laptop_price_analysis`.`laptop_prices`;

# view file
SELECT 
    *
FROM
    `laptop_prices`
LIMIT 10;
 
 # count the total number of laptops
 SELECT 
    COUNT(*) AS Total_laptop
FROM
    laptop_prices;

# PRICE ANALYSIS 
# The cheapest laptops
SELECT 
    brand, processor, storage, price_usd
FROM
    laptop_prices
ORDER BY price_usd ASC
LIMIT 5;  -- Cheapest Laptops

#The most expensive laptops
SELECT 
    brand, processor, storage, price_usd
FROM
    laptop_prices
ORDER BY price_usd desc
LIMIT 5;  -- most expensive Laptops

# Average price by brand
SELECT 
    brand, ROUND(AVG(price_usd), 2) AS avg_price
FROM
    laptop_prices
GROUP BY brand
ORDER BY avg_price DESC;

# Price Distribution (Grouping by Price Ranges)
SELECT
    CASE
        WHEN price_usd < 500 THEN 'Below $500'
        WHEN price_usd BETWEEN 500 AND 1000 THEN '$500 - $1000'
        WHEN price_usd BETWEEN 1000 AND 2000 THEN '$1000 - $2000'
        WHEN price_usd BETWEEN 2000 AND 3000 THEN '$2000 - $3000'
        ELSE 'Above $3000'
    END AS price_range,
    COUNT(*) AS count
FROM laptop_prices
GROUP BY price_range
ORDER BY price_range;

# HARDWARE ANALYSIS
# Most Common Processors
SELECT processor, COUNT(*) AS count
FROM laptop_prices
GROUP BY processor
ORDER BY count DESC
LIMIT 10;

# RAM Distribution (How Many Laptops Have Different RAM Sizes)
SELECT ram_gb, COUNT(*) AS count
FROM laptop_prices
GROUP BY ram_gb
ORDER BY ram_gb DESC;

# Most Common Storage Types
SELECT storage, COUNT(*) AS count
FROM laptop_prices
GROUP BY storage
ORDER BY count DESC;

# Average Storage Size Per Brand
SELECT brand, storage, COUNT(*) AS count
FROM laptop_prices
GROUP BY brand, storage
ORDER BY brand, count DESC;

#  DISPLAY ANS SCREEN ANALYSIS
# Screen Size Distribution
SELECT 
    screen_size_inch, COUNT(*) AS count
FROM
    laptop_prices
GROUP BY screen_size_inch
ORDER BY screen_size_inch DESC;

# Most Common Screen Resolutions
SELECT 
    resolution, COUNT(*) AS count
FROM
    laptop_prices
GROUP BY resolution
ORDER BY count DESC
LIMIT 10;

# BATTERY AND WEIGHT ANALYSIS
# Laptops with the Longest Battery Life
SELECT 
    brand, processor, battery_life_hours, price_usd
FROM
    laptop_prices
ORDER BY battery_life_hours DESC
LIMIT 10;

# Average Battery Life by Brand**
SELECT brand, ROUND(AVG(battery_life_hours), 2) AS avg_battery_life
FROM laptop_prices
GROUP BY brand
ORDER BY avg_battery_life DESC;

# Weight Distribution
SELECT
    CASE
        WHEN weight_kg < 1.5 THEN 'Ultra-Light (< 1.5kg)'
        WHEN weight_kg BETWEEN 1.5 AND 2.5 THEN 'Light (1.5 - 2.5kg)'
        WHEN weight_kg BETWEEN 2.5 AND 3.5 THEN 'Medium (2.5 - 3.5kg)'
        ELSE 'Heavy (> 3.5kg)'
    END AS weight_category,
    COUNT(*) AS count
FROM laptop_prices
GROUP BY weight_category
ORDER BY weight_category;


#  OPERATING SYSTEM ANALYSIS
# Most Common Operating Systems
SELECT 
    operating_system, COUNT(*) AS count
FROM
    laptop_prices
GROUP BY operating_system
ORDER BY count DESC;

# Average Price by OS
SELECT 
    operating_system, ROUND(AVG(price_usd), 2) AS avg_price
FROM
    laptop_prices
GROUP BY operating_system
ORDER BY avg_price DESC;

# Find the Best Value for Money Laptops (Lowest Price Per GB RAM)
SELECT 
    brand,
    processor,
    ram_gb,
    storage,
    price_usd,
    ROUND(price_usd / ram_gb, 2) AS price_per_gb_ram
FROM
    laptop_prices
ORDER BY price_per_gb_ram ASC
LIMIT 10;

# Find the Lightest Laptop with the Best Battery Life
SELECT 
    brand, processor, weight_kg, battery_life_hours, price_usd
FROM
    laptop_prices
ORDER BY battery_life_hours DESC , weight_kg ASC
LIMIT 5;

# Compare Price Differences Between Intel and AMD Processors**
SELECT
    CASE
        WHEN processor LIKE 'Intel%' THEN 'Intel'
        WHEN processor LIKE 'AMD%' THEN 'AMD'
        ELSE 'Other'
    END AS processor_type,
    ROUND(AVG(price_usd), 2) AS avg_price
FROM laptop_prices
GROUP BY processor_type
ORDER BY avg_price DESC;