--
-- PostgreSQL database dump
--

SET client_encoding = 'SQL_ASCII';
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: salaird
--

COMMENT ON SCHEMA public IS 'Standard public schema';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: typo; Tablespace: 
--

CREATE TABLE articles (
    id serial NOT NULL,
    title character varying(255),
    author character varying(255),
    body text,
    body_html text,
    extended text,
    extended_html text,
    excerpt text,
    keywords character varying(255),
    allow_comments integer,
    allow_pings integer,
    published integer DEFAULT 1 NOT NULL,
    text_filter character varying(20),
    user_id integer,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    permalink character varying(255),
    guid character varying(255)
);


ALTER TABLE public.articles OWNER TO typo;

--
-- Name: articles_categories; Type: TABLE; Schema: public; Owner: typo; Tablespace: 
--

CREATE TABLE articles_categories (
    article_id integer,
    category_id integer,
    is_primary integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.articles_categories OWNER TO typo;

--
-- Name: blacklist_patterns; Type: TABLE; Schema: public; Owner: typo; Tablespace: 
--

CREATE TABLE blacklist_patterns (
    id serial NOT NULL,
    "type" character varying(15),
    pattern character varying(255)
);


ALTER TABLE public.blacklist_patterns OWNER TO typo;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: typo; Tablespace: 
--

CREATE TABLE categories (
    id serial NOT NULL,
    name character varying(255),
    "position" integer DEFAULT 0 NOT NULL,
    permalink character varying(255)
);


ALTER TABLE public.categories OWNER TO typo;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: typo; Tablespace: 
--

CREATE TABLE comments (
    id serial NOT NULL,
    article_id integer NOT NULL,
    title character varying(255),
    author character varying(255),
    email character varying(255),
    url character varying(255),
    ip character varying(15),
    body text,
    body_html text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.comments OWNER TO typo;

--
-- Name: page_caches; Type: TABLE; Schema: public; Owner: typo; Tablespace: 
--

CREATE TABLE page_caches (
    id serial NOT NULL,
    name character varying(255)
);


ALTER TABLE public.page_caches OWNER TO typo;

--
-- Name: pages; Type: TABLE; Schema: public; Owner: typo; Tablespace: 
--

CREATE TABLE pages (
    id serial NOT NULL,
    name character varying(255),
    title character varying(255),
    body text,
    body_html text,
    text_filter character varying(20),
    user_id integer,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.pages OWNER TO typo;

--
-- Name: pings; Type: TABLE; Schema: public; Owner: typo; Tablespace: 
--

CREATE TABLE pings (
    id serial NOT NULL,
    article_id integer NOT NULL,
    url character varying(255),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.pings OWNER TO typo;

--
-- Name: resources; Type: TABLE; Schema: public; Owner: typo; Tablespace: 
--

CREATE TABLE resources (
    id serial NOT NULL,
    size integer,
    filename character varying(255),
    mime character varying(255),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.resources OWNER TO typo;

--
-- Name: schema_info; Type: TABLE; Schema: public; Owner: typo; Tablespace: 
--

CREATE TABLE schema_info (
    version integer
);


ALTER TABLE public.schema_info OWNER TO typo;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: typo; Tablespace: 
--

CREATE TABLE sessions (
    id serial NOT NULL,
    sessid character varying(255),
    data text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.sessions OWNER TO typo;

--
-- Name: settings; Type: TABLE; Schema: public; Owner: typo; Tablespace: 
--

CREATE TABLE settings (
    id serial NOT NULL,
    name character varying(255),
    value character varying(255),
    "position" integer
);


ALTER TABLE public.settings OWNER TO typo;

--
-- Name: sidebars; Type: TABLE; Schema: public; Owner: typo; Tablespace: 
--

CREATE TABLE sidebars (
    id serial NOT NULL,
    controller text,
    active_position integer,
    active_config text,
    staged_position integer,
    staged_config text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.sidebars OWNER TO typo;

--
-- Name: trackbacks; Type: TABLE; Schema: public; Owner: typo; Tablespace: 
--

CREATE TABLE trackbacks (
    id serial NOT NULL,
    article_id integer,
    blog_name character varying(255),
    title character varying(255),
    excerpt character varying(255),
    url character varying(255),
    ip character varying(15),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.trackbacks OWNER TO typo;

--
-- Name: users; Type: TABLE; Schema: public; Owner: typo; Tablespace: 
--

CREATE TABLE users (
    id serial NOT NULL,
    login character varying(40),
    "password" character varying(40),
    name text,
    email text
);


ALTER TABLE public.users OWNER TO typo;

--
-- Name: articles_pkey; Type: CONSTRAINT; Schema: public; Owner: typo; Tablespace: 
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


ALTER INDEX public.articles_pkey OWNER TO typo;

--
-- Name: blacklist_patterns_pkey; Type: CONSTRAINT; Schema: public; Owner: typo; Tablespace: 
--

ALTER TABLE ONLY blacklist_patterns
    ADD CONSTRAINT blacklist_patterns_pkey PRIMARY KEY (id);


ALTER INDEX public.blacklist_patterns_pkey OWNER TO typo;

--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: typo; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


ALTER INDEX public.categories_pkey OWNER TO typo;

--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: typo; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


ALTER INDEX public.comments_pkey OWNER TO typo;

--
-- Name: page_caches_pkey; Type: CONSTRAINT; Schema: public; Owner: typo; Tablespace: 
--

ALTER TABLE ONLY page_caches
    ADD CONSTRAINT page_caches_pkey PRIMARY KEY (id);


ALTER INDEX public.page_caches_pkey OWNER TO typo;

--
-- Name: pages_pkey; Type: CONSTRAINT; Schema: public; Owner: typo; Tablespace: 
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


ALTER INDEX public.pages_pkey OWNER TO typo;

--
-- Name: pings_pkey; Type: CONSTRAINT; Schema: public; Owner: typo; Tablespace: 
--

ALTER TABLE ONLY pings
    ADD CONSTRAINT pings_pkey PRIMARY KEY (id);


ALTER INDEX public.pings_pkey OWNER TO typo;

--
-- Name: resources_pkey; Type: CONSTRAINT; Schema: public; Owner: typo; Tablespace: 
--

ALTER TABLE ONLY resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


ALTER INDEX public.resources_pkey OWNER TO typo;

--
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: typo; Tablespace: 
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


ALTER INDEX public.sessions_pkey OWNER TO typo;

--
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: typo; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


ALTER INDEX public.settings_pkey OWNER TO typo;

--
-- Name: sidebars_pkey; Type: CONSTRAINT; Schema: public; Owner: typo; Tablespace: 
--

ALTER TABLE ONLY sidebars
    ADD CONSTRAINT sidebars_pkey PRIMARY KEY (id);


ALTER INDEX public.sidebars_pkey OWNER TO typo;

--
-- Name: trackbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: typo; Tablespace: 
--

ALTER TABLE ONLY trackbacks
    ADD CONSTRAINT trackbacks_pkey PRIMARY KEY (id);


ALTER INDEX public.trackbacks_pkey OWNER TO typo;

--
-- Name: users_login_key; Type: CONSTRAINT; Schema: public; Owner: typo; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_login_key UNIQUE (login);


ALTER INDEX public.users_login_key OWNER TO typo;

--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: typo; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


ALTER INDEX public.users_pkey OWNER TO typo;

--
-- Name: articles_permalink_index; Type: INDEX; Schema: public; Owner: typo; Tablespace: 
--

CREATE INDEX articles_permalink_index ON articles USING btree (permalink);


ALTER INDEX public.articles_permalink_index OWNER TO typo;

--
-- Name: categories_permalink_index; Type: INDEX; Schema: public; Owner: typo; Tablespace: 
--

CREATE INDEX categories_permalink_index ON categories USING btree (permalink);


ALTER INDEX public.categories_permalink_index OWNER TO typo;

--
-- Name: idx_blacklist_pattern; Type: INDEX; Schema: public; Owner: typo; Tablespace: 
--

CREATE INDEX idx_blacklist_pattern ON blacklist_patterns USING btree (pattern);


ALTER INDEX public.idx_blacklist_pattern OWNER TO typo;

--
-- Name: idx_caches; Type: INDEX; Schema: public; Owner: typo; Tablespace: 
--

CREATE INDEX idx_caches ON page_caches USING btree (name);


ALTER INDEX public.idx_caches OWNER TO typo;

--
-- Name: idx_comments_article_id; Type: INDEX; Schema: public; Owner: typo; Tablespace: 
--

CREATE INDEX idx_comments_article_id ON comments USING btree (article_id);


ALTER INDEX public.idx_comments_article_id OWNER TO typo;

--
-- Name: idx_pings_article_id; Type: INDEX; Schema: public; Owner: typo; Tablespace: 
--

CREATE INDEX idx_pings_article_id ON pings USING btree (article_id);


ALTER INDEX public.idx_pings_article_id OWNER TO typo;

--
-- Name: idx_trackbacks_article_id; Type: INDEX; Schema: public; Owner: typo; Tablespace: 
--

CREATE INDEX idx_trackbacks_article_id ON trackbacks USING btree (article_id);


ALTER INDEX public.idx_trackbacks_article_id OWNER TO typo;

