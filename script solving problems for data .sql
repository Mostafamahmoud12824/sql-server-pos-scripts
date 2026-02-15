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
/*---------    والمجموعات الفرعيه Style_Code الاستعلام عن اسم المنتج عربي وانجليزي والسعر وال ---------------------*/
/*
WITH Items_CTE AS (
    SELECT
        -- اسم الصنف عربي
        LTRIM(RTRIM(p.ItemName)) AS ItemName_AR,

        -- اسم الصنف إنجليزي
        LTRIM(RTRIM(ISNULL(i.itname_en, p.ItemName))) AS ItemName_EN,

        -- اسم المجموعة الفرعية
        LTRIM(RTRIM(sm.smname)) AS SubCategory,

        pr.itprice AS Price,
        p.Style_Code,

        ROW_NUMBER() OVER (
            PARTITION BY LTRIM(RTRIM(ISNULL(i.itname_en, p.ItemName)))
            ORDER BY p.ID
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
    ItemName_AR,
    ItemName_EN,
    SubCategory,
    Price,
    Style_Code
FROM Items_CTE
WHERE rn = 1
ORDER BY SubCategory, ItemName_AR;
*/


/*اضافة عميل نقدي علشان لو مش موجود*/
/*
IF NOT EXISTS (
    SELECT 1
    FROM TblCustData
    WHERE LTRIM(RTRIM(Cust_Name)) = N'عميل نقدي'
)
BEGIN
    INSERT INTO TblCustData (
        Cust_Name,
        State_ID,
        City_ID,
        Loca_ID,
        CustAddress,
        CustPhone,
        CustFax,
        CustEmail,
        CustVAT,
        PointOK,
        Point_Amount,
        First_Point,
        Custmap,
        CustBuildNo,
        CustPostBox,
        CustRegNo,
        CustAddNo,
        Ext1,
        Ext2,
        Ext3,
        Transfer,
        Up_Date,
        CustEN,
        CustMOMNo,
        CustAddEN,
        Ident_Type,
        Ident_No,
        Ctry_Code,
        Ctry_Name
    )
    VALUES (
        N'عميل نقدي',   -- Cust_Name
        11,             -- State_ID
        18,             -- City_ID
        838,            -- Loca_ID
        NULL,           -- CustAddress
        NULL,           -- CustPhone
        NULL,           -- CustFax
        NULL,           -- CustEmail
        NULL,           -- CustVAT
        0,              -- PointOK
        0,              -- Point_Amount
        0,              -- First_Point
        NULL,           -- Custmap
        1023,           -- CustBuildNo
        2222,           -- CustPostBox
        NULL,           -- CustRegNo
        NULL,           -- CustAddNo
        NULL,           -- Ext1
        NULL,           -- Ext2
        NULL,           -- Ext3
        1,              -- Transfer
        0,              -- Up_Date (bit)
        NULL,           -- CustEN
        NULL,           -- CustMOMNo
        NULL,           -- CustAddEN
        NULL,           -- Ident_Type
        NULL,           -- Ident_No
        NULL,           -- Ctry_Code
        NULL            -- Ctry_Name
    );
END

-- 🔍 عرض العميل للتأكد
SELECT *
FROM TblCustData
WHERE LTRIM(RTRIM(Cust_Name)) = N'عميل نقدي';
*/

