CREATE DATABASE myresources;


CREATE TABLE Category (
  CategoryID INT PRIMARY KEY AUTO_INCREMENT,
  Nom VARCHAR(255)
);

CREATE TABLE Subcategory (
  SubcategoryID INT PRIMARY KEY AUTO_INCREMENT,
  Nom VARCHAR(255),
  CategoryID INT,
  FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE Projet (
  ProjectID INT PRIMARY KEY,
  Nom VARCHAR(255),
  Description VARCHAR(255),
  DateDebut DATE,
  DateFin DATE
);


CREATE TABLE Squad (
  SquadID INT PRIMARY KEY AUTO_INCREMENT,
  Nom VARCHAR(255),
  ProjectID INT,

  FOREIGN KEY (ProjectID) REFERENCES Projet(ProjectID)
);


CREATE TABLE Utilisateur (
  UserID INT PRIMARY KEY AUTO_INCREMENT,
  Nom VARCHAR(255),
  Email VARCHAR(255),
role VARCHAR(200) CHECK (role IN ('leader', 'admin', 'user'))
squadid int ,

  FOREIGN KEY (squadid) REFERENCES squad(squadid)
);



CREATE TABLE Ressource (
  ResourceID INT PRIMARY KEY AUTO_INCREMENT,
  Nom VARCHAR(255),
  SubcategoryID INT,
  ProjectID INT,
  FOREIGN KEY (SubcategoryID) REFERENCES Subcategory(SubcategoryID),
  FOREIGN KEY (ProjectID) REFERENCES Projet(ProjectID)
);





-- __________________________insert category ________________________



-- first we insert value into category

 insert INTO  category(Nom) VALUES ('front-end'),('back-end');

-- __________________________insert into subcategory________________________


 insert into subcategory(Nom,CategoryID) VALUES
 ('java script',1),
 ('css',1),
 ('html',1),
 ('mySQL',2),
 ('php',2);

-- __________________________insert into projet________________________


INSERT INTO projet VALUES
(1,'amazon','web ecomerce','2023-11-14','2023-12-20'),
(2,'scrum board','agile scrum','2023-10-14','2023-12-30');

-- __________________________insert into squad________________________

INSERT INTO Squad (Nom, ProjectID)
VALUES
  ( 'cell13', 1),
  ('nocoffee', 2);

-- __________________________insert into Utilisateur ________________________


INSERT INTO Utilisateur ( Nom, Email,role,SquadID)
VALUES
  ( 'John Doe', 'john.doe@example.com', 'leader',1),
  ( 'Jane Smith', 'jane.smith@example.com', 'user',1),
  ( 'Mark Johnson', 'mark.johnson@example.com', 'user',1),
  ( 'Emily Davis', 'emily.davis@example.com', 'user',1),
  ( 'youness', 'youness@example.com', 'leader',2),
  ( 'nabil Smith', 'nabil.smith@example.com','user' ,2),
  ( 'Mbark Johnson', 'mbark.johnson@example.com', 'user',2),
  ( 'latifa Davis', 'latifa.davis@example.com','user',2);




-- __________________________insert into Ressource ________________________





INSERT INTO Ressource (NOM, SubcategoryID, ProjectID)
VALUES
('w3school', 1, 1),
('w3school', 2, 1),
('localhost', 3,2);



________________________________________________


SELECT COUNT(*) FROM squad s INNER JOIN projet p ON  p.ProjectID=s.ProjectID 
INNER JOIN ressource r ON r.ResourceID=p.ProjectID 
INNER JOIN subcategory sub ON sub.SubcategoryID=r.SubcategoryID
INNER JOIN category cat ON sub.CategoryID=cat.CategoryID
GROUP BY(cat.Nom) 
 


--En tant que membre de squad, je veux voir la liste des projets pour lesquels mon squad est responsable pour comprendre les projets actuels et suivre les responsabilités.

-- --------------------- select all data from your database

 SELECT * FROM utilisateur u INNER JOIN squad s ON u.squadid=s.SquadID INNER JOIN projet p ON  p.ProjectID=s.ProjectID 
INNER JOIN ressource r ON r.ResourceID=p.ProjectID 
INNER JOIN subcategory sub ON sub.SubcategoryID=r.SubcategoryID
INNER JOIN category cat ON sub.CategoryID=cat.CategoryID
GROUP BY(s.SquadID)  -- remember this just for

-- En tant que développeur Fullstack, je veux pouvoir mettre à jour les détails d'un utilisateur, d'un squad, d'un projet ou d'une ressource existante pour ajuster les informations en fonction des évolutions.

-- update utilasateur table
  UPDATE utilisateur 
  SET utilisateur.Nom='dress' ,utilisateur.Email='dress@gmail.com'
 WHERE UserID=1;
 SELECT * FROM utilisateur
 WHERE USERid=1;
  -- update squad table
    UPDATE squad 
  SET squad.Nom='saynz'
 WHERE squad.SquadID=1;
 SELECT * FROM squad
  -- update project  table

 UPDATE projet 
SET projet.Nom='whorkout',projet.Description='fitnes'
WHERE projet.ProjectID=1;
SELECT *FROM projet



 




