
/* ------------------------------------------------------------------------ */
/* Initialization                                                           */
/* ------------------------------------------------------------------------ */

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON
GO


/* ------------------------------------------------------------------------ */
/* Create Lists table                                                       */
/* ------------------------------------------------------------------------ */

CREATE TABLE [dbo].[Lists](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL,
	[Multiple] [bit] NULL,
 CONSTRAINT [PK_Lists] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
) 

GO

ALTER TABLE [dbo].[Lists] ADD  CONSTRAINT [DF_Lists_Multiple]  DEFAULT ((0)) FOR [Multiple]
GO


/* ------------------------------------------------------------------------ */
/* Add default entries                                                      */
/* ------------------------------------------------------------------------ */

SET IDENTITY_INSERT [dbo].[Lists] ON
INSERT INTO [Lists] ([ID],[Name],[Description],[Multiple])VALUES(1,'YesNo','Yes, No',0)
INSERT INTO [Lists] ([ID],[Name],[Description],[Multiple])VALUES(2,'YesNoAll','Yes, No, All',0)
INSERT INTO [Lists] ([ID],[Name],[Description],[Multiple])VALUES(3,'TrueFalse','True, False',0)
INSERT INTO [Lists] ([ID],[Name],[Description],[Multiple])VALUES(4,'TimeZone','Timezones',0)
INSERT INTO [Lists] ([ID],[Name],[Description],[Multiple])VALUES(5,'TimeZoneName','Timezonenames',0)
SET IDENTITY_INSERT [dbo].[Lists] OFF


/* ------------------------------------------------------------------------ */
/* Create ListEntries table                                                 */
/* ------------------------------------------------------------------------ */

CREATE TABLE [dbo].[ListEntries](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ListID] [int] NULL,
	[Text] [nvarchar](255) NULL,
	[Value] [nvarchar](255) NULL,
	[Sequence] [int] NULL,
 CONSTRAINT [PK_ListEntries] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
) 

GO

ALTER TABLE [dbo].[ListEntries]  WITH CHECK ADD  CONSTRAINT [FK_ListEntries_Lists] FOREIGN KEY([ListID])
REFERENCES [dbo].[Lists] ([ID])
GO

ALTER TABLE [dbo].[ListEntries] CHECK CONSTRAINT [FK_ListEntries_Lists]
GO


/* ------------------------------------------------------------------------ */
/* Add default entries                                                      */
/* ------------------------------------------------------------------------ */


SET IDENTITY_INSERT [dbo].[ListEntries] ON
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(1,1,'Yes','YES',1)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(2,1,'No','NO',2)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(3,2,'Yes','YES',1)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(4,2,'No','NO',2)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(5,2,'All','ALL',3)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(6,3,'True','TRUE',1)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(7,3,'False','FALSE',2)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(8,4,'(GMT-12:00) International Date Line West','0',1)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(9,4,'(GMT-11:00) Midway Island, Samoa','1',2)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(10,4,'(GMT-10:00) Hawaii','2',3)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(11,4,'(GMT-09:00) Alaska','3',4)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(12,4,'(GMT-08:00) Pacific Time (US and Canada); Tijuana','4',5)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(13,4,'(GMT-07:00) Mountain Time (US and Canada)','10',6)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(14,4,'(GMT-07:00) Chihuahua, La Paz, Mazatlan','13',7)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(15,4,'(GMT-07:00) Arizona','15',8)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(16,4,'(GMT-06:00) Central Time (US and Canada)','20',9)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(17,4,'(GMT-06:00) Saskatchewan','25',10)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(18,4,'(GMT-06:00) Guadalajara, Mexico City, Monterrey','30',11)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(19,4,'(GMT-06:00) Central America','33',12)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(20,4,'(GMT-05:00) Eastern Time (US and Canada)','35',13)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(21,4,'(GMT-05:00) Indiana (East)','40',14)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(22,4,'(GMT-05:00) Bogota, Lima, Quito','45',15)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(23,4,'(GMT-04:00) Atlantic Time (Canada)','50',16)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(24,4,'(GMT-04:00) Caracas, La Paz','55',17)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(25,4,'(GMT-04:00) Santiago','56',18)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(26,4,'(GMT-03:30) Newfoundland and Labrador','60',19)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(27,4,'(GMT-03:00) Brasilia','65',20)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(28,4,'(GMT-03:00) Buenos Aires, Georgetown','70',21)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(29,4,'(GMT-03:00) Greenland','73',22)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(30,4,'(GMT-02:00) Mid-Atlantic','75',23)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(31,4,'(GMT-01:00) Azores','80',24)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(32,4,'(GMT-01:00) Cape Verde Islands','83',25)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(33,4,'(GMT) Greenwich Mean Time : Dublin, Edinburgh, Lisbon, London','85',26)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(34,4,'(GMT) Casablanca, Monrovia','90',27)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(35,4,'(GMT+01:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague','95',28)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(36,4,'(GMT+01:00) Sarajevo, Skopje, Warsaw, Zagreb','100',29)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(37,4,'(GMT+01:00) Brussels, Copenhagen, Madrid, Paris','105',30)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(38,4,'(GMT+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna','110',31)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(39,4,'(GMT+01:00) West Central Africa','113',32)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(40,4,'(GMT+02:00) Bucharest','115',33)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(41,4,'(GMT+02:00) Cairo','120',34)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(42,4,'(GMT+02:00) Helsinki, Kiev, Riga, Sofia, Tallinn, Vilnius','125',35)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(43,4,'(GMT+02:00) Athens, Istanbul, Minsk','130',36)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(44,4,'(GMT+02:00) Jerusalem','135',37)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(45,4,'(GMT+02:00) Harare, Pretoria','140',38)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(46,4,'(GMT+03:00) Moscow, St. Petersburg, Volgograd','145',39)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(47,4,'(GMT+03:00) Kuwait, Riyadh','150',40)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(48,4,'(GMT+03:00) Nairobi','155',41)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(49,4,'(GMT+03:00) Baghdad','158',42)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(50,4,'(GMT+03:30) Tehran','160',43)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(51,4,'(GMT+04:00) Abu Dhabi, Muscat','165',44)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(52,4,'(GMT+04:00) Baku, Tbilisi, Yerevan','170',45)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(53,4,'(GMT+04:30) Kabul','175',46)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(54,4,'(GMT+05:00) Ekaterinburg','180',47)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(55,4,'(GMT+05:00) Islamabad, Karachi, Tashkent','185',48)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(56,4,'(GMT+05:30) Chennai, Kolkata, Mumbai, New Delhi','190',49)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(57,4,'(GMT+05:45) Kathmandu','193',50)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(58,4,'(GMT+06:00) Astana, Dhaka','195',51)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(59,4,'(GMT+06:00) Sri Jayawardenepura','200',52)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(60,4,'(GMT+06:00) Almaty, Novosibirsk','201',53)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(61,4,'(GMT+06:30) Yangon (Rangoon)','203',54)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(62,4,'(GMT+07:00) Bangkok, Hanoi, Jakarta','205',55)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(63,4,'(GMT+07:00) Krasnoyarsk','207',56)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(64,4,'(GMT+08:00) Beijing, Chongqing, Hong Kong SAR, Urumqi','210',57)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(65,4,'(GMT+08:00) Kuala Lumpur, Singapore','215',58)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(66,4,'(GMT+08:00) Taipei','220',59)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(67,4,'(GMT+08:00) Perth','225',60)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(68,4,'(GMT+08:00) Irkutsk, Ulaanbaatar','227',61)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(69,4,'(GMT+09:00) Seoul','230',62)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(70,4,'(GMT+09:00) Osaka, Sapporo, Tokyo','235',63)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(71,4,'(GMT+09:00) Yakutsk','240',64)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(72,4,'(GMT+09:30) Darwin','245',65)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(73,4,'(GMT+09:30) Adelaide','250',66)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(74,4,'(GMT+10:00) Canberra, Melbourne, Sydney','255',67)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(75,4,'(GMT+10:00) Brisbane','260',68)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(76,4,'(GMT+10:00) Hobart','265',69)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(77,4,'(GMT+10:00) Vladivostok','270',70)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(78,4,'(GMT+10:00) Guam, Port Moresby','275',71)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(79,4,'(GMT+11:00) Magadan, Solomon Islands, New Caledonia','280',72)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(80,4,'(GMT+12:00) Fiji Islands, Kamchatka, Marshall Islands','285',73)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(81,4,'(GMT+12:00) Auckland, Wellington','290',74)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(82,4,'(GMT+13:00) Nuku''alofa','300',75)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(83,5,'(GMT-12:00) International Date Line West','Dateline Standard Time',1)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(84,5,'(GMT-11:00) Midway Island, Samoa','Samoa Standard Time',2)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(85,5,'(GMT-10:00) Hawaii','Hawaiian Standard Time',3)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(86,5,'(GMT-09:00) Alaska','Alaskan Standard Time',4)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(87,5,'(GMT-08:00) Pacific Time (US and Canada); Tijuana','Pacific Standard Time',5)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(88,5,'(GMT-07:00) Mountain Time (US and Canada)','Mountain Standard Time',6)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(89,5,'(GMT-07:00) Chihuahua, La Paz, Mazatlan','Mexico Standard Time 2',7)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(90,5,'(GMT-07:00) Arizona','US Mountain Standard Time',8)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(91,5,'(GMT-06:00) Central Time (US and Canada)','Central Standard Time',9)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(92,5,'(GMT-06:00) Saskatchewan','Canada Central Standard Time',10)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(93,5,'(GMT-06:00) Guadalajara, Mexico City, Monterrey','Mexico Standard Time',11)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(94,5,'(GMT-06:00) Central America','Central America Standard Time',12)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(95,5,'(GMT-05:00) Eastern Time (US and Canada)','Eastern Standard Time',13)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(96,5,'(GMT-05:00) Indiana (East)','US Eastern Standard Time',14)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(97,5,'(GMT-05:00) Bogota, Lima, Quito','SA Pacific Standard Time',15)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(98,5,'(GMT-04:00) Atlantic Time (Canada)','Atlantic Standard Time',16)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(99,5,'(GMT-04:00) Caracas, La Paz','SA Western Standard Time',17)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(100,5,'(GMT-04:00) Santiago','Pacific SA Standard Time',18)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(101,5,'(GMT-03:30) Newfoundland and Labrador','Newfoundland Standard Time',19)
GO
print 'Processed 100 total records'
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(102,5,'(GMT-03:00) Brasilia','E. South America Standard Time',20)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(103,5,'(GMT-03:00) Buenos Aires, Georgetown','SA Eastern Standard Time',21)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(104,5,'(GMT-03:00) Greenland','Greenland Standard Time',22)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(105,5,'(GMT-02:00) Mid-Atlantic','Mid-Atlantic Standard Time',23)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(106,5,'(GMT-01:00) Azores','Azores Standard Time',24)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(107,5,'(GMT-01:00) Cape Verde Islands','Cape Verde Standard Time',25)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(108,5,'(GMT) Greenwich Mean Time : Dublin, Edinburgh, Lisbon, London','GMT Standard Time',26)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(109,5,'(GMT) Casablanca, Monrovia','Greenwich Standard Time',27)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(110,5,'(GMT+01:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague','Central Europe Standard Time',28)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(111,5,'(GMT+01:00) Sarajevo, Skopje, Warsaw, Zagreb','Central European Standard Time',29)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(112,5,'(GMT+01:00) Brussels, Copenhagen, Madrid, Paris','Romance Standard Time',30)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(113,5,'(GMT+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna','W. Europe Standard Time',31)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(114,5,'(GMT+01:00) West Central Africa','W. Central Africa Standard Time',32)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(115,5,'(GMT+02:00) Bucharest','E. Europe Standard Time',33)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(116,5,'(GMT+02:00) Cairo','Egypt Standard Time',34)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(117,5,'(GMT+02:00) Helsinki, Kiev, Riga, Sofia, Tallinn, Vilnius','FLE Standard Time',35)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(118,5,'(GMT+02:00) Athens, Istanbul, Minsk','GTB Standard Time',36)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(119,5,'(GMT+02:00) Jerusalem','Israel Standard Time',37)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(120,5,'(GMT+02:00) Harare, Pretoria','South Africa Standard Time',38)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(121,5,'(GMT+03:00) Moscow, St. Petersburg, Volgograd','Russian Standard Time',39)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(122,5,'(GMT+03:00) Kuwait, Riyadh','Arab Standard Time',40)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(123,5,'(GMT+03:00) Nairobi','E. Africa Standard Time',41)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(124,5,'(GMT+03:00) Baghdad','Arabic Standard Time',42)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(125,5,'(GMT+03:30) Tehran','Iran Standard Time',43)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(126,5,'(GMT+04:00) Abu Dhabi, Muscat','Arabian Standard Time',44)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(127,5,'(GMT+04:00) Baku, Tbilisi, Yerevan','Caucasus Standard Time',45)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(128,5,'(GMT+04:30) Kabul','Afghanistan Standard Time',46)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(129,5,'(GMT+05:00) Ekaterinburg','Ekaterinburg Standard Time',47)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(130,5,'(GMT+05:00) Islamabad, Karachi, Tashkent','West Asia Standard Time',48)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(131,5,'(GMT+05:30) Chennai, Kolkata, Mumbai, New Delhi','India Standard Time',49)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(132,5,'(GMT+05:45) Kathmandu','Nepal Standard Time',50)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(133,5,'(GMT+06:00) Astana, Dhaka','Central Asia Standard Time',51)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(134,5,'(GMT+06:00) Sri Jayawardenepura','Sri Lanka Standard Time',52)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(135,5,'(GMT+06:00) Almaty, Novosibirsk','N. Central Asia Standard Time',53)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(136,5,'(GMT+06:30) Yangon (Rangoon)','Myanmar Standard Time',54)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(137,5,'(GMT+07:00) Bangkok, Hanoi, Jakarta','SE Asia Standard Time',55)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(138,5,'(GMT+07:00) Krasnoyarsk','North Asia Standard Time',56)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(139,5,'(GMT+08:00) Beijing, Chongqing, Hong Kong SAR, Urumqi','China Standard Time',57)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(140,5,'(GMT+08:00) Kuala Lumpur, Singapore','Singapore Standard Time',58)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(141,5,'(GMT+08:00) Taipei','Taipei Standard Time',59)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(142,5,'(GMT+08:00) Perth','W. Australia Standard Time',60)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(143,5,'(GMT+08:00) Irkutsk, Ulaanbaatar','North Asia East Standard Time',61)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(144,5,'(GMT+09:00) Seoul','Korea Standard Time',62)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(145,5,'(GMT+09:00) Osaka, Sapporo, Tokyo','Tokyo Standard Time',63)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(146,5,'(GMT+09:00) Yakutsk','Yakutsk Standard Time',64)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(147,5,'(GMT+09:30) Darwin','AUS Central Standard Time',65)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(148,5,'(GMT+09:30) Adelaide','Cen. Australia Standard Time',66)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(149,5,'(GMT+10:00) Canberra, Melbourne, Sydney','AUS Eastern Standard Time',67)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(150,5,'(GMT+10:00) Brisbane','E. Australia Standard Time',68)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(151,5,'(GMT+10:00) Hobart','Tasmania Standard Time',69)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(152,5,'(GMT+10:00) Vladivostok','Vladivostok Standard Time',70)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(153,5,'(GMT+10:00) Guam, Port Moresby','West Pacific Standard Time',71)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(154,5,'(GMT+11:00) Magadan, Solomon Islands, New Caledonia','Central Pacific Standard Time',72)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(155,5,'(GMT+12:00) Fiji Islands, Kamchatka, Marshall Islands','Fiji Islands Standard Time',73)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(156,5,'(GMT+12:00) Auckland, Wellington','New Zealand Standard Time',74)
INSERT INTO [ListEntries] ([ID],[ListID],[Text],[Value],[Sequence])VALUES(157,5,'(GMT+13:00) Nuku''alofa','Tonga Standard Time',75)
SET IDENTITY_INSERT [dbo].[ListEntries] OFF


ALTER TABLE [dbo].[Settings_Categories] ADD ListID INT
GO

ALTER TABLE [dbo].[Settings_Categories]  WITH CHECK ADD  CONSTRAINT [FK_Settings_Categories_Lists] FOREIGN KEY([ListID])
REFERENCES [dbo].[Lists] ([ID])
GO

ALTER TABLE [dbo].[Settings_Categories] CHECK CONSTRAINT [FK_Settings_Categories_Lists]
GO


/* ------------------------------------------------------------------------ */
/* Create Applications table                                                */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Applications](
	[ApplicationID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[ShortName] [nvarchar](255) NULL,
	[Version] [nvarchar](255) NULL,
	[Publisher] [nvarchar](255) NULL,
	[Language] [nvarchar](255) NULL,
	[CommandLine] [nvarchar](255) NULL,
	[WorkingDirectory] [nvarchar](255) NULL,
	[enable] [bit] NULL,
	[hide] [bit] NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO


/* ------------------------------------------------------------------------ */
/* Create Views                                                             */
/* ------------------------------------------------------------------------ */


/* ------------------------------------------------------------------------ */
/* Create ApplicationAssignments view                                       */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationAssignments]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[ApplicationAssignments]
AS
SELECT     Type, ID, Sequence, Applications, CASE dbo.Settings_Applications.Type WHEN ''C'' THEN
                          (SELECT     Description
                            FROM          ComputerIdentity
                            WHERE      ID = dbo.Settings_Applications.ID) WHEN ''L'' THEN
                          (SELECT     Location
                            FROM          LocationIdentity
                            WHERE      ID = dbo.Settings_Applications.ID) WHEN ''M'' THEN
                          (SELECT     Make + '' '' + Model
                            FROM          MakeModelIdentity
                            WHERE      ID = dbo.Settings_Applications.ID) WHEN ''R'' THEN
                          (SELECT     Role
                            FROM          RoleIdentity
                            WHERE      ID = dbo.Settings_Applications.ID) END AS Instance
FROM         dbo.Settings_Applications
' 
GO


/* ------------------------------------------------------------------------ */
/* Create PackageAssignments view                                           */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PackageAssignments]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[PackageAssignments]
AS
SELECT     Type, ID, Sequence, Packages, CASE dbo.Settings_Packages.Type WHEN ''C'' THEN
                          (SELECT     Description
                            FROM          ComputerIdentity
                            WHERE      ID = dbo.Settings_Packages.ID) WHEN ''L'' THEN
                          (SELECT     Location
                            FROM          LocationIdentity
                            WHERE      ID = dbo.Settings_Packages.ID) WHEN ''M'' THEN
                          (SELECT     Make + '' '' + Model
                            FROM          MakeModelIdentity
                            WHERE      ID = dbo.Settings_Packages.ID) WHEN ''R'' THEN
                          (SELECT     Role
                            FROM          RoleIdentity
                            WHERE      ID = dbo.Settings_Packages.ID) END AS Instance
FROM         dbo.Settings_Packages
' 
GO


/* ------------------------------------------------------------------------ */
/* Create AdministratorAssignments view                                     */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AdministratorAssignments]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[AdministratorAssignments]
AS
SELECT     Type, ID, Sequence, Administrators, CASE dbo.Settings_Administrators.Type WHEN ''C'' THEN
                          (SELECT     Description
                            FROM          ComputerIdentity
                            WHERE      ID = dbo.Settings_Administrators.ID) WHEN ''L'' THEN
                          (SELECT     Location
                            FROM          LocationIdentity
                            WHERE      ID = dbo.Settings_Administrators.ID) WHEN ''M'' THEN
                          (SELECT     Make + '' '' + Model
                            FROM          MakeModelIdentity
                            WHERE      ID = dbo.Settings_Administrators.ID) WHEN ''R'' THEN
                          (SELECT     Role
                            FROM          RoleIdentity
                            WHERE      ID = dbo.Settings_Administrators.ID) END AS Instance
FROM         dbo.Settings_Administrators
' 
GO


/* ------------------------------------------------------------------------ */
/* Create RoleAssignments view                                              */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[RoleAssignments]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[RoleAssignments]
AS
SELECT     Type, ID, Sequence, Role, CASE dbo.Settings_Roles.Type WHEN ''C'' THEN
                          (SELECT     Description
                            FROM          ComputerIdentity
                            WHERE      ID = dbo.Settings_Roles.ID) WHEN ''L'' THEN
                          (SELECT     Location
                            FROM          LocationIdentity
                            WHERE      ID = dbo.Settings_Roles.ID) WHEN ''M'' THEN
                          (SELECT     Make + '' '' + Model
                            FROM          MakeModelIdentity
                            WHERE      ID = dbo.Settings_Roles.ID) WHEN ''R'' THEN
                          (SELECT     Role
                            FROM          RoleIdentity
                            WHERE      ID = dbo.Settings_Roles.ID) END AS Instance
FROM         dbo.Settings_Roles
' 
GO



/* ------------------------------------------------------------------------ */
/* Update Stored Procedures                                                */
/* ------------------------------------------------------------------------ */


/* ------------------------------------------------------------------------ */
/* Update GetSettingsAsRows stored procedure                               */
/* ------------------------------------------------------------------------ */


-- =============================================
-- Author:		Koster, Maik
-- Description:	returns a list of settings as Rows
-- =============================================
ALTER PROCEDURE [dbo].[GetSettingsAsRows]
	-- Add the parameters for the stored procedure here
	@ID as int,
	@Type as char,
	@GroupID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	/* Ensure a Settings entry exists */
	EXECUTE dbo.AddDefaultSettings @ID, @Type

	SELECT  newid() as ID,
		dbo.Groups.[Name] AS [Group], 
		dbo.Categories.[Name] AS Category,
		dbo.Settings_Categories.[Name] AS [Name], 
		dbo.Settings_Categories.[Column_Name],
		cv.[Column_Value], 
		dbo.Settings_Categories.[Type] AS [Column_Type],
		dbo.Lists.[Name] AS [Column_List],
		dbo.Settings_Categories.[Description], 
		dbo.Settings_Categories.[ReadOnly],
		dbo.Settings_Categories.[ListID]
	FROM    dbo.Lists RIGHT OUTER JOIN dbo.Settings_Categories ON dbo.Lists.ID = dbo.Settings_Categories.ListID INNER JOIN
        dbo.Categories ON dbo.Settings_Categories.CategoryID = dbo.Categories.ID INNER JOIN
        dbo.Categories_Groups ON dbo.Categories.ID = dbo.Categories_Groups.CategoryID INNER JOIN
        dbo.Groups ON dbo.Categories_Groups.GroupID = dbo.Groups.ID INNER JOIN 

		(SELECT t.c.value('local-name(.)', 'NVARCHAR(250)') as [Column_Name]
				,t.c.value('.', 'NVARCHAR(250)') as [Column_Value] 
		 FROM 
			(SELECT 
				(SELECT t.* FOR XML RAW, TYPE) as x 
				 FROM dbo.Settings t 
				 WHERE ID = @ID AND Type = @Type
				 )v 
			CROSS APPLY v.x.nodes('row/@*') AS t(c) 
		) AS cv ON dbo.Settings_Categories.Column_Name = cv.Column_Name
WHERE     (dbo.Categories_Groups.GroupID = @GroupID)
ORDER BY dbo.Categories_Groups.Sequence, dbo.Settings_Categories.Sequence
END

GO


/* ------------------------------------------------------------------------ */
/* Update CreateCustomSetting stored procedure                              */
/* ------------------------------------------------------------------------ */

-- ================================================================
-- Author:	Koster, Maik
-- Description:	Creates a new Custom Setting in the Settings Table
-- ================================================================
ALTER PROCEDURE [dbo].[CreateCustomSetting] 
	@SettingName nvarchar(250)
	
AS
BEGIN
	SET NOCOUNT ON;

	IF @SettingName <> '' And NOT EXISTS (
		SELECT * FROM information_schema.COLUMNS
		WHERE column_name=@SettingName
			AND table_name = 'Settings'
		)
		BEGIN
			DECLARE @SQL nvarchar(500)
		
			SET @SQL = 'ALTER TABLE [dbo].[Settings] ADD [' + @SettingName + '] [nvarchar] (255) NULL DEFAULT('''')'
			EXEC(@SQL)
			
			SET @SQL = 'UPDATE [dbo].[Settings] SET [' + @SettingName + '] = '''' WHERE [' + @SettingName + '] IS NULL'
			EXEC(@SQL)
			
			-- Update Views
			-- ComputerSettings
			DECLARE @ViewDef VARCHAR(max)
			SET @ViewDef = (
				SELECT DEFINITION
				FROM sys.sql_modules
				WHERE object_id = object_id('dbo.ComputerSettings')
			)
		
			IF @ViewDef is null
				RETURN 
			DECLARE @CREATE_LOC int
			SET @CREATE_LOC = CHARINDEX(N'CREATE',@ViewDef)
			SET @ViewDef = STUFF(@ViewDef,@CREATE_LOC,6,N'ALTER')

			EXEC (@ViewDef)
			
			-- LocationSettings
			SET @ViewDef = (
				SELECT DEFINITION
				FROM sys.sql_modules
				WHERE object_id = object_id('dbo.LocationSettings')
			)
		
			IF @ViewDef is null
				RETURN 
				
			SET @CREATE_LOC = CHARINDEX(N'CREATE',@ViewDef)
			SET @ViewDef = STUFF(@ViewDef,@CREATE_LOC,6,N'ALTER')
				
			EXEC (@ViewDef)
			
			-- MakeModelSettings
			SET @ViewDef = (
				SELECT DEFINITION
				FROM sys.sql_modules
				WHERE object_id = object_id('dbo.MakeModelSettings')
			)
		
			IF @ViewDef is null
				RETURN 

			SET @CREATE_LOC = CHARINDEX(N'CREATE',@ViewDef)
			SET @ViewDef = STUFF(@ViewDef,@CREATE_LOC,6,N'ALTER')
				
			EXEC (@ViewDef)
			
			-- RoleSettings
			SET @ViewDef = (
				SELECT DEFINITION
				FROM sys.sql_modules
				WHERE object_id = object_id('dbo.RoleSettings')
			)
		
			IF @ViewDef is null
				RETURN 

			SET @CREATE_LOC = CHARINDEX(N'CREATE',@ViewDef)
			SET @ViewDef = STUFF(@ViewDef,@CREATE_LOC,6,N'ALTER')
				
			EXEC (@ViewDef)
		END
END

GO


/* ------------------------------------------------------------------------ */
/* Update old Settings_Categories Entries with custom Lists                 */
/* ------------------------------------------------------------------------ */

UPDATE [dbo].[Settings_Categories]
	SET [ListID] = 1, [Type] = N'List'
	WHERE [Type] = N'YesNo'
	
GO

UPDATE [dbo].[Settings_Categories]
	SET [ListID] = 2, [Type] = N'List'
	WHERE [Type] = N'YesNoAll'
	
GO

UPDATE [dbo].[Settings_Categories]
	SET [ListID] = 3, [Type] = N'List'
	WHERE [Type] = N'TrueFalse'
	
GO

UPDATE [dbo].[Settings_Categories]
	SET [ListID] = 4, [Type] = N'List'
	WHERE [Type] = N'TimeZone'
	
GO

UPDATE [dbo].[Settings_Categories]
	SET [ListID] = 5, [Type] = N'List'
	WHERE [Type] = N'TimeZoneName'
	
GO