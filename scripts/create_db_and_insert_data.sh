psql -d postgres -c "CREATE DATABASE my_customers;"

psql -d my_customers <<'SQL'
CREATE TABLE IF NOT EXISTS customers (
  id                integer PRIMARY KEY,
  customer_id       text NOT NULL,
  first_name        text NOT NULL,
  last_name         text NOT NULL,
  company           text,
  city              text,
  country           text,
  phone1            text,
  phone2            text,
  email             text,
  subscription_date date,
  website           text
);

INSERT INTO customers
  (id, customer_id, first_name, last_name, company, city, country, phone1, phone2, email, subscription_date, website)
VALUES
  (1,'DD37Cf93aecA6Dc','Sheryl','Baxter','Rasmussen Group','East Leonard','Chile','229.077.5154','397.884.0519x718','zunigavanessa@smith.info','2020-08-24','http://www.stephenson.com/'),
  (2,'1Ef7b82A4CAAD10','Preston','Lozano, Dr','Vega-Gentry','East Jimmychester','Djibouti','5153435776','686-620-1820x944','vmata@colon.com','2021-04-23','http://www.hobbs.com/'),
  (3,'6F94879bDAfE5a6','Roy','Berry','Murillo-Perry','Isabeloborough','Antigua and Barbuda','+1-539-402-0259','(496)978-3968x58947','beckycarr@hogan.com','2020-03-25','http://www.lawrence.com/'),
  (4,'5cfe8B1FA46e5e3c','Linda','Olsen','Dominguez, Mcmillan and Donovan','Bensonview','Dominican Republic','001-808-617-6467x12895','+1-813-324-8756','stanleyblackwell@benson.org','2020-06-02','http://www.good-lyons.com/'),
  (5,'053d585Ab6b3159','Joanna','Bender','Martin, Lang and Andrade','West Priscilla','Slovakia (Slovak Republic)','001-234-203-0635x76146','001-199-446-3860x3486','colinalvarado@miles.net','2021-04-17','https://goodwin-ingram.com/');
SQL