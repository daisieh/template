--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
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

--
-- Name: concat(text); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE concat(text) (
    SFUNC = textcat,
    STYPE = text,
    INITCOND = ''
);


ALTER AGGREGATE public.concat(text) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: _columns_; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE _columns_ (
    id integer NOT NULL,
    _views__id integer,
    name character varying(30),
    display_name character varying(30),
    align character varying(30),
    display_length integer,
    is_hidden boolean DEFAULT false,
    is_read_only boolean DEFAULT false,
    is_required boolean DEFAULT false,
    show_previous boolean DEFAULT false,
    type character varying,
    type_args character varying
);


ALTER TABLE public._columns_ OWNER TO postgres;

--
-- Name: _columns__id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE _columns__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._columns__id_seq OWNER TO postgres;

--
-- Name: _columns__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE _columns__id_seq OWNED BY _columns_.id;


--
-- Name: _modules_; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE _modules_ (
    id integer NOT NULL,
    class character varying,
    name character varying,
    json character varying
);


ALTER TABLE public._modules_ OWNER TO postgres;

--
-- Name: _modules__id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE _modules__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._modules__id_seq OWNER TO postgres;

--
-- Name: _modules__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE _modules__id_seq OWNED BY _modules_.id;


--
-- Name: _relationship_defs_; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE _relationship_defs_ (
    id integer NOT NULL,
    _views__id integer,
    many_view_def_name character varying(30),
    many_table_column character varying(30)
);


ALTER TABLE public._relationship_defs_ OWNER TO postgres;

--
-- Name: _relationship_defs__id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE _relationship_defs__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._relationship_defs__id_seq OWNER TO postgres;

--
-- Name: _relationship_defs__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE _relationship_defs__id_seq OWNED BY _relationship_defs_.id;


--
-- Name: _roles_; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE _roles_ (
    id integer NOT NULL,
    role character varying
);


ALTER TABLE public._roles_ OWNER TO postgres;

--
-- Name: _roles__id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE _roles__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._roles__id_seq OWNER TO postgres;

--
-- Name: _roles__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE _roles__id_seq OWNED BY _roles_.id;


--
-- Name: _settings_; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE _settings_ (
    id integer NOT NULL,
    name character varying(30),
    value character varying
);


ALTER TABLE public._settings_ OWNER TO postgres;

--
-- Name: _settings__id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE _settings__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._settings__id_seq OWNER TO postgres;

--
-- Name: _settings__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE _settings__id_seq OWNED BY _settings_.id;


--
-- Name: _views_; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE _views_ (
    id integer NOT NULL,
    name character varying(30),
    allow_quick_edit boolean DEFAULT false,
    alternate_rows boolean DEFAULT false,
    column_names_form text,
    column_names_form_table text,
    column_names_table text,
    default_order_by character varying(30),
    form_width character varying(10),
    forms_use_submit_buttons boolean DEFAULT false,
    "from" character varying(30),
    record_name character varying(30),
    row_window_size integer,
    show_filter_link boolean DEFAULT false,
    table_align character varying(10),
    table_width character varying(10),
    add_button_text character varying(30),
    show_num_records boolean DEFAULT false
);


ALTER TABLE public._views_ OWNER TO postgres;

--
-- Name: _views__id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE _views__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._views__id_seq OWNER TO postgres;

--
-- Name: _views__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE _views__id_seq OWNED BY _views_.id;


--
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE accounts (
    id integer NOT NULL,
    name character varying(60),
    type integer,
    email character varying(60),
    initial_balance double precision,
    ongoing_account integer
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- Name: accounts_budgets; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE accounts_budgets (
    id integer NOT NULL,
    accounts_id integer,
    year integer,
    amount double precision
);


ALTER TABLE public.accounts_budgets OWNER TO postgres;

--
-- Name: accounts_budgets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE accounts_budgets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_budgets_id_seq OWNER TO postgres;

--
-- Name: accounts_budgets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE accounts_budgets_id_seq OWNED BY accounts_budgets.id;


--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE accounts_id_seq OWNED BY accounts.id;


--
-- Name: additional_emails; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE additional_emails (
    id integer NOT NULL,
    people_id integer,
    email character varying(60)
);


ALTER TABLE public.additional_emails OWNER TO postgres;

--
-- Name: additional_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE additional_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.additional_emails_id_seq OWNER TO postgres;

--
-- Name: additional_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE additional_emails_id_seq OWNED BY additional_emails.id;


--
-- Name: additional_senders; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE additional_senders (
    id integer NOT NULL,
    name character varying(60),
    email character varying(60)
);


ALTER TABLE public.additional_senders OWNER TO postgres;

--
-- Name: additional_senders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE additional_senders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.additional_senders_id_seq OWNER TO postgres;

--
-- Name: additional_senders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE additional_senders_id_seq OWNED BY additional_senders.id;


--
-- Name: bank_accounts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bank_accounts (
    id integer NOT NULL,
    name character varying(60)
);


ALTER TABLE public.bank_accounts OWNER TO postgres;

--
-- Name: bank_accounts_balances; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bank_accounts_balances (
    id integer NOT NULL,
    amount double precision,
    bank_accounts_id integer,
    date date
);


ALTER TABLE public.bank_accounts_balances OWNER TO postgres;

--
-- Name: bank_accounts_balances_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bank_accounts_balances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_accounts_balances_id_seq OWNER TO postgres;

--
-- Name: bank_accounts_balances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bank_accounts_balances_id_seq OWNED BY bank_accounts_balances.id;


--
-- Name: bank_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bank_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_accounts_id_seq OWNER TO postgres;

--
-- Name: bank_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bank_accounts_id_seq OWNED BY bank_accounts.id;


--
-- Name: birthdays_events; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE birthdays_events (
    id integer NOT NULL,
    date date,
    event character varying
);


ALTER TABLE public.birthdays_events OWNER TO postgres;

--
-- Name: birthdays_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE birthdays_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.birthdays_events_id_seq OWNER TO postgres;

--
-- Name: birthdays_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE birthdays_events_id_seq OWNED BY birthdays_events.id;


--
-- Name: blog; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog (
    id integer NOT NULL,
    _owner_ integer,
    text character varying,
    _timestamp_ timestamp without time zone,
    coho boolean DEFAULT true,
    family boolean DEFAULT false,
    likes character varying
);


ALTER TABLE public.blog OWNER TO postgres;

--
-- Name: blog_comments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_comments (
    id integer NOT NULL,
    blog_id integer,
    reply_to integer,
    comment character varying,
    _timestamp_ timestamp without time zone,
    _owner_ integer
);


ALTER TABLE public.blog_comments OWNER TO postgres;

--
-- Name: blog_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_comments_id_seq OWNER TO postgres;

--
-- Name: blog_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_comments_id_seq OWNED BY blog_comments.id;


--
-- Name: blog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_id_seq OWNER TO postgres;

--
-- Name: blog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_id_seq OWNED BY blog.id;


--
-- Name: budgets; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE budgets (
    id integer NOT NULL,
    account character varying(60),
    type integer,
    email character varying(60),
    initial_balance real
);


ALTER TABLE public.budgets OWNER TO postgres;

--
-- Name: budgets_amounts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE budgets_amounts (
    id integer NOT NULL,
    budgets_id integer,
    year integer,
    amount real
);


ALTER TABLE public.budgets_amounts OWNER TO postgres;

--
-- Name: budgets_amounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE budgets_amounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.budgets_amounts_id_seq OWNER TO postgres;

--
-- Name: budgets_amounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE budgets_amounts_id_seq OWNED BY budgets_amounts.id;


--
-- Name: budgets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE budgets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.budgets_id_seq OWNER TO postgres;

--
-- Name: budgets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE budgets_id_seq OWNED BY budgets.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contacts (
    id integer NOT NULL,
    families_id integer,
    first character varying(60),
    last character varying(60),
    relationship character varying(60),
    phone character varying,
    email character varying(60),
    address character varying,
    notes character varying,
    public boolean DEFAULT false,
    category character varying(60)
);


ALTER TABLE public.contacts OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contacts_id_seq OWNED BY contacts.id;


--
-- Name: decisions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE decisions (
    id integer NOT NULL,
    date date,
    title character varying(50),
    filename character varying(50)
);


ALTER TABLE public.decisions OWNER TO postgres;

--
-- Name: decisions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE decisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.decisions_id_seq OWNER TO postgres;

--
-- Name: decisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE decisions_id_seq OWNED BY decisions.id;


--
-- Name: designs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE designs (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.designs OWNER TO postgres;

--
-- Name: designs_css_files; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE designs_css_files (
    id integer NOT NULL,
    designs_id integer,
    filename character varying(30)
);


ALTER TABLE public.designs_css_files OWNER TO postgres;

--
-- Name: designs_css_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE designs_css_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.designs_css_files_id_seq OWNER TO postgres;

--
-- Name: designs_css_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE designs_css_files_id_seq OWNED BY designs_css_files.id;


--
-- Name: designs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE designs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.designs_id_seq OWNER TO postgres;

--
-- Name: designs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE designs_id_seq OWNED BY designs.id;


--
-- Name: designs_items; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE designs_items (
    id integer NOT NULL,
    designs_id integer,
    description character varying(30),
    type character varying,
    data character varying,
    _order_ integer
);


ALTER TABLE public.designs_items OWNER TO postgres;

--
-- Name: designs_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE designs_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.designs_items_id_seq OWNER TO postgres;

--
-- Name: designs_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE designs_items_id_seq OWNED BY designs_items.id;


--
-- Name: designs_js_files; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE designs_js_files (
    id integer NOT NULL,
    designs_id integer,
    filename character varying(30)
);


ALTER TABLE public.designs_js_files OWNER TO postgres;

--
-- Name: designs_js_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE designs_js_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.designs_js_files_id_seq OWNER TO postgres;

--
-- Name: designs_js_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE designs_js_files_id_seq OWNED BY designs_js_files.id;


--
-- Name: discussions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE discussions (
    id integer NOT NULL,
    title character varying(60),
    text text,
    _timestamp_ timestamp without time zone,
    _owner_ integer,
    coho boolean DEFAULT true,
    family boolean DEFAULT false,
    likes character varying
);


ALTER TABLE public.discussions OWNER TO postgres;

--
-- Name: discussions_attachments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE discussions_attachments (
    id integer NOT NULL,
    discussions_id integer,
    filename character varying
);


ALTER TABLE public.discussions_attachments OWNER TO postgres;

--
-- Name: discussions_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE discussions_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discussions_attachments_id_seq OWNER TO postgres;

--
-- Name: discussions_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE discussions_attachments_id_seq OWNED BY discussions_attachments.id;


--
-- Name: discussions_comments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE discussions_comments (
    id integer NOT NULL,
    discussions_id integer,
    reply_to integer,
    comment text,
    _timestamp_ timestamp without time zone,
    _owner_ integer
);


ALTER TABLE public.discussions_comments OWNER TO postgres;

--
-- Name: discussions_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE discussions_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discussions_comments_id_seq OWNER TO postgres;

--
-- Name: discussions_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE discussions_comments_id_seq OWNED BY discussions_comments.id;


--
-- Name: discussions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE discussions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discussions_id_seq OWNER TO postgres;

--
-- Name: discussions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE discussions_id_seq OWNED BY discussions.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE documents (
    id integer NOT NULL,
    filename character varying(60),
    title character varying(60),
    type character varying,
    url boolean DEFAULT false,
    groups_id integer,
    show_on_main_docs_page boolean DEFAULT true,
    _timestamp_ timestamp without time zone,
    coho boolean DEFAULT true,
    family boolean DEFAULT false,
    likes character varying
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- Name: documents_comments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE documents_comments (
    id integer NOT NULL,
    documents_id integer,
    reply_to integer,
    comment character varying,
    _timestamp_ timestamp without time zone,
    _owner_ integer
);


ALTER TABLE public.documents_comments OWNER TO postgres;

--
-- Name: documents_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE documents_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_comments_id_seq OWNER TO postgres;

--
-- Name: documents_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE documents_comments_id_seq OWNED BY documents_comments.id;


--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_id_seq OWNER TO postgres;

--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE documents_id_seq OWNED BY documents.id;


--
-- Name: documents_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE documents_types (
    id integer NOT NULL,
    text character varying
);


ALTER TABLE public.documents_types OWNER TO postgres;

--
-- Name: documents_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE documents_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_types_id_seq OWNER TO postgres;

--
-- Name: documents_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE documents_types_id_seq OWNED BY documents_types.id;


--
-- Name: equipment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE equipment (
    id integer NOT NULL,
    item character varying(60),
    location character varying,
    notes character varying
);


ALTER TABLE public.equipment OWNER TO postgres;

--
-- Name: equipment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE equipment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.equipment_id_seq OWNER TO postgres;

--
-- Name: equipment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE equipment_id_seq OWNED BY equipment.id;


--
-- Name: families; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE families (
    id integer NOT NULL,
    name character varying(30),
    contact integer,
    cm_account_active boolean DEFAULT true,
    meal_work_exempt boolean DEFAULT false,
    homes_id integer,
    active boolean DEFAULT true,
    bio character varying
);


ALTER TABLE public.families OWNER TO postgres;

--
-- Name: families_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE families_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.families_id_seq OWNER TO postgres;

--
-- Name: families_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE families_id_seq OWNED BY families.id;


--
-- Name: families_pictures; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE families_pictures (
    id integer NOT NULL,
    families_id integer,
    picture character varying
);


ALTER TABLE public.families_pictures OWNER TO postgres;

--
-- Name: families_pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE families_pictures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.families_pictures_id_seq OWNER TO postgres;

--
-- Name: families_pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE families_pictures_id_seq OWNED BY families_pictures.id;


--
-- Name: fowl_events; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fowl_events (
    id integer NOT NULL,
    date date,
    _owner_ integer,
    repeat character varying,
    end_date date,
    event character varying,
    _timestamp_ timestamp without time zone
);


ALTER TABLE public.fowl_events OWNER TO postgres;

--
-- Name: fowl_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fowl_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fowl_events_id_seq OWNER TO postgres;

--
-- Name: fowl_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fowl_events_id_seq OWNED BY fowl_events.id;


--
-- Name: fowl_events_reminders; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fowl_events_reminders (
    id integer NOT NULL,
    fowl_events_id integer,
    num_days integer,
    note text,
    email character varying(60),
    _owner_ integer
);


ALTER TABLE public.fowl_events_reminders OWNER TO postgres;

--
-- Name: fowl_events_reminders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fowl_events_reminders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fowl_events_reminders_id_seq OWNER TO postgres;

--
-- Name: fowl_events_reminders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fowl_events_reminders_id_seq OWNED BY fowl_events_reminders.id;


--
-- Name: group_documents; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE group_documents (
    id integer NOT NULL,
    filename character varying(60),
    groups_id integer,
    title character varying(60),
    type character varying,
    url boolean DEFAULT false
);


ALTER TABLE public.group_documents OWNER TO postgres;

--
-- Name: group_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE group_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_documents_id_seq OWNER TO postgres;

--
-- Name: group_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE group_documents_id_seq OWNED BY group_documents.id;


--
-- Name: group_links; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE group_links (
    id integer NOT NULL,
    groups_id integer,
    title character varying(60),
    url text
);


ALTER TABLE public.group_links OWNER TO postgres;

--
-- Name: group_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE group_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_links_id_seq OWNER TO postgres;

--
-- Name: group_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE group_links_id_seq OWNED BY group_links.id;


--
-- Name: group_minutes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE group_minutes (
    id integer NOT NULL,
    groups_id integer,
    date date,
    summary text,
    text character varying,
    _timestamp_ timestamp without time zone,
    _owner_ integer
);


ALTER TABLE public.group_minutes OWNER TO postgres;

--
-- Name: group_minutes_attachments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE group_minutes_attachments (
    id integer NOT NULL,
    group_minutes_id integer,
    filename character varying
);


ALTER TABLE public.group_minutes_attachments OWNER TO postgres;

--
-- Name: group_minutes_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE group_minutes_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_minutes_attachments_id_seq OWNER TO postgres;

--
-- Name: group_minutes_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE group_minutes_attachments_id_seq OWNED BY group_minutes_attachments.id;


--
-- Name: group_minutes_comments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE group_minutes_comments (
    id integer NOT NULL,
    group_minutes_id integer,
    reply_to integer,
    comment text,
    _timestamp_ timestamp without time zone,
    _owner_ integer
);


ALTER TABLE public.group_minutes_comments OWNER TO postgres;

--
-- Name: group_minutes_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE group_minutes_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_minutes_comments_id_seq OWNER TO postgres;

--
-- Name: group_minutes_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE group_minutes_comments_id_seq OWNED BY group_minutes_comments.id;


--
-- Name: group_minutes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE group_minutes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_minutes_id_seq OWNER TO postgres;

--
-- Name: group_minutes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE group_minutes_id_seq OWNED BY group_minutes.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE groups (
    id integer NOT NULL,
    name character varying(60),
    mandate character varying(60),
    convener integer,
    calendar boolean DEFAULT false,
    self_joining boolean DEFAULT true,
    active boolean DEFAULT true,
    calendar_public boolean DEFAULT false
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: guest_room_events; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE guest_room_events (
    id integer NOT NULL,
    date date,
    _owner_ integer,
    repeat character varying,
    end_date date,
    event character varying,
    invoiced boolean DEFAULT false,
    _timestamp_ timestamp without time zone
);


ALTER TABLE public.guest_room_events OWNER TO postgres;

--
-- Name: guest_room_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE guest_room_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guest_room_events_id_seq OWNER TO postgres;

--
-- Name: guest_room_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE guest_room_events_id_seq OWNED BY guest_room_events.id;


--
-- Name: help; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE help (
    id integer NOT NULL,
    category character varying(20),
    title character varying(60),
    text text
);


ALTER TABLE public.help OWNER TO postgres;

--
-- Name: help_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE help_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.help_id_seq OWNER TO postgres;

--
-- Name: help_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE help_id_seq OWNED BY help.id;


--
-- Name: homes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE homes (
    id integer NOT NULL,
    number character varying(3),
    units_id integer,
    pays_hoa integer,
    pays_water integer
);


ALTER TABLE public.homes OWNER TO postgres;

--
-- Name: homes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE homes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homes_id_seq OWNER TO postgres;

--
-- Name: homes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE homes_id_seq OWNED BY homes.id;


--
-- Name: lostfound; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lostfound (
    id integer NOT NULL,
    what character(5),
    item character(30),
    contact character(20),
    date date
);


ALTER TABLE public.lostfound OWNER TO postgres;

--
-- Name: lostfound_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lostfound_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lostfound_id_seq OWNER TO postgres;

--
-- Name: lostfound_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lostfound_id_seq OWNED BY lostfound.id;


--
-- Name: mail_lists; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mail_lists (
    id integer NOT NULL,
    name character varying(60),
    active boolean DEFAULT false,
    username character varying(60),
    host character varying(60),
    password character varying(30),
    store_on_disk boolean DEFAULT false,
    send_to character varying
);


ALTER TABLE public.mail_lists OWNER TO postgres;

--
-- Name: mail_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mail_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_lists_id_seq OWNER TO postgres;

--
-- Name: mail_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mail_lists_id_seq OWNED BY mail_lists.id;


--
-- Name: mail_lists_people; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mail_lists_people (
    mail_lists_id integer,
    people_id integer
);


ALTER TABLE public.mail_lists_people OWNER TO postgres;

--
-- Name: mail_queue; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mail_queue (
    id integer NOT NULL,
    text text,
    context character varying
);


ALTER TABLE public.mail_queue OWNER TO postgres;

--
-- Name: mail_queue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mail_queue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_queue_id_seq OWNER TO postgres;

--
-- Name: mail_queue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mail_queue_id_seq OWNED BY mail_queue.id;


--
-- Name: mail_queue_recipients; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mail_queue_recipients (
    id integer NOT NULL,
    mail_queue_id integer,
    email text
);


ALTER TABLE public.mail_queue_recipients OWNER TO postgres;

--
-- Name: mail_queue_recipients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mail_queue_recipients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_queue_recipients_id_seq OWNER TO postgres;

--
-- Name: mail_queue_recipients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mail_queue_recipients_id_seq OWNED BY mail_queue_recipients.id;


--
-- Name: main_calendar_events; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE main_calendar_events (
    id integer NOT NULL,
    date date,
    _owner_ integer,
    repeat character varying,
    end_date date,
    category character varying,
    end_time time without time zone,
    event character varying,
    start_time time without time zone,
    register_people boolean DEFAULT false,
    main_calendar_events_locations_id integer,
    _timestamp_ timestamp without time zone
);


ALTER TABLE public.main_calendar_events OWNER TO postgres;

--
-- Name: main_calendar_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE main_calendar_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_calendar_events_id_seq OWNER TO postgres;

--
-- Name: main_calendar_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE main_calendar_events_id_seq OWNED BY main_calendar_events.id;


--
-- Name: main_calendar_events_locations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE main_calendar_events_locations (
    id integer NOT NULL,
    text character varying(30)
);


ALTER TABLE public.main_calendar_events_locations OWNER TO postgres;

--
-- Name: main_calendar_events_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE main_calendar_events_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_calendar_events_locations_id_seq OWNER TO postgres;

--
-- Name: main_calendar_events_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE main_calendar_events_locations_id_seq OWNED BY main_calendar_events_locations.id;


--
-- Name: main_calendar_events_registrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE main_calendar_events_registrations (
    id integer NOT NULL,
    main_calendar_events_id integer,
    person integer
);


ALTER TABLE public.main_calendar_events_registrations OWNER TO postgres;

--
-- Name: main_calendar_events_registrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE main_calendar_events_registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_calendar_events_registrations_id_seq OWNER TO postgres;

--
-- Name: main_calendar_events_registrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE main_calendar_events_registrations_id_seq OWNED BY main_calendar_events_registrations.id;


--
-- Name: main_calendar_events_reminders; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE main_calendar_events_reminders (
    id integer NOT NULL,
    main_calendar_events_id integer,
    num_days integer,
    note text,
    email character varying(60),
    _owner_ integer,
    last_sent date
);


ALTER TABLE public.main_calendar_events_reminders OWNER TO postgres;

--
-- Name: main_calendar_events_reminders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE main_calendar_events_reminders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_calendar_events_reminders_id_seq OWNER TO postgres;

--
-- Name: main_calendar_events_reminders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE main_calendar_events_reminders_id_seq OWNED BY main_calendar_events_reminders.id;


--
-- Name: meal_events; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE meal_events (
    id integer NOT NULL,
    date date,
    additional_cooks integer,
    adult_budget_amount real,
    adult_price real,
    assist integer,
    clean1 integer,
    clean2 integer,
    kid_budget_amount real,
    kid_price real,
    closed boolean DEFAULT false,
    max_people integer,
    menu character varying(80),
    _owner_ integer,
    repeat character varying,
    end_date date,
    setup integer,
    start_time time without time zone,
    invoiced boolean DEFAULT false,
    under_five_budget_amount real,
    under_five_price real
);


ALTER TABLE public.meal_events OWNER TO postgres;

--
-- Name: meal_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE meal_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meal_events_id_seq OWNER TO postgres;

--
-- Name: meal_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE meal_events_id_seq OWNED BY meal_events.id;


--
-- Name: meal_people; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE meal_people (
    id integer NOT NULL,
    meal_events_id integer,
    num_adults integer,
    num_kids integer,
    num_under_fives integer,
    dish character varying(30),
    families_id integer,
    notes character varying
);


ALTER TABLE public.meal_people OWNER TO postgres;

--
-- Name: meal_people_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE meal_people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meal_people_id_seq OWNER TO postgres;

--
-- Name: meal_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE meal_people_id_seq OWNED BY meal_people.id;


--
-- Name: meeting_people; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE meeting_people (
    id integer NOT NULL,
    meetings_id integer,
    people_id integer,
    days character varying
);


ALTER TABLE public.meeting_people OWNER TO postgres;

--
-- Name: meeting_people_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE meeting_people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meeting_people_id_seq OWNER TO postgres;

--
-- Name: meeting_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE meeting_people_id_seq OWNED BY meeting_people.id;


--
-- Name: meetings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE meetings (
    id integer NOT NULL,
    title character varying(60),
    days character varying,
    _owner_ integer
);


ALTER TABLE public.meetings OWNER TO postgres;

--
-- Name: meetings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE meetings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meetings_id_seq OWNER TO postgres;

--
-- Name: meetings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE meetings_id_seq OWNED BY meetings.id;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE menu (
    id integer NOT NULL,
    name character varying(30),
    _order_ integer
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: menu_choices; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE menu_choices (
    id integer NOT NULL,
    name character varying(30),
    url character varying(60),
    role character varying,
    on_main_menu boolean DEFAULT true,
    designs_id integer
);


ALTER TABLE public.menu_choices OWNER TO postgres;

--
-- Name: menu_choices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menu_choices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_choices_id_seq OWNER TO postgres;

--
-- Name: menu_choices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE menu_choices_id_seq OWNED BY menu_choices.id;


--
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_id_seq OWNER TO postgres;

--
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE menu_id_seq OWNED BY menu.id;


--
-- Name: menu_items; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE menu_items (
    id integer NOT NULL,
    people_id integer,
    name character varying(30),
    _order_ integer
);


ALTER TABLE public.menu_items OWNER TO postgres;

--
-- Name: menu_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menu_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_items_id_seq OWNER TO postgres;

--
-- Name: menu_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE menu_items_id_seq OWNED BY menu_items.id;


--
-- Name: minutes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE minutes (
    id integer NOT NULL,
    date date,
    summary character varying,
    text character varying,
    _timestamp_ timestamp without time zone,
    _owner_ integer
);


ALTER TABLE public.minutes OWNER TO postgres;

--
-- Name: minutes_attachments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE minutes_attachments (
    id integer NOT NULL,
    minutes_id integer,
    filename character varying
);


ALTER TABLE public.minutes_attachments OWNER TO postgres;

--
-- Name: minutes_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE minutes_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.minutes_attachments_id_seq OWNER TO postgres;

--
-- Name: minutes_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE minutes_attachments_id_seq OWNED BY minutes_attachments.id;


--
-- Name: minutes_comments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE minutes_comments (
    id integer NOT NULL,
    minutes_id integer,
    reply_to integer,
    comment text,
    _timestamp_ timestamp without time zone,
    _owner_ integer
);


ALTER TABLE public.minutes_comments OWNER TO postgres;

--
-- Name: minutes_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE minutes_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.minutes_comments_id_seq OWNER TO postgres;

--
-- Name: minutes_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE minutes_comments_id_seq OWNED BY minutes_comments.id;


--
-- Name: minutes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE minutes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.minutes_id_seq OWNER TO postgres;

--
-- Name: minutes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE minutes_id_seq OWNED BY minutes.id;


--
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movies (
    id integer NOT NULL,
    title character varying,
    genre character varying,
    format character varying,
    owner character varying,
    on_loan_to character varying,
    comments character varying
);


ALTER TABLE public.movies OWNER TO postgres;

--
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE movies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_id_seq OWNER TO postgres;

--
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE movies_id_seq OWNED BY movies.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE news (
    id integer NOT NULL,
    provider character varying,
    item_id integer,
    _owner_ integer,
    _timestamp_ timestamp without time zone,
    coho boolean DEFAULT false,
    family boolean DEFAULT false,
    last_update timestamp without time zone
);


ALTER TABLE public.news OWNER TO postgres;

--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO postgres;

--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE news_id_seq OWNED BY news.id;


--
-- Name: notes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE notes (
    id integer NOT NULL,
    families_id integer,
    title character varying(60),
    note bytea,
    category character varying(30),
    public boolean DEFAULT false
);


ALTER TABLE public.notes OWNER TO postgres;

--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_id_seq OWNER TO postgres;

--
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE notes_id_seq OWNED BY notes.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pages (
    id integer NOT NULL,
    name character varying(30),
    designs_id integer,
    on_main_menu boolean DEFAULT false,
    role character varying,
    url character varying
);


ALTER TABLE public.pages OWNER TO postgres;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO postgres;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pages_id_seq OWNED BY pages.id;


--
-- Name: pages_items; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pages_items (
    id integer NOT NULL,
    pages_id integer,
    description character varying(30),
    type character varying,
    data character varying,
    _order_ integer
);


ALTER TABLE public.pages_items OWNER TO postgres;

--
-- Name: pages_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pages_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_items_id_seq OWNER TO postgres;

--
-- Name: pages_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pages_items_id_seq OWNED BY pages_items.id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE people (
    id integer NOT NULL,
    first character varying(30),
    last character varying(30),
    email character varying(60),
    user_name character varying(30),
    password character varying,
    active boolean DEFAULT false,
    address character varying,
    birthday date,
    coho boolean DEFAULT false,
    families_id integer,
    middle character varying(30),
    phone character varying,
    theme character varying,
    resident boolean DEFAULT false,
    last_login timestamp without time zone,
    owner boolean DEFAULT false,
    picture character varying,
    bio character varying
);


ALTER TABLE public.people OWNER TO postgres;

--
-- Name: people_bio_pictures; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE people_bio_pictures (
    id integer NOT NULL,
    people_id integer,
    filename character varying
);


ALTER TABLE public.people_bio_pictures OWNER TO postgres;

--
-- Name: people_bio_pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE people_bio_pictures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.people_bio_pictures_id_seq OWNER TO postgres;

--
-- Name: people_bio_pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE people_bio_pictures_id_seq OWNED BY people_bio_pictures.id;


--
-- Name: people_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE people_groups (
    people_id integer,
    groups_id integer
);


ALTER TABLE public.people_groups OWNER TO postgres;

--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.people_id_seq OWNER TO postgres;

--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE people_id_seq OWNED BY people.id;


--
-- Name: people_mail_lists; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE people_mail_lists (
    id integer NOT NULL,
    people_id integer,
    name character varying,
    people_ids text
);


ALTER TABLE public.people_mail_lists OWNER TO postgres;

--
-- Name: people_mail_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE people_mail_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.people_mail_lists_id_seq OWNER TO postgres;

--
-- Name: people_mail_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE people_mail_lists_id_seq OWNED BY people_mail_lists.id;


--
-- Name: pictures; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pictures (
    id integer NOT NULL,
    file character varying(30),
    caption character varying(60),
    _owner_ integer,
    _timestamp_ timestamp without time zone,
    coho boolean DEFAULT false,
    family boolean DEFAULT false,
    width integer,
    height integer,
    likes character varying
);


ALTER TABLE public.pictures OWNER TO postgres;

--
-- Name: pictures_comments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pictures_comments (
    id integer NOT NULL,
    pictures_id integer,
    reply_to integer,
    comment text,
    _timestamp_ timestamp without time zone,
    _owner_ integer
);


ALTER TABLE public.pictures_comments OWNER TO postgres;

--
-- Name: pictures_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pictures_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pictures_comments_id_seq OWNER TO postgres;

--
-- Name: pictures_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pictures_comments_id_seq OWNED BY pictures_comments.id;


--
-- Name: pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pictures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pictures_id_seq OWNER TO postgres;

--
-- Name: pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pictures_id_seq OWNED BY pictures.id;


--
-- Name: pictures_pictures_tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pictures_pictures_tags (
    pictures_id integer,
    pictures_tags_id integer
);


ALTER TABLE public.pictures_pictures_tags OWNER TO postgres;

--
-- Name: pictures_tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pictures_tags (
    id integer NOT NULL,
    tag text
);


ALTER TABLE public.pictures_tags OWNER TO postgres;

--
-- Name: pictures_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pictures_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pictures_tags_id_seq OWNER TO postgres;

--
-- Name: pictures_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pictures_tags_id_seq OWNED BY pictures_tags.id;


--
-- Name: qb_balances; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE qb_balances (
    id integer NOT NULL,
    name character varying(60),
    amount real,
    year integer
);


ALTER TABLE public.qb_balances OWNER TO postgres;

--
-- Name: qb_balances_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE qb_balances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qb_balances_id_seq OWNER TO postgres;

--
-- Name: qb_balances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE qb_balances_id_seq OWNED BY qb_balances.id;


--
-- Name: qb_transactions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE qb_transactions (
    id integer NOT NULL,
    date date,
    description character varying,
    amount real,
    balance real,
    families_id integer,
    budgets_id integer,
    type character varying
);


ALTER TABLE public.qb_transactions OWNER TO postgres;

--
-- Name: qb_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE qb_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qb_transactions_id_seq OWNER TO postgres;

--
-- Name: qb_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE qb_transactions_id_seq OWNED BY qb_transactions.id;


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE recipes (
    id integer NOT NULL,
    families_id integer,
    title character varying(60),
    ingredients text,
    directions text,
    category character varying(30),
    coho boolean,
    family boolean,
    _owner_ integer,
    likes character varying
);


ALTER TABLE public.recipes OWNER TO postgres;

--
-- Name: recipes_comments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE recipes_comments (
    id integer NOT NULL,
    recipes_id integer,
    reply_to integer,
    comment character varying,
    _timestamp_ timestamp without time zone,
    _owner_ integer
);


ALTER TABLE public.recipes_comments OWNER TO postgres;

--
-- Name: recipes_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE recipes_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_comments_id_seq OWNER TO postgres;

--
-- Name: recipes_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE recipes_comments_id_seq OWNED BY recipes_comments.id;


--
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE recipes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_id_seq OWNER TO postgres;

--
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE recipes_id_seq OWNED BY recipes.id;


--
-- Name: recommendations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE recommendations (
    id integer NOT NULL,
    recommendation character varying(60),
    recommended_by character varying(30),
    comments character varying
);


ALTER TABLE public.recommendations OWNER TO postgres;

--
-- Name: recommendations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE recommendations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recommendations_id_seq OWNER TO postgres;

--
-- Name: recommendations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE recommendations_id_seq OWNED BY recommendations.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reviews (
    id integer NOT NULL,
    title character varying(60),
    category character varying(30),
    review character varying,
    _owner_ integer,
    coho boolean DEFAULT false,
    family boolean DEFAULT false,
    likes character varying
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_comments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reviews_comments (
    id integer NOT NULL,
    reviews_id integer,
    reply_to integer,
    comment character varying,
    _timestamp_ timestamp without time zone,
    _owner_ integer
);


ALTER TABLE public.reviews_comments OWNER TO postgres;

--
-- Name: reviews_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reviews_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_comments_id_seq OWNER TO postgres;

--
-- Name: reviews_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reviews_comments_id_seq OWNED BY reviews_comments.id;


--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reviews_id_seq OWNED BY reviews.id;


--
-- Name: subscribers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE subscribers (
    id integer NOT NULL,
    mail_lists_id integer,
    email character varying(60)
);


ALTER TABLE public.subscribers OWNER TO postgres;

--
-- Name: subscribers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE subscribers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscribers_id_seq OWNER TO postgres;

--
-- Name: subscribers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE subscribers_id_seq OWNED BY subscribers.id;


--
-- Name: survey_questions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE survey_questions (
    id integer NOT NULL,
    surveys_id integer,
    question text,
    answer_type character varying,
    type_data character varying,
    required boolean,
    pre_text text,
    post_text text,
    _order_ integer,
    _timestamp_ timestamp without time zone
);


ALTER TABLE public.survey_questions OWNER TO postgres;

--
-- Name: survey_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE survey_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.survey_questions_id_seq OWNER TO postgres;

--
-- Name: survey_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE survey_questions_id_seq OWNED BY survey_questions.id;


--
-- Name: surveys; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE surveys (
    id integer NOT NULL,
    title character varying(60),
    description text,
    number_questions boolean,
    one_answer boolean,
    show_answers boolean,
    show_names boolean,
    show_title boolean,
    _owner_ integer
);


ALTER TABLE public.surveys OWNER TO postgres;

--
-- Name: surveys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE surveys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.surveys_id_seq OWNER TO postgres;

--
-- Name: surveys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE surveys_id_seq OWNED BY surveys.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tasks (
    id integer NOT NULL,
    description character varying,
    notes character varying,
    num_people_needed character varying(6),
    workers character varying,
    _owner_ integer
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO postgres;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tasks_id_seq OWNED BY tasks.id;


--
-- Name: todos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE todos (
    id integer NOT NULL,
    families_id integer,
    task character varying(60),
    notes text,
    assigned_to integer,
    project character varying(30)
);


ALTER TABLE public.todos OWNER TO postgres;

--
-- Name: todos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE todos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.todos_id_seq OWNER TO postgres;

--
-- Name: todos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE todos_id_seq OWNED BY todos.id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE transactions (
    id integer NOT NULL,
    accounts_id integer,
    amount double precision,
    date date,
    description character varying,
    families_id integer,
    num character varying,
    reconciled boolean DEFAULT false,
    type character varying,
    transactions_id integer
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO postgres;

--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transactions_id_seq OWNED BY transactions.id;


--
-- Name: units; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE units (
    id integer NOT NULL,
    unit character varying(30),
    hoa_dues real
);


ALTER TABLE public.units OWNER TO postgres;

--
-- Name: units_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.units_id_seq OWNER TO postgres;

--
-- Name: units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE units_id_seq OWNED BY units.id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_roles (
    id integer NOT NULL,
    people_id integer,
    user_name character varying(20),
    role character varying(30)
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_roles_id_seq OWNER TO postgres;

--
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_roles_id_seq OWNED BY user_roles.id;


--
-- Name: values; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "values" (
    id integer NOT NULL,
    value text
);


ALTER TABLE public."values" OWNER TO postgres;

--
-- Name: values_decisions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE values_decisions (
    values_id integer,
    decisions_id integer
);


ALTER TABLE public.values_decisions OWNER TO postgres;

--
-- Name: values_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.values_id_seq OWNER TO postgres;

--
-- Name: values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE values_id_seq OWNED BY "values".id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY _columns_ ALTER COLUMN id SET DEFAULT nextval('_columns__id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY _modules_ ALTER COLUMN id SET DEFAULT nextval('_modules__id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY _relationship_defs_ ALTER COLUMN id SET DEFAULT nextval('_relationship_defs__id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY _roles_ ALTER COLUMN id SET DEFAULT nextval('_roles__id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY _settings_ ALTER COLUMN id SET DEFAULT nextval('_settings__id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY _views_ ALTER COLUMN id SET DEFAULT nextval('_views__id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts ALTER COLUMN id SET DEFAULT nextval('accounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts_budgets ALTER COLUMN id SET DEFAULT nextval('accounts_budgets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY additional_emails ALTER COLUMN id SET DEFAULT nextval('additional_emails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY additional_senders ALTER COLUMN id SET DEFAULT nextval('additional_senders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bank_accounts ALTER COLUMN id SET DEFAULT nextval('bank_accounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bank_accounts_balances ALTER COLUMN id SET DEFAULT nextval('bank_accounts_balances_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY birthdays_events ALTER COLUMN id SET DEFAULT nextval('birthdays_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog ALTER COLUMN id SET DEFAULT nextval('blog_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_comments ALTER COLUMN id SET DEFAULT nextval('blog_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY budgets ALTER COLUMN id SET DEFAULT nextval('budgets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY budgets_amounts ALTER COLUMN id SET DEFAULT nextval('budgets_amounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacts ALTER COLUMN id SET DEFAULT nextval('contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY decisions ALTER COLUMN id SET DEFAULT nextval('decisions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY designs ALTER COLUMN id SET DEFAULT nextval('designs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY designs_css_files ALTER COLUMN id SET DEFAULT nextval('designs_css_files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY designs_items ALTER COLUMN id SET DEFAULT nextval('designs_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY designs_js_files ALTER COLUMN id SET DEFAULT nextval('designs_js_files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY discussions ALTER COLUMN id SET DEFAULT nextval('discussions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY discussions_attachments ALTER COLUMN id SET DEFAULT nextval('discussions_attachments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY discussions_comments ALTER COLUMN id SET DEFAULT nextval('discussions_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documents ALTER COLUMN id SET DEFAULT nextval('documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documents_comments ALTER COLUMN id SET DEFAULT nextval('documents_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documents_types ALTER COLUMN id SET DEFAULT nextval('documents_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY equipment ALTER COLUMN id SET DEFAULT nextval('equipment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY families ALTER COLUMN id SET DEFAULT nextval('families_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY families_pictures ALTER COLUMN id SET DEFAULT nextval('families_pictures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fowl_events ALTER COLUMN id SET DEFAULT nextval('fowl_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fowl_events_reminders ALTER COLUMN id SET DEFAULT nextval('fowl_events_reminders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_documents ALTER COLUMN id SET DEFAULT nextval('group_documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_links ALTER COLUMN id SET DEFAULT nextval('group_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_minutes ALTER COLUMN id SET DEFAULT nextval('group_minutes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_minutes_attachments ALTER COLUMN id SET DEFAULT nextval('group_minutes_attachments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_minutes_comments ALTER COLUMN id SET DEFAULT nextval('group_minutes_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY guest_room_events ALTER COLUMN id SET DEFAULT nextval('guest_room_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY help ALTER COLUMN id SET DEFAULT nextval('help_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY homes ALTER COLUMN id SET DEFAULT nextval('homes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lostfound ALTER COLUMN id SET DEFAULT nextval('lostfound_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mail_lists ALTER COLUMN id SET DEFAULT nextval('mail_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mail_queue ALTER COLUMN id SET DEFAULT nextval('mail_queue_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mail_queue_recipients ALTER COLUMN id SET DEFAULT nextval('mail_queue_recipients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY main_calendar_events ALTER COLUMN id SET DEFAULT nextval('main_calendar_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY main_calendar_events_locations ALTER COLUMN id SET DEFAULT nextval('main_calendar_events_locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY main_calendar_events_registrations ALTER COLUMN id SET DEFAULT nextval('main_calendar_events_registrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY main_calendar_events_reminders ALTER COLUMN id SET DEFAULT nextval('main_calendar_events_reminders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY meal_events ALTER COLUMN id SET DEFAULT nextval('meal_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY meal_people ALTER COLUMN id SET DEFAULT nextval('meal_people_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY meeting_people ALTER COLUMN id SET DEFAULT nextval('meeting_people_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY meetings ALTER COLUMN id SET DEFAULT nextval('meetings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu ALTER COLUMN id SET DEFAULT nextval('menu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu_choices ALTER COLUMN id SET DEFAULT nextval('menu_choices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu_items ALTER COLUMN id SET DEFAULT nextval('menu_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY minutes ALTER COLUMN id SET DEFAULT nextval('minutes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY minutes_attachments ALTER COLUMN id SET DEFAULT nextval('minutes_attachments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY minutes_comments ALTER COLUMN id SET DEFAULT nextval('minutes_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movies ALTER COLUMN id SET DEFAULT nextval('movies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news ALTER COLUMN id SET DEFAULT nextval('news_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notes ALTER COLUMN id SET DEFAULT nextval('notes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pages ALTER COLUMN id SET DEFAULT nextval('pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pages_items ALTER COLUMN id SET DEFAULT nextval('pages_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY people ALTER COLUMN id SET DEFAULT nextval('people_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY people_bio_pictures ALTER COLUMN id SET DEFAULT nextval('people_bio_pictures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY people_mail_lists ALTER COLUMN id SET DEFAULT nextval('people_mail_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pictures ALTER COLUMN id SET DEFAULT nextval('pictures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pictures_comments ALTER COLUMN id SET DEFAULT nextval('pictures_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pictures_tags ALTER COLUMN id SET DEFAULT nextval('pictures_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY qb_balances ALTER COLUMN id SET DEFAULT nextval('qb_balances_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY qb_transactions ALTER COLUMN id SET DEFAULT nextval('qb_transactions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recipes ALTER COLUMN id SET DEFAULT nextval('recipes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recipes_comments ALTER COLUMN id SET DEFAULT nextval('recipes_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recommendations ALTER COLUMN id SET DEFAULT nextval('recommendations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reviews ALTER COLUMN id SET DEFAULT nextval('reviews_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reviews_comments ALTER COLUMN id SET DEFAULT nextval('reviews_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subscribers ALTER COLUMN id SET DEFAULT nextval('subscribers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY survey_questions ALTER COLUMN id SET DEFAULT nextval('survey_questions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY surveys ALTER COLUMN id SET DEFAULT nextval('surveys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasks ALTER COLUMN id SET DEFAULT nextval('tasks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY todos ALTER COLUMN id SET DEFAULT nextval('todos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transactions ALTER COLUMN id SET DEFAULT nextval('transactions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY units ALTER COLUMN id SET DEFAULT nextval('units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_roles ALTER COLUMN id SET DEFAULT nextval('user_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "values" ALTER COLUMN id SET DEFAULT nextval('values_id_seq'::regclass);


--
-- Data for Name: _columns_; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY _columns_ (id, _views__id, name, display_name, align, display_length, is_hidden, is_read_only, is_required, show_previous, type, type_args) FROM stdin;
\.


--
-- Name: _columns__id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('_columns__id_seq', 1, false);


--
-- Data for Name: _modules_; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY _modules_ (id, class, name, json) FROM stdin;
\.


--
-- Name: _modules__id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('_modules__id_seq', 1, false);


--
-- Data for Name: _relationship_defs_; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY _relationship_defs_ (id, _views__id, many_view_def_name, many_table_column) FROM stdin;
\.


--
-- Name: _relationship_defs__id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('_relationship_defs__id_seq', 1, false);


--
-- Data for Name: _roles_; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY _roles_ (id, role) FROM stdin;
1	coho
2	people
3	groups
4	mail
5	docs
35	accounting
36	cm account manager
37	hoa history
38	site
\.


--
-- Name: _roles__id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('_roles__id_seq', 38, true);


--
-- Data for Name: _settings_; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY _settings_ (id, name, value) FROM stdin;
1	backup cmd	
2	backup email	
3	contact email	
4	contact name	
35	smtp username	zenlunatics_smtp
36	smtp password	zl_smtp_135
37	smtp	smtp.webfaction.com
\.


--
-- Name: _settings__id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('_settings__id_seq', 37, true);


--
-- Data for Name: _views_; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY _views_ (id, name, allow_quick_edit, alternate_rows, column_names_form, column_names_form_table, column_names_table, default_order_by, form_width, forms_use_submit_buttons, "from", record_name, row_window_size, show_filter_link, table_align, table_width, add_button_text, show_num_records) FROM stdin;
\.


--
-- Name: _views__id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('_views__id_seq', 1, false);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY accounts (id, name, type, email, initial_balance, ongoing_account) FROM stdin;
\.


--
-- Data for Name: accounts_budgets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY accounts_budgets (id, accounts_id, year, amount) FROM stdin;
\.


--
-- Name: accounts_budgets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('accounts_budgets_id_seq', 1, false);


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('accounts_id_seq', 1, false);


--
-- Data for Name: additional_emails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY additional_emails (id, people_id, email) FROM stdin;
\.


--
-- Name: additional_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('additional_emails_id_seq', 1, false);


--
-- Data for Name: additional_senders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY additional_senders (id, name, email) FROM stdin;
\.


--
-- Name: additional_senders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('additional_senders_id_seq', 1, false);


--
-- Data for Name: bank_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bank_accounts (id, name) FROM stdin;
\.


--
-- Data for Name: bank_accounts_balances; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bank_accounts_balances (id, amount, bank_accounts_id, date) FROM stdin;
\.


--
-- Name: bank_accounts_balances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bank_accounts_balances_id_seq', 1, false);


--
-- Name: bank_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bank_accounts_id_seq', 1, false);


--
-- Data for Name: birthdays_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY birthdays_events (id, date, event) FROM stdin;
\.


--
-- Name: birthdays_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('birthdays_events_id_seq', 1, false);


--
-- Data for Name: blog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog (id, _owner_, text, _timestamp_, coho, family, likes) FROM stdin;
\.


--
-- Data for Name: blog_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_comments (id, blog_id, reply_to, comment, _timestamp_, _owner_) FROM stdin;
\.


--
-- Name: blog_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_comments_id_seq', 1, false);


--
-- Name: blog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_id_seq', 1, false);


--
-- Data for Name: budgets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY budgets (id, account, type, email, initial_balance) FROM stdin;
\.


--
-- Data for Name: budgets_amounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY budgets_amounts (id, budgets_id, year, amount) FROM stdin;
\.


--
-- Name: budgets_amounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('budgets_amounts_id_seq', 1, false);


--
-- Name: budgets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('budgets_id_seq', 1, false);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contacts (id, families_id, first, last, relationship, phone, email, address, notes, public, category) FROM stdin;
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contacts_id_seq', 1, false);


--
-- Data for Name: decisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY decisions (id, date, title, filename) FROM stdin;
\.


--
-- Name: decisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('decisions_id_seq', 1, false);


--
-- Data for Name: designs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY designs (id, name) FROM stdin;
\.


--
-- Data for Name: designs_css_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY designs_css_files (id, designs_id, filename) FROM stdin;
\.


--
-- Name: designs_css_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('designs_css_files_id_seq', 1, false);


--
-- Name: designs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('designs_id_seq', 1, false);


--
-- Data for Name: designs_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY designs_items (id, designs_id, description, type, data, _order_) FROM stdin;
\.


--
-- Name: designs_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('designs_items_id_seq', 1, false);


--
-- Data for Name: designs_js_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY designs_js_files (id, designs_id, filename) FROM stdin;
\.


--
-- Name: designs_js_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('designs_js_files_id_seq', 1, false);


--
-- Data for Name: discussions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY discussions (id, title, text, _timestamp_, _owner_, coho, family, likes) FROM stdin;
\.


--
-- Data for Name: discussions_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY discussions_attachments (id, discussions_id, filename) FROM stdin;
\.


--
-- Name: discussions_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('discussions_attachments_id_seq', 1, false);


--
-- Data for Name: discussions_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY discussions_comments (id, discussions_id, reply_to, comment, _timestamp_, _owner_) FROM stdin;
\.


--
-- Name: discussions_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('discussions_comments_id_seq', 1, false);


--
-- Name: discussions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('discussions_id_seq', 1, false);


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY documents (id, filename, title, type, url, groups_id, show_on_main_docs_page, _timestamp_, coho, family, likes) FROM stdin;
\.


--
-- Data for Name: documents_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY documents_comments (id, documents_id, reply_to, comment, _timestamp_, _owner_) FROM stdin;
\.


--
-- Name: documents_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('documents_comments_id_seq', 1, false);


--
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('documents_id_seq', 1, false);


--
-- Data for Name: documents_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY documents_types (id, text) FROM stdin;
\.


--
-- Name: documents_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('documents_types_id_seq', 1, false);


--
-- Data for Name: equipment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY equipment (id, item, location, notes) FROM stdin;
\.


--
-- Name: equipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('equipment_id_seq', 1, false);


--
-- Data for Name: families; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY families (id, name, contact, cm_account_active, meal_work_exempt, homes_id, active, bio) FROM stdin;
\.


--
-- Name: families_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('families_id_seq', 1, false);


--
-- Data for Name: families_pictures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY families_pictures (id, families_id, picture) FROM stdin;
\.


--
-- Name: families_pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('families_pictures_id_seq', 1, false);


--
-- Data for Name: fowl_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fowl_events (id, date, _owner_, repeat, end_date, event, _timestamp_) FROM stdin;
\.


--
-- Name: fowl_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fowl_events_id_seq', 1, false);


--
-- Data for Name: fowl_events_reminders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fowl_events_reminders (id, fowl_events_id, num_days, note, email, _owner_) FROM stdin;
\.


--
-- Name: fowl_events_reminders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fowl_events_reminders_id_seq', 1, false);


--
-- Data for Name: group_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY group_documents (id, filename, groups_id, title, type, url) FROM stdin;
\.


--
-- Name: group_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('group_documents_id_seq', 1, false);


--
-- Data for Name: group_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY group_links (id, groups_id, title, url) FROM stdin;
\.


--
-- Name: group_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('group_links_id_seq', 1, false);


--
-- Data for Name: group_minutes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY group_minutes (id, groups_id, date, summary, text, _timestamp_, _owner_) FROM stdin;
\.


--
-- Data for Name: group_minutes_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY group_minutes_attachments (id, group_minutes_id, filename) FROM stdin;
\.


--
-- Name: group_minutes_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('group_minutes_attachments_id_seq', 1, false);


--
-- Data for Name: group_minutes_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY group_minutes_comments (id, group_minutes_id, reply_to, comment, _timestamp_, _owner_) FROM stdin;
\.


--
-- Name: group_minutes_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('group_minutes_comments_id_seq', 1, false);


--
-- Name: group_minutes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('group_minutes_id_seq', 1, false);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY groups (id, name, mandate, convener, calendar, self_joining, active, calendar_public) FROM stdin;
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('groups_id_seq', 1, false);


--
-- Data for Name: guest_room_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY guest_room_events (id, date, _owner_, repeat, end_date, event, invoiced, _timestamp_) FROM stdin;
\.


--
-- Name: guest_room_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('guest_room_events_id_seq', 1, false);


--
-- Data for Name: help; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY help (id, category, title, text) FROM stdin;
\.


--
-- Name: help_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('help_id_seq', 1, false);


--
-- Data for Name: homes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY homes (id, number, units_id, pays_hoa, pays_water) FROM stdin;
\.


--
-- Name: homes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('homes_id_seq', 1, false);


--
-- Data for Name: lostfound; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY lostfound (id, what, item, contact, date) FROM stdin;
\.


--
-- Name: lostfound_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('lostfound_id_seq', 1, false);


--
-- Data for Name: mail_lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mail_lists (id, name, active, username, host, password, store_on_disk, send_to) FROM stdin;
\.


--
-- Name: mail_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mail_lists_id_seq', 1, false);


--
-- Data for Name: mail_lists_people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mail_lists_people (mail_lists_id, people_id) FROM stdin;
\.


--
-- Data for Name: mail_queue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mail_queue (id, text, context) FROM stdin;
\.


--
-- Name: mail_queue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mail_queue_id_seq', 1, false);


--
-- Data for Name: mail_queue_recipients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mail_queue_recipients (id, mail_queue_id, email) FROM stdin;
\.


--
-- Name: mail_queue_recipients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mail_queue_recipients_id_seq', 1, false);


--
-- Data for Name: main_calendar_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY main_calendar_events (id, date, _owner_, repeat, end_date, category, end_time, event, start_time, register_people, main_calendar_events_locations_id, _timestamp_) FROM stdin;
\.


--
-- Name: main_calendar_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('main_calendar_events_id_seq', 1, false);


--
-- Data for Name: main_calendar_events_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY main_calendar_events_locations (id, text) FROM stdin;
\.


--
-- Name: main_calendar_events_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('main_calendar_events_locations_id_seq', 1, false);


--
-- Data for Name: main_calendar_events_registrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY main_calendar_events_registrations (id, main_calendar_events_id, person) FROM stdin;
\.


--
-- Name: main_calendar_events_registrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('main_calendar_events_registrations_id_seq', 1, false);


--
-- Data for Name: main_calendar_events_reminders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY main_calendar_events_reminders (id, main_calendar_events_id, num_days, note, email, _owner_, last_sent) FROM stdin;
\.


--
-- Name: main_calendar_events_reminders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('main_calendar_events_reminders_id_seq', 1, false);


--
-- Data for Name: meal_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY meal_events (id, date, additional_cooks, adult_budget_amount, adult_price, assist, clean1, clean2, kid_budget_amount, kid_price, closed, max_people, menu, _owner_, repeat, end_date, setup, start_time, invoiced, under_five_budget_amount, under_five_price) FROM stdin;
\.


--
-- Name: meal_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('meal_events_id_seq', 1, false);


--
-- Data for Name: meal_people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY meal_people (id, meal_events_id, num_adults, num_kids, num_under_fives, dish, families_id, notes) FROM stdin;
\.


--
-- Name: meal_people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('meal_people_id_seq', 1, false);


--
-- Data for Name: meeting_people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY meeting_people (id, meetings_id, people_id, days) FROM stdin;
\.


--
-- Name: meeting_people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('meeting_people_id_seq', 1, false);


--
-- Data for Name: meetings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY meetings (id, title, days, _owner_) FROM stdin;
\.


--
-- Name: meetings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('meetings_id_seq', 1, false);


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY menu (id, name, _order_) FROM stdin;
6	Calendars	2
1	People	3
10	Groups	4
2	email	5
8	Docs	6
5	Pictures	7
3	Other	8
\.


--
-- Data for Name: menu_choices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY menu_choices (id, name, url, role, on_main_menu, designs_id) FROM stdin;
2	email	/email.jsp	\N	t	\N
4	Recipes	/recipes.jsp	\N	t	\N
5	Surveys	/surveys.jsp	\N	t	\N
6	Meeting Scheduler	/meetings.jsp	\N	t	\N
8	Pictures	/pictures.jsp	\N	t	\N
9	Calendars	/calendars.jsp	\N	t	\N
19	Docs	/documents.jsp	\N	t	\N
3	Other	\N	\N	t	\N
26	Discussions	/discussions.jsp	\N	t	\N
27	Reviews	/reviews.jsp	\N	t	\N
13	Community Equipment	/Views/equipment/page	\N	t	\N
14	Community Tasks	/Views/tasks/page	\N	t	\N
15	Lost and Found	/Views/lostfound/page	\N	t	\N
16	Movies to Share	/Views/movies/page	\N	t	\N
\.


--
-- Name: menu_choices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('menu_choices_id_seq', 27, true);


--
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('menu_id_seq', 10, true);


--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY menu_items (id, people_id, name, _order_) FROM stdin;
\.


--
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('menu_items_id_seq', 1, false);


--
-- Data for Name: minutes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY minutes (id, date, summary, text, _timestamp_, _owner_) FROM stdin;
\.


--
-- Data for Name: minutes_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY minutes_attachments (id, minutes_id, filename) FROM stdin;
\.


--
-- Name: minutes_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('minutes_attachments_id_seq', 1, false);


--
-- Data for Name: minutes_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY minutes_comments (id, minutes_id, reply_to, comment, _timestamp_, _owner_) FROM stdin;
\.


--
-- Name: minutes_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('minutes_comments_id_seq', 1, false);


--
-- Name: minutes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('minutes_id_seq', 1, false);


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY movies (id, title, genre, format, owner, on_loan_to, comments) FROM stdin;
\.


--
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('movies_id_seq', 1, false);


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY news (id, provider, item_id, _owner_, _timestamp_, coho, family, last_update) FROM stdin;
\.


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('news_id_seq', 1, false);


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY notes (id, families_id, title, note, category, public) FROM stdin;
\.


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('notes_id_seq', 1, false);


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pages (id, name, designs_id, on_main_menu, role, url) FROM stdin;
\.


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pages_id_seq', 1, false);


--
-- Data for Name: pages_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pages_items (id, pages_id, description, type, data, _order_) FROM stdin;
\.


--
-- Name: pages_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pages_items_id_seq', 1, false);


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY people (id, first, last, email, user_name, password, active, address, birthday, coho, families_id, middle, phone, theme, resident, last_login, owner, picture, bio) FROM stdin;
1	Administrator	\N	\N	admin	e1b6f00013bb86d002664316b3e95e59	f	\N	\N	f	\N	\N	\N	bootstrap	f	2015-11-28 16:44:33	f	\N	\N
\.


--
-- Data for Name: people_bio_pictures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY people_bio_pictures (id, people_id, filename) FROM stdin;
\.


--
-- Name: people_bio_pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('people_bio_pictures_id_seq', 1, false);


--
-- Data for Name: people_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY people_groups (people_id, groups_id) FROM stdin;
\.


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('people_id_seq', 2, false);


--
-- Data for Name: people_mail_lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY people_mail_lists (id, people_id, name, people_ids) FROM stdin;
\.


--
-- Name: people_mail_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('people_mail_lists_id_seq', 1, false);


--
-- Data for Name: pictures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pictures (id, file, caption, _owner_, _timestamp_, coho, family, width, height, likes) FROM stdin;
\.


--
-- Data for Name: pictures_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pictures_comments (id, pictures_id, reply_to, comment, _timestamp_, _owner_) FROM stdin;
\.


--
-- Name: pictures_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pictures_comments_id_seq', 1, false);


--
-- Name: pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pictures_id_seq', 1, false);


--
-- Data for Name: pictures_pictures_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pictures_pictures_tags (pictures_id, pictures_tags_id) FROM stdin;
\.


--
-- Data for Name: pictures_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pictures_tags (id, tag) FROM stdin;
\.


--
-- Name: pictures_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pictures_tags_id_seq', 1, false);


--
-- Data for Name: qb_balances; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY qb_balances (id, name, amount, year) FROM stdin;
\.


--
-- Name: qb_balances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('qb_balances_id_seq', 1, false);


--
-- Data for Name: qb_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY qb_transactions (id, date, description, amount, balance, families_id, budgets_id, type) FROM stdin;
\.


--
-- Name: qb_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('qb_transactions_id_seq', 1, false);


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY recipes (id, families_id, title, ingredients, directions, category, coho, family, _owner_, likes) FROM stdin;
\.


--
-- Data for Name: recipes_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY recipes_comments (id, recipes_id, reply_to, comment, _timestamp_, _owner_) FROM stdin;
\.


--
-- Name: recipes_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('recipes_comments_id_seq', 1, false);


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('recipes_id_seq', 1, false);


--
-- Data for Name: recommendations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY recommendations (id, recommendation, recommended_by, comments) FROM stdin;
\.


--
-- Name: recommendations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('recommendations_id_seq', 1, false);


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reviews (id, title, category, review, _owner_, coho, family, likes) FROM stdin;
\.


--
-- Data for Name: reviews_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reviews_comments (id, reviews_id, reply_to, comment, _timestamp_, _owner_) FROM stdin;
\.


--
-- Name: reviews_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reviews_comments_id_seq', 1, false);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reviews_id_seq', 1, false);


--
-- Data for Name: subscribers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY subscribers (id, mail_lists_id, email) FROM stdin;
\.


--
-- Name: subscribers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('subscribers_id_seq', 1, false);


--
-- Data for Name: survey_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY survey_questions (id, surveys_id, question, answer_type, type_data, required, pre_text, post_text, _order_, _timestamp_) FROM stdin;
\.


--
-- Name: survey_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('survey_questions_id_seq', 1, false);


--
-- Data for Name: surveys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY surveys (id, title, description, number_questions, one_answer, show_answers, show_names, show_title, _owner_) FROM stdin;
\.


--
-- Name: surveys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('surveys_id_seq', 1, false);


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tasks (id, description, notes, num_people_needed, workers, _owner_) FROM stdin;
\.


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tasks_id_seq', 1, false);


--
-- Data for Name: todos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY todos (id, families_id, task, notes, assigned_to, project) FROM stdin;
\.


--
-- Name: todos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('todos_id_seq', 1, false);


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transactions (id, accounts_id, amount, date, description, families_id, num, reconciled, type, transactions_id) FROM stdin;
\.


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transactions_id_seq', 1, false);


--
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY units (id, unit, hoa_dues) FROM stdin;
\.


--
-- Name: units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('units_id_seq', 1, false);


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_roles (id, people_id, user_name, role) FROM stdin;
1	1	admin	administrator
2	1	admin	coho
\.


--
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_roles_id_seq', 34, true);


--
-- Data for Name: values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "values" (id, value) FROM stdin;
\.


--
-- Data for Name: values_decisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY values_decisions (values_id, decisions_id) FROM stdin;
\.


--
-- Name: values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('values_id_seq', 1, false);


--
-- Name: _columns__pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY _columns_
    ADD CONSTRAINT _columns__pkey PRIMARY KEY (id);


--
-- Name: _modules__pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY _modules_
    ADD CONSTRAINT _modules__pkey PRIMARY KEY (id);


--
-- Name: _relationship_defs__pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY _relationship_defs_
    ADD CONSTRAINT _relationship_defs__pkey PRIMARY KEY (id);


--
-- Name: _roles__pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY _roles_
    ADD CONSTRAINT _roles__pkey PRIMARY KEY (id);


--
-- Name: _settings__pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY _settings_
    ADD CONSTRAINT _settings__pkey PRIMARY KEY (id);


--
-- Name: _views__pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY _views_
    ADD CONSTRAINT _views__pkey PRIMARY KEY (id);


--
-- Name: accounts_budgets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY accounts_budgets
    ADD CONSTRAINT accounts_budgets_pkey PRIMARY KEY (id);


--
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: additional_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY additional_emails
    ADD CONSTRAINT additional_emails_pkey PRIMARY KEY (id);


--
-- Name: additional_senders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY additional_senders
    ADD CONSTRAINT additional_senders_pkey PRIMARY KEY (id);


--
-- Name: bank_accounts_balances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bank_accounts_balances
    ADD CONSTRAINT bank_accounts_balances_pkey PRIMARY KEY (id);


--
-- Name: bank_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bank_accounts
    ADD CONSTRAINT bank_accounts_pkey PRIMARY KEY (id);


--
-- Name: birthdays_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY birthdays_events
    ADD CONSTRAINT birthdays_events_pkey PRIMARY KEY (id);


--
-- Name: blog_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_comments
    ADD CONSTRAINT blog_comments_pkey PRIMARY KEY (id);


--
-- Name: blog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog
    ADD CONSTRAINT blog_pkey PRIMARY KEY (id);


--
-- Name: budgets_amounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY budgets_amounts
    ADD CONSTRAINT budgets_amounts_pkey PRIMARY KEY (id);


--
-- Name: budgets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY budgets
    ADD CONSTRAINT budgets_pkey PRIMARY KEY (id);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: decisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY decisions
    ADD CONSTRAINT decisions_pkey PRIMARY KEY (id);


--
-- Name: designs_css_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY designs_css_files
    ADD CONSTRAINT designs_css_files_pkey PRIMARY KEY (id);


--
-- Name: designs_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY designs_items
    ADD CONSTRAINT designs_items_pkey PRIMARY KEY (id);


--
-- Name: designs_js_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY designs_js_files
    ADD CONSTRAINT designs_js_files_pkey PRIMARY KEY (id);


--
-- Name: designs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY designs
    ADD CONSTRAINT designs_pkey PRIMARY KEY (id);


--
-- Name: discussions_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY discussions_attachments
    ADD CONSTRAINT discussions_attachments_pkey PRIMARY KEY (id);


--
-- Name: discussions_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY discussions_comments
    ADD CONSTRAINT discussions_comments_pkey PRIMARY KEY (id);


--
-- Name: discussions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY discussions
    ADD CONSTRAINT discussions_pkey PRIMARY KEY (id);


--
-- Name: documents_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY documents_comments
    ADD CONSTRAINT documents_comments_pkey PRIMARY KEY (id);


--
-- Name: documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: documents_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY documents_types
    ADD CONSTRAINT documents_types_pkey PRIMARY KEY (id);


--
-- Name: equipment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipment
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (id);


--
-- Name: families_pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY families_pictures
    ADD CONSTRAINT families_pictures_pkey PRIMARY KEY (id);


--
-- Name: families_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY families
    ADD CONSTRAINT families_pkey PRIMARY KEY (id);


--
-- Name: fowl_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fowl_events
    ADD CONSTRAINT fowl_events_pkey PRIMARY KEY (id);


--
-- Name: fowl_events_reminders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fowl_events_reminders
    ADD CONSTRAINT fowl_events_reminders_pkey PRIMARY KEY (id);


--
-- Name: group_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY group_documents
    ADD CONSTRAINT group_documents_pkey PRIMARY KEY (id);


--
-- Name: group_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY group_links
    ADD CONSTRAINT group_links_pkey PRIMARY KEY (id);


--
-- Name: group_minutes_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY group_minutes_attachments
    ADD CONSTRAINT group_minutes_attachments_pkey PRIMARY KEY (id);


--
-- Name: group_minutes_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY group_minutes_comments
    ADD CONSTRAINT group_minutes_comments_pkey PRIMARY KEY (id);


--
-- Name: group_minutes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY group_minutes
    ADD CONSTRAINT group_minutes_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: guest_room_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY guest_room_events
    ADD CONSTRAINT guest_room_events_pkey PRIMARY KEY (id);


--
-- Name: help_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY help
    ADD CONSTRAINT help_pkey PRIMARY KEY (id);


--
-- Name: homes_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY homes
    ADD CONSTRAINT homes_number_key UNIQUE (number);


--
-- Name: homes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY homes
    ADD CONSTRAINT homes_pkey PRIMARY KEY (id);


--
-- Name: lostfound_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lostfound
    ADD CONSTRAINT lostfound_pkey PRIMARY KEY (id);


--
-- Name: mail_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mail_lists
    ADD CONSTRAINT mail_lists_pkey PRIMARY KEY (id);


--
-- Name: mail_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mail_queue
    ADD CONSTRAINT mail_queue_pkey PRIMARY KEY (id);


--
-- Name: mail_queue_recipients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mail_queue_recipients
    ADD CONSTRAINT mail_queue_recipients_pkey PRIMARY KEY (id);


--
-- Name: main_calendar_events_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY main_calendar_events_locations
    ADD CONSTRAINT main_calendar_events_locations_pkey PRIMARY KEY (id);


--
-- Name: main_calendar_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY main_calendar_events
    ADD CONSTRAINT main_calendar_events_pkey PRIMARY KEY (id);


--
-- Name: main_calendar_events_registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY main_calendar_events_registrations
    ADD CONSTRAINT main_calendar_events_registrations_pkey PRIMARY KEY (id);


--
-- Name: main_calendar_events_reminders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY main_calendar_events_reminders
    ADD CONSTRAINT main_calendar_events_reminders_pkey PRIMARY KEY (id);


--
-- Name: meal_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY meal_events
    ADD CONSTRAINT meal_events_pkey PRIMARY KEY (id);


--
-- Name: meal_people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY meal_people
    ADD CONSTRAINT meal_people_pkey PRIMARY KEY (id);


--
-- Name: meeting_people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY meeting_people
    ADD CONSTRAINT meeting_people_pkey PRIMARY KEY (id);


--
-- Name: meetings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY meetings
    ADD CONSTRAINT meetings_pkey PRIMARY KEY (id);


--
-- Name: menu_choices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY menu_choices
    ADD CONSTRAINT menu_choices_pkey PRIMARY KEY (id);


--
-- Name: menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- Name: menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);


--
-- Name: minutes_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY minutes_attachments
    ADD CONSTRAINT minutes_attachments_pkey PRIMARY KEY (id);


--
-- Name: minutes_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY minutes_comments
    ADD CONSTRAINT minutes_comments_pkey PRIMARY KEY (id);


--
-- Name: minutes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY minutes
    ADD CONSTRAINT minutes_pkey PRIMARY KEY (id);


--
-- Name: movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- Name: news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: notes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: pages_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pages_items
    ADD CONSTRAINT pages_items_pkey PRIMARY KEY (id);


--
-- Name: pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: people_bio_pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY people_bio_pictures
    ADD CONSTRAINT people_bio_pictures_pkey PRIMARY KEY (id);


--
-- Name: people_mail_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY people_mail_lists
    ADD CONSTRAINT people_mail_lists_pkey PRIMARY KEY (id);


--
-- Name: people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: people_user_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_user_name_key UNIQUE (user_name);


--
-- Name: pictures_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pictures_comments
    ADD CONSTRAINT pictures_comments_pkey PRIMARY KEY (id);


--
-- Name: pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pictures
    ADD CONSTRAINT pictures_pkey PRIMARY KEY (id);


--
-- Name: pictures_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pictures_tags
    ADD CONSTRAINT pictures_tags_pkey PRIMARY KEY (id);


--
-- Name: qb_balances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY qb_balances
    ADD CONSTRAINT qb_balances_pkey PRIMARY KEY (id);


--
-- Name: qb_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY qb_transactions
    ADD CONSTRAINT qb_transactions_pkey PRIMARY KEY (id);


--
-- Name: recipes_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY recipes_comments
    ADD CONSTRAINT recipes_comments_pkey PRIMARY KEY (id);


--
-- Name: recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY recommendations
    ADD CONSTRAINT recommendations_pkey PRIMARY KEY (id);


--
-- Name: reviews_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reviews_comments
    ADD CONSTRAINT reviews_comments_pkey PRIMARY KEY (id);


--
-- Name: reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: subscribers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY subscribers
    ADD CONSTRAINT subscribers_pkey PRIMARY KEY (id);


--
-- Name: survey_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY survey_questions
    ADD CONSTRAINT survey_questions_pkey PRIMARY KEY (id);


--
-- Name: surveys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY surveys
    ADD CONSTRAINT surveys_pkey PRIMARY KEY (id);


--
-- Name: tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: todos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY todos
    ADD CONSTRAINT todos_pkey PRIMARY KEY (id);


--
-- Name: transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- Name: user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "values"
    ADD CONSTRAINT values_pkey PRIMARY KEY (id);


--
-- Name: _columns___views__id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX _columns___views__id ON _columns_ USING btree (_views__id);


--
-- Name: _relationship_defs___views__id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX _relationship_defs___views__id ON _relationship_defs_ USING btree (_views__id);


--
-- Name: accounts_budgets_accounts_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX accounts_budgets_accounts_id ON accounts_budgets USING btree (accounts_id);


--
-- Name: additional_emails_people_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX additional_emails_people_id ON additional_emails USING btree (people_id);


--
-- Name: bank_accounts_balances_bank_accounts_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX bank_accounts_balances_bank_accounts_id ON bank_accounts_balances USING btree (bank_accounts_id);


--
-- Name: birthdays_events_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX birthdays_events_date ON birthdays_events USING btree (date);


--
-- Name: blog__owner_; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog__owner_ ON blog USING btree (_owner_);


--
-- Name: blog_comments_blog_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_comments_blog_id ON blog_comments USING btree (blog_id);


--
-- Name: budgets_amounts_budgets_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX budgets_amounts_budgets_id ON budgets_amounts USING btree (budgets_id);


--
-- Name: contacts_families_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX contacts_families_id ON contacts USING btree (families_id);


--
-- Name: designs_css_files_designs_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX designs_css_files_designs_id ON designs_css_files USING btree (designs_id);


--
-- Name: designs_items_designs_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX designs_items_designs_id ON designs_items USING btree (designs_id);


--
-- Name: designs_js_files_designs_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX designs_js_files_designs_id ON designs_js_files USING btree (designs_id);


--
-- Name: discussions_attachments_discussions_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX discussions_attachments_discussions_id ON discussions_attachments USING btree (discussions_id);


--
-- Name: discussions_comments_discussions_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX discussions_comments_discussions_id ON discussions_comments USING btree (discussions_id);


--
-- Name: documents_comments_documents_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX documents_comments_documents_id ON documents_comments USING btree (documents_id);


--
-- Name: documents_groups_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX documents_groups_id ON documents USING btree (groups_id);


--
-- Name: families_homes_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX families_homes_id ON families USING btree (homes_id);


--
-- Name: families_pictures_families_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX families_pictures_families_id ON families_pictures USING btree (families_id);


--
-- Name: fowl_events__owner_; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fowl_events__owner_ ON fowl_events USING btree (_owner_);


--
-- Name: fowl_events_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fowl_events_date ON fowl_events USING btree (date);


--
-- Name: fowl_events_reminders_fowl_events_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fowl_events_reminders_fowl_events_id ON fowl_events_reminders USING btree (fowl_events_id);


--
-- Name: group_documents_groups_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX group_documents_groups_id ON group_documents USING btree (groups_id);


--
-- Name: group_links_groups_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX group_links_groups_id ON group_links USING btree (groups_id);


--
-- Name: group_minutes__owner_; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX group_minutes__owner_ ON group_minutes USING btree (_owner_);


--
-- Name: group_minutes_attachments_group_minutes_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX group_minutes_attachments_group_minutes_id ON group_minutes_attachments USING btree (group_minutes_id);


--
-- Name: group_minutes_comments_group_minutes_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX group_minutes_comments_group_minutes_id ON group_minutes_comments USING btree (group_minutes_id);


--
-- Name: group_minutes_groups_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX group_minutes_groups_id ON group_minutes USING btree (groups_id);


--
-- Name: guest_room_events__owner_; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX guest_room_events__owner_ ON guest_room_events USING btree (_owner_);


--
-- Name: guest_room_events_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX guest_room_events_date ON guest_room_events USING btree (date);


--
-- Name: homes_pays_hoa; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX homes_pays_hoa ON homes USING btree (pays_hoa);


--
-- Name: homes_pays_water; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX homes_pays_water ON homes USING btree (pays_water);


--
-- Name: mail_lists_people_mail_lists_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mail_lists_people_mail_lists_id ON mail_lists_people USING btree (mail_lists_id);


--
-- Name: mail_lists_people_people_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mail_lists_people_people_id ON mail_lists_people USING btree (people_id);


--
-- Name: mail_queue_recipients_mail_queue_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mail_queue_recipients_mail_queue_id ON mail_queue_recipients USING btree (mail_queue_id);


--
-- Name: main_calendar_events__owner_; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX main_calendar_events__owner_ ON main_calendar_events USING btree (_owner_);


--
-- Name: main_calendar_events_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX main_calendar_events_date ON main_calendar_events USING btree (date);


--
-- Name: main_calendar_events_main_calendar_events_locations_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX main_calendar_events_main_calendar_events_locations_id ON main_calendar_events USING btree (main_calendar_events_locations_id);


--
-- Name: main_calendar_events_registrations_main_calendar_events_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX main_calendar_events_registrations_main_calendar_events_id ON main_calendar_events_registrations USING btree (main_calendar_events_id);


--
-- Name: main_calendar_events_reminders_main_calendar_events_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX main_calendar_events_reminders_main_calendar_events_id ON main_calendar_events_reminders USING btree (main_calendar_events_id);


--
-- Name: meal_events__owner_; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX meal_events__owner_ ON meal_events USING btree (_owner_);


--
-- Name: meal_events_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX meal_events_date ON meal_events USING btree (date);


--
-- Name: meal_people_meal_events_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX meal_people_meal_events_id ON meal_people USING btree (meal_events_id);


--
-- Name: meeting_people_meetings_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX meeting_people_meetings_id ON meeting_people USING btree (meetings_id);


--
-- Name: menu_items_people_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX menu_items_people_id ON menu_items USING btree (people_id);


--
-- Name: minutes__owner_; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX minutes__owner_ ON minutes USING btree (_owner_);


--
-- Name: minutes_attachments_minutes_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX minutes_attachments_minutes_id ON minutes_attachments USING btree (minutes_id);


--
-- Name: minutes_comments_minutes_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX minutes_comments_minutes_id ON minutes_comments USING btree (minutes_id);


--
-- Name: news__owner_; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX news__owner_ ON news USING btree (_owner_);


--
-- Name: notes_families_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX notes_families_id ON notes USING btree (families_id);


--
-- Name: pages_designs_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pages_designs_id ON pages USING btree (designs_id);


--
-- Name: pages_items_pages_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pages_items_pages_id ON pages_items USING btree (pages_id);


--
-- Name: people_bio_pictures_people_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX people_bio_pictures_people_id ON people_bio_pictures USING btree (people_id);


--
-- Name: people_groups_groups_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX people_groups_groups_id ON people_groups USING btree (groups_id);


--
-- Name: people_groups_people_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX people_groups_people_id ON people_groups USING btree (people_id);


--
-- Name: people_mail_lists_people_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX people_mail_lists_people_id ON people_mail_lists USING btree (people_id);


--
-- Name: pictures__owner_; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pictures__owner_ ON pictures USING btree (_owner_);


--
-- Name: pictures_comments_pictures_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pictures_comments_pictures_id ON pictures_comments USING btree (pictures_id);


--
-- Name: pictures_pictures_tags_pictures_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pictures_pictures_tags_pictures_id ON pictures_pictures_tags USING btree (pictures_id);


--
-- Name: pictures_pictures_tags_pictures_tags_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pictures_pictures_tags_pictures_tags_id ON pictures_pictures_tags USING btree (pictures_tags_id);


--
-- Name: recipes_comments_recipes_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX recipes_comments_recipes_id ON recipes_comments USING btree (recipes_id);


--
-- Name: recipes_families_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX recipes_families_id ON recipes USING btree (families_id);


--
-- Name: reviews__owner_; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reviews__owner_ ON reviews USING btree (_owner_);


--
-- Name: reviews_comments_reviews_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reviews_comments_reviews_id ON reviews_comments USING btree (reviews_id);


--
-- Name: subscribers_mail_lists_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX subscribers_mail_lists_id ON subscribers USING btree (mail_lists_id);


--
-- Name: survey_questions_surveys_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX survey_questions_surveys_id ON survey_questions USING btree (surveys_id);


--
-- Name: tasks__owner_; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tasks__owner_ ON tasks USING btree (_owner_);


--
-- Name: todos_families_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX todos_families_id ON todos USING btree (families_id);


--
-- Name: transactions_transactions_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX transactions_transactions_id ON transactions USING btree (transactions_id);


--
-- Name: user_roles_people_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX user_roles_people_id ON user_roles USING btree (people_id);


--
-- Name: values_decisions_decisions_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX values_decisions_decisions_id ON values_decisions USING btree (decisions_id);


--
-- Name: values_decisions_values_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX values_decisions_values_id ON values_decisions USING btree (values_id);


--
-- Name: _columns___views__id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY _columns_
    ADD CONSTRAINT _columns___views__id_fkey FOREIGN KEY (_views__id) REFERENCES _views_(id) ON DELETE CASCADE;


--
-- Name: _relationship_defs___views__id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY _relationship_defs_
    ADD CONSTRAINT _relationship_defs___views__id_fkey FOREIGN KEY (_views__id) REFERENCES _views_(id) ON DELETE CASCADE;


--
-- Name: accounts_budgets_accounts_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts_budgets
    ADD CONSTRAINT accounts_budgets_accounts_id_fkey FOREIGN KEY (accounts_id) REFERENCES accounts(id) ON DELETE CASCADE;


--
-- Name: additional_emails_people_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY additional_emails
    ADD CONSTRAINT additional_emails_people_id_fkey FOREIGN KEY (people_id) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: bank_accounts_balances_bank_accounts_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bank_accounts_balances
    ADD CONSTRAINT bank_accounts_balances_bank_accounts_id_fkey FOREIGN KEY (bank_accounts_id) REFERENCES bank_accounts(id) ON DELETE CASCADE;


--
-- Name: blog__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog
    ADD CONSTRAINT blog__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: blog_comments__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_comments
    ADD CONSTRAINT blog_comments__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: blog_comments_blog_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_comments
    ADD CONSTRAINT blog_comments_blog_id_fkey FOREIGN KEY (blog_id) REFERENCES blog(id) ON DELETE CASCADE;


--
-- Name: budgets_amounts_budgets_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY budgets_amounts
    ADD CONSTRAINT budgets_amounts_budgets_id_fkey FOREIGN KEY (budgets_id) REFERENCES budgets(id) ON DELETE CASCADE;


--
-- Name: contacts_families_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_families_id_fkey FOREIGN KEY (families_id) REFERENCES families(id) ON DELETE CASCADE;


--
-- Name: designs_css_files_designs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY designs_css_files
    ADD CONSTRAINT designs_css_files_designs_id_fkey FOREIGN KEY (designs_id) REFERENCES designs(id) ON DELETE CASCADE;


--
-- Name: designs_items_designs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY designs_items
    ADD CONSTRAINT designs_items_designs_id_fkey FOREIGN KEY (designs_id) REFERENCES designs(id) ON DELETE CASCADE;


--
-- Name: designs_js_files_designs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY designs_js_files
    ADD CONSTRAINT designs_js_files_designs_id_fkey FOREIGN KEY (designs_id) REFERENCES designs(id) ON DELETE CASCADE;


--
-- Name: discussions__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY discussions
    ADD CONSTRAINT discussions__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: discussions_attachments_discussions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY discussions_attachments
    ADD CONSTRAINT discussions_attachments_discussions_id_fkey FOREIGN KEY (discussions_id) REFERENCES discussions(id) ON DELETE CASCADE;


--
-- Name: discussions_comments__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY discussions_comments
    ADD CONSTRAINT discussions_comments__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: discussions_comments_discussions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY discussions_comments
    ADD CONSTRAINT discussions_comments_discussions_id_fkey FOREIGN KEY (discussions_id) REFERENCES discussions(id) ON DELETE CASCADE;


--
-- Name: documents_comments__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documents_comments
    ADD CONSTRAINT documents_comments__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: documents_comments_documents_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documents_comments
    ADD CONSTRAINT documents_comments_documents_id_fkey FOREIGN KEY (documents_id) REFERENCES documents(id) ON DELETE CASCADE;


--
-- Name: documents_groups_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT documents_groups_id_fkey FOREIGN KEY (groups_id) REFERENCES groups(id) ON DELETE CASCADE;


--
-- Name: families_homes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY families
    ADD CONSTRAINT families_homes_id_fkey FOREIGN KEY (homes_id) REFERENCES homes(id) ON DELETE SET NULL;


--
-- Name: families_pictures_families_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY families_pictures
    ADD CONSTRAINT families_pictures_families_id_fkey FOREIGN KEY (families_id) REFERENCES families(id) ON DELETE CASCADE;


--
-- Name: fowl_events__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fowl_events
    ADD CONSTRAINT fowl_events__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE SET NULL;


--
-- Name: fowl_events_reminders__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fowl_events_reminders
    ADD CONSTRAINT fowl_events_reminders__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: fowl_events_reminders_fowl_events_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fowl_events_reminders
    ADD CONSTRAINT fowl_events_reminders_fowl_events_id_fkey FOREIGN KEY (fowl_events_id) REFERENCES fowl_events(id) ON DELETE CASCADE;


--
-- Name: group_documents_groups_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_documents
    ADD CONSTRAINT group_documents_groups_id_fkey FOREIGN KEY (groups_id) REFERENCES groups(id) ON DELETE CASCADE;


--
-- Name: group_links_groups_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_links
    ADD CONSTRAINT group_links_groups_id_fkey FOREIGN KEY (groups_id) REFERENCES groups(id) ON DELETE CASCADE;


--
-- Name: group_minutes__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_minutes
    ADD CONSTRAINT group_minutes__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: group_minutes_attachments_group_minutes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_minutes_attachments
    ADD CONSTRAINT group_minutes_attachments_group_minutes_id_fkey FOREIGN KEY (group_minutes_id) REFERENCES group_minutes(id) ON DELETE CASCADE;


--
-- Name: group_minutes_comments__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_minutes_comments
    ADD CONSTRAINT group_minutes_comments__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: group_minutes_comments_group_minutes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_minutes_comments
    ADD CONSTRAINT group_minutes_comments_group_minutes_id_fkey FOREIGN KEY (group_minutes_id) REFERENCES group_minutes(id) ON DELETE CASCADE;


--
-- Name: group_minutes_groups_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_minutes
    ADD CONSTRAINT group_minutes_groups_id_fkey FOREIGN KEY (groups_id) REFERENCES groups(id) ON DELETE CASCADE;


--
-- Name: guest_room_events__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY guest_room_events
    ADD CONSTRAINT guest_room_events__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE SET NULL;


--
-- Name: homes_pays_hoa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY homes
    ADD CONSTRAINT homes_pays_hoa_fkey FOREIGN KEY (pays_hoa) REFERENCES families(id) ON DELETE SET NULL;


--
-- Name: homes_pays_water_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY homes
    ADD CONSTRAINT homes_pays_water_fkey FOREIGN KEY (pays_water) REFERENCES families(id) ON DELETE SET NULL;


--
-- Name: mail_lists_people_mail_lists_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mail_lists_people
    ADD CONSTRAINT mail_lists_people_mail_lists_id_fkey FOREIGN KEY (mail_lists_id) REFERENCES mail_lists(id) ON DELETE CASCADE;


--
-- Name: mail_lists_people_people_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mail_lists_people
    ADD CONSTRAINT mail_lists_people_people_id_fkey FOREIGN KEY (people_id) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: mail_queue_recipients_mail_queue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mail_queue_recipients
    ADD CONSTRAINT mail_queue_recipients_mail_queue_id_fkey FOREIGN KEY (mail_queue_id) REFERENCES mail_queue(id) ON DELETE CASCADE;


--
-- Name: main_calendar_events__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY main_calendar_events
    ADD CONSTRAINT main_calendar_events__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE SET NULL;


--
-- Name: main_calendar_events_main_calendar_events_locations_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY main_calendar_events
    ADD CONSTRAINT main_calendar_events_main_calendar_events_locations_id_fkey FOREIGN KEY (main_calendar_events_locations_id) REFERENCES main_calendar_events_locations(id) ON DELETE SET NULL;


--
-- Name: main_calendar_events_registrations_main_calendar_events_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY main_calendar_events_registrations
    ADD CONSTRAINT main_calendar_events_registrations_main_calendar_events_id_fkey FOREIGN KEY (main_calendar_events_id) REFERENCES main_calendar_events(id) ON DELETE CASCADE;


--
-- Name: main_calendar_events_reminders__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY main_calendar_events_reminders
    ADD CONSTRAINT main_calendar_events_reminders__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: main_calendar_events_reminders_main_calendar_events_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY main_calendar_events_reminders
    ADD CONSTRAINT main_calendar_events_reminders_main_calendar_events_id_fkey FOREIGN KEY (main_calendar_events_id) REFERENCES main_calendar_events(id) ON DELETE CASCADE;


--
-- Name: meal_events__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY meal_events
    ADD CONSTRAINT meal_events__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: meal_people_families_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY meal_people
    ADD CONSTRAINT meal_people_families_id_fkey FOREIGN KEY (families_id) REFERENCES families(id) ON DELETE CASCADE;


--
-- Name: meal_people_meal_events_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY meal_people
    ADD CONSTRAINT meal_people_meal_events_id_fkey FOREIGN KEY (meal_events_id) REFERENCES meal_events(id) ON DELETE CASCADE;


--
-- Name: meeting_people_meetings_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY meeting_people
    ADD CONSTRAINT meeting_people_meetings_id_fkey FOREIGN KEY (meetings_id) REFERENCES meetings(id) ON DELETE CASCADE;


--
-- Name: meeting_people_people_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY meeting_people
    ADD CONSTRAINT meeting_people_people_id_fkey FOREIGN KEY (people_id) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: meetings__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY meetings
    ADD CONSTRAINT meetings__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: menu_items_people_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu_items
    ADD CONSTRAINT menu_items_people_id_fkey FOREIGN KEY (people_id) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: minutes__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY minutes
    ADD CONSTRAINT minutes__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: minutes_attachments_minutes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY minutes_attachments
    ADD CONSTRAINT minutes_attachments_minutes_id_fkey FOREIGN KEY (minutes_id) REFERENCES minutes(id) ON DELETE CASCADE;


--
-- Name: minutes_comments__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY minutes_comments
    ADD CONSTRAINT minutes_comments__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: minutes_comments_minutes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY minutes_comments
    ADD CONSTRAINT minutes_comments_minutes_id_fkey FOREIGN KEY (minutes_id) REFERENCES minutes(id) ON DELETE CASCADE;


--
-- Name: news__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news
    ADD CONSTRAINT news__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: notes_families_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT notes_families_id_fkey FOREIGN KEY (families_id) REFERENCES families(id) ON DELETE CASCADE;


--
-- Name: pages_designs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT pages_designs_id_fkey FOREIGN KEY (designs_id) REFERENCES designs(id) ON DELETE SET NULL;


--
-- Name: pages_items_pages_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pages_items
    ADD CONSTRAINT pages_items_pages_id_fkey FOREIGN KEY (pages_id) REFERENCES pages(id) ON DELETE CASCADE;


--
-- Name: people_bio_pictures_people_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY people_bio_pictures
    ADD CONSTRAINT people_bio_pictures_people_id_fkey FOREIGN KEY (people_id) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: people_groups_groups_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY people_groups
    ADD CONSTRAINT people_groups_groups_id_fkey FOREIGN KEY (groups_id) REFERENCES groups(id) ON DELETE CASCADE;


--
-- Name: people_groups_people_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY people_groups
    ADD CONSTRAINT people_groups_people_id_fkey FOREIGN KEY (people_id) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: people_mail_lists_people_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY people_mail_lists
    ADD CONSTRAINT people_mail_lists_people_id_fkey FOREIGN KEY (people_id) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: pictures__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pictures
    ADD CONSTRAINT pictures__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE SET NULL;


--
-- Name: pictures_comments__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pictures_comments
    ADD CONSTRAINT pictures_comments__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: pictures_comments_pictures_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pictures_comments
    ADD CONSTRAINT pictures_comments_pictures_id_fkey FOREIGN KEY (pictures_id) REFERENCES pictures(id) ON DELETE CASCADE;


--
-- Name: pictures_pictures_tags_pictures_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pictures_pictures_tags
    ADD CONSTRAINT pictures_pictures_tags_pictures_id_fkey FOREIGN KEY (pictures_id) REFERENCES pictures(id) ON DELETE CASCADE;


--
-- Name: pictures_pictures_tags_pictures_tags_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pictures_pictures_tags
    ADD CONSTRAINT pictures_pictures_tags_pictures_tags_id_fkey FOREIGN KEY (pictures_tags_id) REFERENCES pictures_tags(id) ON DELETE CASCADE;


--
-- Name: recipes__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recipes
    ADD CONSTRAINT recipes__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: recipes_comments__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recipes_comments
    ADD CONSTRAINT recipes_comments__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: recipes_comments_recipes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recipes_comments
    ADD CONSTRAINT recipes_comments_recipes_id_fkey FOREIGN KEY (recipes_id) REFERENCES recipes(id) ON DELETE CASCADE;


--
-- Name: recipes_families_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recipes
    ADD CONSTRAINT recipes_families_id_fkey FOREIGN KEY (families_id) REFERENCES families(id) ON DELETE CASCADE;


--
-- Name: reviews__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: reviews_comments__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reviews_comments
    ADD CONSTRAINT reviews_comments__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: reviews_comments_reviews_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reviews_comments
    ADD CONSTRAINT reviews_comments_reviews_id_fkey FOREIGN KEY (reviews_id) REFERENCES reviews(id) ON DELETE CASCADE;


--
-- Name: subscribers_mail_lists_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subscribers
    ADD CONSTRAINT subscribers_mail_lists_id_fkey FOREIGN KEY (mail_lists_id) REFERENCES mail_lists(id) ON DELETE CASCADE;


--
-- Name: survey_questions_surveys_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY survey_questions
    ADD CONSTRAINT survey_questions_surveys_id_fkey FOREIGN KEY (surveys_id) REFERENCES surveys(id) ON DELETE CASCADE;


--
-- Name: surveys__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY surveys
    ADD CONSTRAINT surveys__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: tasks__owner__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks__owner__fkey FOREIGN KEY (_owner_) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: todos_families_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY todos
    ADD CONSTRAINT todos_families_id_fkey FOREIGN KEY (families_id) REFERENCES families(id) ON DELETE CASCADE;


--
-- Name: user_roles_people_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_people_id_fkey FOREIGN KEY (people_id) REFERENCES people(id) ON DELETE CASCADE;


--
-- Name: user_roles_user_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_user_name_fkey FOREIGN KEY (user_name) REFERENCES people(user_name) ON UPDATE CASCADE;


--
-- Name: values_decisions_decisions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY values_decisions
    ADD CONSTRAINT values_decisions_decisions_id_fkey FOREIGN KEY (decisions_id) REFERENCES decisions(id) ON DELETE CASCADE;


--
-- Name: values_decisions_values_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY values_decisions
    ADD CONSTRAINT values_decisions_values_id_fkey FOREIGN KEY (values_id) REFERENCES "values"(id) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: sean
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM sean;
GRANT ALL ON SCHEMA public TO sean;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

