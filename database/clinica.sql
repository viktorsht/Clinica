--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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
-- Name: atendimentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.atendimentos (
    id integer NOT NULL,
    medico_id integer NOT NULL,
    cliente_id integer NOT NULL,
    horario date NOT NULL
);


ALTER TABLE public.atendimentos OWNER TO postgres;

--
-- Name: atendimentos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.atendimentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.atendimentos_id_seq OWNER TO postgres;

--
-- Name: atendimentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.atendimentos_id_seq OWNED BY public.atendimentos.id;


--
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    cpf character varying(11) NOT NULL,
    email character varying(100) NOT NULL,
    telefone character varying(20) NOT NULL,
    endereco character varying(200) NOT NULL
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_seq OWNER TO postgres;

--
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- Name: funcionarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcionarios (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    cpf character varying(11) NOT NULL,
    cargo character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    telefone character varying(20) NOT NULL,
    senha character varying(200)
);


ALTER TABLE public.funcionarios OWNER TO postgres;

--
-- Name: funcionarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.funcionarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.funcionarios_id_seq OWNER TO postgres;

--
-- Name: funcionarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.funcionarios_id_seq OWNED BY public.funcionarios.id;


--
-- Name: medicos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicos (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    telefone character varying(20) NOT NULL,
    cpf character varying(11) NOT NULL,
    crm character varying(10) NOT NULL,
    especialidade character varying(255) NOT NULL
);


ALTER TABLE public.medicos OWNER TO postgres;

--
-- Name: medicos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicos_id_seq OWNER TO postgres;

--
-- Name: medicos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicos_id_seq OWNED BY public.medicos.id;


--
-- Name: atendimentos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atendimentos ALTER COLUMN id SET DEFAULT nextval('public.atendimentos_id_seq'::regclass);


--
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- Name: funcionarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios ALTER COLUMN id SET DEFAULT nextval('public.funcionarios_id_seq'::regclass);


--
-- Name: medicos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicos ALTER COLUMN id SET DEFAULT nextval('public.medicos_id_seq'::regclass);


--
-- Data for Name: atendimentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.atendimentos (id, medico_id, cliente_id, horario) FROM stdin;
1	4	1	2023-05-09
2	4	2	2023-05-09
3	1	2	2023-05-09
4	1	1	2023-05-09
5	1	3	2023-05-09
6	4	3	2023-05-09
9	3	22	2023-05-09
11	3	16	2023-05-09
14	2	17	2023-05-09
24	3	11	2023-05-11
\.


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, nome, cpf, email, telefone, endereco) FROM stdin;
1	João Silva	12345678900	joao.silva@gmail.com	(11) 9999-8888	Rua A, 123
2	Maria Santos	98765432100	maria.santos@gmail.com	(11) 7777-6666	Rua B, 456
3	Pedro Souza	11122233300	pedro.souza@gmail.com	(11) 3333-2222	Rua C, 789
4	Ana Oliveira	44455566600	ana.oliveira@gmail.com	(11) 5555-4444	Rua D, 321
6	Fernando Santos	12345678901	fernando.santos@gmail.com	(11) 9999-1111	Rua A, 123
7	Juliana Almeida	98765432101	juliana.almeida@gmail.com	(11) 7777-2222	Avenida B, 456
8	Roberto Lima	11122233301	roberto.lima@gmail.com	(11) 3333-4444	Rua C, 789
9	Camila Pereira	44455566601	camila.pereira@gmail.com	(11) 5555-7777	Avenida D, 234
10	Rafael Silva	10101010101	rafael.silva@gmail.com	(11) 8888-9999	Rua E, 567
11	Carla Alves	20202020201	carla.alves@gmail.com	(11) 2222-3333	Avenida F, 890
12	Julio Cesar	30303030301	julio.cesar@gmail.com	(11) 4444-5555	Rua G, 1234
13	Mariana Ferreira	50505050501	mariana.ferreira@gmail.com	(11) 6666-7777	Avenida H, 5678
14	Fernanda Costa	70707070701	fernanda.costa@gmail.com	(11) 9999-4444	Rua I, 901
15	Luiz Oliveira	90909090901	luiz.oliveira@gmail.com	(11) 1111-3333	Avenida J, 2345
16	Thais Rodrigues	80808080801	thais.rodrigues@gmail.com	(11) 7777-1111	Rua K, 6789
17	Cassio Souza	60606060601	cassio.souza@gmail.com	(11) 2222-5555	Avenida L, 0123
18	Paulo Silva	40404040401	paulo.silva@gmail.com	(11) 4444-8888	Rua M, 3456
19	Gabriela Santos	20202020202	gabriela.santos@gmail.com	(11) 6666-2222	Avenida N, 7890
20	Ricardo Almeida	30303030302	ricardo.almeida@gmail.com	(11) 9999-5555	Rua O, 12345
5	Pedro Henrique	12121212121	pedro.henrique@gmail.com	(11) 1111-2222	Rua das Flores, 123 - Apto 456, São Paulo - SP
\.


--
-- Data for Name: funcionarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.funcionarios (id, nome, cpf, cargo, email, telefone, senha) FROM stdin;
1	Aline	12365478909	secretária	aline@clinica.com	(11) 9876-5432	$2b$12$ZXK8zWgIPGcckpHnjOri6.RrOe99w7KyrpAiIkttJ0VYOKOHLSsAW
\.


--
-- Data for Name: medicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicos (id, nome, email, telefone, cpf, crm, especialidade) FROM stdin;
1	Dr. Gustavo Rodrigues	gustavo.rodrigues@clinica.com.br	(11) 9999-8888	12345678900	CRM-12345	Cardiologista
2	Dra. Ana Souza	ana.souza@clinica.com.br	(11) 7777-6666	98765432100	CRM-54321	Pediatra
3	Dr. Felipe Silva	felipe.silva@clinica.com.br	(11) 3333-2222	11122233300	CRM-67890	Dermatologista
4	Dra. Juliana Santos	juliana.santos@clinica.com.br	(11) 5555-4444	44455566600	CRM-24680	Ginecologista
\.


--
-- Name: atendimentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.atendimentos_id_seq', 25, true);


--
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 27, true);


--
-- Name: funcionarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.funcionarios_id_seq', 1, true);


--
-- Name: medicos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicos_id_seq', 4, true);


--
-- Name: atendimentos atendimento_unico; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atendimentos
    ADD CONSTRAINT atendimento_unico UNIQUE (medico_id, cliente_id, horario);


--
-- Name: atendimentos atendimentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atendimentos
    ADD CONSTRAINT atendimentos_pkey PRIMARY KEY (id);


--
-- Name: clientes clientes_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_cpf_key UNIQUE (cpf);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- Name: funcionarios funcionarios_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_cpf_key UNIQUE (cpf);


--
-- Name: funcionarios funcionarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_email_key UNIQUE (email);


--
-- Name: funcionarios funcionarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (id);


--
-- Name: medicos medicos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT medicos_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

