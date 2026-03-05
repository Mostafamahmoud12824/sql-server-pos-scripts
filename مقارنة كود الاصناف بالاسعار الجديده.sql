/*--- مقارنة كود الاصناف بالاسعار الجديده----------*/
BEGIN TRAN;

UPDATE prices_items
SET itprice = CASE itid
    WHEN 1 THEN 17
    WHEN 2 THEN 16
    WHEN 3 THEN 19
    WHEN 4 THEN 18
    WHEN 5 THEN 13
    WHEN 6 THEN 14
    WHEN 7 THEN 9
    WHEN 8 THEN 14
    WHEN 9 THEN 14
    WHEN 10 THEN 7
    WHEN 11 THEN 18
    WHEN 26 THEN 16
    WHEN 27 THEN 15
    WHEN 28 THEN 13
    WHEN 29 THEN 7
    WHEN 30 THEN 7
    WHEN 31 THEN 14
    WHEN 32 THEN 14
    WHEN 33 THEN 15
    WHEN 34 THEN 9
    WHEN 35 THEN 13
    WHEN 36 THEN 12
    WHEN 37 THEN 9
    WHEN 38 THEN 6
    WHEN 39 THEN 18
END
WHERE itid IN (
1,2,3,4,5,6,7,8,9,10,11,
26,27,28,29,30,31,32,33,34,
35,36,37,38,39
);

SELECT @@ROWCOUNT AS UpdatedRows;

COMMIT;
-- لو حصلت مشكلة
-- ROLLBACK;