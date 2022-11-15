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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(40) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(40) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (43, 2018, 'Final', 231, 232, 4, 2);
INSERT INTO public.games VALUES (44, 2018, 'Third Place', 233, 234, 2, 0);
INSERT INTO public.games VALUES (45, 2018, 'Semi-Final', 232, 234, 2, 1);
INSERT INTO public.games VALUES (46, 2018, 'Semi-Final', 231, 233, 1, 0);
INSERT INTO public.games VALUES (47, 2018, 'Quarter-Final', 232, 235, 3, 2);
INSERT INTO public.games VALUES (48, 2018, 'Quarter-Final', 234, 236, 2, 0);
INSERT INTO public.games VALUES (49, 2018, 'Quarter-Final', 233, 237, 2, 1);
INSERT INTO public.games VALUES (50, 2018, 'Quarter-Final', 231, 238, 2, 0);
INSERT INTO public.games VALUES (51, 2018, 'Eighth-Final', 234, 239, 2, 1);
INSERT INTO public.games VALUES (52, 2018, 'Eighth-Final', 236, 240, 1, 0);
INSERT INTO public.games VALUES (53, 2018, 'Eighth-Final', 233, 241, 3, 2);
INSERT INTO public.games VALUES (54, 2018, 'Eighth-Final', 237, 242, 2, 0);
INSERT INTO public.games VALUES (55, 2018, 'Eighth-Final', 232, 243, 2, 1);
INSERT INTO public.games VALUES (56, 2018, 'Eighth-Final', 235, 244, 2, 1);
INSERT INTO public.games VALUES (57, 2018, 'Eighth-Final', 238, 245, 2, 1);
INSERT INTO public.games VALUES (58, 2018, 'Eighth-Final', 231, 246, 4, 3);
INSERT INTO public.games VALUES (59, 2014, 'Final', 247, 246, 1, 0);
INSERT INTO public.games VALUES (60, 2014, 'Third Place', 248, 237, 3, 0);
INSERT INTO public.games VALUES (61, 2014, 'Semi-Final', 246, 248, 1, 0);
INSERT INTO public.games VALUES (62, 2014, 'Semi-Final', 247, 237, 7, 1);
INSERT INTO public.games VALUES (63, 2014, 'Quarter-Final', 248, 249, 1, 0);
INSERT INTO public.games VALUES (64, 2014, 'Quarter-Final', 246, 233, 1, 0);
INSERT INTO public.games VALUES (65, 2014, 'Quarter-Final', 237, 239, 2, 1);
INSERT INTO public.games VALUES (66, 2014, 'Quarter-Final', 247, 231, 1, 0);
INSERT INTO public.games VALUES (67, 2014, 'Eighth-Final', 237, 250, 2, 1);
INSERT INTO public.games VALUES (68, 2014, 'Eighth-Final', 239, 238, 2, 0);
INSERT INTO public.games VALUES (69, 2014, 'Eighth-Final', 231, 251, 2, 0);
INSERT INTO public.games VALUES (70, 2014, 'Eighth-Final', 247, 252, 2, 1);
INSERT INTO public.games VALUES (71, 2014, 'Eighth-Final', 248, 242, 2, 1);
INSERT INTO public.games VALUES (72, 2014, 'Eighth-Final', 249, 253, 2, 1);
INSERT INTO public.games VALUES (73, 2014, 'Eighth-Final', 246, 240, 1, 0);
INSERT INTO public.games VALUES (74, 2014, 'Eighth-Final', 233, 254, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (231, 'France');
INSERT INTO public.teams VALUES (232, 'Croatia');
INSERT INTO public.teams VALUES (233, 'Belgium');
INSERT INTO public.teams VALUES (234, 'England');
INSERT INTO public.teams VALUES (235, 'Russia');
INSERT INTO public.teams VALUES (236, 'Sweden');
INSERT INTO public.teams VALUES (237, 'Brazil');
INSERT INTO public.teams VALUES (238, 'Uruguay');
INSERT INTO public.teams VALUES (239, 'Colombia');
INSERT INTO public.teams VALUES (240, 'Switzerland');
INSERT INTO public.teams VALUES (241, 'Japan');
INSERT INTO public.teams VALUES (242, 'Mexico');
INSERT INTO public.teams VALUES (243, 'Denmark');
INSERT INTO public.teams VALUES (244, 'Spain');
INSERT INTO public.teams VALUES (245, 'Portugal');
INSERT INTO public.teams VALUES (246, 'Argentina');
INSERT INTO public.teams VALUES (247, 'Germany');
INSERT INTO public.teams VALUES (248, 'Netherlands');
INSERT INTO public.teams VALUES (249, 'Costa Rica');
INSERT INTO public.teams VALUES (250, 'Chile');
INSERT INTO public.teams VALUES (251, 'Nigeria');
INSERT INTO public.teams VALUES (252, 'Algeria');
INSERT INTO public.teams VALUES (253, 'Greece');
INSERT INTO public.teams VALUES (254, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 76, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 272, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

