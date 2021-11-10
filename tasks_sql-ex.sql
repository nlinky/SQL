https://www.sql-ex.ru/

База данных "Компьютерная фирма":

Схема БД состоит из четырех таблиц:
	Product(maker, model, type)
	PC(code, model, speed, ram, hd, cd, price)
	Laptop(code, model, speed, ram, hd, price, screen)
	Printer(code, model, color, type, price)

Таблица Product представляет производителя (maker), номер модели (model) и тип ('PC' - ПК, 'Laptop' - ПК-блокнот или 'Printer' - принтер). 
Предполагается, что номера моделей в таблице Product уникальны для всех производителей и типов продуктов. 

В таблице PC для каждого ПК, однозначно определяемого уникальным кодом – code, указаны модель – model (внешний ключ к таблице Product), 
скорость - speed (процессора в мегагерцах), объем памяти - ram (в мегабайтах), 
размер диска - hd (в гигабайтах), скорость считывающего устройства - cd (например, '4x') и цена - price. 

Таблица Laptop аналогична таблице РС за исключением того, что вместо скорости CD содержит размер экрана -screen (в дюймах). 

В таблице Printer для каждой модели принтера указывается, является ли он цветным - color ('y', если цветной), 
тип принтера - type (лазерный – 'Laser', струйный – 'Jet' или матричный – 'Matrix') и цена - price.
----------------------------------------------------------------------
База данных "Корабли":

	Classes (class, type, country, numGuns, bore, displacement)
	Ships (name, class, launched)
	Battles (name, date)
	Outcomes (ship, battle, result)

Корабли в «классах» построены по одному и тому же проекту, и классу присваивается либо имя первого корабля, 
построенного по данному проекту, либо названию класса дается имя проекта, которое не совпадает ни с одним из кораблей в БД. 
Корабль, давший название классу, называется головным.

Отношение Classes содержит имя класса, тип (bb для боевого (линейного) корабля или bc для боевого крейсера), страну, 
в которой построен корабль, число главных орудий, калибр орудий (диаметр ствола орудия в дюймах) и водоизмещение ( вес в тоннах). 

В отношении Ships записаны название корабля, имя его класса и год спуска на воду. 

В отношение Battles включены название и дата битвы, в которой участвовали корабли, 
а в отношении Outcomes – результат участия данного корабля в битве (потоплен-sunk, поврежден - damaged или невредим - OK).

Замечания. 
1) В отношение Outcomes могут входить корабли, отсутствующие в отношении Ships. 
2) Потопленный корабль в последующих битвах участия не принимает.
----------------------------------------------------------------------
Задание: 1
Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd

SELECT model, speed, hd
FROM PC
WHERE price < 500;

 model speed hd 
 1232  500  10.0 
 1232  450  8.0 
 1232  450  10.0
 1260  500  10.0 
----------------------------------------------------------------------
Задание: 2
Найдите производителей принтеров. Вывести: maker

SELECT DISTINCT maker
FROM Product
WHERE type = 'Printer';

maker
A
D
E
----------------------------------------------------------------------
Задание: 3
Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.

SELECT model, ram, screen
FROM Laptop
WHERE price > 1000;

model	ram	screen
1750	128	14
1298	64	15
1752	128	14
----------------------------------------------------------------------
Задание: 4
Найдите все записи таблицы Printer для цветных принтеров.

SELECT * FROM Printer
WHERE color = 'y';

code	model	color	type	price
3	1434	y	Jet	290.0000
2	1433	y	Jet	270.0000
----------------------------------------------------------------------
Задание: 5
Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.

SELECT DISTINCT model, speed, hd
FROM PC
WHERE (cd = '12x' OR cd = '24x') AND price < 600;

model	speed	hd
1232	450	8.0
1232	450	10.0
1232	500	10.0
1260	500	10.0
----------------------------------------------------------------------
Задание: 6
Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.

SELECT DISTINCT maker, speed
FROM Product INNER JOIN Laptop on Laptop.model = Product.model
WHERE hd >= 10;

maker	speed
A	450
A	600
A	750
B	750
----------------------------------------------------------------------
Задание: 7
Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

SELECT DISTINCT PC.model, PC.price
FROM Product INNER JOIN PC ON PC.model = Product.model
WHERE maker = 'B'
UNION 
SELECT DISTINCT Laptop.model, Laptop.price
FROM Product INNER JOIN Laptop ON Laptop.model = Product.model
WHERE maker = 'B'
UNION 
SELECT DISTINCT Printer.model, Printer.price
FROM Product INNER JOIN Printer ON Printer.model = Product.model
WHERE maker = 'B';

model	price
1121	850.0000
1750	1200.0000
----------------------------------------------------------------------
Задание: 8
----------------------------------------------------------------------
Задание: 9
Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

SELECT DISTINCT Maker
FROM Product INNER JOIN PC ON PC.model = Product.model
WHERE speed >= 450;

Maker
A
B
E
----------------------------------------------------------------------
Задание: 10
Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price

SELECT model, price
FROM Printer
WHERE price = (SELECT MAX(price) FROM Printer);

model	price
1288	400.0000
1276	400.0000
----------------------------------------------------------------------
Задание: 11
Найдите среднюю скорость ПК.

SELECT AVG(speed) AS avg_speed
FROM PC;

avg_speed
608
----------------------------------------------------------------------
Задание: 12
Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.

SELECT AVG(speed) AS avg_speed
FROM Laptop
WHERE price > 1000;

avg_speed
700
----------------------------------------------------------------------
Задание: 13
Найдите среднюю скорость ПК, выпущенных производителем A.

SELECT AVG(speed) AS Avg_speed
FROM PC INNER JOIN Product ON Product.model = PC.model
WHERE maker = 'A';

Avg_speed
606
----------------------------------------------------------------------
Задание: 14
Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.

SELECT Ships.class, name, Classes.country
FROM Ships INNER JOIN Classes ON Classes.class = Ships.class 
WHERE Classes.numGuns >= 10;

class		name		country
Tennessee	California	USA
North Carolina	North Carolina	USA
North Carolina	South Dakota	USA
Tennessee	Tennessee	USA
North Carolina	Washington	USA
----------------------------------------------------------------------
Задание: 15
Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD

SELECT HD
FROM PC
GROUP BY HD
HAVING COUNT(HD) >= 2;

HD
5.0
8.0
10.0
14.0
20.0

----------------------------------------------------------------------
Задание: 16
Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.

SELECT DISTINCT A.model, B.model, A.speed, A.ram
FROM PC AS A, PC AS B
WHERE A.speed = B.speed AND A.ram = B.ram AND A.model > B.model;

model	model	speed	ram
1233	1121	750	128
1233	1232	500	64
1260	1232	500	32
----------------------------------------------------------------------
Задание: 17
Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed

SELECT DISTINCT type, Laptop.model, speed
FROM Laptop INNER JOIN Product ON Product.model = Laptop.model
WHERE speed < ALL (SELECT speed FROM PC);

type	model	speed
Laptop	1298	350
----------------------------------------------------------------------
Задание: 18
Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price

SELECT DISTINCT maker, price
FROM Printer INNER JOIN Product ON Product.model = Printer.model
WHERE color = 'y' AND price = (SELECT MIN(price) 
FROM Printer 
WHERE color = 'y');

maker	price
D	270.0000
----------------------------------------------------------------------
Задание: 19
Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
Вывести: maker, средний размер экрана.

SELECT maker, AVG(screen) AS avg_screen
FROM Product INNER JOIN Laptop ON Product.model =  Laptop.model
GROUP BY maker;

maker	avg_screen
A	13
B	14
C	12
----------------------------------------------------------------------
Задание: 20
Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.

SELECT maker, COUNT(model) AS Count_Model
FROM Product
WHERE type = 'PC'
GROUP BY maker, type
HAVING COUNT(model) >= 3;

maker	Count_Model
E	3
----------------------------------------------------------------------
Задание: 21
Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
Вывести: maker, максимальная цена.

SELECT maker, MAX(price) AS max_price
FROM PC INNER JOIN Product ON Product.model = PC.model
GROUP BY maker;

maker	max_price
A	980.0000
B	850.0000
E	350.0000
----------------------------------------------------------------------
Задание: 22
Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. 
Вывести: speed, средняя цена.

SELECT speed, AVG(price) AS avg_price
FROM PC
WHERE speed > 600
GROUP BY speed;

speed	avg_price
750	900.0000
800	970.0000
900	980.0000
----------------------------------------------------------------------
Задание: 23
Найдите производителей, которые производили бы как ПК
со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
Вывести: Maker

SELECT maker FROM PC
INNER JOIN Product ON PC.model = Product.model
WHERE speed >= 750
INTERSECT
SELECT maker FROM Laptop
INNER JOIN Product ON Laptop.model = Product.model
WHERE speed >= 750;

maker
A
B
----------------------------------------------------------------------
