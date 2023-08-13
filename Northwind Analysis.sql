use northwind;

-- 1. Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName.
select CategoryName, Description 
from categories
order by CategoryName;


-- 2. Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers table sorted by Phone.
select ContactName, CompanyName, ContactTitle, Phone
from customers
order by Phone;


/* 3. Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname
       respectively and HireDate from the employees table sorted from the newest to the oldest employee*/
 select upper(FirstName), upper(LastName),HireDate
 from employees
 order by HireDate desc;
 
 
-- 4. Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sorted by Freight in descending order.
select OrderID,OrderDate,ShippedDate,CustomerID,Freight
from orders
order by Freight desc
limit 10;


-- 5. Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table.
select lower(CustomerID) as ID
from customers;


-- 6. Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by the Country in descending order then by CompanyName in ascending order.
select CompanyName, Fax, Phone, Country, HomePage
from suppliers
order by 4 desc, 1;


-- 7. Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only
select  CompanyName, ContactName, City
from customers
where City = 'Buenos Aires';


-- 8. Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock.
select ProductName, UnitPrice, QuantityPerUnit, UnitsInStock
from products
where UnitsInStock = 0;



-- 9. Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain.
select ContactName, Address, City
from customers
where city not like '%Mexico%'  and City not in ('Germany','Spain') ;


-- 10. Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996.
select  ShippedDate, CustomerID, Freight,
convert(orderdate, date)  as OrderDate
from orders 
 where convert(orderdate, date)  = '1996-05-21';



-- 11. Create a report showing FirstName, LastName, Country from the employees not from United States
select FirstName, LastName, Country
from employees
where Country not in ('USA');


-- 12. Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from all orders shipped later than the required date.
select EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate
from orders
where ShippedDate > RequiredDate;



-- 13. Create a report that shows the City, CompanyName, ContactName of customers from cities starting with A or B.
select City, CompanyName, ContactName
from customers
where City like 'A%' or 'B%';


-- 14. Create a report showing all the even numbers of OrderID from the orders table.
select *
from orders
where OrderID % 2 = 0;


-- 15. Create a report that shows all the orders where the freight cost more than $500.
select *
from orders
where freight > 500
order by Freight;


-- 16. Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of all products that are up for reorder.
select ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel
from products
where ReorderLevel = 0;


-- 17. Create a report that shows the CompanyName, ContactName number of all customer that have no fax number
select  CompanyName, ContactName, phone, fax
from customers
where fax is null;



-- 18. Create a report that shows the FirstName, LastName of all employees that do not report to anybody.
select FirstName, LastName, ReportsTo
from employees
where ReportsTo is null;



-- 19. Create a report showing all the odd numbers of OrderID from the orders table.
select *
from orders
where OrderID % 2 = 1;



-- 20. Create a report that shows the CompanyName, ContactName, Fax of all customers that do not have Fax number and sorted by ContactName
select CompanyName, ContactName, Fax
from customers
where fax is null 
order by ContactName;



-- 21. Create a report that shows the City, CompanyName, ContactName of customers from cities that has letter L in the name sorted by ContactName.
select City, CompanyName, ContactName
from customers
where city like '%L%'
order by ContactName;



-- 22. Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s.
select FirstName,LastName, sub.Employee_Birthyear
from 
(
select *,
extract(year from birthdate) as Employee_Birthyear
from employees
) sub
where sub.Employee_Birthyear between 1950 and 1959;



-- 23. Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table
select FirstName, LastName,
        extract(year from birthdate) as "Birth Year"
from employees;



-- 24. Create a report showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped by OrderID and sorted by NumberofOrders in descending order. HINT: you will need to use a Groupby statement
select OrderID,
count(orderid) as 'Number Of Orders'
FROM northwind.`order details`
group by 1
order by 2;



-- 25. Create a report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids, Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID

select  SupplierID, ProductName, CompanyName
from products p
join suppliers s
using(supplierid)
 where CompanyName  in ('Exotic Liquids', 'Specialty Biscuits, Ltd.','Escargots Nouveaux')
 order by 1;



-- 26. Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all orders with ShipPostalCode beginning with "98124"
select ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress
from orders
where ShipPostalCode like '98124%';



-- 27. Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in their ContactTitle.
select ContactName, ContactTitle, CompanyName
from customers
where ContactTitle not like '%Sales%';



-- 28. Create a report that shows the LastName, FirstName, City of employees in cities other than "Seattle"
select LastName, FirstName, City
from employees
where City not like '%Seattle%';



-- 29. Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other cities in Spain other than Madrid
select CompanyName, ContactTitle, City, Country
from customers
where (country = 'Mexico' or country = 'Spain' ) and city not like 'Madrid';



-- 30
select 
concat(firstname,' ',lastname, ' can be reached at ', extension) as 'Contact Info'
from employees;



-- 31. Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet in their Contactname
select ContactName
from customers
where ContactName not like '_a%';



-- 32. Create a report that shows the average UnitPrice rounded to the next whole number, total price of UnitsInStock and maximum number of orders from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively.
select 
round(avg(unitprice)) as 'Average Price',
max(UnitsOnOrder) as 'Max Order',
 sum(UnitsInStock) as "Total Stock"
from products;



-- 33. Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice from the products, suppliers and categories table
select p.SupplierID, CompanyName, CategoryName, ProductName, UnitPrice
from products p
join suppliers s
using(supplierid)
join categories c
using(categoryid);




-- 34. Create a report that shows the CustomerID, sum of Freight, from the orders table with sum of freight greater $200, grouped by CustomerID. HINT: you will need to use a Groupby and a Having statement
select customerid, total_freight
 from (
select *,
       round(sum(Freight),2) as Total_Freight
from orders
group by 1
having round(sum(Freight),2) > 200
order by round(sum(Freight),2)
) sub;





-- 35. Create a report that shows the OrderID ContactName, UnitPrice, Quantity, Discount from the order details, orders and customers table with discount given on every purchase.
select OrderID,ContactName, UnitPrice, Quantity, Discount
FROM northwind.`order details` od
join orders o
using(orderid)
join customers c
using(customerid);




-- 36. Create a report that shows the EmployeeID, the LastName and FirstName as employee, and the LastName and FirstName of who they report to as manager from the employees table sorted by Employee ID. HINT: This is a SelfJoin.
select   m.EmployeeID,
         concat(m.LastName, ' ', m.FirstName) as Employee,
 		 concat(e.LastName, ' ', e.FirstName) as Manager,
        e.EmployeeID as 'Manager ID'
from employees e
join employees m
on e.EmployeeID = m.ReportsTo;




-- 37. Create a report that shows the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice and MaximumPrice respectively.
select avg(UnitPrice) as 'Average Price',
       min(Unitprice) as 'Minimum Price',
       max(UnitPrice) as 'Maximum Price'
from products;



-- 38. Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Country, Phone, OrderDate, RequiredDate, ShippedDate from the customers and orders table. HINT: Create a View.
create view CustomerInfo as 
select CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Country, Phone, OrderDate, RequiredDate, ShippedDate
from customers
join orders
using(customerid);




-- 39. Change the name of the view you created from customerinfo to customer details.
 rename table customerinfo to Customer_details;




-- 40. Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, Description, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from the supplier, products and categories tables.
create view Productdetails as
select ProductID, CompanyName, ProductName, CategoryName, Description, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
from suppliers
join products 
using(supplierid)
join categories
using(categoryid);



-- 41. Drop the customer details view
drop view customer_details;



-- 42. Create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo
select *,
left(categoryname,5) as ShortInfo
from categories;



-- 43. Create a copy of the shipper table as shippers_duplicate. Then insert a copy of shippers data into the new table HINT: Create a Table, use the LIKE Statement and INSERT INTO statement.
create table shippers_duplicate as
select * from shippers;

alter table shippers_duplicate
add column email varchar(50);

select *
from shippers_duplicate;

ALTER TABLE shippers_duplicate
MODIFY COLUMN email VARCHAR(50) NULL;

insert into shippers_duplicate (email)
values('speedyexpress@gmail.com'),
      ('unitedpackage@gmail.com'),
	   ('federalshipping@gmail.com');




-- 45. Create a report that shows the CompanyName and ProductName from all product in the Seafood category
select  CompanyName, ProductName, CategoryName
from categories
join products
using(categoryid)
join suppliers
using(supplierid)
where CategoryName = 'Seafood';




-- 46. Create a report that shows the CategoryID, CompanyName and ProductName from all product in the categoryID 5.
select  CategoryID, CompanyName, ProductName
from products
join suppliers
using(supplierid)
where CategoryID = 5;



-- 47. Delete the shippers_duplicate table.
drop table shippers_duplicate;






-- 48. Create a select statement that ouputs the following from the employees table.
select LastName, FirstName, Age
  from 
(
       select *,
	    extract(year from birthdate) as yearofbirth,
		extract(year from now()) as currentyear,
        extract(year from now()) - extract(year from birthdate) as Age
 from employees
 ) a;
 
 
 
 
 -- 49. Create a report that the CompanyName and total number of orders by customer renamed as number of orders since Decemeber 31, 1994. Show number of Orders greater than 10.
 select CompanyName, 
        count(OrderID) as "Number Of Orders Since December 31, 1994"
 from customers
 join orders
 using(customerid)
 group by 1
 having count(OrderID) > 10;
 
 
 
 
 -- 50. Create a select statement that ouputs the following from the product table
 select 
 concat(productname,' weighs/is ', quantityperunit, ' and cost ', round(unitprice) ) as 'Product Info'
 from products;