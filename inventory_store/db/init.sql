CREATE DATABASE IF NOT EXISTS storedb;

USE storedb;

CREATE TABLE IF NOT EXISTS inventory (
  id INTEGER NOT NULL AUTO_INCREMENT,
  name  VARCHAR(300),
  quantity  INTEGER,
  PRIMARY KEY (id)
);
