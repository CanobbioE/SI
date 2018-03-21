DROP TABLE IF EXISTS Tutors;
DROP TABLE IF EXISTS Membri;
DROP TABLE IF EXISTS Studenti;
DROP TABLE IF EXISTS Docenti;
DROP TABLE IF EXISTS Progetti;
DROP TABLE IF EXISTS Fondi;
DROP TABLE IF EXISTS Teams;
DROP TABLE IF EXISTS Borse;
DROP TABLE IF EXISTS Borsisti;
DROP TABLE IF EXISTS Missioni;


CREATE TABLE Membri (
	Matricola 	SERIAL 		NOT NULL,
	Nome 		VARCHAR(20) NOT NULL,
	Cognome		VARCHAR(20) NOT NULL,
	PRIMARY KEY (Matricola)
);

CREATE TABLE Studenti (
	Matricola INT 	NOT NULL,
	PRIMARY KEY (Matricola),
	FOREIGN KEY (Matricola) REFERENCES Membri(Matricola)
);

CREATE TABLE Docenti (
	Matricola 	INT 		NOT NULL,
	Ruolo 		VARCHAR(20) NOT NULL,
	PRIMARY KEY (Matricola),
	FOREIGN KEY (Matricola) REFERENCES Membri(Matricola)
);

CREATE TABLE Progetti (
	ProgettoID 				SERIAL 		NOT NULL,
	Finanziatore 			VARCHAR(20),
	DataInizio				DATE 		NOT NULL,
	DataFine				DATE 		NOT NULL,
	MatricolaResponsabile 	INT			NOT NULL,
	PRIMARY KEY (ProgettoID),
	FOREIGN KEY (MatricolaResponsabile) REFERENCES Docenti(Matricola)
);

CREATE TABLE Fondi (
	ProgettoID 	INT 	NOT NULL,
	Capacità 	DECIMAL,
	NomeFondo 	VARCHAR(20),
	PRIMARY KEY (ProgettoID),
	FOREIGN KEY (ProgettoID) REFERENCES Progetti(ProgettoID)
);

CREATE TABLE Teams (
	ProgettoID INT NOT NULL,
	Matricola INT NOT NULL,
	FOREIGN KEY (ProgettoID) REFERENCES Progetti(ProgettoID),
	FOREIGN KEY (Matricola) REFERENCES Membri(Matricola),
	PRIMARY KEY (ProgettoID)
);

CREATE TABLE Borse (
	BorsaID 	SERIAL 	NOT NULL,
	DataInizio 	DATE 	NOT NULL,
	DataFine	DATE 	NOT NULL,
	ProgettoID 	INT 	NOT NULL,
	PRIMARY KEY (BorsaID),
	FOREIGN KEY (ProgettoID) REFERENCES Progetti(ProgettoID)
);

CREATE TABLE Borsisti (
	Matricola 	INT 	NOT NULL,
	BorsaID 	INT 	NOT NULL,
	PRIMARY KEY (Matricola),
	FOREIGN KEY (Matricola) REFERENCES Studenti(Matricola),
	FOREIGN KEY (BorsaID) REFERENCES Borse(BorsaID)

);

CREATE TABLE Missioni (
	MatricolaRichiedente 	INT 		NOT NULL,
	ProgettoID 				INT 		NOT NULL,
	Città 					VARCHAR(20),
	Stato 					VARCHAR(20),
	DataPartenza 			DATE 		NOT NULL,
	DataRitorno 			DATE 		NOT NULL,
	Spesa 					DECIMAL,
	PRIMARY KEY (MatricolaRichiedente, ProgettoID),
	FOREIGN KEY (MatricolaRichiedente) REFERENCES Membri(Matricola),
	FOREIGN KEY (ProgettoID) REFERENCES Progetti(ProgettoID)
);

CREATE TABLE Tutors (
	MatricolaStudente INT 	NOT NULL,
	MatricolaDocente INT 	NOT NULL,
	PRIMARY KEY (MatricolaStudente, MatricolaDocente),
	FOREIGN KEY (MatricolaStudente) REFERENCES Studenti(Matricola),
	FOREIGN KEY (MatricolaDocente) REFERENCES Docenti(Matricola)
);