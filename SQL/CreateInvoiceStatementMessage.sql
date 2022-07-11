IF NOT EXISTS(
  SELECT *
FROM sysobjects
WHERE name='InvoiceStatementMessage' and xtype='U'
)

CREATE TABLE InvoiceStatementMessage
(
  MessageID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  MessageName nvarchar(30),
  MessageType char(1),
  Descr text,
  CorporateRegionID int,
  StateID nvarchar(50),
  OrganizationID int,
  BranchID int,
  StartDate datetime,
  EndDate datetime
)