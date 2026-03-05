/*---------    والمجموعات الفرعيه Style_Code الاستعلام عن اسم المنتج عربي وانجليزي والسعر وال ---------------------*/
WITH Items_CTE AS (
    SELECT
        p.ID AS ItemID,
        LTRIM(RTRIM(p.ItemName)) AS ItemName_AR,
        LTRIM(RTRIM(ISNULL(i.itname_en, p.ItemName))) AS ItemName_EN,
        LTRIM(RTRIM(sm.smname)) AS SubCategory,
        pr.itprice AS Price,
        p.Style_Code,

        ROW_NUMBER() OVER (
            PARTITION BY p.ID
            ORDER BY pr.itprice DESC
        ) AS rn

    FROM TblProductItem p
    INNER JOIN prices_items pr
        ON p.ID = pr.itid

    LEFT JOIN select_sub_men_items i
        ON LTRIM(RTRIM(p.ItemName)) = LTRIM(RTRIM(i.itname))

    LEFT JOIN select_sub_men sm
        ON i.smid = sm.smid

    WHERE
        p.ItemName IS NOT NULL
        AND LTRIM(RTRIM(p.ItemName)) <> ''
        AND pr.itprice > 0
)

SELECT
    ItemID,
    ItemName_AR,
    ItemName_EN,
    SubCategory,
    Price,
    Style_Code
FROM Items_CTE
WHERE rn = 1
ORDER BY ItemID ASC;
