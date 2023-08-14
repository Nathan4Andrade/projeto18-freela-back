--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)

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
-- Name: cats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cats (
    id integer NOT NULL,
    name text NOT NULL,
    age integer NOT NULL,
    breed text NOT NULL,
    description text NOT NULL,
    image text NOT NULL,
    available boolean DEFAULT true NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: cats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cats_id_seq OWNED BY public.cats.id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.favorites (
    id integer NOT NULL,
    "userId" integer,
    "catId" integer,
    "favoritedAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.favorites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    cpf character varying(11) NOT NULL,
    email text NOT NULL,
    telephone text NOT NULL,
    password text NOT NULL,
    image text,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: cats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cats ALTER COLUMN id SET DEFAULT nextval('public.cats_id_seq'::regclass);


--
-- Name: favorites id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: cats; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cats VALUES (9, 'Olivia Benson', 114, ' Scottish Fold', 'Eu sou mais rica que você e sua família juntos', 'https://economictimes.indiatimes.com/thumb/msid-96771641,width-2000,height-1333,resizemode-4,imgsize-271324/taylor-swifts-cat-becomes-worlds-3rd-wealthiest-pet-with-net-worth-of-97-million-know-whos-richer-than-olivia-benson.jpg?from=mdr', true, 3, '2023-08-13 23:00:05.034662');
INSERT INTO public.cats VALUES (11, 'Meredith Grey', 153, 'Scottish Fold', 'Não sou a da série', 'https://i.pinimg.com/736x/f3/62/91/f3629147fb60ac996d9266af8b1a8814.jpg', true, 3, '2023-08-13 23:05:14.677471');
INSERT INTO public.cats VALUES (13, 'Benjamin', 55, 'Ragdoll', 'Duvido você achar um gato mais bonito que eu', 'https://people.com/thmb/r7bWAm1LFQCMaVtguGLG3wPl6xA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(847x0:849x2)/taylor-swift-cat-benjamin-button-911200cdadb04af1a547cf7034ccc3a0.jpg', true, 3, '2023-08-13 23:11:13.764547');
INSERT INTO public.cats VALUES (15, 'Salem', 6004, 'Preto', 'Não sou um gato de verdade', 'https://static.wikia.nocookie.net/riverdalearchie/images/a/af/CAOS-P2-Salem-Cat.jpg', true, 4, '2023-08-13 23:20:54.424638');
INSERT INTO public.cats VALUES (16, 'Garfield', 468, 'Persa', 'Lasanha! Lasanha! Lasanha! Lasanha! Lasanha! Lasanha! ', 'https://i.pinimg.com/736x/13/6e/86/136e860243c4596953b9445c800dbe62.jpg', true, 5, '2023-08-14 00:12:34.783888');
INSERT INTO public.cats VALUES (17, 'Chesire', 511, 'British Shorthairs', 'Todo mundo é meio doidin aqui', 'https://www.alice-in-wonderland.net/wp-content/uploads/cheshire-cat-4.jpg', true, 6, '2023-08-14 00:20:12.233826');


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.favorites VALUES (10, 3, 11, '2023-08-13 23:05:26.891282');
INSERT INTO public.favorites VALUES (11, 1, 13, '2023-08-13 23:14:41.286947');
INSERT INTO public.favorites VALUES (12, 4, 11, '2023-08-13 23:21:59.399014');
INSERT INTO public.favorites VALUES (13, 3, 15, '2023-08-13 23:58:12.32226');
INSERT INTO public.favorites VALUES (14, 5, 11, '2023-08-14 00:13:00.188834');
INSERT INTO public.favorites VALUES (15, 6, 16, '2023-08-14 00:24:01.203666');
INSERT INTO public.favorites VALUES (16, 6, 17, '2023-08-14 00:26:44.609189');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, '55ca72cc-6c2c-433a-9f08-daa122be9efe', '2023-08-10 19:34:27.23455');
INSERT INTO public.sessions VALUES (2, 1, '126ef6d9-4d01-4687-9868-2a82f34246d0', '2023-08-10 20:07:51.893045');
INSERT INTO public.sessions VALUES (3, 1, '43a1dc26-f951-4768-b7ec-199e10dd6eb7', '2023-08-10 20:08:00.529505');
INSERT INTO public.sessions VALUES (4, 1, '0e24d381-7203-4201-9c6a-6c6f5bbfd31f', '2023-08-10 20:14:02.561235');
INSERT INTO public.sessions VALUES (5, 1, '50e42a58-a2f1-4407-b5d9-a4d55b0b2fc4', '2023-08-10 20:14:37.867087');
INSERT INTO public.sessions VALUES (6, 1, '9f44dd93-67b8-4436-b59e-245308d18f66', '2023-08-10 20:16:38.453169');
INSERT INTO public.sessions VALUES (7, 3, '8265722d-396b-4e1c-ba0f-5edb52285165', '2023-08-13 22:54:45.682426');
INSERT INTO public.sessions VALUES (8, 1, 'b67b2af9-f486-4d82-8a47-4afe3ee7153e', '2023-08-13 23:14:07.789056');
INSERT INTO public.sessions VALUES (9, 4, 'f293203c-6b25-435c-b8f7-c66cddfbcee9', '2023-08-13 23:16:54.818776');
INSERT INTO public.sessions VALUES (10, 3, '7a652ced-08d0-43b1-97ab-7b3ab46bd469', '2023-08-13 23:58:04.736675');
INSERT INTO public.sessions VALUES (11, 3, '546854b9-dea0-4731-96f2-3cdf09ac7901', '2023-08-14 00:00:06.355719');
INSERT INTO public.sessions VALUES (12, 3, 'a4b8e602-3260-4ae7-bf83-ab7f80a84edd', '2023-08-14 00:05:09.071222');
INSERT INTO public.sessions VALUES (13, 3, '7ffa334c-af83-443f-a2d8-998fe082537d', '2023-08-14 00:06:25.005216');
INSERT INTO public.sessions VALUES (14, 5, 'bf77b137-81da-4a22-852e-2128238de67e', '2023-08-14 00:11:13.151204');
INSERT INTO public.sessions VALUES (15, 6, 'a21092a2-1a99-44f2-a805-6031b6c1b055', '2023-08-14 00:18:07.381313');
INSERT INTO public.sessions VALUES (16, 7, 'bf4f35b8-ba62-4bc3-9172-55b6ce7ebf76', '2023-08-14 00:34:16.492665');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Lucas', '12345678912', 'lucas@driven.com', '1234567892', '$2b$10$JWcesr/iO8py1i8ji7wyX.IpwiwmOBsFA6IaFXfe9Y0rQoSGfU3B2', 'https://i.pinimg.com/564x/24/fc/02/24fc02fa2d79c6c832d4d450d8f31f34.jpg', '2023-08-10 19:32:24.313404');
INSERT INTO public.users VALUES (3, 'Taylor Swift', '13131313131', 'taylor@swift.com', '1313131313', '$2b$10$B4xEcssqLuEb4tfgJrDTOOS6L/bWi.ywOoMcjqbeKE/ts53zzYUrO', 'https://pbs.twimg.com/media/E783mABVUAcqbEc?format=jpg&name=4096x4096', '2023-08-13 22:54:22.550685');
INSERT INTO public.users VALUES (4, 'Sabrina Spellman', '66666666666', 'sabrina@spellman.com', '6666666666', '$2b$10$5NM05ich26kEPRByZlVNl.dweFh6Q1W.eto2fVCPCphwTnPOs59qO', 'https://i.pinimg.com/736x/1d/0a/83/1d0a83d6bcbfe3789568542b69bae653.jpg', '2023-08-13 23:16:45.959496');
INSERT INTO public.users VALUES (5, 'Jon Arbuckle', '12345678917', 'jon@email.com', '83999995678', '$2b$10$X/2hEZoYGagRqEgGnUT.V.JDrWp7mRv9JLRhTZOojFhcAsVM7mSoS', 'https://i.pinimg.com/originals/a7/e3/fe/a7e3fe1a07a5c8e2ae0893abc1d53a1b.jpg', '2023-08-14 00:10:51.710893');
INSERT INTO public.users VALUES (6, 'Alice Kingsleigh', '88888888888', 'alice@wonderland.com', '11987564123', '$2b$10$W7R70HJJKoT4fzn4Z7/uveIcs9TsAOZD4czaeM/sjIIaqYU1UFRLa', 'https://pbs.twimg.com/media/EjKVfPnX0AEH3DL.jpg', '2023-08-14 00:17:45.740467');
INSERT INTO public.users VALUES (7, 'Shrek', '77777777777', 'shrek@gmail.com', '4377080085', '$2b$10$Pe7IDfjC6B6ie6/jQpykHeuIvW1DInjGfYlGQFT/ubZvNd/7WD2aW', 'https://i.pinimg.com/736x/f4/15/f8/f415f883c1d19c81e7479e59f7e25f6e.jpg', '2023-08-14 00:34:05.37371');


--
-- Name: cats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cats_id_seq', 17, true);


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.favorites_id_seq', 16, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 16, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- Name: cats cats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cats
    ADD CONSTRAINT cats_pkey PRIMARY KEY (id);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: favorites unique_user_cat_combination; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT unique_user_cat_combination UNIQUE ("userId", "catId");


--
-- Name: users users_cpf_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cpf_key UNIQUE (cpf);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_telephone_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_telephone_key UNIQUE (telephone);


--
-- Name: cats cats_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cats
    ADD CONSTRAINT "cats_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: favorites favorites_catId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT "favorites_catId_fkey" FOREIGN KEY ("catId") REFERENCES public.cats(id) ON DELETE CASCADE;


--
-- Name: favorites favorites_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT "favorites_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

