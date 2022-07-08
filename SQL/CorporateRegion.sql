IF NOT EXISTS(
  SELECT * FROM sysobjects WHERE name='CorporateRegion' and xtype='U'
)

CREATE TABLE CorporateRegion
(
  CorporateRegionID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  CorporateRegionCD nvarchar(30) UNIQUE,
  Descr nvarchar(60),
)

DROP TABLE IF EXISTS CorporateRegion;