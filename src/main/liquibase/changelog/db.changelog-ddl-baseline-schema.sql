--liquibase formatted sql

--changeset fcruz.coatli@gmail.com:baseline-ddl context:ddl
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = current_schema() AND table_name IN ('state', 'gender', 'person', 'address')

--
-- PostgreSQL database dump
--


-- Dumped from database version 17.10 (Debian 17.10-1.pgdg13+1)
-- Dumped by pg_dump version 17.10 (Debian 17.10-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_table_access_method = heap;

--
-- Name: address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.address (
    id uuid NOT NULL,
    person_id uuid NOT NULL,
    street character varying(200) NOT NULL,
    state_id smallint NOT NULL,
    zip_code character(5) NOT NULL,
    CONSTRAINT ck_address_zip_code CHECK ((zip_code ~ '^[0-9]{5}$'::text))
);


--
-- Name: gender; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gender (
    id smallint NOT NULL,
    code character varying(1) NOT NULL,
    description character varying(50) NOT NULL
);


--
-- Name: person; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.person (
    id uuid NOT NULL,
    name character varying(200) NOT NULL,
    age smallint NOT NULL,
    gender_id smallint NOT NULL,
    CONSTRAINT ck_person_age CHECK ((age >= 0))
);


--
-- Name: state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.state (
    id smallint NOT NULL,
    code character varying(5) NOT NULL,
    description character varying(100) NOT NULL
);


--
-- Name: address pk_address; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT pk_address PRIMARY KEY (id);


--
-- Name: gender pk_gender; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gender
    ADD CONSTRAINT pk_gender PRIMARY KEY (id);


--
-- Name: person pk_person; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT pk_person PRIMARY KEY (id);


--
-- Name: state pk_state; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT pk_state PRIMARY KEY (id);


--
-- Name: gender uk_gender_code; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gender
    ADD CONSTRAINT uk_gender_code UNIQUE (code);


--
-- Name: gender uk_gender_description; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gender
    ADD CONSTRAINT uk_gender_description UNIQUE (description);


--
-- Name: state uk_state_code; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT uk_state_code UNIQUE (code);


--
-- Name: state uk_state_description; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT uk_state_description UNIQUE (description);


--
-- Name: ix_address_person_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_address_person_id ON public.address USING btree (person_id);


--
-- Name: ix_address_state_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_address_state_id ON public.address USING btree (state_id);


--
-- Name: ix_person_gender_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_person_gender_id ON public.person USING btree (gender_id);


--
-- Name: address fk_address_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT fk_address_person FOREIGN KEY (person_id) REFERENCES public.person(id) ON DELETE CASCADE;


--
-- Name: address fk_address_state; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT fk_address_state FOREIGN KEY (state_id) REFERENCES public.state(id);


--
-- Name: person fk_person_gender; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT fk_person_gender FOREIGN KEY (gender_id) REFERENCES public.gender(id);


--
-- PostgreSQL database dump complete
--


--rollback DROP TABLE public.address;
--rollback DROP TABLE public.person;
--rollback DROP TABLE public.gender;
--rollback DROP TABLE public.state;
