USE electro;

-- DROP TABLES

DROP TABLE IF EXISTS province, district, office, address, user, role, user_role, department, job_level, job_title, job_type, employee;

-- CREATE TABLES

CREATE TABLE province
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    created_by BIGINT                NULL,
    updated_by BIGINT                NULL,
    name       VARCHAR(255)          NOT NULL,
    code       VARCHAR(35)           NOT NULL,
    CONSTRAINT pk_province PRIMARY KEY (id)
);

CREATE TABLE district
(
    id          BIGINT AUTO_INCREMENT NOT NULL,
    created_at  datetime              NOT NULL,
    updated_at  datetime              NOT NULL,
    created_by  BIGINT                NULL,
    updated_by  BIGINT                NULL,
    name        VARCHAR(255)          NOT NULL,
    code        VARCHAR(35)           NOT NULL,
    province_id BIGINT                NOT NULL,
    CONSTRAINT pk_district PRIMARY KEY (id)
);

ALTER TABLE district
    ADD CONSTRAINT FK_DISTRICT_ON_PROVINCE FOREIGN KEY (province_id) REFERENCES province (id);

CREATE TABLE address
(
    id          BIGINT AUTO_INCREMENT NOT NULL,
    created_at  datetime              NOT NULL,
    updated_at  datetime              NOT NULL,
    created_by  BIGINT                NULL,
    updated_by  BIGINT                NULL,
    line        VARCHAR(255)          NOT NULL,
    province_id BIGINT                NOT NULL,
    district_id BIGINT                NOT NULL,
    CONSTRAINT pk_address PRIMARY KEY (id)
);

ALTER TABLE address
    ADD CONSTRAINT FK_ADDRESS_ON_DISTRICT FOREIGN KEY (district_id) REFERENCES district (id);

ALTER TABLE address
    ADD CONSTRAINT FK_ADDRESS_ON_PROVINCE FOREIGN KEY (province_id) REFERENCES province (id);

CREATE TABLE user
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    created_by BIGINT                NULL,
    updated_by BIGINT                NULL,
    username   VARCHAR(255)          NOT NULL,
    password   VARCHAR(255)          NOT NULL,
    fullname   VARCHAR(255)          NOT NULL,
    email      VARCHAR(255)          NOT NULL,
    phone      VARCHAR(255)          NOT NULL,
    gender     CHAR                  NOT NULL,
    address_id BIGINT                NOT NULL,
    avatar     VARCHAR(255)          NULL,
    status     TINYINT               NOT NULL,
    CONSTRAINT pk_user PRIMARY KEY (id)
);

ALTER TABLE user
    ADD CONSTRAINT uc_user_address UNIQUE (address_id);

ALTER TABLE user
    ADD CONSTRAINT FK_USER_ON_ADDRESS FOREIGN KEY (address_id) REFERENCES address (id);

CREATE TABLE `role`
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    created_by BIGINT                NULL,
    updated_by BIGINT                NULL,
    code       VARCHAR(35)           NOT NULL,
    name       VARCHAR(255)          NOT NULL,
    status     TINYINT               NOT NULL,
    CONSTRAINT pk_role PRIMARY KEY (id)
);

CREATE TABLE user_role
(
    user_id bigint not null,
    role_id bigint not null,
    primary key (user_id, role_id)
);

ALTER TABLE user_role
    ADD CONSTRAINT FK_USER_ROLE_ON_USER FOREIGN KEY (user_id) REFERENCES user (id);

ALTER TABLE user_role
    ADD CONSTRAINT FK_USER_ROLE_ON_ROLE FOREIGN KEY (role_id) REFERENCES role (id);


CREATE TABLE office (
   id BIGINT AUTO_INCREMENT NOT NULL,
   created_at datetime NOT NULL,
   updated_at datetime NOT NULL,
   created_by BIGINT NULL,
   updated_by BIGINT NULL,
   name VARCHAR(255) NOT NULL,
   address_id BIGINT NOT NULL,
   status INT NOT NULL,
   CONSTRAINT pk_office PRIMARY KEY (id)
);

ALTER TABLE office ADD CONSTRAINT uc_office_address UNIQUE (address_id);

ALTER TABLE office ADD CONSTRAINT FK_OFFICE_ON_ADDRESS FOREIGN KEY (address_id) REFERENCES address (id);

CREATE TABLE department (
  id BIGINT AUTO_INCREMENT NOT NULL,
   created_at datetime NOT NULL,
   updated_at datetime NOT NULL,
   created_by BIGINT NULL,
   updated_by BIGINT NULL,
   name VARCHAR(255) NOT NULL,
   status TINYINT NOT NULL,
   CONSTRAINT pk_department PRIMARY KEY (id)
);

CREATE TABLE job_level (
  id BIGINT AUTO_INCREMENT NOT NULL,
   created_at datetime NOT NULL,
   updated_at datetime NOT NULL,
   created_by BIGINT NULL,
   updated_by BIGINT NULL,
   name VARCHAR(255) NOT NULL,
   status TINYINT NOT NULL,
   CONSTRAINT pk_job_lever PRIMARY KEY (id)
);

CREATE TABLE job_title (
  id BIGINT AUTO_INCREMENT NOT NULL,
   created_at datetime NOT NULL,
   updated_at datetime NOT NULL,
   created_by BIGINT NULL,
   updated_by BIGINT NULL,
   name VARCHAR(255) NOT NULL,
   status TINYINT NOT NULL,
   CONSTRAINT pk_job_title PRIMARY KEY (id)
);

CREATE TABLE job_type (
  id BIGINT AUTO_INCREMENT NOT NULL,
   created_at datetime NOT NULL,
   updated_at datetime NOT NULL,
   created_by BIGINT NULL,
   updated_by BIGINT NULL,
   name VARCHAR(255) NOT NULL,
   status TINYINT NOT NULL,
   CONSTRAINT pk_job_type PRIMARY KEY (id)
);

CREATE TABLE employee (
  id BIGINT AUTO_INCREMENT NOT NULL,
   created_at datetime NOT NULL,
   updated_at datetime NOT NULL,
   created_by BIGINT NULL,
   updated_by BIGINT NULL,
   user_id BIGINT NOT NULL,
   office_id BIGINT NOT NULL,
   department_id BIGINT NOT NULL,
   job_type_id BIGINT NOT NULL,
   job_level_id BIGINT NOT NULL,
   job_title_id BIGINT NOT NULL,
   CONSTRAINT pk_employee PRIMARY KEY (id)
);

ALTER TABLE employee ADD CONSTRAINT uc_employee_user UNIQUE (user_id);

ALTER TABLE employee ADD CONSTRAINT FK_EMPLOYEE_ON_DEPARTMENT FOREIGN KEY (department_id) REFERENCES department (id);

ALTER TABLE employee ADD CONSTRAINT FK_EMPLOYEE_ON_JOBLEVEL FOREIGN KEY (job_level_id) REFERENCES job_level (id);

ALTER TABLE employee ADD CONSTRAINT FK_EMPLOYEE_ON_JOBTITLE FOREIGN KEY (job_title_id) REFERENCES job_title (id);

ALTER TABLE employee ADD CONSTRAINT FK_EMPLOYEE_ON_JOBTYPE FOREIGN KEY (job_type_id) REFERENCES job_type (id);

ALTER TABLE employee ADD CONSTRAINT FK_EMPLOYEE_ON_OFFICE FOREIGN KEY (office_id) REFERENCES office (id);

ALTER TABLE employee ADD CONSTRAINT FK_EMPLOYEE_ON_USER FOREIGN KEY (user_id) REFERENCES user (id);