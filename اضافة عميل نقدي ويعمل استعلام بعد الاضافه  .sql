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

