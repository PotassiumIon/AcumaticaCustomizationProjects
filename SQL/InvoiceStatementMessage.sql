IF NOT EXISTS(
  SELECT * FROM sysobjects WHERE name='InvoiceStatementMessage' and xtype='U'
)

CREATE TABLE InvoiceStatementMessage
(
  MessageID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  MessageName nvarchar(30) UNIQUE,
  Descr ntext,
)
