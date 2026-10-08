--liquibase formatted sql

--changeset fcruz.coatli@gmail.com:create-table-person context:ddl
CREATE TABLE person (
  id UUID NOT NULL,
  name VARCHAR(200) NOT NULL,
  age SMALLINT NOT NULL,
  gender_id SMALLINT NOT NULL,
  CONSTRAINT pk_person PRIMARY KEY (id),
  CONSTRAINT fk_person_gender FOREIGN KEY (gender_id) REFERENCES gender (id),
  CONSTRAINT ck_person_age CHECK (age >= 0)
);
CREATE INDEX ix_person_gender_id ON person (gender_id);
--rollback DROP TABLE person;
