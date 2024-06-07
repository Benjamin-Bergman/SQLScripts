SET @vin = 4444;

SELECT d.* FROM dealerships d NATURAL JOIN inventory i WHERE i.vin = @vin;