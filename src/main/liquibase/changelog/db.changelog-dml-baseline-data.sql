--liquibase formatted sql

--changeset fcruz.coatli@gmail.com:baseline-dml context:dml
--preconditions onFail:MARK_RAN onError:HALT

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

--
-- Data for Name: gender; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.gender (id, code, description) VALUES (1, 'M', 'Masculino');
INSERT INTO public.gender (id, code, description) VALUES (2, 'F', 'Femenino');


--
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.state (id, code, description) VALUES (1, 'AGS', 'Aguascalientes');
INSERT INTO public.state (id, code, description) VALUES (2, 'BC', 'Baja California');
INSERT INTO public.state (id, code, description) VALUES (3, 'BCS', 'Baja California Sur');
INSERT INTO public.state (id, code, description) VALUES (4, 'CAMP', 'Campeche');
INSERT INTO public.state (id, code, description) VALUES (5, 'COAH', 'Coahuila de Zaragoza');
INSERT INTO public.state (id, code, description) VALUES (6, 'COL', 'Colima');
INSERT INTO public.state (id, code, description) VALUES (7, 'CHIS', 'Chiapas');
INSERT INTO public.state (id, code, description) VALUES (8, 'CHIH', 'Chihuahua');
INSERT INTO public.state (id, code, description) VALUES (9, 'CDMX', 'Ciudad de México');
INSERT INTO public.state (id, code, description) VALUES (10, 'DGO', 'Durango');
INSERT INTO public.state (id, code, description) VALUES (11, 'GTO', 'Guanajuato');
INSERT INTO public.state (id, code, description) VALUES (12, 'GRO', 'Guerrero');
INSERT INTO public.state (id, code, description) VALUES (13, 'HGO', 'Hidalgo');
INSERT INTO public.state (id, code, description) VALUES (14, 'JAL', 'Jalisco');
INSERT INTO public.state (id, code, description) VALUES (15, 'MEX', 'México');
INSERT INTO public.state (id, code, description) VALUES (16, 'MICH', 'Michoacán de Ocampo');
INSERT INTO public.state (id, code, description) VALUES (17, 'MOR', 'Morelos');
INSERT INTO public.state (id, code, description) VALUES (18, 'NAY', 'Nayarit');
INSERT INTO public.state (id, code, description) VALUES (19, 'NL', 'Nuevo León');
INSERT INTO public.state (id, code, description) VALUES (20, 'OAX', 'Oaxaca');
INSERT INTO public.state (id, code, description) VALUES (21, 'PUE', 'Puebla');
INSERT INTO public.state (id, code, description) VALUES (22, 'QRO', 'Querétaro');
INSERT INTO public.state (id, code, description) VALUES (23, 'QROO', 'Quintana Roo');
INSERT INTO public.state (id, code, description) VALUES (24, 'SLP', 'San Luis Potosí');
INSERT INTO public.state (id, code, description) VALUES (25, 'SIN', 'Sinaloa');
INSERT INTO public.state (id, code, description) VALUES (26, 'SON', 'Sonora');
INSERT INTO public.state (id, code, description) VALUES (27, 'TAB', 'Tabasco');
INSERT INTO public.state (id, code, description) VALUES (28, 'TAMPS', 'Tamaulipas');
INSERT INTO public.state (id, code, description) VALUES (29, 'TLAX', 'Tlaxcala');
INSERT INTO public.state (id, code, description) VALUES (30, 'VER', 'Veracruz de Ignacio de la Llave');
INSERT INTO public.state (id, code, description) VALUES (31, 'YUC', 'Yucatán');
INSERT INTO public.state (id, code, description) VALUES (32, 'ZAC', 'Zacatecas');


--
-- PostgreSQL database dump complete
--


--rollback DELETE FROM public.gender;
--rollback DELETE FROM public.state;
