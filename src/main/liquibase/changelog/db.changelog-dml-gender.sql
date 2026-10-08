--liquibase formatted sql

--changeset fcruz.coatli@gmail.com:load-gender context:dml
INSERT INTO gender (id, code, description) VALUES
  (1, 'M', 'Masculino'),
  (2, 'F', 'Femenino');
--rollback DELETE FROM gender;
