SET @make = "Ford";
SET @model = "C-Max";
SET @color = "Red";

SELECT d.* FROM dealerships d NATURAL JOIN inventory NATURAL JOIN vehicles v WHERE v.make = @make AND v.model = model AND v.color = color;