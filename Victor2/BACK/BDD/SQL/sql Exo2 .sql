CREATE DATABASE hotel_exercice2
go

Use hotel_exercice2
go

create table station (
num_station int identity primary key, // contrainte
nom_station varchar (30)
)
go

create table hotel (
num_hotel int identity primary key, // contrainte
nom_hotel varchar (30) NOT NULL,
adresse_hotel varchar (100),
categorie_hotel varchar (30),
capacite_hotel int,
num_station int references station(num_station)
)
go
 
create table chambre (
num_chambre int identity primary key, // contrainte
type_chambre varchar (15),
confort_chambre varchar (30),
capacite_chambre int,
exposition_chambre varchar (10),
num_hotel int references hotel(num_hotel)
)
go 

CREATE table client (
num_client int identity primary key, // contrainte
nom_client varchar (30) NOT NULL,
prenom_client varchar (30) NOT NULL,
adresse_client varchar (100)
)
go

create table reservation (
num_chambre int references chambre(num_chambre), // contrainte
num_client int references client(num_client), // contrainte
date_debut date NOT NULL,
date_fin date NOT NULL,
date_reservation date NOT NULL,
prix_total money not null,
montant_reservation money not null,
primary key (num_chambre, num_client) // contrainte
)
go