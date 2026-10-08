--liquibase formatted sql

--changeset fcruz.coatli@gmail.com:create-table-gender context:ddl
CREATE TABLE gender (
  id SMALLINT NOT NULL,
  code VARCHAR(1) NOT NULL,
  description VARCHAR(50) NOT NULL,
  CONSTRAINT pk_gender PRIMARY KEY (id),
  CONSTRAINT uk_gender_code UNIQUE (code),
  CONSTRAINT uk_gender_description UNIQUE (description)
);
--rollback DROP TABLE gender;
