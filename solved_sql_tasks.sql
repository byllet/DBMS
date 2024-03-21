--1
SELECT FirstName, LastName 
FROM customers
where City = "Prague"

--2
/*SELECT FirstName, LastName 
FROM customers
where FirstName like 'M%' and FirstName like '%ch%'*/

--3
/*SELECT Name, Bytes / 1024 / 1024 as Mb
FROM tracks */

--4
/*
SELECT FirstName, LastName
from employees
where HireDate like '2002%' and City = 'Calgary'*/

--5
/*SELECT FirstName, LastName
from employees
where (HireDate - BirthDate) >= 40 */

--6
/*SELECT FirstName, LastName
FROM customers
where Fax is NULL and Country = 'USA' */

--7
/*SELECT ShipCity
FROM sales
where SalesDate like '%-08-%' or SalesDate like '%-09-%'*/

--8
/*SELECT Email
FROM customers
where Email like '%gmail.com'*/

--9
/*SELECT FirstName, LastName
FROM employees
where datetime('now') - HireDate >= 18*/

--10
/*SELECT Title
FROM employees
group by Title*/

--11
/*SELECT LastName, FirstName, Date('now') -  Age as Year
FROM customers
ORDER BY LastName, FirstName,  Year*/

--12
/*SELECT Milliseconds / 1000 as seconds
FROM tracks
ORDER BY seconds limit 1*/

--13 
/*SELECT Name, Milliseconds / 1000 as seconds
FROM tracks
ORDER BY Milliseconds LIMIT 1;*/

--14
/*SELECT AVG(Age) as AVG_AGE, Country
FROM customers
GROUP BY Country */

--15
/*SELECT LastName as Фамилия
FROM employees
where HireDate like '%-10-%'*/

--16
/*SELECT LastName
FROM employees
ORDER BY HireDate ASC limit 1*/