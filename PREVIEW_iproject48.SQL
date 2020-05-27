USE iproject48
GO

EXEC sp_msforeachtable 'SELECT * FROM ?'
GO
