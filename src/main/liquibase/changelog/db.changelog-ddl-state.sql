--liquibase formatted sql

--changeset fcruz.coatli@gmail.com:create-table-state context:ddl
CREATE TABLE state (
  id SMALLINT NOT NULL,
  code VARCHAR(5) NOT NULL,
  description VARCHAR(100) NOT NULL,
  CONSTRAINT pk_state PRIMARY KEY (id),
  CONSTRAINT uk_state_code UNIQUE (code),
  CONSTRAINT uk_state_description UNIQUE (description)
);
--rollback DROP TABLE state;
