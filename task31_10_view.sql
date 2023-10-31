create database task31_10view

use task31_10view

create table Users(
id int primary key identity,
name varchar(25)not null,
surname varchar (30) default 'XXXX' ,
username varchar(20) not null unique,
password char(15) not null,
gender varchar(10) )

create table Artist (
id int primary key identity,
name varchar(25)not null,
surname varchar (30) default 'XXXX' ,
birthday date ,
gender varchar(10) )

create table Categories (
id int primary key identity,
name varchar(25)not null )

create table Music (
id int primary key identity,
name varchar(25)not null,
duration int check(duration>0),
categoryId int references categories(id))

create table Playlist (
musicId int references music(id),
userId int references users(id) )

create table ArtistMusic (
artistId int references artist(id),
musicId int references music(id) )


insert users (name,surname,username,password,gender) values
('Samama','Quliyeva','cepissmom','cepis345','female' ),--cepis samamanin pisiyidi
('Sebuhi','Camalzade','gym4ever','protein888','male'),
('Zulfiyya','Qurbanova','catlover','masya558','female')--masya menim pisiyimdi


insert artist (name,surname,birthday,gender) values 
('Lana','Del Rey','21.06.1997','female'),
('Sevda','Elekberzade','04.07.1977','female'),
('Miri','Yusif','27.10.1977','male'),
('Elsad','Xose','01.01.1975','male')

insert categories(name) values 
('Alternative-Indi'),
('Pop'),
('Hip-Hop')

insert music (name,duration,categoryId) values 
('Summertime Sadness ' , 266,1),
('Ag Teyyare ' ,240,3),
('Bir sevgim var',234,2),
('Gel danis',292,2)

insert ArtistMusic (artistId,musicId) values
(1,1),(2,3),(3,2),(4,3),(4,4)

 


create view AppleMusic
as
select m.name as MahniAdi, m.Duration as MahnininDavamliligi, c.Name as Kategoriya, CONCAT(a.Name,' ',a.Surname) as Artist
from music as m


join categories as c 
on m.categoryId = c.Id

join ArtistMusic as am 
on m.Id = am.musicId

join artist as a 
on am.artistId = a.Id

select *from AppleMusic