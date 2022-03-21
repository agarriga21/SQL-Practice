Select ABS(-124*54);	#Returns the absolute value of a number 
#E
Select CEIL(49.543);	#Returns the smallest integer value greater than or equal to the input number (n).
#E
Select FLOOR(56.564);	#Returns the largest integer value not greater than the argument
#E
Select MOD(391,4);	#Returns the remainder of a number divided by another
#E
Select ROUND(3.4953,2);	#Rounds a number to a specified number of decimal places.
#E
Select TRUNCATE(PI(),3);	#Truncates a number to a specified number of decimal places
#E
Select ACOS(.7);	#Returns the arc cosine of n or null if n is not in the range -1 and 1.
#M
Select ASIN(.12);	#Returns the arcsine of n which is the value whose sine is n. It returns null if n is not in the range -1 to 1.
#M
Select ATAN(.45);	#Returns the arctangent of n.
#M
Select ATAN2(1,3);	#Returns the arctangent of the two variables n and m
#M
Select CONV(n,from_base,to_base);	#Converts a number between different number bases
#H
Select COS(5);	#Returns the cosine of n, where n is in radians
#E
Select COT(4);	#Returns the cotangent of n.
#E
Select CRC32(12);	#Computes a cyclic redundancy check value and returns a 32-bit unsigned value
#H
Select DEGREES(.5);	#Converts radians to degrees of the argument n
#E
Select EXP(3);	#Raises to the power of e raised to the power of n
#M
Select LN(EXP(3));	#Returns the natural logarithm of n
#M
Select LOG(4,16);	#Returns the natural logarithm of the first argument
#E
Select LOG10(1000);	#Returns the base-10 logarithm of the argument
#E
Select LOG2(16);	#Returns the base-2 logarithm of the argument
#E
Select PI();	#Returns the value of PI
#E
Select POW(2,4);	#Returns the argument raised to the specified power
#E
Select POWER(10,3);	 #Returns the argument raised to the specified power
#E
Select RADIANS(180);	#Returns argument converted to radians
#M
Select RAND();	#Returns a random floating-point value
#E
Select SIGN(-56);	#Returns the sign of n that can be -1, 0, or 1 depending on whether n is negative, zero, or positive.
#E
Select SIN(21);	#Returns the sine of n
#E

Select SQRT(16);	#Returns the square root of n
#E
Select TAN(2);	#Returns the tangent of n
#E

DELIMITER $$

CREATE FUNCTION Circumference(
	Diameter double
) 
RETURNS double
DETERMINISTIC
BEGIN
    DECLARE circumference double;

    IF Diameter > 0 THEN
		SET circumference = PI()*Diameter;
    ELSE
        SET circumference = 0;
    END IF;
	
	RETURN (circumference);
END$$
DELIMITER ;

SHOW FUNCTION STATUS 
WHERE db = 'database_sample';

Select Circumference(2);
Select Circumference(5);
Select Circumference(10);
Select Circumference(-10);
drop function ShapeArea;
DELIMITER $$

Create FUNCTION ShapeArea(
	Shape varchar(20),
    length double,
    width double,
    otherline double
) 
RETURNS double
DETERMINISTIC
BEGIN
    DECLARE area double;
	
    IF Shape = "Circle" or "circle" and length >0  THEN
		SET area = PI()*length;
    ELSEIF Shape = "Square" or "square" and length >0 THEN
        SET area = POW(length,2);
	ELSEIF Shape = "Rectangle" or "rectangle" and length >0 and width >0 THEN
        SET area = length*width;
	ELSEIF Shape = "Triangle" or "triangle" and length >0 and width >0 THEN
        SET area = .5*(length)*width;
	ELSEIF Shape = "Trapezoid" or "trapezoid" and length >0 and width >0 and otherline >0 THEN
        SET area = .5*(length+width)*otherline;
	Else
    SET area = null;
    END IF;
	
	RETURN (area);
END$$
DELIMITER ;

Select ShapeArea("Circle",1.5,null,null);
Select ShapeArea("Square",3,null,null);
Select ShapeArea("rectangle",2,10,null);
Select ShapeArea("triangle",3,5,null);
Select ShapeArea("trapezoid",2,5,3);
Select ShapeArea("invalid shape",1,null,null);
Select ShapeArea("Square",-13,null,null);
Select ShapeArea("Square",3,null,null)-ShapeArea("Circle",1.5,null,null);