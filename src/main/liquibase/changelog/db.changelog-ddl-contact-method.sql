--liquibase formatted sql

--changeset fcruz.coatli@gmail.com:create-table-contact-method context:ddl
CREATE TABLE contact_method (
  id UUID NOT NULL,
  person_id UUID NOT NULL,
  contact_type_id SMALLINT NOT NULL,
  value VARCHAR(200) NOT NULL,
  is_primary BOOLEAN NOT NULL DEFAULT FALSE,
  CONSTRAINT pk_contact_method PRIMARY KEY (id),
  CONSTRAINT fk_contact_method_person FOREIGN KEY (person_id) REFERENCES person (id) ON DELETE CASCADE,
  CONSTRAINT fk_contact_method_contact_type FOREIGN KEY (contact_type_id) REFERENCES contact_type (id),
  CONSTRAINT uk_contact_method_person_type_value UNIQUE (person_id, contact_type_id, value)
);
CREATE INDEX ix_contact_method_person_id ON contact_method (person_id);
CREATE INDEX ix_contact_method_contact_type_id ON contact_method (contact_type_id);
-- A lo más un medio principal por persona y tipo
CREATE UNIQUE INDEX ux_contact_method_primary ON contact_method (person_id, contact_type_id) WHERE is_primary;
--rollback DROP TABLE contact_method;
