SELECT *
FROM person.Person;

SELECT title
FROM person.Person;

SELECT FirstName, LastName
FROM person.Person;

SELECT DISTINCT FirstName FROM person.Person;

SELECT DISTINCT LastName FROM person.Person;

SELECT * 
FROM person.Person
WHERE LastName = 'Miller' AND FirstName = 'Anna';

SELECT *
FROM production.Product
WHERE color = 'blue' OR color = 'black';

SELECT *
FROM Production.Product
WHERE ListPrice > 1500 AND ListPrice < 5000;

SELECT *
FROM Production.Product
WHERE color <> 'red';

-- DESAFIO 1;

-- Selecionar produtos com peso entre 500 e 700;

SELECT Name
FROM Production.Product
WHERE Weight > 500 AND Weight < 700;

-- DESAFIO 2;

-- Selecionar colaboradores que estão casados e assalariados;

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'M' AND SalariedFlag = '1';

-- DESAFIO 3;

-- Selecionar a pessoa Peter Krebs e identificar o seu endereço de email para envio de cobrança;

SELECT *
FROM Person.Person
WHERE FirstName = 'Peter' AND LastName = 'Krebs';

SELECT *
FROM Person.EmailAddress
WHERE BusinessEntityID = '26';

-- COUNT

-- Contar quantos cargos temos diferentes

SELECT COUNT(DISTINCT TITLE) 
FROM Person.Person

-- DESAFIO 1

-- Contar quantos nomes diferentes temos;

SELECT COUNT(DISTINCT Name)
FROM Production.Product;

-- DESAFIO 2

-- Contar quantos tamanhos temos disponíveis

SELECT COUNT(size)
FROM Production.Product;

-- DESAFIO 3

-- Contar quantos tamanhos diferentes temos disponíveis;

SELECT COUNT(DISTINCT size)
FROM Production.Product;


-- TOP

-- Selecionar o top 10 de colaboradores;

SELECT TOP 10 *
FROM Person.Person;

-- ORDER BY

SELECT FirstName, LastName
FROM Person.Person
ORDER BY FirstName asc, LastName desc;

-- DESAFIO 1;

-- Ordenando os 10 produtos mais caros do maior para o menor.

SELECT TOP 10 ProductID
FROM Production.Product
ORDER BY ListPrice desc;

-- DESAFIO 2;

-- Obter nome e numero dos produtos que o ProductID entre 1~4;

SELECT TOP 4 name, ProductNumber
FROM Production.Product
ORDER BY ProductID asc;

-- BETWEEN;

SELECT *
FROM Production.Product
WHERE ListPrice BETWEEN 1000 AND 1500;

SELECT *
FROM Production.Product
WHERE ListPrice NOT BETWEEN 1000 AND 1500;

SELECT * 
FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009/01/01' AND '2010/01/01'
ORDER BY HireDate;

-- IN 

SELECT *
FROM Person.Person
WHERE BusinessEntityID IN (2, 7, 13);

SELECT *
FROM Person.Person
WHERE BusinessEntityID NOT IN (2, 7, 13);

-- LIKE

SELECT *
FROM Person.Person
WHERE FirstName like '%essa%' 

-- Com o underline a diferénça é que os caracteres seguintes não serão maior do que um,
-- no caso abaixo sempre virá apenas uma letra após a combinação

SELECT *
FROM Person.Person
WHERE FirstName like '%ro_' 

-- DESAFIOS DE FUNDAMENTOS

-- DESAFIO 1 -> Buscar a quantidade de produtos que temos cadastrados com valor maior que USD 1500;

SELECT COUNT(ListPrice)
FROM Production.Product
WHERE ListPrice >= 1500;

-- DESAFIO 2 -> Quantas pessoas temos com o sobrenome que inicia com a letra P;

SELECT COUNT(LastName)
FROM Person.Person
WHERE LastName like 'P%'

-- DESAFIO 3 -> Em quantas cidades únicas estão cadastradas nossos clientes;

SELECT COUNT (DISTINCT CITY)
FROM Person.Address;

-- DESAFIO 4 -> Quais são as cidades unicas que temos cadastrados nossos clientes;

SELECT DISTINCT city
FROM Person.Address;

-- DESAFIO 5 -> Quantos produtos VERMELHOS tem o preço entre 500 a 1000 USD;

SELECT COUNT(*)
FROM Production.Product
WHERE Color = 'red' AND ListPrice BETWEEN 500 AND 1000;

-- DESAFIO 6 -> Quantos produtos cadastrados tem a palavra 'ROAD' neles;

SELECT COUNT(*)
FROM Production.Product
WHERE Name like '%road%';