#Part 1

#1.	List all countries in South America.
SELECT Name FROM country WHERE country.Continent = 'South America';

#2.	Find the population of 'Germany'.
SELECT Population FROM country WHERE country.Name = 'Germany';

#3.	Retrieve all cities in the country 'Japan'.
SELECT city.Name FROM city JOIN country ON city.CountryCode = country.Code WHERE country.Name = 'Japan';

#4.	Find the 3 most populated countries in the 'Africa' region.
SELECT Name, Population FROM country WHERE country.Continent = 'Africa' ORDER BY Population DESC LIMIT 3;

#5.	Retrieve the country and its life expectancy where the population is between 1 and 5 million.
SELECT Name, LifeExpectancy FROM country WHERE country.Population BETWEEN 1000000 AND 5000000;

#6.	List countries with an official language of 'French'.
SELECT country.Name FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';

#7.	Retrieve all album titles by the artist 'AC/DC'.
SELECT Album.Title FROM Album JOIN Artist ON Album.ArtistId = Artist.ArtistId WHERE Artist.Name = 'AC/DC';

#8. Find the name and email of customers located in 'Brazil'.
SELECT FirstName, LastName, Email FROM Customer WHERE Customer.Country = 'Brazil';

#9. List all playlists in the database.
SELECT Name FROM Playlist;

#10. Find the total number of tracks in the 'Rock' genre.
SELECT Genre.Name, COUNT(Track.TrackId) AS TotalTracks FROM Track JOIN Genre ON Track.GenreId = Genre.GenreId WHERE Genre.Name = 'Rock';

#11. List all employees who report to 'Nancy Edwards'.
SELECT FirstName, LastName FROM Employee WHERE ReportsTo = (SELECT EmployeeId FROM Employee WHERE FirstName = 'Nancy' AND LastName = 'Edwards');

#12. Calculate the total sales per customer by summing the total amount in invoices.
SELECT Customer.FirstName, Customer.LastName, SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity) AS TotalSpent FROM Customer JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId JOIN InvoiceLine ON Invoice.InvoiceId = InvoiceLine.InvoiceId GROUP BY Customer.CustomerId, Customer.FirstName, Customer.LastName;


#Part 2

#Example of Database creation (not done during project due to gzd7vs database created)
CREATE DATABASE UnitedRealtors


#Table Creation
CREATE TABLE HouseLocations (
    location_id INT,
    city VARCHAR(20),
    state VARCHAR(20),
    country VARCHAR(20),
    PRIMARY KEY (location_id)
);

CREATE TABLE HouseDescriptions (
    descriptions_id INT,
    location_id INT,
    description VARCHAR(50),
    price VARCHAR(20),
    num_bedrooms INT,
    num_bathrooms VARCHAR(20),
    PRIMARY KEY (descriptions_id),
    FOREIGN KEY (location_id) REFERENCES HouseLocations(location_id)
);

CREATE TABLE HouseSeekers (
    seekers_id INT,
   name VARCHAR(20),
    preferred_city VARCHAR(20),
    preferred_state VARCHAR(20),
    budget VARCHAR(20),
    PRIMARY KEY (seekers_id)
);

# Insert data
INSERT INTO HouseLocations (location_id,city, state, country) VALUES
(1,'Winchester', 'VA', 'USA'),
(2,'Richmond', 'VA', 'USA'),
(3,'Waco', 'TX', 'USA'),
(4,'Charlestown', 'WV', 'USA'),
(5,'Leesburg', 'VA', 'USA');

INSERT INTO HouseDescriptions (descriptions_id, location_id, description, price, num_bedrooms, num_bathrooms) VALUES
(1, 1, '4 room family home with a porch.', 250295.00, 4, 3.5),
(2, 2, '2 room condo with a patio.', 181900.00, 2, 2.5),
(3, 3, '3 room townhouse with a 2 car garage.', 220290.00, 3, 2.5),
(4, 4, '4 room cabin by the lake.', 301000.00, 4, 3.5),
(5, 5, '6 room lake house with ocean views.', 1202920.00, 6, 5.5);

INSERT INTO HouseSeekers (seekers_id, name, preferred_city, preferred_state, budget) VALUES
(1,'Carter Buck', 'Winchester', 'VA', 3002900.00),
(2,'Bianca Linares', 'Richmond', 'VA', 202940.00),
(3,'Andy Lopez', 'Waco', 'TX', 250200.00),
(4,'Chris Clarke', 'Charlestown', 'WV', 1500100.00),
(5,'Donald Johnson', 'Leesburg', 'VA', 8000190.00);


#Write Queries
SELECT description, price, num_bedrooms FROM HouseDescriptions WHERE  num_bathrooms = 2.5;

SELECT name, preferred_city, preferred_state, budget FROM HouseSeekers ORDER BY budget DESC;

SELECT description, price FROM HouseDescriptions WHERE price < 300000;


