--liquibase formatted sql

--changeset fcruz.coatli@gmail.com:add-column-person-birth-date context:ddl
ALTER TABLE person ADD COLUMN birth_date DATE;
--rollback ALTER TABLE person DROP COLUMN birth_date;
