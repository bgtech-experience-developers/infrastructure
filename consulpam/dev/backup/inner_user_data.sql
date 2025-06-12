--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.5 (Debian 17.5-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: inner_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.inner_user (id, name, email, cpf, password, role, "isFirstAccess", "profileImage", "createdAt", "updatedAt") FROM stdin;
7f51bd6b-4402-4fe7-b955-f9c5fee2f39b	lucas	naoki@gmail.com	12	$2b$10$EuUTPnVCJRI.1BewJxkp2.5PmUomQvWJz/l4N9wK70sfbWOqF5GnC	ADMIN	t	WITHOUT	2025-06-11 11:38:16.969	2025-06-11 11:38:16.969
2e4d6fdf-84a6-423f-8d7c-5a75fa07ea4e	carlos	carlos@gmail.com	13	$2b$10$WP7jEGkF5Vtb3SAHb.TGPuSGP2P5x7qDTO8a/y.Gg24Jia.TBtTuq	REGIONAL	t	WITHOUT	2025-06-11 11:38:16.969	2025-06-11 11:38:16.969
80168842-68d3-42e5-a0e4-c929e402f94d	levy	levy@gmail.com	14	$2b$10$Oin1AY5qhKjuzZ6hdy3VG.eM5O025TkQCdQyFxgy6brOUMx7fbb1G	MUNICIPAL	t	WITHOUT	2025-06-11 11:38:16.969	2025-06-11 11:38:16.969
\.


--
-- PostgreSQL database dump complete
--

