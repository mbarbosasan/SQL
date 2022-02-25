-- SUM / MIN / AVERAGE;

SELECT TOP 10 SUM(LineTotal) AS "Soma"
FROM Sales.SalesOrderDetail;

SELECT TOP 10 MIN(LineTotal) AS "Menor Valor"
FROM Sales.SalesOrderDetail;

SELECT TOP 10 AVG(LineTotal) AS "M�dia"
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

SELECT COLOR, AVG(ListPrice) AS "M�dia"
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
-- Quantidade m�dia de cada produto vendido na loja

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
-- Buscar quantos produtos e a sua respectiva quantidade m�dia cadastradas nas nossas ordens de servi�o, agrupadas por PRODUCT ID;

SELECT ProductID,
COUNT(OrderQty) as "Quantidade",
AVG(OrderQty) as "M�dia"
FROM Production.WorkOrder
GROUP BY ProductID
ORDER BY "M�dia" desc;

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
-- Identificar as provincias com o maior numero de registros, come�ando a partir de 1000;

SELECT StateProvinceID, COUNT(StateProvinceID) AS "Quantidade"
FROM Person.Address
GROUP BY StateProvinceID
HAVING COUNT(StateProvinceID) > 1000;

-- DESAFIO 2
-- Buscar os produtos que n�o est�o vendendo em m�dia 1000000 em total de vendas;

SELECT ProductID, AVG(LineTotal) as "Total"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(LineTotal) < 1000000
ORDER BY Total desc;

-- AS

-- DESAFIO 1
-- Encontrar o FirstName e o LastName Person.Person e renomear para PT-BR.

SELECT FirstName as "Primeiro Nome", LastName as "Sobrenome"
FROM Person.Person;

-- DESAFIO 2
-- Encontrar a coluna "Product Number" e renome�-la para PT-BR.

SELECT ProductNumber as "N�mero do Produto"
FROM Production.Product

--DESAFIO 3
-- Encontrar a coluna "SalesOrderDetails" e renomear para "Pre�o Unit�rio"

SELECT UnitPrice as "Pre�o Unit�rio"
FROM Sales.SalesOrderDetail

-- INNER JOIN // OUTER JOIN // SELF-JOIN

SELECT P.BusinessEntityID, P.FirstName, P.LastName, PE.EmailAddress
FROM Person.Person AS P
INNER JOIN Person.EmailAddress AS PE ON P.BusinessEntityID = PE.BusinessEntityID;

-- Pre�o do Produto, Nome do Produto e sub-categoria;

SELECT TOP 100 PR.Name, PR.ListPrice, PC.Name
FROM Production.Product as PR
INNER JOIN Production.ProductSubcategory as PC on PC.ProductSubcategoryID = PR.ProductSubcategoryID

SELECT TOP 100 City
FROM Person.BusinessEntityAddress AS BA
INNER JOIN PERSON.Address AS PA ON PA.AddressID = BA.AddressID

-- DESAFIO 1
-- BusinessEntityId, Name, PhoneNumberTypeId, PhoneNumber;

SELECT TOP 100 PH.BusinessEntityID, PT.Name, PT.PhoneNumberTypeID, PH.PhoneNumber
FROM Person.PhoneNumberType as PT
INNER JOIN Person.PersonPhone as PH ON PH.PhoneNumberTypeID = PT.PhoneNumberTypeID;

-- DESAFIO 2
-- ADDRESSID, CITY, STATEPROVINCEID, NOME DO ESTADO

SELECT TOP 100 PA.AddressID, PA.City, PS.StateProvinceID, PS.CountryRegionCode
FROM Person.Address AS PA
INNER JOIN Person.StateProvince as PS ON PS.StateProvinceID = PA.StateProvinceID;

-- LEFT JOIN

-- Buscar pessoas com cart�es de cr�dito registrado

SELECT *
FROM Person.Person AS PP 
LEFT JOIN Sales.PersonCreditCard AS PC ON PP.BusinessEntityID = PC.BusinessEntityID
WHERE PC.BusinessEntityID is null

-- INNER JOIN : 19118
-- LEFT JOIN : 19972

-- UNION

SELECT ProductID, Name, ProductNumber
FROM Production.Product
WHERE NAME LIKE '%Chain%'
UNION
SELECT ProductID, Name, ProductNumber
FROM Production.Product
WHERE NAME LIKE '%Decal%'

SELECT FirstName, Title, MiddleName
FROM Person.Person
WHERE TITLE = 'Mr.'
UNION
SELECT FirstName, Title, MiddleName
FROM Person.Person
WHERE MiddleName = 'A'

-- DATEPART, TIMESTAMP

SELECT SalesOrderID, DATEPART(MONTH, OrderDate) as "M�s"
FROM Sales.SalesOrderHeader

SELECT AVG(TotalDue) as "M�dia", DATEPART(DAY, OrderDate) AS "M�s"
FROM Sales.SalesOrderHeader
GROUP BY DATEPART(DAY, OrderDate) 
ORDER BY M�s asc;

SELECT AVG(LastReceiptCost) as "Media", DATEPART(MONTH, LastReceiptDate) AS "Mes"
FROM Purchasing.ProductVendor
GROUP BY DATEPART(MONTH, LastReceiptDate)
ORDER BY Mes ASC;

