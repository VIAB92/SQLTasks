/*ЗАДАНИЕ 1: Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd*/

SELECT model, speed, hd FROM pc WHERE price<500;

/*ЗАДАНИЕ 2: Найдите производителей принтеров. Вывести: maker*/
SELECT DISTINCT maker FROM product WHERE type='printer'

/*ЗАДАНИЕ 3: Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.*/
SELECT model, ram, screen FROM laptop WHERE price>1000;

/*ЗАДАНИЕ 4: Найдите все записи таблицы Printer для цветных принтеров. */
SELECT * FROM printer WHERE color='y';

/*ЗАДАНИЕ 5: Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.*/
SELECT model, speed, hd FROM pc WHERE  (cd='12x' or cd='24x') AND price<600;

/*ЗАДАНИЕ 6: Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
*/
SELECT DISTINCT p.maker, l.speed FROM  product p JOIN laptop l ON p.model=l.model AND l.hd>=10 ORDER BY p.maker;

/*ЗАДАНИЕ 7: Найдите номера моделей и цены всех продуктов (любого типа), выпущенных производителем B (латинская буква).*/

SELECT l.model, l.price FROM laptop l JOIN product p ON l.model=p.model WHERE maker='B'
UNION
SELECT pc.model, pc.price FROM pc JOIN product p ON pc.model=p.model WHERE maker='B'
UNION
SELECT pr.model, pr.price FROM printer pr JOIN product p ON pr.model=p.model WHERE maker='B';

/*ЗАДАНИЕ 8: Найдите производителя, выпускающего ПК, но не ПК-блокноты.*/
SELECT DISTINCT maker FROM product WHERE type='pc' and maker NOT IN(SELECT maker FROM product WHERE type='laptop');

/*ЗАДАНИЕ 9: Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker*/
SELECT DISTINCT maker FROM product p JOIN pc ON p.model=pc.model WHERE pc.speed>=450;

/*ЗАДАНИЕ 10: Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price*/
SELECT model, price FROM printer WHERE price = (SELECT MAX(price) FROM printer);

/*ЗАДАНИЕ 11: Найдите среднюю скорость ПК.*/
SELECT AVG(speed) FROM pc

/*ЗАДАНИЕ 12: Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.*/
SELECT AVG(speed) FROM laptop WHERE price>1000

/*ЗАДАНИЕ 13: Найдите среднюю скорость ПК, выпущенных производителем A.*/
SELECT AVG(speed) FROM pc JOIN product p ON pc.model=p.model WHERE p.maker='A';

/*ЗАДАНИЕ 14: Найти производителей, которые выпускают более одной модели, при этом все выпускаемые производителем модели являются продуктами одного типа.
Вывести: maker, type*/
select distinct maker, type from product where maker in (select maker from product group by maker having count(distinct type)=1 and count(model)>1);

/*ЗАДАНИЕ 15: Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD*/

SELECT hd FROM pc GROUP BY hd HAVING count(hd)>1









