-- Query 1 to get Individual and Business customers 

SELECT CustomerID,
  CustomerType
FROM `tc-da-1.adwentureworks_db.customer`

--Query to get Product Categories

WITH product_name as (
    SELECT product.ProductID as ProductID,
      product.Name as ProductName,
      product_subcategory.Name as SubcategoryName
    FROM `tc-da-1.adwentureworks_db.product` as product
    LEFT JOIN tc-da-1.adwentureworks_db.productsubcategory as product_subcategory
    ON product.ProductSubcategoryID = product_subcategory.ProductSubcategoryID
)


SELECT
  sales_order.SalesOrderID,
  sales_order.ProductID,
  sales_order.LineTotal,
  product_name.SubcategoryName
FROM tc-da-1.adwentureworks_db.salesorderdetail as sales_order
INNER JOIN product_name
ON product_name.ProductID = sales_order.ProductID
