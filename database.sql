-- Get all customers and their addresses.
SELECT * FROM "addresses"
JOIN "customers"
ON "customer_id" = "customers"."id";

-- Get all orders and their line items.
SELECT * FROM "orders"
JOIN "line_items"
ON "order_id" = "orders"."id";

-- Which warehouses have cheetos?
SELECT "warehouse" FROM "warehouse_product"
JOIN "warehouse"
ON "warehouse_id"="warehouse"."id"
JOIN "products"
ON "product_id"="products"."id"
WHERE "description"='cheetos';

-- Which warehouses have diet pepsi?
SELECT * FROM "warehouse_product"
JOIN "warehouse"
ON "warehouse_id"="warehouse"."id"
JOIN "products"
ON "product_id"="products"."id"
WHERE "description"='diet pepsi';

-- Get the number of orders for each customer. 
-- NOTE: It is OK if those without orders are not included
-- in results.
SELECT "customer_id",COUNT(*) FROM "orders"
JOIN "addresses"
ON "address_id"="addresses"."id"
JOIN "customers"
ON "addresses"."customer_id"="customers"."id"
GROUP BY "customer_id";

-- How many customers do we have?
SELECT COUNT("id") FROM "customers";

-- How many products do we carry?
SELECT COUNT("id") FROM "products";

-- What is the total available on-hand quantity of diet pepsi?
SELECT SUM("on_hand") FROM "warehouse_product"
JOIN "products" ON "product_id"="products"."id"
WHERE "products"."description" ='diet pepsi';