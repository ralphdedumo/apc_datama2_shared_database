--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 12.0

-- Started on 2019-12-05 09:22:07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 28 (class 2615 OID 16752)
-- Name: radedumo; Type: SCHEMA; Schema: -; Owner: datama2mi181
--

CREATE SCHEMA radedumo;


ALTER SCHEMA radedumo OWNER TO datama2mi181;

SET default_tablespace = '';

--
-- TOC entry 278 (class 1259 OID 17213)
-- Name: bill; Type: TABLE; Schema: radedumo; Owner: datama2mi181
--

CREATE TABLE radedumo.bill (
    id integer NOT NULL,
    hot_name character varying(45) NOT NULL,
    cus_fullname character varying(45) NOT NULL,
    bill_dmg integer,
    hotel_id integer NOT NULL
);


ALTER TABLE radedumo.bill OWNER TO datama2mi181;

--
-- TOC entry 279 (class 1259 OID 17354)
-- Name: check_in_slip; Type: TABLE; Schema: radedumo; Owner: datama2mi181
--

CREATE TABLE radedumo.check_in_slip (
    id integer NOT NULL,
    slip_cin date NOT NULL,
    slip_cout date NOT NULL,
    employee_id integer NOT NULL
);


ALTER TABLE radedumo.check_in_slip OWNER TO datama2mi181;

--
-- TOC entry 280 (class 1259 OID 17357)
-- Name: customer; Type: TABLE; Schema: radedumo; Owner: datama2mi181
--

CREATE TABLE radedumo.customer (
    id integer NOT NULL,
    cus_fname character varying(45) DEFAULT NULL::character varying,
    cus_lname character varying(45) DEFAULT NULL::character varying,
    cus_initial character varying(45) DEFAULT NULL::character varying,
    cus_fullname character varying(45) NOT NULL,
    cus_add character varying(45) NOT NULL,
    cus_cont integer NOT NULL,
    cus_email character varying(45) DEFAULT NULL::character varying,
    cus_crdt integer NOT NULL,
    employee_id integer NOT NULL,
    check_in_slip_id integer NOT NULL
);


ALTER TABLE radedumo.customer OWNER TO datama2mi181;

--
-- TOC entry 281 (class 1259 OID 17364)
-- Name: employee; Type: TABLE; Schema: radedumo; Owner: datama2mi181
--

CREATE TABLE radedumo.employee (
    id integer NOT NULL,
    emp_fname character varying(45) DEFAULT NULL::character varying,
    emp_lname character varying(45) DEFAULT NULL::character varying,
    emp_initial character varying(45) DEFAULT NULL::character varying,
    emp_fullname character varying(45) NOT NULL,
    emp_add character varying(45) NOT NULL,
    emp_cont integer NOT NULL,
    emp_email character varying(45) NOT NULL,
    emp_type character varying(45) NOT NULL
);


ALTER TABLE radedumo.employee OWNER TO datama2mi181;

--
-- TOC entry 282 (class 1259 OID 17370)
-- Name: hotel; Type: TABLE; Schema: radedumo; Owner: datama2mi181
--

CREATE TABLE radedumo.hotel (
    id integer NOT NULL,
    hot_name character varying(45) DEFAULT NULL::character varying,
    hot_type character varying(45) DEFAULT NULL::character varying,
    hot_add character varying(255) DEFAULT NULL::character varying,
    hot_cont integer
);


ALTER TABLE radedumo.hotel OWNER TO datama2mi181;

--
-- TOC entry 283 (class 1259 OID 17376)
-- Name: key_holder; Type: TABLE; Schema: radedumo; Owner: datama2mi181
--

CREATE TABLE radedumo.key_holder (
    id integer NOT NULL,
    key_holder character varying(45) NOT NULL
);


ALTER TABLE radedumo.key_holder OWNER TO datama2mi181;

--
-- TOC entry 284 (class 1259 OID 17457)
-- Name: room; Type: TABLE; Schema: radedumo; Owner: datama2mi181
--

CREATE TABLE radedumo.room (
    id integer NOT NULL,
    room_type character varying(45) NOT NULL,
    room_cpcty integer NOT NULL,
    room_cont integer NOT NULL,
    room_price integer NOT NULL,
    hotel_id integer NOT NULL
);


ALTER TABLE radedumo.room OWNER TO datama2mi181;

--
-- TOC entry 365 (class 1259 OID 23273)
-- Name: view2; Type: VIEW; Schema: radedumo; Owner: datama2mi181
--

CREATE VIEW radedumo.view2 AS
 SELECT employee.id,
    employee.emp_fullname,
    employee.emp_email
   FROM (radedumo.employee
     LEFT JOIN radedumo.hotel ON ((employee.id = hotel.id)));


ALTER TABLE radedumo.view2 OWNER TO datama2mi181;

--
-- TOC entry 3556 (class 0 OID 17213)
-- Dependencies: 278
-- Data for Name: bill; Type: TABLE DATA; Schema: radedumo; Owner: datama2mi181
--

COPY radedumo.bill (id, hot_name, cus_fullname, bill_dmg, hotel_id) FROM stdin;
1	Shangrila Makati	Ralph Dedumo	0	1
\.


--
-- TOC entry 3557 (class 0 OID 17354)
-- Dependencies: 279
-- Data for Name: check_in_slip; Type: TABLE DATA; Schema: radedumo; Owner: datama2mi181
--

COPY radedumo.check_in_slip (id, slip_cin, slip_cout, employee_id) FROM stdin;
1	2019-11-11	2019-11-11	1
\.


--
-- TOC entry 3558 (class 0 OID 17357)
-- Dependencies: 280
-- Data for Name: customer; Type: TABLE DATA; Schema: radedumo; Owner: datama2mi181
--

COPY radedumo.customer (id, cus_fname, cus_lname, cus_initial, cus_fullname, cus_add, cus_cont, cus_email, cus_crdt, employee_id, check_in_slip_id) FROM stdin;
1	Ralph	Dedumo	A	Ralph Dedumo	Laguna	1909090909	radedumo@gmail.com	909090909	1	1
\.


--
-- TOC entry 3559 (class 0 OID 17364)
-- Dependencies: 281
-- Data for Name: employee; Type: TABLE DATA; Schema: radedumo; Owner: datama2mi181
--

COPY radedumo.employee (id, emp_fname, emp_lname, emp_initial, emp_fullname, emp_add, emp_cont, emp_email, emp_type) FROM stdin;
1	Darline	Mendoza	D	Darline D Mendoza	Laguna	909090901	darline@yahoo.com	Hotel Clerk
\.


--
-- TOC entry 3560 (class 0 OID 17370)
-- Dependencies: 282
-- Data for Name: hotel; Type: TABLE DATA; Schema: radedumo; Owner: datama2mi181
--

COPY radedumo.hotel (id, hot_name, hot_type, hot_add, hot_cont) FROM stdin;
1	Shangrila Makati	Luxury and High-End Hotels	Makati City	81694088
\.


--
-- TOC entry 3561 (class 0 OID 17376)
-- Dependencies: 283
-- Data for Name: key_holder; Type: TABLE DATA; Schema: radedumo; Owner: datama2mi181
--

COPY radedumo.key_holder (id, key_holder) FROM stdin;
1	Darlyn D Mendoza
\.


--
-- TOC entry 3562 (class 0 OID 17457)
-- Dependencies: 284
-- Data for Name: room; Type: TABLE DATA; Schema: radedumo; Owner: datama2mi181
--

COPY radedumo.room (id, room_type, room_cpcty, room_cont, room_price, hotel_id) FROM stdin;
1	Single	1	89802141	8000	1
2	Double	2	89802351	8000	2
3	King	2	49802351	10000	3
\.


--
-- TOC entry 3392 (class 2606 OID 25313)
-- Name: bill bill_pkey; Type: CONSTRAINT; Schema: radedumo; Owner: datama2mi181
--

ALTER TABLE ONLY radedumo.bill
    ADD CONSTRAINT bill_pkey PRIMARY KEY (id);


--
-- TOC entry 3394 (class 2606 OID 25615)
-- Name: check_in_slip check_in_slip_pkey; Type: CONSTRAINT; Schema: radedumo; Owner: datama2mi181
--

ALTER TABLE ONLY radedumo.check_in_slip
    ADD CONSTRAINT check_in_slip_pkey PRIMARY KEY (id);


--
-- TOC entry 3396 (class 2606 OID 25596)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: radedumo; Owner: datama2mi181
--

ALTER TABLE ONLY radedumo.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- TOC entry 3398 (class 2606 OID 25594)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: radedumo; Owner: datama2mi181
--

ALTER TABLE ONLY radedumo.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- TOC entry 3400 (class 2606 OID 25610)
-- Name: hotel hotel_pkey; Type: CONSTRAINT; Schema: radedumo; Owner: datama2mi181
--

ALTER TABLE ONLY radedumo.hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (id);


--
-- TOC entry 3402 (class 2606 OID 25579)
-- Name: key_holder key_holder_pkey; Type: CONSTRAINT; Schema: radedumo; Owner: datama2mi181
--

ALTER TABLE ONLY radedumo.key_holder
    ADD CONSTRAINT key_holder_pkey PRIMARY KEY (id);


--
-- TOC entry 3404 (class 2606 OID 25608)
-- Name: room room_pkey; Type: CONSTRAINT; Schema: radedumo; Owner: datama2mi181
--

ALTER TABLE ONLY radedumo.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (id);


--
-- TOC entry 3405 (class 2606 OID 26050)
-- Name: bill bill_fkey; Type: FK CONSTRAINT; Schema: radedumo; Owner: datama2mi181
--

ALTER TABLE ONLY radedumo.bill
    ADD CONSTRAINT bill_fkey FOREIGN KEY (id) REFERENCES radedumo.check_in_slip(id);


--
-- TOC entry 3407 (class 2606 OID 25931)
-- Name: check_in_slip check_in_slip2_fkey; Type: FK CONSTRAINT; Schema: radedumo; Owner: datama2mi181
--

ALTER TABLE ONLY radedumo.check_in_slip
    ADD CONSTRAINT check_in_slip2_fkey FOREIGN KEY (id) REFERENCES radedumo.employee(id);


--
-- TOC entry 3408 (class 2606 OID 26012)
-- Name: check_in_slip check_in_slip3_fkey; Type: FK CONSTRAINT; Schema: radedumo; Owner: datama2mi181
--

ALTER TABLE ONLY radedumo.check_in_slip
    ADD CONSTRAINT check_in_slip3_fkey FOREIGN KEY (id) REFERENCES radedumo.room(id);


--
-- TOC entry 3406 (class 2606 OID 25921)
-- Name: check_in_slip check_in_slip_fkey; Type: FK CONSTRAINT; Schema: radedumo; Owner: datama2mi181
--

ALTER TABLE ONLY radedumo.check_in_slip
    ADD CONSTRAINT check_in_slip_fkey FOREIGN KEY (id) REFERENCES radedumo.customer(id);


--
-- TOC entry 3410 (class 2606 OID 26028)
-- Name: key_holder key_holder_fkey; Type: FK CONSTRAINT; Schema: radedumo; Owner: datama2mi181
--

ALTER TABLE ONLY radedumo.key_holder
    ADD CONSTRAINT key_holder_fkey FOREIGN KEY (id) REFERENCES radedumo.room(id);


--
-- TOC entry 3409 (class 2606 OID 25624)
-- Name: hotel room_fkey; Type: FK CONSTRAINT; Schema: radedumo; Owner: datama2mi181
--

ALTER TABLE ONLY radedumo.hotel
    ADD CONSTRAINT room_fkey FOREIGN KEY (id) REFERENCES radedumo.room(id);


-- Completed on 2019-12-05 09:22:08

--
-- PostgreSQL database dump complete
--

