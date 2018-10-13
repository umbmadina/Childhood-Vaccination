--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 9.6.10

-- Started on 2018-10-13 11:30:31 +06

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12655)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2469 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 190 (class 1259 OID 25333)
-- Name: Child; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Child" (
    iin character varying(12) NOT NULL,
    id_doctor character varying(12) NOT NULL,
    id_hospital character varying(12) NOT NULL,
    id_schedule character varying(12) NOT NULL,
    name character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    paternity character varying(50) NOT NULL,
    phone numeric(11,0) NOT NULL,
    created_at abstime NOT NULL,
    updated_at abstime NOT NULL,
    birth_date abstime NOT NULL,
    photo bytea NOT NULL
);


ALTER TABLE public."Child" OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 25325)
-- Name: Doctor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Doctor" (
    id_doctor character varying NOT NULL,
    id_hospital character varying(12) NOT NULL,
    name character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    paternity character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    phone numeric(11,0) NOT NULL,
    birth_date abstime NOT NULL,
    created_at abstime NOT NULL,
    updated_at abstime NOT NULL,
    photo bytea
);


ALTER TABLE public."Doctor" OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 25392)
-- Name: DoctorSchedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DoctorSchedule" (
    id_schedule character varying(12) NOT NULL,
    id_doctor character varying(12) NOT NULL,
    name character varying(50) NOT NULL,
    created_at abstime NOT NULL,
    updated_at abstime NOT NULL
);


ALTER TABLE public."DoctorSchedule" OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 25402)
-- Name: DoctorScheduleItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DoctorScheduleItem" (
    id_item character varying(12) NOT NULL,
    id_schedule character varying(12) NOT NULL,
    date abstime NOT NULL,
    room numeric(3,0) NOT NULL,
    time_start abstime NOT NULL,
    time_finish abstime NOT NULL,
    "created_at " abstime NOT NULL,
    updated_at abstime NOT NULL
);


ALTER TABLE public."DoctorScheduleItem" OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 25320)
-- Name: Hospital; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Hospital" (
    id_hospital character varying(12) NOT NULL,
    hospital_name character varying(100) NOT NULL,
    created_at abstime NOT NULL,
    updated_at abstime NOT NULL
);


ALTER TABLE public."Hospital" OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 25353)
-- Name: Nurse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Nurse" (
    id_nurse character varying(12) NOT NULL,
    name character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    id_doctor character varying(12) NOT NULL,
    photo bytea NOT NULL,
    created_at abstime NOT NULL,
    updated_at abstime NOT NULL
);


ALTER TABLE public."Nurse" OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 25371)
-- Name: Prescription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Prescription" (
    id_prescription character varying(12) NOT NULL,
    id_doctor character varying(12) NOT NULL,
    id_child character varying(12) NOT NULL,
    date abstime NOT NULL,
    diagnosis character varying(100) NOT NULL,
    description character varying(1000) NOT NULL,
    prescription character varying(500) NOT NULL,
    "created_at " abstime NOT NULL,
    updated_at abstime NOT NULL
);


ALTER TABLE public."Prescription" OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 25412)
-- Name: TicketDoctor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TicketDoctor" (
    id_ticket character varying(12) NOT NULL,
    id_schedule character varying(12) NOT NULL,
    name character varying(50) NOT NULL,
    date abstime NOT NULL,
    room numeric(4,0) NOT NULL,
    description character varying(500) NOT NULL,
    created_at abstime NOT NULL,
    updated_at abstime NOT NULL
);


ALTER TABLE public."TicketDoctor" OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 25310)
-- Name: TicketVaccine; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TicketVaccine" (
    id_ticket character varying(12) NOT NULL,
    id_vaccine_schedule character varying(12) NOT NULL,
    ticket_name character varying(50) NOT NULL,
    ticket_date abstime NOT NULL,
    room numeric(4,0) NOT NULL,
    ticket_created_at abstime NOT NULL,
    ticket_updated_at abstime NOT NULL,
    id_nurse character varying(12) NOT NULL
);


ALTER TABLE public."TicketVaccine" OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 25297)
-- Name: Vaccine; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Vaccine" (
    name character varying(50) NOT NULL,
    id_vaccine_schedule character varying(12) NOT NULL,
    created_at abstime NOT NULL,
    updated_at abstime NOT NULL,
    id_vaccine character varying(12) NOT NULL,
    id_schedule character varying(12) NOT NULL,
    name_vaccine character varying(50) NOT NULL,
    post_care_description character varying(1000),
    age numeric(3,0) NOT NULL,
    "date " abstime,
    vaccine_created_at abstime NOT NULL,
    vaccine_updated_at abstime NOT NULL
);


ALTER TABLE public."Vaccine" OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 25292)
-- Name: VaccineSchedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."VaccineSchedule" (
    name character varying(50) NOT NULL,
    id_vaccine_schedule character varying(12) NOT NULL,
    created_at abstime NOT NULL,
    updated_at abstime NOT NULL
);


ALTER TABLE public."VaccineSchedule" OWNER TO postgres;

--
-- TOC entry 2322 (class 2606 OID 25337)
-- Name: Child Child_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Child"
    ADD CONSTRAINT "Child_pkey" PRIMARY KEY (iin);


--
-- TOC entry 2330 (class 2606 OID 25406)
-- Name: DoctorScheduleItem DoctorScheduleItem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DoctorScheduleItem"
    ADD CONSTRAINT "DoctorScheduleItem_pkey" PRIMARY KEY (id_item);


--
-- TOC entry 2328 (class 2606 OID 25396)
-- Name: DoctorSchedule DoctorSchedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DoctorSchedule"
    ADD CONSTRAINT "DoctorSchedule_pkey" PRIMARY KEY (id_schedule);


--
-- TOC entry 2320 (class 2606 OID 25332)
-- Name: Doctor Doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Doctor"
    ADD CONSTRAINT "Doctor_pkey" PRIMARY KEY (id_doctor);


--
-- TOC entry 2318 (class 2606 OID 25324)
-- Name: Hospital Hospital_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Hospital"
    ADD CONSTRAINT "Hospital_pkey" PRIMARY KEY (id_hospital);


--
-- TOC entry 2324 (class 2606 OID 25360)
-- Name: Nurse Nurse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Nurse"
    ADD CONSTRAINT "Nurse_pkey" PRIMARY KEY (id_nurse);


--
-- TOC entry 2326 (class 2606 OID 25378)
-- Name: Prescription Prescription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Prescription"
    ADD CONSTRAINT "Prescription_pkey" PRIMARY KEY (id_prescription);


--
-- TOC entry 2332 (class 2606 OID 25419)
-- Name: TicketDoctor TicketDoctor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TicketDoctor"
    ADD CONSTRAINT "TicketDoctor_pkey" PRIMARY KEY (id_ticket);


--
-- TOC entry 2316 (class 2606 OID 25314)
-- Name: TicketVaccine TicketVaccine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TicketVaccine"
    ADD CONSTRAINT "TicketVaccine_pkey" PRIMARY KEY (id_ticket);


--
-- TOC entry 2312 (class 2606 OID 25296)
-- Name: VaccineSchedule VaccineSchedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."VaccineSchedule"
    ADD CONSTRAINT "VaccineSchedule_pkey" PRIMARY KEY (id_vaccine_schedule);


--
-- TOC entry 2314 (class 2606 OID 25304)
-- Name: Vaccine Vaccine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vaccine"
    ADD CONSTRAINT "Vaccine_pkey" PRIMARY KEY (id_vaccine);


--
-- TOC entry 2336 (class 2606 OID 25338)
-- Name: Child Child_id_doctor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Child"
    ADD CONSTRAINT "Child_id_doctor_fkey" FOREIGN KEY (id_doctor) REFERENCES public."Doctor"(id_doctor) MATCH FULL ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2337 (class 2606 OID 25343)
-- Name: Child Child_id_hospital_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Child"
    ADD CONSTRAINT "Child_id_hospital_fkey" FOREIGN KEY (id_hospital) REFERENCES public."Hospital"(id_hospital) MATCH FULL ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2338 (class 2606 OID 25348)
-- Name: Child Child_id_schedule_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Child"
    ADD CONSTRAINT "Child_id_schedule_fkey" FOREIGN KEY (id_schedule) REFERENCES public."VaccineSchedule"(id_vaccine_schedule) MATCH FULL ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2343 (class 2606 OID 25407)
-- Name: DoctorScheduleItem DoctorScheduleItem_id_schedule_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DoctorScheduleItem"
    ADD CONSTRAINT "DoctorScheduleItem_id_schedule_fkey" FOREIGN KEY (id_schedule) REFERENCES public."DoctorSchedule"(id_schedule) MATCH FULL ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2342 (class 2606 OID 25397)
-- Name: DoctorSchedule DoctorSchedule_id_doctor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DoctorSchedule"
    ADD CONSTRAINT "DoctorSchedule_id_doctor_fkey" FOREIGN KEY (id_doctor) REFERENCES public."Doctor"(id_doctor) MATCH FULL ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2339 (class 2606 OID 25361)
-- Name: Nurse Nurse_id_doctor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Nurse"
    ADD CONSTRAINT "Nurse_id_doctor_fkey" FOREIGN KEY (id_doctor) REFERENCES public."Doctor"(id_doctor) MATCH FULL ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2341 (class 2606 OID 25384)
-- Name: Prescription Prescription_id_child_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Prescription"
    ADD CONSTRAINT "Prescription_id_child_fkey" FOREIGN KEY (id_child) REFERENCES public."Child"(iin) MATCH FULL ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2340 (class 2606 OID 25379)
-- Name: Prescription Prescription_id_doctor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Prescription"
    ADD CONSTRAINT "Prescription_id_doctor_fkey" FOREIGN KEY (id_doctor) REFERENCES public."Doctor"(id_doctor) MATCH FULL ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2344 (class 2606 OID 25420)
-- Name: TicketDoctor TicketDoctor_id_schedule_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TicketDoctor"
    ADD CONSTRAINT "TicketDoctor_id_schedule_fkey" FOREIGN KEY (id_schedule) REFERENCES public."DoctorSchedule"(id_schedule) MATCH FULL ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2335 (class 2606 OID 25366)
-- Name: TicketVaccine TicketVaccine_id_nurse_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TicketVaccine"
    ADD CONSTRAINT "TicketVaccine_id_nurse_fkey" FOREIGN KEY (id_nurse) REFERENCES public."Nurse"(id_nurse) MATCH FULL ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- TOC entry 2334 (class 2606 OID 25315)
-- Name: TicketVaccine TicketVaccine_id_vaccine_schedule_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TicketVaccine"
    ADD CONSTRAINT "TicketVaccine_id_vaccine_schedule_fkey" FOREIGN KEY (id_vaccine_schedule) REFERENCES public."VaccineSchedule"(id_vaccine_schedule) MATCH FULL ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2333 (class 2606 OID 25305)
-- Name: Vaccine id_vaccine_schedule; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vaccine"
    ADD CONSTRAINT id_vaccine_schedule FOREIGN KEY (id_schedule) REFERENCES public."VaccineSchedule"(id_vaccine_schedule) MATCH FULL ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2018-10-13 11:30:31 +06

--
-- PostgreSQL database dump complete
--

