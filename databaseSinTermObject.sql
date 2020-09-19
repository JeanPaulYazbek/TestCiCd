--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

CREATE SCHEMA zmywvjjdgdblxr;


CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';

SET default_tablespace = '';

SET default_with_oids = false;


-- Domains 

--
-- Name: alias_list
--
CREATE DOMAIN zmywvjjdgdblxr."alias_list" AS
  TEXT NOT NULL CHECK ( (value ~ '(^(([A-Z][a-z]*:(1|2)*),\s)*([A-Z][a-z]*:(1|2)*))$') or (value LIKE '') );

--
-- Name: categoria; Type: TABLE; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

CREATE TABLE zmywvjjdgdblxr.categoria (
    id integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE zmywvjjdgdblxr.categoria OWNER TO zmywvjjdgdblxr;

--
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

CREATE SEQUENCE zmywvjjdgdblxr.categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zmywvjjdgdblxr.categoria_id_seq OWNER TO zmywvjjdgdblxr;

--
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zmywvjjdgdblxr
--

ALTER SEQUENCE zmywvjjdgdblxr.categoria_id_seq OWNED BY zmywvjjdgdblxr.categoria.id;


--
-- Name: dispone; Type: TABLE; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

CREATE TABLE zmywvjjdgdblxr.dispone (
    id integer NOT NULL,
    numerometateorema text,
    resuelto boolean DEFAULT false NOT NULL,
    loginusuario text NOT NULL,
    metateoremaid integer NOT NULL
);


ALTER TABLE zmywvjjdgdblxr.dispone OWNER TO zmywvjjdgdblxr;

--
-- Name: dispone_id_seq; Type: SEQUENCE; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

CREATE SEQUENCE zmywvjjdgdblxr.dispone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zmywvjjdgdblxr.dispone_id_seq OWNER TO zmywvjjdgdblxr;

--
-- Name: dispone_id_seq; Type: SEQUENCE OWNED BY; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

ALTER SEQUENCE zmywvjjdgdblxr.dispone_id_seq OWNED BY zmywvjjdgdblxr.dispone.id;


--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

CREATE SEQUENCE zmywvjjdgdblxr.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zmywvjjdgdblxr.hibernate_sequence OWNER TO zmywvjjdgdblxr;

--
-- Name: materia; Type: TABLE; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

CREATE TABLE zmywvjjdgdblxr.materia (
    id integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE zmywvjjdgdblxr.materia OWNER TO zmywvjjdgdblxr;

--
-- Name: materia_id_seq; Type: SEQUENCE; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

CREATE SEQUENCE zmywvjjdgdblxr.materia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zmywvjjdgdblxr.materia_id_seq OWNER TO zmywvjjdgdblxr;

--
-- Name: materia_id_seq; Type: SEQUENCE OWNED BY; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

ALTER SEQUENCE zmywvjjdgdblxr.materia_id_seq OWNED BY zmywvjjdgdblxr.materia.id;


--
-- Name: metateorema; Type: TABLE; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

CREATE TABLE zmywvjjdgdblxr.metateorema (
    id integer NOT NULL,
    enunciado text NOT NULL,
    metateoserializado bytea NOT NULL
);


ALTER TABLE zmywvjjdgdblxr.metateorema OWNER TO zmywvjjdgdblxr;

--
-- Name: metateorema_id_seq; Type: SEQUENCE; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

CREATE SEQUENCE zmywvjjdgdblxr.metateorema_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zmywvjjdgdblxr.metateorema_id_seq OWNER TO zmywvjjdgdblxr;

--
-- Name: metateorema_id_seq; Type: SEQUENCE OWNED BY; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

ALTER SEQUENCE zmywvjjdgdblxr.metateorema_id_seq OWNED BY zmywvjjdgdblxr.metateorema.id;


--
-- Name: predicado; Type: TABLE; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

CREATE TABLE zmywvjjdgdblxr.predicado (
    predicado text NOT NULL,
    alias text NOT NULL,
    login text NOT NULL,
    argumentos text NOT NULL,
    aliases zmywvjjdgdblxr.alias_list NOT NULL,
    notacion text NOT NULL
);


ALTER TABLE zmywvjjdgdblxr.predicado OWNER TO zmywvjjdgdblxr;

--
-- Name: publicacion; Type: TABLE; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

CREATE TABLE zmywvjjdgdblxr.publicacion (
    alias text,
    login text
);


ALTER TABLE zmywvjjdgdblxr.publicacion OWNER TO zmywvjjdgdblxr;

--
-- Name: resuelve; Type: TABLE; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

CREATE TABLE zmywvjjdgdblxr.resuelve (
    id integer NOT NULL,
    nombreteorema text,
    numeroteorema text NOT NULL,
    resuelto boolean DEFAULT false NOT NULL,
    loginusuario text NOT NULL,
    teoremaid integer NOT NULL,
    categoriaid integer NOT NULL
);


ALTER TABLE zmywvjjdgdblxr.resuelve OWNER TO zmywvjjdgdblxr;

--
-- Name: resuelve_id_seq; Type: SEQUENCE; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

CREATE SEQUENCE zmywvjjdgdblxr.resuelve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zmywvjjdgdblxr.resuelve_id_seq OWNER TO zmywvjjdgdblxr;

--
-- Name: resuelve_id_seq; Type: SEQUENCE OWNED BY; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

ALTER SEQUENCE zmywvjjdgdblxr.resuelve_id_seq OWNED BY zmywvjjdgdblxr.resuelve.id;


--
-- Name: solucion; Type: TABLE; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

CREATE TABLE zmywvjjdgdblxr.solucion (
    id integer NOT NULL,
    resuelveid integer NOT NULL,
    resuelto boolean DEFAULT false NOT NULL,
    demostracion text NOT NULL,
    metodo text NOT NULL
    
);


ALTER TABLE zmywvjjdgdblxr.solucion OWNER TO zmywvjjdgdblxr;

--
-- Name: solucion_id_seq; Type: SEQUENCE; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

CREATE SEQUENCE zmywvjjdgdblxr.solucion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zmywvjjdgdblxr.solucion_id_seq OWNER TO zmywvjjdgdblxr;

--
-- Name: solucion_id_seq; Type: SEQUENCE OWNED BY; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

ALTER SEQUENCE zmywvjjdgdblxr.solucion_id_seq OWNED BY zmywvjjdgdblxr.solucion.id;


--
-- Name: teorema; Type: TABLE; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

CREATE TABLE zmywvjjdgdblxr.teorema (
    id integer NOT NULL,
    enunciado text NOT NULL,
    esquema boolean NOT NULL,
    aliases zmywvjjdgdblxr.alias_list NOT NULL
);


ALTER TABLE zmywvjjdgdblxr.teorema OWNER TO zmywvjjdgdblxr;

--
-- Name: teorema_id_seq; Type: SEQUENCE; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

CREATE SEQUENCE zmywvjjdgdblxr.teorema_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zmywvjjdgdblxr.teorema_id_seq OWNER TO zmywvjjdgdblxr;

--
-- Name: teorema_id_seq; Type: SEQUENCE OWNED BY; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

ALTER SEQUENCE zmywvjjdgdblxr.teorema_id_seq OWNED BY zmywvjjdgdblxr.teorema.id;


--
-- Name: termino; Type: TABLE; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

CREATE TABLE zmywvjjdgdblxr.termino (
    combinador text NOT NULL,
    serializado bytea NOT NULL,
    alias text NOT NULL,
    login text NOT NULL
);


ALTER TABLE zmywvjjdgdblxr.termino OWNER TO zmywvjjdgdblxr;

--
-- Name: usuario; Type: TABLE; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

CREATE TABLE zmywvjjdgdblxr.usuario (
    login text NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    correo text NOT NULL,
    password text NOT NULL,
    materiaid integer NOT NULL,
    admin boolean DEFAULT false NOT NULL
);


ALTER TABLE zmywvjjdgdblxr.usuario OWNER TO zmywvjjdgdblxr;

CREATE TABLE zmywvjjdgdblxr.teoria (
    id integer NOT NULL,
    nombre text NOT NULL
);

ALTER TABLE zmywvjjdgdblxr.teoria OWNER TO zmywvjjdgdblxr;

CREATE SEQUENCE zmywvjjdgdblxr.teoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE zmywvjjdgdblxr.teoria_id_seq OWNER TO zmywvjjdgdblxr;

ALTER SEQUENCE zmywvjjdgdblxr.teoria_id_seq OWNED BY zmywvjjdgdblxr.teoria.id;


CREATE TABLE zmywvjjdgdblxr.simbolo (
    id integer NOT NULL,
    notacion_latex text NOT NULL,
    argumentos integer,
    esInfijo boolean DEFAULT false NOT NULL,
    asociatividad integer,
    precedencia integer NOT NULL,
    notacion text NOT NULL,
    teoriaid integer NOT NULL
);

ALTER TABLE zmywvjjdgdblxr.simbolo OWNER TO zmywvjjdgdblxr;

CREATE SEQUENCE zmywvjjdgdblxr.simbolo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE zmywvjjdgdblxr.simbolo_id_seq OWNER TO zmywvjjdgdblxr;

ALTER SEQUENCE zmywvjjdgdblxr.simbolo_id_seq OWNED BY zmywvjjdgdblxr.simbolo.id;

CREATE TABLE zmywvjjdgdblxr.mostrarCategoria (
    id integer NOT NULL,
    categoriaid integer NOT NULL,
    usuariologin text NOT NULL
);

ALTER TABLE zmywvjjdgdblxr.mostrarCategoria OWNER TO zmywvjjdgdblxr;

CREATE SEQUENCE zmywvjjdgdblxr.mostrarCategoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE zmywvjjdgdblxr.mostrarCategoria_id_seq OWNER TO zmywvjjdgdblxr;

--
-- Name: id; Type: DEFAULT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

ALTER TABLE ONLY zmywvjjdgdblxr.categoria ALTER COLUMN id SET DEFAULT nextval('zmywvjjdgdblxr.categoria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

ALTER TABLE ONLY zmywvjjdgdblxr.dispone ALTER COLUMN id SET DEFAULT nextval('zmywvjjdgdblxr.dispone_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

ALTER TABLE ONLY zmywvjjdgdblxr.metateorema ALTER COLUMN id SET DEFAULT nextval('zmywvjjdgdblxr.metateorema_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

ALTER TABLE ONLY zmywvjjdgdblxr.resuelve ALTER COLUMN id SET DEFAULT nextval('zmywvjjdgdblxr.resuelve_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

ALTER TABLE ONLY zmywvjjdgdblxr.solucion ALTER COLUMN id SET DEFAULT nextval('zmywvjjdgdblxr.solucion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

ALTER TABLE ONLY zmywvjjdgdblxr.teorema ALTER COLUMN id SET DEFAULT nextval('zmywvjjdgdblxr.teorema_id_seq'::regclass);


ALTER TABLE ONLY zmywvjjdgdblxr.teoria ALTER COLUMN id SET DEFAULT nextval('zmywvjjdgdblxr.teoria_id_seq'::regclass);

ALTER TABLE ONLY zmywvjjdgdblxr.simbolo ALTER COLUMN id SET DEFAULT nextval('zmywvjjdgdblxr.simbolo_id_seq'::regclass);

ALTER TABLE ONLY zmywvjjdgdblxr.mostrarCategoria ALTER COLUMN id SET DEFAULT nextval('zmywvjjdgdblxr.simbolo_id_seq'::regclass);

insert into zmywvjjdgdblxr.simbolo (id, notacion_latex, argumentos, esinfijo, asociatividad, precedencia, notacion, teoriaid) values (1,'\equiv', 2, TRUE, 0, 1,'%(aa2) %(op) %(a1)',1);
insert into zmywvjjdgdblxr.simbolo (id, notacion_latex, argumentos, esinfijo, asociatividad, precedencia, notacion, teoriaid) values (2,'\Rightarrow', 2, TRUE, 1, 2,'%(a2) %(op) %(aa1)', 1);
insert into zmywvjjdgdblxr.simbolo (id, notacion_latex, argumentos, esinfijo, asociatividad, precedencia, notacion, teoriaid) values (3,'\Leftarrow', 2,TRUE,0,2,'%(aa2) %(op) %(a1)',1);
insert into zmywvjjdgdblxr.simbolo (id, notacion_latex, argumentos, esinfijo, asociatividad, precedencia, notacion, teoriaid) values (4,'\vee', 2, TRUE, 0, 3,'%(aa2) %(op) %(a1)',1);
insert into zmywvjjdgdblxr.simbolo (id, notacion_latex, argumentos, esinfijo, asociatividad, precedencia, notacion, teoriaid) values (5,'\wedge', 2, TRUE, 0, 3,'%(aa2) %(op) %(a1)',1);
insert into zmywvjjdgdblxr.simbolo (id, notacion_latex, argumentos, esinfijo, asociatividad, precedencia, notacion, teoriaid) values (6,'\not\equiv', 2, TRUE, 0, 4,'%(a2) %(op) %(a1)',1);
insert into zmywvjjdgdblxr.simbolo (id, notacion_latex, argumentos, esinfijo, asociatividad, precedencia, notacion, teoriaid) values (7,'\neg', 1, TRUE, 1, 5,'%(op) %(aa1)',1);
insert into zmywvjjdgdblxr.simbolo (id, notacion_latex, argumentos, esinfijo, asociatividad, precedencia, notacion, teoriaid) values (8,'true', 0, TRUE, 0, 0,'%(op)',1);
insert into zmywvjjdgdblxr.simbolo (id, notacion_latex, argumentos, esinfijo, asociatividad, precedencia, notacion, teoriaid) values (9,'false', 0, TRUE, 0, 0,'%(op)',1);
insert into zmywvjjdgdblxr.simbolo (id, notacion_latex, argumentos, esinfijo, asociatividad, precedencia, notacion, teoriaid) values (10,'=', 2, TRUE, 0, 5,'%(a2) %(op) %(a1)',1);
insert into zmywvjjdgdblxr.simbolo (id, notacion_latex, argumentos, esinfijo, asociatividad, precedencia, notacion, teoriaid) values (11,'+', 2, TRUE, 0, 6,'%(a2) %(op) %(a1)',1);
insert into zmywvjjdgdblxr.simbolo (id, notacion_latex, argumentos, esinfijo, asociatividad, precedencia, notacion, teoriaid) values (12,'-', 2, TRUE, 0, 6,'%(a2) %(op) %(a1)',1);
insert into zmywvjjdgdblxr.simbolo (id, notacion_latex, argumentos, esinfijo, asociatividad, precedencia, notacion, teoriaid) values (13,'.', 2, TRUE, 0, 7,'%(aa2) %(op) %(a1)',1);
insert into zmywvjjdgdblxr.simbolo (id, notacion_latex, argumentos, esinfijo, asociatividad, precedencia, notacion, teoriaid) values (14,' ', 2, TRUE, 0, 7,'\frac{%(na2)}{%(na1)}',1);
insert into zmywvjjdgdblxr.simbolo (id, notacion_latex, argumentos, esinfijo, asociatividad, precedencia, notacion, teoriaid) values (15,'-', 1, TRUE, 0, 8,'%(op)%(a1)',1);
insert into zmywvjjdgdblxr.simbolo (id, notacion_latex, argumentos, esinfijo, asociatividad, precedencia, notacion, teoriaid) values (16,'^', 1, TRUE, 0, 9,'%(a2)%(op){%(a1)}',1);
insert into zmywvjjdgdblxr.simbolo (id, notacion_latex, argumentos, esinfijo, asociatividad, precedencia, notacion, teoriaid) values (17,'0', 0, TRUE, 0, 0,'%(op)',1);
insert into zmywvjjdgdblxr.simbolo (id, notacion_latex, argumentos, esinfijo, asociatividad, precedencia, notacion, teoriaid) values (18,'1', 0, TRUE, 0, 0,'%(op)',1);

--
-- Name: simbolo_id_seq; Type: SEQUENCE SET; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

SELECT pg_catalog.setval('zmywvjjdgdblxr.simbolo_id_seq', 18, true);

--
-- Data for Name: categoria; Type: TABLE DATA; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

COPY zmywvjjdgdblxr.categoria (id, nombre) FROM stdin;
1	Equivalencia
2	Negación
3	Disyunción
4	Conjunción
5	Implicación
\.


--
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

SELECT pg_catalog.setval('zmywvjjdgdblxr.categoria_id_seq', 5, true);


--
-- Data for Name: dispone; Type: TABLE DATA; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

COPY zmywvjjdgdblxr.dispone (id, numerometateorema, resuelto, loginusuario, metateoremaid) FROM stdin;
\.


--
-- Name: dispone_id_seq; Type: SEQUENCE SET; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

SELECT pg_catalog.setval('zmywvjjdgdblxr.dispone_id_seq', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

SELECT pg_catalog.setval('zmywvjjdgdblxr.hibernate_sequence', 1, false);


--
-- Data for Name: materia; Type: TABLE DATA; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

COPY zmywvjjdgdblxr.materia (id, nombre) FROM stdin;
1	Lógica Simbólica Ene-Mar 2018
\.


--
-- Name: materia_id_seq; Type: SEQUENCE SET; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

SELECT pg_catalog.setval('zmywvjjdgdblxr.materia_id_seq', 1, true);


--
-- Data for Name: metateorema; Type: TABLE DATA; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

COPY zmywvjjdgdblxr.metateorema (id, enunciado, metateoserializado) FROM stdin;
\.


--
-- Name: metateorema_id_seq; Type: SEQUENCE SET; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

SELECT pg_catalog.setval('zmywvjjdgdblxr.metateorema_id_seq', 1, false);


--
-- Data for Name: predicado; Type: TABLE DATA; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

COPY zmywvjjdgdblxr.predicado (predicado, alias, login, argumentos) FROM stdin;
\.


--
-- Data for Name: publicacion; Type: TABLE DATA; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

COPY zmywvjjdgdblxr.publicacion (alias, login) FROM stdin;
\.


--
-- Data for Name: resuelve; Type: TABLE DATA; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

COPY zmywvjjdgdblxr.resuelve (id, nombreteorema, numeroteorema, resuelto, loginusuario, teoremaid) FROM stdin;
\.


--
-- Name: resuelve_id_seq; Type: SEQUENCE SET; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

SELECT pg_catalog.setval('zmywvjjdgdblxr.resuelve_id_seq', 1, false);


--
-- Data for Name: solucion; Type: TABLE DATA; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

COPY zmywvjjdgdblxr.solucion (id, resuelveid, resuelto, demostracion, metodo) FROM stdin;
\.


--
-- Name: solucion_id_seq; Type: SEQUENCE SET; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

SELECT pg_catalog.setval('zmywvjjdgdblxr.solucion_id_seq', 1, false);


--
-- Data for Name: teorema; Type: TABLE DATA; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

COPY zmywvjjdgdblxr.teorema (id, enunciado, esquema, aliases) FROM stdin;
\.


--
-- Name: teorema_id_seq; Type: SEQUENCE SET; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

SELECT pg_catalog.setval('zmywvjjdgdblxr.teorema_id_seq', 1, false);


--
-- Data for Name: termino; Type: TABLE DATA; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

COPY zmywvjjdgdblxr.termino (combinador, serializado, alias, login) FROM stdin;
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

COPY zmywvjjdgdblxr.usuario (login, nombre, apellido, correo, password, materiaid, admin) FROM stdin;
admin	Admin	Admin	correodem@asiado.falso	1f0d65c78b2350520c7bb6409104226063e3d9b05cb0a31ba497f489f98ef6bb8c92cd81ba298543d4fb1b293e139d12f4a7110adb157c75075d8a582e1fe97d	1	t
AdminTeoremas	Admin	Teoremas	admin@teoremas.gries	4b39bf2b2076bb3aec161cfd09ca0614a65f3c0adadb80ff443b8434237ad0a2745018653685a9811f2335dd0b314427ff7568592cd3856ef67ddb0315da4627	1	t
\.

COPY zmywvjjdgdblxr.teoria (id, nombre) FROM stdin;
1	Lógica proposicional
\.


--
-- Name: categoria_PK; Type: CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

ALTER TABLE ONLY zmywvjjdgdblxr.categoria
    ADD CONSTRAINT "categoria_PK" PRIMARY KEY (id);


--
-- Name: categoria_UNIQUE; Type: CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

ALTER TABLE ONLY zmywvjjdgdblxr.categoria
    ADD CONSTRAINT "categoria_UNIQUE" UNIQUE (nombre);


--
-- Name: dispone_PK; Type: CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

ALTER TABLE ONLY zmywvjjdgdblxr.dispone
    ADD CONSTRAINT "dispone_PK" PRIMARY KEY (id);


--
-- Name: dispone_metateorema_y_usuario_UNIQUE; Type: CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

ALTER TABLE ONLY zmywvjjdgdblxr.dispone
    ADD CONSTRAINT "dispone_metateorema_y_usuario_UNIQUE" UNIQUE (loginusuario, metateoremaid);


--
-- Name: materia_PK; Type: CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

ALTER TABLE ONLY zmywvjjdgdblxr.materia
    ADD CONSTRAINT "materia_PK" PRIMARY KEY (id);


--
-- Name: materia_UNIQUE; Type: CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

ALTER TABLE ONLY zmywvjjdgdblxr.materia
    ADD CONSTRAINT "materia_UNIQUE" UNIQUE (nombre);


--
-- Name: metateorema_PK; Type: CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

ALTER TABLE ONLY zmywvjjdgdblxr.metateorema
    ADD CONSTRAINT "metateorema_PK" PRIMARY KEY (id);


--
-- Name: predicado_PK; Type: CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

ALTER TABLE ONLY zmywvjjdgdblxr.predicado
    ADD CONSTRAINT "predicado_PK" PRIMARY KEY (alias, login);


--
-- Name: predicado_alias_UNIQUE; Type: CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

ALTER TABLE ONLY zmywvjjdgdblxr.predicado
    ADD CONSTRAINT "predicado_alias_UNIQUE" UNIQUE (predicado, login);


--
-- Name: resuelve_PK; Type: CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

ALTER TABLE ONLY zmywvjjdgdblxr.resuelve
    ADD CONSTRAINT "resuelve_PK" PRIMARY KEY (id);


--
-- Name: resuelve_teorema_y_usuario_UNIQUE; Type: CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

ALTER TABLE ONLY zmywvjjdgdblxr.resuelve
    ADD CONSTRAINT "resuelve_teorema_y_usuario_UNIQUE" UNIQUE (loginusuario, teoremaid);


--
-- Name: solucion_PK; Type: CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

ALTER TABLE ONLY zmywvjjdgdblxr.solucion
    ADD CONSTRAINT "solucion_PK" PRIMARY KEY (id);


--
-- Name: teorema_PK; Type: CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

ALTER TABLE ONLY zmywvjjdgdblxr.teorema
    ADD CONSTRAINT "teorema_PK" PRIMARY KEY (id);


--
-- Name: termino_PK; Type: CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

ALTER TABLE ONLY zmywvjjdgdblxr.termino
    ADD CONSTRAINT "termino_PK" PRIMARY KEY (alias, login);


--
-- Name: termino_UNIQUE; Type: CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

ALTER TABLE ONLY zmywvjjdgdblxr.termino
    ADD CONSTRAINT "termino_UNIQUE" UNIQUE (combinador, login);


--
-- Name: usuario_pk; Type: CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr; Tablespace: 
--

ALTER TABLE ONLY zmywvjjdgdblxr.usuario
    ADD CONSTRAINT usuario_pk PRIMARY KEY (login);


ALTER TABLE ONLY zmywvjjdgdblxr.teoria
    ADD CONSTRAINT "teoria_pk" PRIMARY KEY (id);

ALTER TABLE ONLY zmywvjjdgdblxr.simbolo
    ADD CONSTRAINT "simbolo_pk" PRIMARY KEY (id);   
--
-- Name: dispone_metateorema_FK; Type: FK CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

ALTER TABLE ONLY zmywvjjdgdblxr.dispone
    ADD CONSTRAINT "dispone_metateorema_FK" FOREIGN KEY (metateoremaid) REFERENCES zmywvjjdgdblxr.metateorema(id);


--
-- Name: dispone_usuario_FK; Type: FK CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

ALTER TABLE ONLY zmywvjjdgdblxr.dispone
    ADD CONSTRAINT "dispone_usuario_FK" FOREIGN KEY (loginusuario) REFERENCES zmywvjjdgdblxr.usuario(login);


--
-- Name: predicado_FK; Type: FK CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

ALTER TABLE ONLY zmywvjjdgdblxr.predicado
    ADD CONSTRAINT "predicado_FK" FOREIGN KEY (login) REFERENCES zmywvjjdgdblxr.usuario(login);


--
-- Name: resuelve_teorema_FK; Type: FK CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

ALTER TABLE ONLY zmywvjjdgdblxr.resuelve
    ADD CONSTRAINT "resuelve_teorema_FK" FOREIGN KEY (teoremaid) REFERENCES zmywvjjdgdblxr.teorema(id);


--
-- Name: resuelve_usuario_FK; Type: FK CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

ALTER TABLE ONLY zmywvjjdgdblxr.resuelve
    ADD CONSTRAINT "resuelve_usuario_FK" FOREIGN KEY (loginusuario) REFERENCES zmywvjjdgdblxr.usuario(login);


--
-- Name: solucion_FK; Type: FK CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

ALTER TABLE ONLY zmywvjjdgdblxr.solucion
    ADD CONSTRAINT "solucion_FK" FOREIGN KEY (resuelveid) REFERENCES zmywvjjdgdblxr.resuelve(id);


--
--
-- Name: termino_FK; Type: FK CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

ALTER TABLE ONLY zmywvjjdgdblxr.termino
    ADD CONSTRAINT "termino_FK" FOREIGN KEY (login) REFERENCES zmywvjjdgdblxr.usuario(login);


--
-- Name: usuario_FK; Type: FK CONSTRAINT; Schema: zmywvjjdgdblxr; Owner: zmywvjjdgdblxr
--

ALTER TABLE ONLY zmywvjjdgdblxr.usuario
    ADD CONSTRAINT "usuario_FK" FOREIGN KEY (materiaid) REFERENCES zmywvjjdgdblxr.materia(id);

ALTER TABLE ONLY zmywvjjdgdblxr.resuelve
    ADD CONSTRAINT "categoria_FK" FOREIGN KEY (categoriaid) REFERENCES zmywvjjdgdblxr.categoria(id);
--
-- Name: zmywvjjdgdblxr; Type: ACL; Schema: -; Owner: zmywvjjdgdblxr

ALTER TABLE ONLY zmywvjjdgdblxr.simbolo
    ADD CONSTRAINT "teoria_FK" FOREIGN KEY (teoriaid) REFERENCES zmywvjjdgdblxr.teoria(id);
--

ALTER TABLE ONLY zmywvjjdgdblxr.mostrarCategoria
    ADD CONSTRAINT "mostrarCategoria_PK" PRIMARY KEY (id);

ALTER TABLE ONLY zmywvjjdgdblxr.mostrarCategoria
    ADD CONSTRAINT "categoria_FK" FOREIGN KEY (categoriaid) REFERENCES zmywvjjdgdblxr.categoria(id);

ALTER TABLE ONLY zmywvjjdgdblxr.mostrarCategoria
    ADD CONSTRAINT "usuario_FK" FOREIGN KEY (usuariologin) REFERENCES zmywvjjdgdblxr.usuario(login);

GRANT ALL ON SCHEMA zmywvjjdgdblxr TO zmywvjjdgdblxr;
REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

