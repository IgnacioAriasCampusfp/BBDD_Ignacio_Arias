-- 1
select month(now());
-- 2
SELECT CURRENT_DATE();
-- 3
SELECT ROW_COUNT();
-- 4
SELECT DATABASE();
-- 5
select sqrt(4);
-- 6
select round(235.4444444444449);
-- 7
select abs(-123);
-- 8
SELECT REVERSE("La cripta mágica");
-- 9
SELECT TRIM(" 1234sadfsf ");
-- 10
select strcmp("Alicia","Alex");
-- 11
SELECT FLOOR("25.89466312312688561");
-- 12
SELECT ROUND(45.8564312,5);
-- 13
SELECT DAYOFWEEK(NOW());
-- 14
select current_user();
-- 15
select ucase("asd qweeqw qowep");
-- 16
select lcase("ASDJOPO ASDKKNKL");
-- 17
select pow(123,12);
-- 18
SELECT contacto, INSTR(contacto, "PEREZ") AS BUSCAPEREZ FROM CLIENTE;
-- 19
SELECT LCASE(nombre), PRECIO FROM PRODUCTO;
-- 20
select sysdate();