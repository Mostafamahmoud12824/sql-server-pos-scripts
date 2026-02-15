/*---------   Style_Code الاستعلام عن اسم المنتج عربي وانجليزي والسعر وال ---------------------*/
/*
WITH Items_CTE AS (
    SELECT
        p.ItemName                               AS ItemName_AR,
        ISNULL(m.itname_en, p.ItemName)          AS ItemName_EN,
        pr.itprice                               AS Price,
        p.Style_Code,
        ROW_NUMBER() OVER (
            PARTITION BY p.ItemName
            ORDER BY p.ID
        ) AS rn
    FROM TblProductItem p
    INNER JOIN prices_items pr
        ON p.ID = pr.itid
    LEFT JOIN select_sub_men_items m
        ON LTRIM(RTRIM(p.ItemName)) = LTRIM(RTRIM(m.itname))
)
SELECT
    ItemName_AR,
    ItemName_EN,
    Price,
    Style_Code
FROM Items_CTE
WHERE rn = 1
ORDER BY ItemName_AR;
*/
WITH Items_CTE AS (
    SELECT
        -- الاسم العربي
        LTRIM(RTRIM(p.ItemName)) AS ItemName_AR,

        -- الاسم الإنجليزي (ولو مش موجود يرجع العربي)
        LTRIM(RTRIM(ISNULL(m.itname_en, p.ItemName))) AS ItemName_EN,

        pr.itprice AS Price,
        p.Style_Code,

        ROW_NUMBER() OVER (
            PARTITION BY 
                LTRIM(RTRIM(ISNULL(m.itname_en, p.ItemName)))
            ORDER BY p.ID
        ) AS rn
    FROM TblProductItem p
    INNER JOIN prices_items pr
        ON p.ID = pr.itid
    LEFT JOIN select_sub_men_items m
        ON LTRIM(RTRIM(p.ItemName)) = LTRIM(RTRIM(m.itname))
    WHERE
        p.ItemName IS NOT NULL
        AND LTRIM(RTRIM(p.ItemName)) <> ''
        AND pr.itprice > 0
)

SELECT
    ItemName_AR,
    ItemName_EN,
    Price,
    Style_Code
FROM Items_CTE
WHERE rn = 1
ORDER BY ItemName_AR;