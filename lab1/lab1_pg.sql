--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: books; Type: TABLE; Schema: public; Owner: ecylmz; Tablespace: 
--

CREATE TABLE books (
    id integer NOT NULL,
    publisher_id integer NOT NULL,
    subject_id integer NOT NULL,
    name character varying(255) NOT NULL,
    first_author character varying(255) NOT NULL,
    year integer NOT NULL,
    price numeric(6,2) NOT NULL
);


ALTER TABLE public.books OWNER TO ecylmz;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: ecylmz
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO ecylmz;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecylmz
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- Name: buys; Type: TABLE; Schema: public; Owner: ecylmz; Tablespace: 
--

CREATE TABLE buys (
    student_id integer NOT NULL,
    book_id integer NOT NULL
);


ALTER TABLE public.buys OWNER TO ecylmz;

--
-- Name: covers; Type: TABLE; Schema: public; Owner: ecylmz; Tablespace: 
--

CREATE TABLE covers (
    subject_id integer NOT NULL,
    book_id integer NOT NULL
);


ALTER TABLE public.covers OWNER TO ecylmz;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: ecylmz; Tablespace: 
--

CREATE TABLE departments (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.departments OWNER TO ecylmz;

--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: ecylmz
--

CREATE SEQUENCE departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_id_seq OWNER TO ecylmz;

--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecylmz
--

ALTER SEQUENCE departments_id_seq OWNED BY departments.id;


--
-- Name: publishers; Type: TABLE; Schema: public; Owner: ecylmz; Tablespace: 
--

CREATE TABLE publishers (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.publishers OWNER TO ecylmz;

--
-- Name: publishers_id_seq; Type: SEQUENCE; Schema: public; Owner: ecylmz
--

CREATE SEQUENCE publishers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publishers_id_seq OWNER TO ecylmz;

--
-- Name: publishers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecylmz
--

ALTER SEQUENCE publishers_id_seq OWNED BY publishers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: ecylmz; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO ecylmz;

--
-- Name: students; Type: TABLE; Schema: public; Owner: ecylmz; Tablespace: 
--

CREATE TABLE students (
    id integer NOT NULL,
    department_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.students OWNER TO ecylmz;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: ecylmz
--

CREATE SEQUENCE students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO ecylmz;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecylmz
--

ALTER SEQUENCE students_id_seq OWNED BY students.id;


--
-- Name: studies; Type: TABLE; Schema: public; Owner: ecylmz; Tablespace: 
--

CREATE TABLE studies (
    student_id integer NOT NULL,
    subject_id integer NOT NULL
);


ALTER TABLE public.studies OWNER TO ecylmz;

--
-- Name: subjects; Type: TABLE; Schema: public; Owner: ecylmz; Tablespace: 
--

CREATE TABLE subjects (
    id integer NOT NULL,
    stitle character varying(255) NOT NULL
);


ALTER TABLE public.subjects OWNER TO ecylmz;

--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: ecylmz
--

CREATE SEQUENCE subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subjects_id_seq OWNER TO ecylmz;

--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecylmz
--

ALTER SEQUENCE subjects_id_seq OWNED BY subjects.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ecylmz
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ecylmz
--

ALTER TABLE ONLY departments ALTER COLUMN id SET DEFAULT nextval('departments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ecylmz
--

ALTER TABLE ONLY publishers ALTER COLUMN id SET DEFAULT nextval('publishers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ecylmz
--

ALTER TABLE ONLY students ALTER COLUMN id SET DEFAULT nextval('students_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ecylmz
--

ALTER TABLE ONLY subjects ALTER COLUMN id SET DEFAULT nextval('subjects_id_seq'::regclass);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: ecylmz
--

COPY books (id, publisher_id, subject_id, name, first_author, year, price) FROM stdin;
1	4	5	Yabancı	Albert Camus	1942	16.25
2	3	2	Kayıp Zamanın İzinde	Marcel Proust	1927	10.00
3	1	4	Dava	Franz Kafka	1925	16.25
4	1	5	Küçük Prens	Antoine de Saint-Exupiry	1943	20.75
5	2	2	İnsanlık Durumu	Andri Malraux	1933	20.25
6	4	6	Gecenin Sonuna Yolculuk	Louis-Ferdinand Ciline	1932	17.00
7	5	7	Gazap Üzümleri	John Steinbeck	1939	15.00
8	3	5	Çanlar Kimin İçin Çalıyor	Ernest Hemingway	1940	13.00
9	2	2	Adsız Ülke	Alain-Fournier	1913	12.00
10	2	8	Günlerin Köpüğü	Boris Vian	1947	11.00
11	4	5	İkinci Cins	Simone de Beauvoir	1949	19.25
12	3	2	Godot'yu Beklerken	Samuel Beckett	1952	10.75
13	1	4	Varlık ve Hiçlik	Jean-Paul Sartre	1943	18.75
14	1	5	Gülün Adı	Umberto Eco	1980	20.75
15	2	2	Gulag Takımadaları	Aleksandr Soljenitsin	1973	20.75
16	4	6	Paroles (Fransızca)	Jacques Privert	1946	20.75
17	1	7	Alkoller	Guillaume Apollinaire	1913	20.75
18	3	5	Mavi Lotus	Hergi	1936	20.75
19	2	2	Het Achterhuis (Felemenkçe)	Anne Frank	1947	20.75
20	2	8	Hüzünlü Dönenceler	Claude Livi-Strauss	1955	20.75
21	4	5	Cesur Yeni Dünya	Aldous Huxley	1932	20.75
22	3	2	Bin Dokuz Yüz Seksen Dört (1984)	George Orwell	1949	20.75
23	1	4	Galyalı Asteriks	Reni Goscinny ile Albert Uderzo	1959	20.75
24	1	5	Kel Kantocu	Eugene lenosco	1952	20.75
25	2	2	Cinsellik Üzerine	Sigmund Freud	1905	20.75
26	4	6	Zenon	Marguerite Yourcenar	1968	20.75
27	5	7	Lolita	Vladimir Nabokov	1955	20.75
28	3	5	Ulysses	James Joyce	1922	20.75
29	2	2	Tatar Çölü	Dino Buzzati	1940	20.75
30	1	8	Kalpazanlar	Andri Gide	1925	20.75
31	4	5	Der Husar auf dem Dach (Almanca)	Jean Giono	1951	20.75
32	3	2	Die Schöne des Herrn (Almanca)	Albert Cohen	1968	20.75
33	1	4	Yüzyıllık Yalnızlık	Gabriel Garcma Mrquez	1967	20.75
34	1	5	Ses ve Öfke	William Faulkner	1929	20.75
35	2	2	Zazie Metroda	Raymond Queneau	1959	20.75
36	4	6	Duygu Karmaşası	Stefan Zweig	1927	20.75
37	2	7	Rüzgbr Gibi Geçti	Margaret Mitchell	1936	20.75
38	3	5	Lady Chatterley'in Sevgilisi	D. H. Lawrence	1928	20.75
39	2	2	Büyülü Dağ	Thomas Mann	1924	20.75
40	2	8	Günaydın Hüzün	Françoise Sagan	1954	20.75
41	4	5	Le Silence de la mer (Fransızca)	Vercors	1942	20.75
42	3	2	Yaşam Kulanma Kılavuzu	Georges Perec	1978	20.75
43	1	4	Baskervillerin Köpeği	Arthur Conan Doyle	1902	20.75
44	1	5	Die Sonne Satans (Almanca)	Georges Bernanos	1926	20.75
45	2	2	Muhteşem Gatsby	F. Scott Fitzgerald	1925	20.75
46	4	6	Şaka	Milan Kundera	1967	20.75
47	2	7	Il disprezzo (İtalyanca)	Alberto Moravia	1954	20.75
48	3	5	Roger Ackroyd Cinayeti	Agatha Christie	1926	20.75
49	2	2	Nadja	Andri Breton	1928	20.75
50	2	8	Günaydın HüzünLouis	Aragon	1944	20.75
51	2	2	Her Yönüyle C++	Emre Can Yılmaz	2000	39.00
52	2	2	Her Yönüyle C#	Emre Can Yılmaz	2001	39.00
53	2	2	Her Yönüyle C	Tevfik Kızılören	2013	39.00
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecylmz
--

SELECT pg_catalog.setval('books_id_seq', 53, true);


--
-- Data for Name: buys; Type: TABLE DATA; Schema: public; Owner: ecylmz
--

COPY buys (student_id, book_id) FROM stdin;
1	1
1	35
1	34
1	36
1	33
1	32
1	31
1	30
1	29
1	28
1	27
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
11	11
12	12
13	13
14	14
15	15
16	16
17	17
18	18
19	19
20	20
21	21
22	22
23	23
24	24
25	25
26	26
27	27
28	28
29	29
30	30
31	31
32	32
33	33
\.


--
-- Data for Name: covers; Type: TABLE DATA; Schema: public; Owner: ecylmz
--

COPY covers (subject_id, book_id) FROM stdin;
1	1
1	35
1	2
1	3
1	4
1	5
1	6
2	7
2	8
2	9
2	10
2	11
2	12
2	13
2	14
2	15
2	16
3	17
3	18
3	19
3	20
3	21
3	22
3	23
3	24
3	25
3	26
4	27
4	28
4	29
4	30
4	31
4	32
4	33
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: ecylmz
--

COPY departments (id, name) FROM stdin;
1	Bilgisayar Mühendisliği
2	Elektronik Mühendisliği
3	Makina Mühendisliği
4	Kimya Mühendiliği
5	Bilgisayar Programcılığı
\.


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecylmz
--

SELECT pg_catalog.setval('departments_id_seq', 5, true);


--
-- Data for Name: publishers; Type: TABLE DATA; Schema: public; Owner: ecylmz
--

COPY publishers (id, name) FROM stdin;
1	Pusula Yayıncılık
2	Kodlab Yayıncılık
3	Everest Yayınları
4	Alfa Yayınları
\.


--
-- Name: publishers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecylmz
--

SELECT pg_catalog.setval('publishers_id_seq', 4, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: ecylmz
--

COPY schema_migrations (version) FROM stdin;
20130302114426
20130302114922
20130302114927
20130302114935
20130302114940
20130302114952
20130302114958
20130302115025
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: ecylmz
--

COPY students (id, department_id, name) FROM stdin;
1	1	MELEK FAHRİ BEKİR
2	1	DILBAR NARTAJIYEVA
3	1	MERİMA MURTİÇ
4	1	JAFAR NOORİ
5	1	MOHAMMAD M. NAMMOURAH
6	1	AIPERI TAALAI KYZY
7	2	ERBLINA NIKSHIQI
8	2	AYTA FORUOZ
9	2	VEDAT CAMKIRAN
10	2	TAHMİNE HALİLOVA
11	2	NURİYEV ARSLAN
12	2	ROKSANA MATAMEDİAN
13	2	SABİNA GULİEVA
14	2	HUZEYFE SAYIM
15	2	SEÇİL AZİME USUL
16	2	GİZEM OCAK KÜÇÜK
17	3	BUĞRAHAN AHED ÇİZMECİ
18	3	UMUT TECİR
19	3	SEVAL DAĞITICI
20	3	AHMET CAN ÖZEN
21	3	İBRAHİM KİTAPLI
22	3	BÜŞRA KİRTİ
23	3	VUSLAT SENA YAVUZ
24	3	FURKAN DURSUN ESER
25	3	AHMET SANCAR
26	3	MERVE UMUT
27	4	SETENAY DER
28	4	HANDE CAN
29	4	DOĞANCAN DANIŞMAN
30	4	AYŞE RUMEYSA AYDOĞAN
31	4	YASİN ONUR POLAT
32	4	ÖMER FARUK BULUT
33	4	NURULLAH USLU
34	4	MUSTAFA TAYYİB BİÇİCİ
35	4	BURCU SEVGİLİ
36	4	HACER UKBA KINA
37	5	MUSTAFA SEFA SÖZEN
38	5	NİSANUR CİNGÖZ
39	5	ŞÜHEDA ALBAYRAK
40	5	MÜCAHİT ÇELİK
41	5	SAMET TAN
42	5	YİĞİT CAN AHISHA
43	5	BÜŞRA DÜNDAR
\.


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecylmz
--

SELECT pg_catalog.setval('students_id_seq', 43, true);


--
-- Data for Name: studies; Type: TABLE DATA; Schema: public; Owner: ecylmz
--

COPY studies (student_id, subject_id) FROM stdin;
1	1
2	1
3	1
4	2
5	2
6	2
7	3
8	2
9	2
10	2
11	2
12	4
13	4
14	3
15	4
16	3
17	4
18	2
19	2
20	3
21	5
22	5
23	4
24	5
25	5
26	2
27	5
28	5
29	2
30	1
31	2
32	1
33	3
\.


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: ecylmz
--

COPY subjects (id, stitle) FROM stdin;
1	Veritabanı
2	Ağlar
3	Programlar ve Uygulamalar
4	Sistem Yönetimi
5	Bilimsel Uygulama
6	Grafik Çizim
7	İnternet ve WWW
8	Bilgisayarlı Muhasebe
9	İşletim Sistemleri
10	Programlama
11	Yazılım
\.


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecylmz
--

SELECT pg_catalog.setval('subjects_id_seq', 11, true);


--
-- Name: books_pkey; Type: CONSTRAINT; Schema: public; Owner: ecylmz; Tablespace: 
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: departments_pkey; Type: CONSTRAINT; Schema: public; Owner: ecylmz; Tablespace: 
--

ALTER TABLE ONLY departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: publishers_pkey; Type: CONSTRAINT; Schema: public; Owner: ecylmz; Tablespace: 
--

ALTER TABLE ONLY publishers
    ADD CONSTRAINT publishers_pkey PRIMARY KEY (id);


--
-- Name: students_pkey; Type: CONSTRAINT; Schema: public; Owner: ecylmz; Tablespace: 
--

ALTER TABLE ONLY students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: ecylmz; Tablespace: 
--

ALTER TABLE ONLY subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: ecylmz; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

