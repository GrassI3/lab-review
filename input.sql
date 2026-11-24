ALTER TABLE Members
ADD CONSTRAINT CHK_Age CHECK (Age >= 18);
Select from Members where age > 50;
