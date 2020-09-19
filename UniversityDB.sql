CREATE TABLE STUDENT (
    StdSSN INT,
    StdFName VARCHAR(10),
    stdLName VARCHAR(10),
    StdCity VARCHAR(10),
    StdState VARCHAR(2),
    StdZip VARCHAR(10),
    StdMajor VARCHAR(10),
    StdYear VARCHAR(10),
    StdGPA DECIMAL(3 , 2 )
	
	PRIMARY KEY (StdSSN)
);

CREATE TABLE FACULTY (
    FacSSN INT,
    FacFName VARCHAR(10),
    FacLName VARCHAR(10),
    FacCity VARCHAR(10),
    FacState VARCHAR(2),
    FacZip VARCHAR(10),
    FacStartDate DATE,
    FacDept VARCHAR(10),
    FacRank VARCHAR(10),
    FacSalary INT,
    FacSupervisor INT

	PRIMARY KEY (FacSSN),
    CONSTRAINT FK_FacSupervisor_FACULTY FOREIGN KEY (FacSupervisor)
        REFERENCES FACULTY (FacSSN)
    
);

CREATE TABLE OFFERING (
    OfferNo INT,
    CourseNo VARCHAR(10),
    OfferTerm VARCHAR(10),
    OfferYear INT,
    OfferLocation VARCHAR(10),
    OfferTime TIME,
    OfferDays VARCHAR(10),
    FacSSN INT

	 PRIMARY KEY (OfferNo),
    FOREIGN KEY (CourseNo)
        REFERENCES COURSE (CourseNo),
    FOREIGN KEY (FacSSN)
        REFERENCES FACULTY (FacSSN)
);

CREATE TABLE COURSE (
    CourseNo VARCHAR(10),
    CourseDescription VARCHAR(30),
    CourseCredit INT

	    PRIMARY KEY (CourseNo)

);



CREATE TABLE ENROLLMENT (
    OfferNo INT ,
    StdSSN INT ,
    Grade DECIMAL(3 , 2 )

	FOREIGN KEY (OfferNo)
        REFERENCES OFFERING (OfferNo),
    FOREIGN KEY (StdSSN)
        REFERENCES STUDENT (StdSSN)
);


INSERT INTO STUDENT
	VALUES(123456791, 'Hanes','Wilson','Savon','OK','68123-1113','IT','Freshman',3.10),
	(124567892, 'Blake','Nuke','Burwick','OK','68023-2123','FIL','Junior',2.80),
	(234567892, 'Claire','Keller','Thomasvile','OK','69044-3323','ART','Junior',3.60),
	(345678903, 'Wayne','Keller','Savon','OK','68125-1143','IT','Senior',2.90),
	(456789014,'Josh', 'Eckart', 'Savon', 'OK', '68123-2335', 'FIL', 'Senior', 3.30),
	(567890125, 'Maggie', 'Diamond', 'Savon', 'OK', '68116-0023', 'IT', 'Junior',3.70),
	(678901236, 'Tammy', 'Diamond', 'Richmond', 'OK', '68118-2346', 'ART', 'Sophomore',3.40),
	(789012347, 'Richard', 'Moore', 'Savon', 'OK', '68123-2214', 'FIL', 'Junior', 2.60),
	(876543212, 'Chris', 'Coleman', 'Savon', 'OK', '68116-1334', 'IT', 'Senior', 4.00),
	(890123458, 'Lance', 'Brave', 'Savon', 'OK', '98118-0023', 'IT', 'Senior', 2.30),
	(901234569, 'Winston', 'Pale', 'Burwick', 'OK', '98115-1887', 'IT', 'Sophomore',3.90);

INSERT INTO FACULTY 
	VALUES(098765434, 'Liam','Victor','Savon','OK','681139923','10-Apr-08','MATH','ASST',65000,654321100),
	(543210989, 'Valerie','Edwards','Burwick','OK','680132244','15-Apr-09','MATH','PROF',150000, null),
	(654321100, 'Liam','Fuller','Savon','OK','681230096','1-May-07','MATH','ASSOC',100000,543210989),
	(765432111, 'Nicole', 'Marson', 'Birmingham', 'OK', 680179947, '11-Apr-10', 'FIL', 'PROF',95000, null),
	(876543212,' Chris', 'Coleman', 'Savon', 'OK', 681161334, '1-Mar-12', 'MATH', 'ASST', 70000, 654321100),
	(987654323, 'Jane', 'Miller', 'Savon', 'OK', 681169956, '15-Mar-13', 'FIL', 'ASSOC', 105000, 765432111);


INSERT INTO COURSE
	VALUES('FIL310','Introduction to Philology',3),
	('FIL460', 'Ancient Greek', 3),
	('FIL490', 'Latin Literature', 3),
	('IT330','Data Structures',3),
	('IT470','Algorithmic Analysis',3),
	('IT480','Software Engineering',3),
	('IT490', 'Object Oriented Design', 3);

INSERT INTO OFFERING
	VALUES(1121,'IT330','Sum',2013, 'AMPH312','11:30AM', 'MW', null ),
	(1244,'IT330','Fall',2012,'AMPH312','11:30AM','MW',098765434),
	(2232,'IT470','Sum',2012, 'AMPH422','2:30PM', 'TR', null ),
	(3343,'IT330','Spr',2013,'AMPH224', '9:30AM','MW',098765434),
	(4331,'IT330','Fall',2012,'AMPH224', '4:30PM','TR',098765434),
	(4454,'IT330','Win',2013,'AMPH312','4:30PM','TR',543210989),
	(5565,'FIL310','Win',2013,'AMPH217','9:30AM','MW',765432111),
	(5688,'IT490','Win',2013,'AMPH312','11:30AM','MW',987654323),
	(5689,'IT490','Spr',2013,'AMPH422','4:30PM','TR', 876543212),
	(6676,'FIL460','Win',2013,'AMPH222','11:30AM','TR',987654323),
	(7787,'FIL490','Spr',2013,'AMPH315','2:30PM','MW',765432111),
	(8898,'IT330','Sum',2013,'AMPH415', '2:30PM','MW',654321100),
	(9886,'IT470','Spr',2013,'AMPH317', '2:30PM','TR',654321100);


INSERT INTO ENROLLMENT
	VALUES(1244, 123456791, 3.30),
	(1244, 234567892, 3.70),
	(1244, 345678903, 3.30),
	(1244, 456789014, 3.20),
	(1244, 567890125, 3.90),
	(1244, 678901236, 3.50),
	(4331, 123456791, 3.60),
	(4331, 124567892, 3.30),
	(4331, 789012347, 3.60),
	(4331, 876543212, 3.20),
	(4331, 890123458, 3.50),
	(4331, 901234569, 3.20),
	(5565, 123456791, 3.30),
	(5565, 124567892, 2.80),
	(5688, 123456791, 3.30),
	(5688, 234567892, 2.90),
	(5688, 345678903, 3.40),
	(5688, 456789014, 3.50),
	(5688, 567890125, 2.70),
	(5689, 123456791, 2.10),
	(5689, 124567892, 3.80),
	(5689, 678901236, 3.40),
	(5689, 789012347, 3.90),
	(5689, 890123458, 3.00),
	(5689, 901234569, 3.20),
	(6676, 234567892, 3.20),
	(6676, 567890125, 3.70),
	(7787, 876543212, 3.50),
	(7787, 890123458, 3.80),
	(7787, 901234569, 3.50),
	(9886, 124567892, 3.60),
	(9886, 234567892, 3.30),
	(9886, 345678903, 3.30),
	(9886, 456789014, 3.50),
	(9886, 567890125, 2.70),
	(9886, 678901236, 3.40),
	(9886, 901234569, 4.00);

SELECT 
    *
FROM
    STUDENT;
SELECT 
    *
FROM
    FACULTY;
SELECT 
    *
FROM
    OFFERING;
SELECT 
    *
FROM
    COURSE;
SELECT 
    *
FROM
    ENROLLMENT;

