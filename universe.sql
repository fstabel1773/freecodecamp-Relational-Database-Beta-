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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description character varying(200),
    origin_of_name character varying(200),
    constellation text,
    name character varying(30) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    discovery_year integer,
    mean_radius_in_km numeric,
    name character varying(30) NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    equatorial_diameter numeric,
    has_satellites boolean,
    has_life boolean,
    description text,
    name character varying(30) NOT NULL,
    star_id integer,
    planet_type_id integer,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    description character varying(200),
    name character varying(30) NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    age_in_years numeric,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    mass_x_times_earth numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, NULL, 'Andromeda, which ist shortened from "Andromeda Galaxy", gets its name from the area of the sky in which it appears, the constellation of Andromeda.', 'Andromeda', 'Andromeda Galaxy');
INSERT INTO public.galaxy VALUES (2, NULL, 'Looks are similar to a butterfly.', 'Virgo', 'Butterfly Galaxies');
INSERT INTO public.galaxy VALUES (3, NULL, 'Appears similar in shape to a cigar.', 'Ursa Major', 'Cigar Galaxy');
INSERT INTO public.galaxy VALUES (4, NULL, 'Due to its resemblance to the Eye of Sauron from The Lord of the Rings.', 'Canes Venatici', 'Eye of Sauron');
INSERT INTO public.galaxy VALUES (5, NULL, 'The appearance from Earth of the galaxy -- a band of light.', 'Sagittarius', 'Milky Way');
INSERT INTO public.galaxy VALUES (6, NULL, 'From the whirlpool appearance this gravitationally disturbed galaxy exhibits.', 'Canes Venatici', 'Whirlpool Galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, NULL, 1.738, 'Moon', 3);
INSERT INTO public.moon VALUES (2, 1877, 11.267, 'Phobos', 4);
INSERT INTO public.moon VALUES (3, 1610, 6.2, 'Deimos', 4);
INSERT INTO public.moon VALUES (4, 1610, 1821.6, 'Io', 5);
INSERT INTO public.moon VALUES (5, 1610, 2634.1, 'Ganymede', 5);
INSERT INTO public.moon VALUES (6, 1610, 2410.3, 'Callisto', 5);
INSERT INTO public.moon VALUES (7, 1892, 83.5, 'Amalthea', 5);
INSERT INTO public.moon VALUES (8, 1904, 69.8, 'Himalia', 5);
INSERT INTO public.moon VALUES (9, 1905, 43.0, 'Elara', 5);
INSERT INTO public.moon VALUES (10, 1908, 30.0, 'Pasiphae', 5);
INSERT INTO public.moon VALUES (11, 1914, 19.0, 'Sinope', 5);
INSERT INTO public.moon VALUES (12, 1938, 18.0, 'Lysithea', 5);
INSERT INTO public.moon VALUES (13, 1789, 198.2, 'Mimas', 6);
INSERT INTO public.moon VALUES (14, 1789, 252.1, 'Enceladus', 6);
INSERT INTO public.moon VALUES (15, 1684, 533.1, 'Tethys', 6);
INSERT INTO public.moon VALUES (16, 1684, 561.4, 'Dione', 6);
INSERT INTO public.moon VALUES (17, 1672, 763.8, 'Rhea', 6);
INSERT INTO public.moon VALUES (18, 1655, 2574.73, 'Titan', 6);
INSERT INTO public.moon VALUES (19, 1851, 578.9, 'Ariel', 7);
INSERT INTO public.moon VALUES (20, 1851, 584.7, 'Umbriel', 7);
INSERT INTO public.moon VALUES (21, 1787, 788.9, 'Titania', 7);
INSERT INTO public.moon VALUES (22, 1787, 761.4, 'Oberon', 7);
INSERT INTO public.moon VALUES (23, 1948, 235.8, 'Miranda', 7);
INSERT INTO public.moon VALUES (24, 1846, 1353.4, 'Triton', 8);
INSERT INTO public.moon VALUES (25, 2005, 221.0, 'Vanth', 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 1.000, true, true, NULL, 'Earth', 1, 1, 1);
INSERT INTO public.planet VALUES (4, 0.532, true, false, NULL, 'Mars', 1, 1, 2);
INSERT INTO public.planet VALUES (1, 0.383, false, false, NULL, 'Mercury', 1, 1, 0);
INSERT INTO public.planet VALUES (2, 0.949, false, false, NULL, 'Venus', 1, 1, 0);
INSERT INTO public.planet VALUES (5, 11.209, true, false, NULL, 'Jupiter', 1, 7, 80);
INSERT INTO public.planet VALUES (6, 9.449, true, false, NULL, 'Saturn', 1, 7, 83);
INSERT INTO public.planet VALUES (7, 4.007, true, false, NULL, 'Uranus', 1, 8, 27);
INSERT INTO public.planet VALUES (8, 3.883, true, false, NULL, 'Neptune', 1, 8, 14);
INSERT INTO public.planet VALUES (9, 0.0742, false, false, NULL, 'Ceres', 1, 9, 0);
INSERT INTO public.planet VALUES (10, 0.072, true, false, NULL, 'Orcus', 1, 9, 1);
INSERT INTO public.planet VALUES (11, 0.186, true, false, NULL, 'Pluto', 1, 9, 5);
INSERT INTO public.planet VALUES (12, 0.10, true, false, NULL, 'Gonggong', 1, 9, 1);
INSERT INTO public.planet VALUES (13, 0.18, true, false, NULL, 'Eris', 1, 9, 1);
INSERT INTO public.planet VALUES (14, 0.078, false, false, NULL, 'Sedna', 1, 9, 0);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, NULL, 'Terrestrial planet');
INSERT INTO public.planet_type VALUES (2, NULL, 'Ocean planet');
INSERT INTO public.planet_type VALUES (3, NULL, 'Lava planet');
INSERT INTO public.planet_type VALUES (4, NULL, 'Ice planet');
INSERT INTO public.planet_type VALUES (5, NULL, 'Desert planet');
INSERT INTO public.planet_type VALUES (6, NULL, 'Puffy Planet');
INSERT INTO public.planet_type VALUES (7, NULL, 'Gas Giant');
INSERT INTO public.planet_type VALUES (8, NULL, 'Ice Giant');
INSERT INTO public.planet_type VALUES (9, NULL, 'Dwarf planet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, NULL, 'Sirius', NULL, NULL);
INSERT INTO public.star VALUES (3, NULL, 'Aldebran', NULL, NULL);
INSERT INTO public.star VALUES (4, NULL, 'Rigel', NULL, NULL);
INSERT INTO public.star VALUES (5, NULL, 'Mizar', NULL, NULL);
INSERT INTO public.star VALUES (6, NULL, 'Acrab', NULL, NULL);
INSERT INTO public.star VALUES (1, 4600000000, 'Sun', 5, 332.950);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 9, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: planet_type unique_planet_type_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT unique_planet_type_id UNIQUE (planet_type_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

