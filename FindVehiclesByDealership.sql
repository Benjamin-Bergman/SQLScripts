SET @dealership = 1;

SELECT v.* FROM vehicles v NATURAL JOIN inventory i WHERE i.dealership_id = @dealership;