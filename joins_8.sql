--1

/*SELECT (SELECT SUM(UnitPrice) FROM sales_items
            WHERE sales_items.SalesId IN (
            SELECT SalesId FROM sales 
            WHERE strftime('%Y %m', SalesDate) >= '2012 01' 
            AND strftime('%Y %m', SalesDate) <= '2012 03'
            AND ShipCountry == 'USA')) as SUM*/


/*SELECT SUM(UnitPrice) FROM sales_items JOIN sales ON 
sales_items.SalesId = sales.SalesId and strftime('%Y %m', SalesDate) >= '2012 01' 
AND strftime('%Y %m', SalesDate) <= '2012 03' AND ShipCountry = 'USA'*/

-------------------
--2

/*SELECT FirstName FROM (SELECT CustomerId, FirstName FROM customers 
WHERE customers.FirstName NOT IN (SELECT employees.FirstName FROM employees))
GROUP BY FirstName;*/


/*SELECT FN FROM (SELECT ec.FirstName as FN 
FROM employees OUTER JOIN customers AS ec
ON ec.FirstName NOT IN (SELECT FirstName FROM employees) )
GROUP BY FN*/


/*SELECT FirstName FROM customers
EXCEPT
SELECT FirstName FROM employees*/

   
-----------

--3

--В общем случае будет разный результат 
--Во втором случае в любом случае получаем все строки из t1
--В первом запросе можем получить не все строки t1, так как не все могу удовлетворять where

---------------

--4

/*SELECT Title, (SELECT COUNT(*) FROM tracks as tr WHERE tr.AlbumId 
IN (SELECT TrackId FROM tracks WHERE al.AlbumId = tr.AlbumId)) as track_count
FROM albums as al*/


/*SELECT al.Title, count(tr.TrackId) as cnt
FROM albums AS al LEFT JOIN tracks AS tr ON al.AlbumId = tr.AlbumId
GROUP BY al.Title*/

-------------

--5

/*SELECT cus.FirstName, cus.LastName
FROM customers AS cus INNER JOIN sales AS sal 
ON cus.Country = "Germany" AND sal.SalesDate like "%2009%" AND sal.ShipCity =  "Berlin"
GROUP BY FirstName*/

-------------------

--6
 
/*SELECT FirstName, LastName FROM (SELECT FirstName, LastName, (SELECT count(*) FROM sales_items as SI 
                                             WHERE SI.SalesId IN 
                                             (SELECT SalesId FROM sales WHERE sales.CustomerId = c.CustomerId)) AS count
FROM customers as c WHERE count > 30)*/


/*SELECT FirstName, LastName 
FROM (SELECT FirstName, LastName, 
                                (SELECT Count(*) FROM sales_items INNER JOIN sales ON sales.SalesId = sales_items.SalesId AND sales.CustomerId = s.CustomerId) 
      as count FROM customers as s WHERE count > 30)*/


-----------

--7

/*SELECT gr.Name, AVG(tr.UnitPrice) AS avg 
FROM tracks AS tr LEFT JOIN genres AS gr 
ON tr.GenreId = gr.GenreId 
GROUP BY gr.Name*/

--------------------

--8

/*SELECT * FROM (SELECT gr.Name as name, AVG(tr.UnitPrice) AS avg 
FROM tracks AS tr LEFT JOIN genres AS gr 
ON tr.GenreId = gr.GenreId 
GROUP BY gr.Name)
WHERE avg  > 1*/





