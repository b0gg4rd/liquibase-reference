--liquibase formatted sql

--changeset fcruz.coatli@gmail.com:load-contact-type context:dml
INSERT INTO contact_type (id, code, description) VALUES
  (1, 'PHONE',  'Teléfono fijo'),
  (2, 'MOBILE', 'Teléfono móvil'),
  (3, 'EMAIL',  'Correo electrónico');
--rollback DELETE FROM contact_type;
