SQL> CREATE TABLE laptop(
  2  code NUMBER(6) NOT NULL,
  3  model VARCHAR(20) NOT NULL,
  4  speed NUMBER(4) NOT NULL,
  5  ram NUMBER(4) NOT NULL,
  6  price NUMBER(4,4) NOT NULL,
  7  SCREEN NUMBER(2) NOT NULL
  8  );
/*
Table created.
*/
SQL> CREATE TABLE pc (
  2  code NUMBER(6) NOT NULL,
  3  model VARCHAR(20) NOT NULL,
  4  speed NUMBER(4) NOT NULL,
  5  ram NUMBER(4) NOT NULL,
  6  hd NUMBER(4,4) NOT NULL,
  7  cd VARCHAR(10) NOT NULL,
  8  price NUMBER(4,
  9  4) NOT NULL
 10  );
/*
Table created.
*/
SQL> CREATE TABLE product(
  2  maker VARCHAR(10) NOT NULL,
  3  model VARCHAR(20) NOT NULL,
  4  type VARCHAR(50) NOT NULL
  5  );
/*
Table created.
*/
SQL> CREATE TABLE PRINTER(
  2  code NUMBER(6) NOT NULL,
  3  model VARCHAR(20) NOT NULL,
  4  color VARCHAR(1) NOT NULL,
  5  price NUMBER(4,4) NOT NULL
  6  );
/*
Table created.
*/
SQL> ALTER TABLE laptop ADD CONSTRAINT pk_laptop PRIMARY KEY(code);
/*
Table altered.
*/
SQL> ALTER TABLE printer ADD CONSTRAINT pk_printer PRIMARY KEY(code);
/*
Table altered.
*/
SQL> ALTER TABLE pc ADD CONSTRAINT pk_pc PRIMARY KEY(code);
/*
Table altered.
*/
SQL> ALTER TABLE product ADD CONSTRAINT product_pc PRIMARY KEY(model);
/*
Table altered.
*/
SQL> ALTER TABLE laptop ADD CONSTRAINT fk_laptop_prod FOREIGN KEY(model) REFERENCES product(model);
/*
Table altered.
*/
SQL> ALTER TABLE pc ADD CONSTRAINT pc_laptop_prod FOREIGN KEY(model) REFERENCES product(model);
/*
Table altered.
*/
SQL> ALTER TABLE printer ADD CONSTRAINT printer_laptop_prod FOREIGN KEY(model) REFERENCES product(model);
/*
Table altered.
*/

