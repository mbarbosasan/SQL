-- MANIPULA��O DE STRINGS

SELECT CONCAT(FirstName, ' ', LastName)
FROM Person.Person;

SELECT UPPER(FirstName)
FROM Person.Person;

SELECT LOWER(LastName)
FROM Person.Person

SELECT LEN(FirstName)
FROM Person.Person

SELECT FirstName, SUBSTRING(FirstName, 3, 5)
FROM Person.Person;

SELECT REPLACE(ProductNumber, '-',':')
FROM Production.Product;

-- OPERA��ES MATEM�TICAS

SELECT LineTotal / UnitPrice
FROM Sales.SalesOrderDetail;

SELECT LineTotal * UnitPrice
FROM Sales.SalesOrderDetail;

SELECT LineTotal + UnitPrice
FROM Sales.SalesOrderDetail;

SELECT LineTotal - UnitPrice
FROM Sales.SalesOrderDetail;

SELECT ROUND(LineTotal, 2)
FROM Sales.SalesOrderDetail

SELECT SQRT(LineTotal)
FROM Sales.SalesOrderDetail

-- https://docs.microsoft.com/pt-br/sql/t-sql/functions/mathematical-functions-transact-sql?view=sql-server-ver15

-- SUBQUERIES

-- Buscar os produtos cadastrados com um pre�o de venda acima da m�dia;

SELECT *
FROM Production.Product
WHERE ListPrice > (SELECT AVG(ListPrice) FROM Production.Product)

-- Buscar o nome das pessoas que tem como cargo Design Engineer

SELECT *
FROM Person.Person

SELECT *
FROM HumanResources.Employee
WHERE JobTitle = 'Design Engineer'

SELECT FirstName
FROM Person.Person
WHERE BusinessEntityID IN (
	SELECT BusinessEntityID
	FROM HumanResources.Employee
	WHERE JobTitle = 'Design Engineer')

SELECT FirstName
FROM Person.Person as PP
INNER JOIN HumanResources.Employee AS HR ON HR.BusinessEntityID = PP.BusinessEntityID
AND HR.JobTitle = 'Design Engineer'

-- DESAFIO 
-- Encontrar todos os endere�os no estado de "Alberta"

SELECT *
FROM Person.Address

SELECT *
FROM Person.StateProvince

SELECT *
FROM Person.Address
WHERE StateProvinceID IN (
	SELECT StateProvinceID
	FROM PERSON.StateProvince
	WHERE Name = 'Alberta')