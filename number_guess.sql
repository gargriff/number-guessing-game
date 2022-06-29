--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(30),
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (194, 'Cynan', 1, 10);
INSERT INTO public.users VALUES (202, 'user_1656525065302', 2, 539);
INSERT INTO public.users VALUES (210, 'user_1656525884425', 2, 502);
INSERT INTO public.users VALUES (196, 'user_1656524376000', 2, 718);
INSERT INTO public.users VALUES (201, 'user_1656525065303', 5, 221);
INSERT INTO public.users VALUES (191, 'gargriff', 11, 6);
INSERT INTO public.users VALUES (195, 'user_1656524376001', 5, 237);
INSERT INTO public.users VALUES (209, 'user_1656525884426', 5, 175);
INSERT INTO public.users VALUES (198, 'user_1656524440150', 2, 98);
INSERT INTO public.users VALUES (204, 'user_1656525231396', 2, 27);
INSERT INTO public.users VALUES (197, 'user_1656524440151', 5, 77);
INSERT INTO public.users VALUES (203, 'user_1656525231397', 5, 14);
INSERT INTO public.users VALUES (193, 'Gareth', 2, 10);
INSERT INTO public.users VALUES (192, 'saran', 4, 7);
INSERT INTO public.users VALUES (200, 'user_1656524881635', 2, 184);
INSERT INTO public.users VALUES (206, 'user_1656525555229', 2, 49);
INSERT INTO public.users VALUES (199, 'user_1656524881636', 5, 290);
INSERT INTO public.users VALUES (205, 'user_1656525555230', 5, 10);
INSERT INTO public.users VALUES (208, 'user_1656525647343', 2, 271);
INSERT INTO public.users VALUES (207, 'user_1656525647344', 5, 60);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 210, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

