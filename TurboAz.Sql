CREATE DATABASE TURBOAZ

USE TURBOAZ


CREATE TABLE Markas(
Id int identity primary key,
MarkaName nvarchar(20)
)
INSERT INTO Markas(MarkaName) VALUES ('Mercedes')

CREATE TABLE Model(
Id int identity primary key,
ModelName nvarchar(20),
MarkaId int references Markas(Id) 
)
INSERT INTO Model (ModelName,MarkaId) VALUES ('E300',1)

CREATE TABLE AttemptsOfOwner(
Id int identity primary key,
Attempts nvarchar(20)

)

INSERT INTO AttemptsOfOwner(Attempts) VALUES ('Birinci Defe')

CREATE TABLE TypeOfFuel(
Id int identity primary key,
FuelName nvarchar(20)
)
INSERT INTO TypeOfFuel (FuelName) VALUES ('Benzin')


CREATE TABLE Color(
Id int identity primary key,
ColorName nvarchar(20)
)
INSERT INTO Color (ColorName) VALUES ('BLACK')


CREATE TABLE TypeOfBan(
Id int identity primary key,
BanName nvarchar(20)
)
INSERT INTO TypeOfBan (BanName) VALUES ('SEDAN')


CREATE TABLE Years(
Id int identity primary key,
Years nvarchar(20)
)
INSERT INTO Years (Years) VALUES ('2023')

CREATE TABLE SpeedBox(
Id int identity primary key,
BoxName nvarchar(20)
)

INSERT INTO SpeedBox (BoxName) VALUES ('Automat')

CREATE TABLE EngineSize(
Id int identity primary key,
EngineV int
)

INSERT INTO EngineSize (EngineV) VALUES (1400)

CREATE TABLE EnginePower(
Id int identity primary key,
PowerAG int
)

INSERT INTO EnginePower (PowerAG) VALUES (6300)


CREATE TABLE MarketOwner(
Id int identity primary key,
CountryName nvarchar(20)
)

INSERT INTO MarketOwner (CountryName) VALUES ('Germany')


CREATE TABLE Contact(
Id int identity primary key,
Name nvarchar(20),
Country nvarchar(20),
PhoneNumber nvarchar(20)
)
INSERT INTO Contact (Name,Country,PhoneNumber) VALUES ('Murad','Azerbaycan','055-777-77-77')

CREATE TABLE Gear(
Id int identity primary key,
GearName nvarchar(20)
)
INSERT INTO Gear (GearName) VALUES ('ALL')

CREATE TABLE Photos(
Id int identity primary key, 
Urls nvarchar(80)
)
INSERT INTO Photos (Urls) VALUES ('https:merc.e300')

CREATE TABLE Announcement(
Id int identity primary key,
March nvarchar(5),
HasStroke  nvarchar(10),
IsColored  nvarchar(10),
AccidentSpareParts nvarchar(10),
NumberOfSeats int,
VINKOD int unique,
Descriptions nvarchar(50),
Credit nvarchar(10),
Barter nvarchar(10),
Currency nvarchar(10),


 MarkaSSId int references Markas(Id),
 ModelId int references Model(Id),
 AttemptsOfOwnerId int references  AttemptsOfOwner(Id),
 TypeOfFuelId int references TypeOfFuel(Id),
 ColorId int references Color(Id),
 TypeOfBanId int references TypeOfBan(Id),
 YearsId int references Years(Id),
 SpeedBoxId int references SpeedBox(Id),
 EngineSizeId int references EngineSize(Id),
 EnginePowerId int references EnginePower(Id),
 MarketOwnerId int references MarketOwner(Id),
 ContactId int references Contact(Id),
 GearId int references Gear(Id),
 PhotosId int references Photos(Id)
)
INSERT INTO Announcement(March,HasStroke,IsColored,AccidentSpareParts,NumberOfSeats,VINKOD,Descriptions,Credit,Barter,Currency,
MarkaSSId,ModelId,AttemptsOfOwnerId,TypeOfBanId,TypeOfFuelId,ColorId,YearsId,SpeedBoxId,EngineSizeId,EnginePowerId,MarketOwnerId,ContactId,GearId,PhotosId)
VALUES ('KM','NO','NO','NO',5,211011,'EXCELLENT','NO','YES','USD',1,1,1,1,1,1,1,1,1,1,1,1,1,1)





SELECT  MarkaName,ModelName,Attempts,FuelName,ColorName,BanName,Years,BoxName,EngineV,PowerAG,CountryName,
March,HasStroke,IsColored,AccidentSpareParts,NumberOfSeats,VINKOD,Descriptions,Credit,Barter,Currency, Name,Country,PhoneNumber,Urls

FROM Announcement
JOIN Markas
ON
Announcement.MarkaSSId=Markas.Id


JOIN Model
on
Announcement.ModelId=Model.Id
JOIN AttemptsOfOwner
ON 
Announcement.AttemptsOfOwnerId=AttemptsOfOwner.Id
JOIN TypeOfFuel
ON
Announcement.TypeOfFuelId=TypeOfFuel.Id
JOIN Color
ON
Announcement.ColorId=Color.Id
JOIN TypeOfBan
ON
Announcement.TypeOfBanId=TypeOfBan.Id
JOIN Years
ON
Announcement.YearsId=Years.Id
JOIN SpeedBox
ON
Announcement.SpeedBoxId=SpeedBox.Id
JOIN EngineSize
ON
Announcement.EngineSizeId=EngineSize.Id
JOIN EnginePower
ON
Announcement.EnginePowerId=EnginePower.Id
JOIN  MarketOwner
ON
Announcement.MarketOwnerId=MarketOwner.Id
JOIN  Gear
ON
Announcement.GearId=Gear.Id
JOIN Contact
ON 
Announcement.ContactId=Contact.Id
JOIN Photos
ON
Announcement.PhotosId=Photos.Id


