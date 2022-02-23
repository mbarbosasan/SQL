-- SUM / MIN / AVERAGE;

SELECT TOP 10 SUM(LineTotal) AS "Soma"
FROM Sales.SalesOrderDetail;

SELECT TOP 10 MIN(LineTotal) AS "Menor Valor"
FROM Sales.SalesOrderDetail;

SELECT TOP 10 AVG(LineTotal) AS "Média"
FROM Sales.SalesOrderDetail;

-- GROUP BY;

SELECT SpecialOfferID, AVG(UnitPrice) AS "SOMA"
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID;

SELECT ProductID, SUM(OrderQty) AS "QUANTIDADE"
FROM Sales.SalesOrderDetail
GROUP BY ProductID;


SELECT FirstName, COUNT(FirstName) AS  "QUANTIDADE"
FROM Person.Person
GROUP BY FirstName
ORDER BY QUANTIDADE Desc;

SELECT COLOR, AVG(ListPrice) AS "Média"
FROM Production.Product
WHERE COLOR = 'Silver'
GROUP BY COLOR;

SELECT *
FROM Person.Person;

SELECT *
FROM Production.Product;

SELECT *
FROM Sales.SalesOrderDetail;

-- DESAFIO 1
-- Quantidade de pessoas com o mesmo 'MiddleName' agrupadas pelo 'MiddleName'

SELECT MiddleName, COUNT(MiddleName) as "Quantidade"
FROM Person.Person
GROUP BY MiddleName
ORDER BY Quantidade desc;

SELECT MiddleName, COUNT(FirstName) as "Quantidade"
FROM Person.Person
GROUP BY MiddleName
ORDER BY Quantidade desc;

-- DESAFIO 2
-- Quantidade média de cada produto vendido na loja

SELECT ProductID, AVG(OrderQty) as "Quantidade"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY Quantidade desc;

-- DESAFIO 3
-- Buscar os top 10 de produtos mais vendidos e o valor total de venda, ordenar do maior para o menor.

SELECT TOP 10 ProductID, SUM(LineTotal) as "Valor_Total"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY Valor_Total desc;

-- DESAFIO 4
-- Buscar quantos produtos e a sua respectiva quantidade média cadastradas nas nossas ordens de serviço, agrupadas por PRODUCT ID;

SELECT ProductID,
COUNT(OrderQty) as "Quantidade",
AVG(OrderQty) as "Média"
FROM Production.WorkOrder
GROUP BY ProductID
ORDER BY "Média" desc;

-- HAVING

SELECT FirstName, COUNT(FirstName) as "Quantidade"
FROM Person.Person
GROUP BY FirstName
HAVING COUNT(FirstName) > 10
ORDER BY Quantidade desc;

SELECT ProductID, SUM(LineTotal) AS "TOTAL"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LINETOTAL) BETWEEN 200000 AND 500000;

SELECT FirstName, COUNT(FirstName) as "QUANTIDADE"
FROM Person.Person
WHERE TITLE = 'Mr.'
GROUP BY FirstName
HAVING COUNT(FirstName) > 10;

-- DESAFIO 1
-- Identificar as provincias com o maior numero de registros, começando a partir de 1000;

SELECT StateProvinceID, COUNT(StateProvinceID) AS "Quantidade"
FROM Person.Address
GROUP BY StateProvinceID
HAVING COUNT(StateProvinceID) > 1000;

-- DESAFIO 2
-- Buscar os produtos que não estão vendendo em média 1000000 em total de vendas;

SELECT ProductID, AVG(LineTotal) as "Total"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(LineTotal) < 1000000
ORDER BY Total desc;