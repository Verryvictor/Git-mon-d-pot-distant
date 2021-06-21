/* Exercice 1 -- */

CREATE DATABASE hotel;
USE hotel;
CREATE TABLE station (
    num_station INT PRIMARY KEY NOT NULL,
    nom_station VARCHAR (50)
);

CREATE TABLE hotel (
    capacite_hotel INT,
    categorie_hotel VARCHAR(50),
    nom_hotel VARCHAR(50),
    adresse_hotel VARCHAR(50),
    num_hotel INT PRIMARY KEY NOT NULL,
    num_station INT,
    FOREIGN KEY (num_station) REFERENCES station(num_station) 
);

CREATE TABLE chambre(
    capacite_chambre INT,
    degre_confort INT,
    exposition VARCHAR(50),
    type_chambre VARCHAR(50),
    num_chambre INT PRIMARY KEY NOT NULL,
    num_hotel INT,
    FOREIGN KEY (num_hotel) REFERENCES hotel(num_hotel) 
    
    
);
CREATE TABLE Client(
    adresse_client VARCHAR(50),
    nom_client VARCHAR(50),
    prenom_client VARCHAR(50),
    num_client  INT PRIMARY KEY NOT NULL
);
CREATE TABLE Reservation(
    num_chambre INT,
    num_client INT,
    date_debut INT,
    date_fin INT,
    date_reservation INT,
    montant_arrhes INT,
    prix_total INT,
    FOREIGN KEY (num_chambre) REFERENCES chambre(num_chambre),
    FOREIGN KEY (num_client) REFERENCES client(num_client)
);


