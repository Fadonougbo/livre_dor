--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: userinfo; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.userinfo (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.userinfo OWNER TO root;

--
-- Name: userinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.userinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userinfo_id_seq OWNER TO root;

--
-- Name: userinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.userinfo_id_seq OWNED BY public.userinfo.id;


--
-- Name: userinfo id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.userinfo ALTER COLUMN id SET DEFAULT nextval('public.userinfo_id_seq'::regclass);


--
-- Data for Name: userinfo; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.userinfo (id, name, content, created_at) FROM stdin;
27	Gautier	Lorem, ipsum dolor sit amet consectetur adipisicing elit. Harum dolore sint quibusdam ea consectetur praesentium impedit, veniam blanditiis sit fuga, cumque, officia possimus iure voluptatibus nam temporibus cum error debitis exercitationem voluptate dolorem ipsum nihil consequatur odit. Esse, sunt vel ratione cum commodi voluptates, assumenda quam alias fuga earum ex accusantium labore in! Maiores similique saepe animi deserunt aut quasi modi fugiat obcaecati velit voluptatum maxime tempora accusantium, unde aperiam hic! Reprehenderit vero, enim quidem eaque sit modi corporis cupiditate labore sint ducimus maiores dignissimos aut nihil dolores maxime commodi delectus cumque aliquam, beatae quo aperiam voluptates unde architecto? Reiciendis, quod error! Sequi aliquam quaerat non! Corporis in ex totam molestiae ipsam excepturi, voluptates maiores ea, fugiat numquam vero doloremque labore quidem, aspernatur rerum corrupti reiciendis placeat officia nobis eligendi minus quos? Molestiae soluta architecto vitae quos nesciunt quo minima dicta, fugiat, iusto repellendus voluptas voluptatem sint sequi nisi sapiente totam earum aperiam esse fuga. Non quas quasi beatae, voluptatem minima quam eum illum asperiores aspernatur ipsam animi earum alias dolorum repellat itaque ducimus deleniti accusamus praesentium eaque unde nisi? Quas libero suscipit quisquam tempore corrupti dolorum modi iste alias. Aliquam vero totam doloribus ab exercitationem placeat tenetur, amet ratione!	2023-04-22 08:25:23.58092+01
\.


--
-- Name: userinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.userinfo_id_seq', 27, true);


--
-- Name: userinfo userinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.userinfo
    ADD CONSTRAINT userinfo_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

