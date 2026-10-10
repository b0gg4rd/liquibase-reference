--liquibase formatted sql

--changeset fcruz.coatli@gmail.com:create-table-contact-type context:ddl
CREATE TABLE contact_type (
  id SMALLINT NOT NULL,
  code VARCHAR(10) NOT NULL,
  description VARCHAR(50) NOT NULL,
  CONSTRAINT pk_contact_type PRIMARY KEY (id),
  CONSTRAINT uk_contact_type_code UNIQUE (code),
  CONSTRAINT uk_contact_type_description UNIQUE (description)
);
--rollback DROP TABLE contact_type;
