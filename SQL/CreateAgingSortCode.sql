IF NOT EXISTS(
  SELECT * FROM sysobjects WHERE name='AgingSortCode' and xtype='U'
)

CREATE TABLE AgingSortCode
(
  AgingSortCodeID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  AgingSortCodeCD nvarchar(30) UNIQUE,
  Descr nvarchar(60),
)