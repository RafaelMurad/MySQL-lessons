USE mydb;

DROP TABLE profiles;
DROP TABLE orders;
DROP TABLE people;

/*   creates a people table   */
CREATE TABLE people (
    id INTEGER AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    PRIMARY KEY (id)
);

/*  creates a orders table  */
CREATE TABLE orders (
    id INTEGER AUTO_INCREMENT,
    amount DECIMAL(16 , 2 ) NOT NULL,
    person_id INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (person_id)
        REFERENCES people (id),
    CHECK (amount > 0)
);

/* creates a profiles table   */
CREATE TABLE profiles (
    id INTEGER AUTO_INCREMENT,
    person_id INT,
    address TEXT,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (person_id)
        REFERENCES people (id)
);

/*  add a new person to the people table   */
INSERT INTO mydb.people(
	first_name,
    last_name,
    DOB
) VALUES (
	'Rafael',
    'Murad',
    str_to_date('26-10-1993', '%d-%m-%Y')
);
	
/*  adds our new person to our profile table   */
INSERT INTO mydb.profiles (
	person_id,
    address
) VALUES (
	1,
    '7 strathaven roead'
);

/* creates 5 orders using a single insert command   */
INSERT INTO mydb.orders (
	amount,
    person_id
) VALUES
	(5.99, 1),
    (10.55, 1),
    (111.45, 1),
    (1.45, 1),
    (10.02, 1);
    

    
    
