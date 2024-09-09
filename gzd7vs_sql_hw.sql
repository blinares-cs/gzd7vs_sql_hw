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
