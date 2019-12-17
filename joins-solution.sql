1. Get all customers and their addresses.

SELECT * FROM "customers"
JOIN "addresses" ON "customers"."id" = "addresses"."customer_id";

2. Get all orders and their line items (orders, quantity and product).

SELECT "orders"."order_date", "line_items"."quantity", "products"."description" FROM "orders"
JOIN "line_items" ON "orders"."id" = "line_items"."order_id"
JOIN "products" ON "line_items"."product_id" = "products"."id";

3. Which warehouses have cheetos?

SELECT "warehouse"."warehouse", "products"."description" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse_product"."warehouse_id" = "warehouse"."id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."id" = 5;

4. Which warehouses have diet pepsi?

SELECT "warehouse"."warehouse", "products"."description" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse_product"."warehouse_id" = "warehouse"."id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."id" = 6;

5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT "customers"."first_name", "customers"."last_name", count(*) as "num_of_orders" FROM "orders"
JOIN "addresses" ON "addresses"."id" = "orders"."address_id"
JOIN "customers" ON "customers"."id" = "addresses"."customer_id"
GROUP BY "customers"."id";

6. How many customers do we have?

SELECT count(*) FROM "customers";

7. How many products do we carry?

SELECT count(*) FROM "products";

8. What is the total available on-hand quantity of diet pepsi?

SELECT "products"."description", SUM("on_hand") FROM "warehouse_product"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."id" = 6
GROUP BY "products"."description";
