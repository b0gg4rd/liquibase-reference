--liquibase formatted sql

--changeset fcruz.coatli@gmail.com:create-table-address context:ddl
CREATE TABLE address (
  id UUID NOT NULL,
  person_id UUID NOT NULL,
  street VARCHAR(200) NOT NULL,
  state_id SMALLINT NOT NULL,
  zip_code CHAR(5) NOT NULL,
  CONSTRAINT pk_address PRIMARY KEY (id),
  CONSTRAINT fk_address_person FOREIGN KEY (person_id) REFERENCES person (id) ON DELETE CASCADE,
  CONSTRAINT fk_address_state FOREIGN KEY (state_id) REFERENCES state (id),
  CONSTRAINT ck_address_zip_code CHECK (zip_code ~ '^[0-9]{5}$')
);
CREATE INDEX ix_address_person_id ON address (person_id);
CREATE INDEX ix_address_state_id ON address (state_id);
--rollback DROP TABLE address;
