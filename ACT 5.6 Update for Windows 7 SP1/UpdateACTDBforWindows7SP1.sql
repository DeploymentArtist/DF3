USE ACT
INSERT INTO.[dbo].[OS]
           ([osID]
           ,[osName]
           ,[majorVersion]
           ,[minorVersion]
           ,[buildNumber]
           ,[servicePackName]
           ,[servicePackMajor]
           ,[servicePackMinor]
           ,[csdVersion]
           ,[productType]
           ,[suite]
           ,[publishedDate])
     VALUES
           (N'6.1.1'
           ,N'Windows 7 SP1'
           ,6
           ,1
           ,0
           ,N'Service Pack 1'
           ,1
           ,0
           ,N'Service Pack 1'
           ,0
           ,0
           ,'2011-02-22')
GO