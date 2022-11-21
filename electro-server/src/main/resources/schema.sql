USE electro;

-- DROP TABLES

DROP TABLE IF EXISTS
    province,
    district,
    address,
    user,
    role,
    user_role,
    office,
    department,
    job_level,
    job_title,
    job_type,
    employee,
    customer_group,
    customer_resource,
    customer_status,
    customer,
    property,
    category,
    tag,
    guarantee,
    unit,
    supplier,
    brand,
    specification,
    product,
    product_tag,
    variant,
    product_inventory_limit,
    variant_inventory_limit,
    warehouse,
    count,
    count_variant,
    destination,
    docket_reason,
    transfer,
    transfer_variant,
    storage_location,
    purchase_order,
    purchase_order_variant,
    docket,
    docket_variant,
    room,
    message,
    verification;

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
    line        VARCHAR(255)          NULL,
    province_id BIGINT                NULL,
    district_id BIGINT                NULL,
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

ALTER TABLE `role`
    ADD CONSTRAINT uc_role_code UNIQUE (code);

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

CREATE TABLE office
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    created_by BIGINT                NULL,
    updated_by BIGINT                NULL,
    name       VARCHAR(255)          NOT NULL,
    address_id BIGINT                NOT NULL,
    status     TINYINT               NOT NULL,
    CONSTRAINT pk_office PRIMARY KEY (id)
);

ALTER TABLE office
    ADD CONSTRAINT uc_office_address UNIQUE (address_id);

ALTER TABLE office
    ADD CONSTRAINT FK_OFFICE_ON_ADDRESS FOREIGN KEY (address_id) REFERENCES address (id);

CREATE TABLE department
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    created_by BIGINT                NULL,
    updated_by BIGINT                NULL,
    name       VARCHAR(255)          NOT NULL,
    status     TINYINT               NOT NULL,
    CONSTRAINT pk_department PRIMARY KEY (id)
);

CREATE TABLE job_level
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    created_by BIGINT                NULL,
    updated_by BIGINT                NULL,
    name       VARCHAR(255)          NOT NULL,
    status     TINYINT               NOT NULL,
    CONSTRAINT pk_job_level PRIMARY KEY (id)
);

CREATE TABLE job_title
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    created_by BIGINT                NULL,
    updated_by BIGINT                NULL,
    name       VARCHAR(255)          NOT NULL,
    status     TINYINT               NOT NULL,
    CONSTRAINT pk_job_title PRIMARY KEY (id)
);

CREATE TABLE job_type
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    created_by BIGINT                NULL,
    updated_by BIGINT                NULL,
    name       VARCHAR(255)          NOT NULL,
    status     TINYINT               NOT NULL,
    CONSTRAINT pk_job_type PRIMARY KEY (id)
);

CREATE TABLE employee
(
    id            BIGINT AUTO_INCREMENT NOT NULL,
    created_at    datetime              NOT NULL,
    updated_at    datetime              NOT NULL,
    created_by    BIGINT                NULL,
    updated_by    BIGINT                NULL,
    user_id       BIGINT                NOT NULL,
    office_id     BIGINT                NOT NULL,
    department_id BIGINT                NOT NULL,
    job_type_id   BIGINT                NOT NULL,
    job_level_id  BIGINT                NOT NULL,
    job_title_id  BIGINT                NOT NULL,
    CONSTRAINT pk_employee PRIMARY KEY (id)
);

ALTER TABLE employee
    ADD CONSTRAINT uc_employee_user UNIQUE (user_id);

ALTER TABLE employee
    ADD CONSTRAINT FK_EMPLOYEE_ON_DEPARTMENT FOREIGN KEY (department_id) REFERENCES department (id);

ALTER TABLE employee
    ADD CONSTRAINT FK_EMPLOYEE_ON_JOB_LEVEL FOREIGN KEY (job_level_id) REFERENCES job_level (id);

ALTER TABLE employee
    ADD CONSTRAINT FK_EMPLOYEE_ON_JOB_TITLE FOREIGN KEY (job_title_id) REFERENCES job_title (id);

ALTER TABLE employee
    ADD CONSTRAINT FK_EMPLOYEE_ON_JOB_TYPE FOREIGN KEY (job_type_id) REFERENCES job_type (id);

ALTER TABLE employee
    ADD CONSTRAINT FK_EMPLOYEE_ON_OFFICE FOREIGN KEY (office_id) REFERENCES office (id);

ALTER TABLE employee
    ADD CONSTRAINT FK_EMPLOYEE_ON_USER FOREIGN KEY (user_id) REFERENCES user (id);

CREATE TABLE customer_group
(
    id            BIGINT AUTO_INCREMENT NOT NULL,
    created_at    datetime              NOT NULL,
    updated_at    datetime              NOT NULL,
    created_by    BIGINT                NULL,
    updated_by    BIGINT                NULL,
    code          VARCHAR(255)          NOT NULL,
    name          VARCHAR(255)          NOT NULL,
    `description` VARCHAR(255)          NOT NULL,
    color         VARCHAR(255)          NOT NULL,
    status        TINYINT               NOT NULL,
    CONSTRAINT pk_customer_group PRIMARY KEY (id)
);

ALTER TABLE customer_group
    ADD CONSTRAINT uc_customer_group_code UNIQUE (code);

CREATE TABLE customer_resource
(
    id            BIGINT AUTO_INCREMENT NOT NULL,
    created_at    datetime              NOT NULL,
    updated_at    datetime              NOT NULL,
    created_by    BIGINT                NULL,
    updated_by    BIGINT                NULL,
    code          VARCHAR(255)          NOT NULL,
    name          VARCHAR(255)          NOT NULL,
    `description` VARCHAR(255)          NOT NULL,
    color         VARCHAR(255)          NOT NULL,
    status        TINYINT               NOT NULL,
    CONSTRAINT pk_customer_resource PRIMARY KEY (id)
);

ALTER TABLE customer_resource
    ADD CONSTRAINT uc_customer_resource_code UNIQUE (code);

CREATE TABLE customer_status
(
    id            BIGINT AUTO_INCREMENT NOT NULL,
    created_at    datetime              NOT NULL,
    updated_at    datetime              NOT NULL,
    created_by    BIGINT                NULL,
    updated_by    BIGINT                NULL,
    code          VARCHAR(255)          NOT NULL,
    name          VARCHAR(255)          NOT NULL,
    `description` VARCHAR(255)          NOT NULL,
    color         VARCHAR(255)          NOT NULL,
    status        TINYINT               NOT NULL,
    CONSTRAINT pk_customer_status PRIMARY KEY (id)
);

ALTER TABLE customer_status
    ADD CONSTRAINT uc_customer_status_code UNIQUE (code);

CREATE TABLE customer
(
    id                   BIGINT AUTO_INCREMENT NOT NULL,
    created_at           datetime              NOT NULL,
    updated_at           datetime              NOT NULL,
    created_by           BIGINT                NULL,
    updated_by           BIGINT                NULL,
    user_id              BIGINT                NOT NULL,
    customer_group_id    BIGINT                NOT NULL,
    customer_status_id   BIGINT                NOT NULL,
    customer_resource_id BIGINT                NOT NULL,
    CONSTRAINT pk_customer PRIMARY KEY (id)
);

ALTER TABLE customer
    ADD CONSTRAINT uc_customer_user UNIQUE (user_id);

ALTER TABLE customer
    ADD CONSTRAINT FK_CUSTOMER_ON_CUSTOMER_GROUP FOREIGN KEY (customer_group_id) REFERENCES customer_group (id);

ALTER TABLE customer
    ADD CONSTRAINT FK_CUSTOMER_ON_CUSTOMER_RESOURCE FOREIGN KEY (customer_resource_id) REFERENCES customer_resource (id);

ALTER TABLE customer
    ADD CONSTRAINT FK_CUSTOMER_ON_CUSTOMER_STATUS FOREIGN KEY (customer_status_id) REFERENCES customer_status (id);

ALTER TABLE customer
    ADD CONSTRAINT FK_CUSTOMER_ON_USER FOREIGN KEY (user_id) REFERENCES user (id);

CREATE TABLE property
(
    id            BIGINT AUTO_INCREMENT NOT NULL,
    created_at    datetime              NOT NULL,
    updated_at    datetime              NOT NULL,
    created_by    BIGINT                NULL,
    updated_by    BIGINT                NULL,
    name          VARCHAR(255)          NOT NULL,
    code          VARCHAR(255)          NOT NULL,
    `description` VARCHAR(255)          NULL,
    status        TINYINT               NOT NULL,
    CONSTRAINT pk_property PRIMARY KEY (id)
);

CREATE TABLE category
(
    id            BIGINT AUTO_INCREMENT NOT NULL,
    created_at    datetime              NOT NULL,
    updated_at    datetime              NOT NULL,
    created_by    BIGINT                NULL,
    updated_by    BIGINT                NULL,
    name          VARCHAR(255)          NOT NULL,
    slug          VARCHAR(255)          NOT NULL,
    `description` VARCHAR(255)          NULL,
    thumbnail     VARCHAR(255)          NULL,
    category_id   BIGINT                NULL,
    status        TINYINT               NOT NULL,
    CONSTRAINT pk_category PRIMARY KEY (id)
);

ALTER TABLE category
    ADD CONSTRAINT uc_category_slug UNIQUE (slug);

ALTER TABLE category
    ADD CONSTRAINT FK_CATEGORY_ON_CATEGORY FOREIGN KEY (category_id) REFERENCES category (id);

CREATE TABLE tag
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    created_by BIGINT                NULL,
    updated_by BIGINT                NULL,
    name       VARCHAR(255)          NOT NULL,
    slug       VARCHAR(255)          NOT NULL,
    status     TINYINT               NOT NULL,
    CONSTRAINT pk_tag PRIMARY KEY (id)
);

ALTER TABLE tag
    ADD CONSTRAINT uc_tag_slug UNIQUE (slug);

CREATE TABLE guarantee
(
    id            BIGINT AUTO_INCREMENT NOT NULL,
    created_at    datetime              NOT NULL,
    updated_at    datetime              NOT NULL,
    created_by    BIGINT                NULL,
    updated_by    BIGINT                NULL,
    name          VARCHAR(255)          NOT NULL,
    `description` VARCHAR(255)          NULL,
    status        TINYINT               NOT NULL,
    CONSTRAINT pk_guarantee PRIMARY KEY (id)
);

CREATE TABLE unit
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    created_by BIGINT                NULL,
    updated_by BIGINT                NULL,
    name       VARCHAR(255)          NOT NULL,
    status     TINYINT               NOT NULL,
    CONSTRAINT pk_unit PRIMARY KEY (id)
);

CREATE TABLE supplier
(
    id               BIGINT AUTO_INCREMENT NOT NULL,
    created_at       datetime              NOT NULL,
    updated_at       datetime              NOT NULL,
    created_by       BIGINT                NULL,
    updated_by       BIGINT                NULL,
    display_name     VARCHAR(255)          NOT NULL,
    code             VARCHAR(255)          NOT NULL,
    contact_fullname VARCHAR(255)          NULL,
    contact_email    VARCHAR(255)          NULL,
    contact_phone    VARCHAR(255)          NULL,
    company_name     VARCHAR(255)          NULL,
    tax_code         VARCHAR(255)          NULL,
    email            VARCHAR(255)          NULL,
    phone            VARCHAR(255)          NULL,
    fax              VARCHAR(255)          NULL,
    website          VARCHAR(255)          NULL,
    address_id       BIGINT                NULL,
    `description`    VARCHAR(255)          NULL,
    note             VARCHAR(255)          NULL,
    status           TINYINT               NOT NULL,
    CONSTRAINT pk_supplier PRIMARY KEY (id)
);

ALTER TABLE supplier
    ADD CONSTRAINT uc_supplier_address UNIQUE (address_id);

ALTER TABLE supplier
    ADD CONSTRAINT uc_supplier_code UNIQUE (code);

ALTER TABLE supplier
    ADD CONSTRAINT FK_SUPPLIER_ON_ADDRESS FOREIGN KEY (address_id) REFERENCES address (id);

CREATE TABLE brand
(
    id            BIGINT AUTO_INCREMENT NOT NULL,
    created_at    datetime              NOT NULL,
    updated_at    datetime              NOT NULL,
    created_by    BIGINT                NULL,
    updated_by    BIGINT                NULL,
    name          VARCHAR(255)          NOT NULL,
    code          VARCHAR(35)           NOT NULL,
    `description` VARCHAR(255)          NULL,
    status        TINYINT               NOT NULL,
    CONSTRAINT pk_brand PRIMARY KEY (id)
);

ALTER TABLE brand
    ADD CONSTRAINT uc_brand_code UNIQUE (code);

CREATE TABLE specification
(
    id            BIGINT AUTO_INCREMENT NOT NULL,
    created_at    datetime              NOT NULL,
    updated_at    datetime              NOT NULL,
    created_by    BIGINT                NULL,
    updated_by    BIGINT                NULL,
    name          VARCHAR(255)          NOT NULL,
    code          VARCHAR(255)          NOT NULL,
    `description` VARCHAR(255)          NULL,
    status        TINYINT               NOT NULL,
    CONSTRAINT pk_specification PRIMARY KEY (id)
);

ALTER TABLE specification
    ADD CONSTRAINT uc_specification_code UNIQUE (code);

CREATE TABLE product
(
    id                BIGINT AUTO_INCREMENT NOT NULL,
    created_at        datetime              NOT NULL,
    updated_at        datetime              NOT NULL,
    created_by        BIGINT                NULL,
    updated_by        BIGINT                NULL,
    name              VARCHAR(255)          NOT NULL,
    code              VARCHAR(255)          NOT NULL,
    slug              VARCHAR(255)          NOT NULL,
    short_description VARCHAR(255)          NULL,
    `description`     VARCHAR(255)          NULL,
    thumbnail         VARCHAR(255)          NULL,
    images            JSON                  NULL,
    status            TINYINT               NOT NULL,
    category_id       BIGINT                NULL,
    brand_id          BIGINT                NULL,
    supplier_id       BIGINT                NULL,
    unit_id           BIGINT                NULL,
    specifications    JSON                  NULL,
    properties        JSON                  NULL,
    weight            DOUBLE                NULL,
    guarantee_id      BIGINT                NULL,
    CONSTRAINT pk_product PRIMARY KEY (id)
);

ALTER TABLE product
    ADD CONSTRAINT uc_product_code UNIQUE (code);

ALTER TABLE product
    ADD CONSTRAINT uc_product_slug UNIQUE (slug);

ALTER TABLE product
    ADD CONSTRAINT FK_PRODUCT_ON_BRAND FOREIGN KEY (brand_id) REFERENCES brand (id);

ALTER TABLE product
    ADD CONSTRAINT FK_PRODUCT_ON_CATEGORY FOREIGN KEY (category_id) REFERENCES category (id);

ALTER TABLE product
    ADD CONSTRAINT FK_PRODUCT_ON_GUARANTEE FOREIGN KEY (guarantee_id) REFERENCES guarantee (id);

ALTER TABLE product
    ADD CONSTRAINT FK_PRODUCT_ON_SUPPLIER FOREIGN KEY (supplier_id) REFERENCES supplier (id);

ALTER TABLE product
    ADD CONSTRAINT FK_PRODUCT_ON_UNIT FOREIGN KEY (unit_id) REFERENCES unit (id);

CREATE TABLE product_tag
(
    product_id bigint not null,
    tag_id     bigint not null,
    primary key (product_id, tag_id)
);

ALTER TABLE product_tag
    ADD CONSTRAINT FK_PRODUCT_TAG_ON_PRODUCT FOREIGN KEY (product_id) REFERENCES product (id);

ALTER TABLE product_tag
    ADD CONSTRAINT FK_PRODUCT_TAG_ON_TAG FOREIGN KEY (tag_id) REFERENCES tag (id);

CREATE TABLE variant
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    created_by BIGINT                NULL,
    updated_by BIGINT                NULL,
    product_id BIGINT                NOT NULL,
    sku        VARCHAR(255)          NOT NULL,
    cost       DOUBLE                NOT NULL,
    price      DOUBLE                NOT NULL,
    properties JSON                  NULL,
    images     JSON                  NULL,
    status     TINYINT               NOT NULL,
    CONSTRAINT pk_variant PRIMARY KEY (id)
);

ALTER TABLE variant
    ADD CONSTRAINT uc_variant_sku UNIQUE (sku);

ALTER TABLE variant
    ADD CONSTRAINT FK_VARIANT_ON_PRODUCT FOREIGN KEY (product_id) REFERENCES product (id);

CREATE TABLE product_inventory_limit
(
    id            BIGINT AUTO_INCREMENT NOT NULL,
    created_at    datetime              NOT NULL,
    updated_at    datetime              NOT NULL,
    created_by    BIGINT                NULL,
    updated_by    BIGINT                NULL,
    product_id    BIGINT                NOT NULL,
    minimum_limit INT                   NULL,
    maximum_limit INT                   NULL,
    CONSTRAINT pk_product_inventory_limit PRIMARY KEY (id)
);

ALTER TABLE product_inventory_limit
    ADD CONSTRAINT uc_product_inventory_limit_product UNIQUE (product_id);

ALTER TABLE product_inventory_limit
    ADD CONSTRAINT FK_PRODUCT_INVENTORY_LIMIT_ON_PRODUCT FOREIGN KEY (product_id) REFERENCES product (id);

CREATE TABLE variant_inventory_limit
(
    id            BIGINT AUTO_INCREMENT NOT NULL,
    created_at    datetime              NOT NULL,
    updated_at    datetime              NOT NULL,
    created_by    BIGINT                NULL,
    updated_by    BIGINT                NULL,
    variant_id    BIGINT                NOT NULL,
    minimum_limit INT                   NULL,
    maximum_limit INT                   NULL,
    CONSTRAINT pk_variant_inventory_limit PRIMARY KEY (id)
);

ALTER TABLE variant_inventory_limit
    ADD CONSTRAINT uc_variant_inventory_limit_variant UNIQUE (variant_id);

ALTER TABLE variant_inventory_limit
    ADD CONSTRAINT FK_VARIANT_INVENTORY_LIMIT_ON_VARIANT FOREIGN KEY (variant_id) REFERENCES variant (id);

CREATE TABLE warehouse
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    created_by BIGINT                NULL,
    updated_by BIGINT                NULL,
    code       VARCHAR(255)          NOT NULL,
    name       VARCHAR(255)          NOT NULL,
    address_id BIGINT                NULL,
    status     TINYINT               NOT NULL,
    CONSTRAINT pk_warehouse PRIMARY KEY (id)
);

ALTER TABLE warehouse
    ADD CONSTRAINT uc_warehouse_address UNIQUE (address_id);

ALTER TABLE warehouse
    ADD CONSTRAINT uc_warehouse_code UNIQUE (code);

ALTER TABLE warehouse
    ADD CONSTRAINT FK_WAREHOUSE_ON_ADDRESS FOREIGN KEY (address_id) REFERENCES address (id);

CREATE TABLE count
(
    id           BIGINT AUTO_INCREMENT NOT NULL,
    created_at   datetime              NOT NULL,
    updated_at   datetime              NOT NULL,
    created_by   BIGINT                NULL,
    updated_by   BIGINT                NULL,
    code         VARCHAR(255)          NOT NULL,
    warehouse_id BIGINT                NOT NULL,
    note         VARCHAR(255)          NULL,
    status       TINYINT               NOT NULL,
    CONSTRAINT pk_count PRIMARY KEY (id)
);

ALTER TABLE count
    ADD CONSTRAINT uc_count_code UNIQUE (code);

ALTER TABLE count
    ADD CONSTRAINT FK_COUNT_ON_WAREHOUSE FOREIGN KEY (warehouse_id) REFERENCES warehouse (id);

CREATE TABLE count_variant
(
    count_id         BIGINT NOT NULL,
    variant_id       BIGINT NOT NULL,
    inventory        INT    NOT NULL,
    actual_inventory INT    NOT NULL,
    CONSTRAINT pk_count_variant PRIMARY KEY (count_id, variant_id)
);

ALTER TABLE count_variant
    ADD CONSTRAINT FK_COUNT_VARIANT_ON_COUNT FOREIGN KEY (count_id) REFERENCES count (id);

ALTER TABLE count_variant
    ADD CONSTRAINT FK_COUNT_VARIANT_ON_VARIANT FOREIGN KEY (variant_id) REFERENCES variant (id);

CREATE TABLE destination
(
    id               BIGINT AUTO_INCREMENT NOT NULL,
    created_at       datetime              NOT NULL,
    updated_at       datetime              NOT NULL,
    created_by       BIGINT                NULL,
    updated_by       BIGINT                NULL,
    contact_fullname VARCHAR(255)          NULL,
    contact_email    VARCHAR(255)          NULL,
    contact_phone    VARCHAR(255)          NULL,
    address_id       BIGINT                NOT NULL,
    status           TINYINT               NOT NULL,
    CONSTRAINT pk_destination PRIMARY KEY (id)
);

ALTER TABLE destination
    ADD CONSTRAINT uc_destination_address UNIQUE (address_id);

ALTER TABLE destination
    ADD CONSTRAINT FK_DESTINATION_ON_ADDRESS FOREIGN KEY (address_id) REFERENCES address (id);

CREATE TABLE docket_reason
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    created_by BIGINT                NULL,
    updated_by BIGINT                NULL,
    name       VARCHAR(255)          NOT NULL,
    status     TINYINT               NOT NULL,
    CONSTRAINT pk_docket_reason PRIMARY KEY (id)
);

CREATE TABLE transfer
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    created_by BIGINT                NULL,
    updated_by BIGINT                NULL,
    code       VARCHAR(255)          NOT NULL,
    note       VARCHAR(255)          NULL,
    status     TINYINT               NOT NULL,
    CONSTRAINT pk_transfer PRIMARY KEY (id)
);

ALTER TABLE transfer
    ADD CONSTRAINT uc_transfer_code UNIQUE (code);

CREATE TABLE transfer_variant
(
    transfer_id BIGINT NOT NULL,
    variant_id  BIGINT NOT NULL,
    quantity    INT    NOT NULL,
    CONSTRAINT pk_transfer_variant PRIMARY KEY (transfer_id, variant_id)
);

ALTER TABLE transfer_variant
    ADD CONSTRAINT FK_TRANSFER_VARIANT_ON_TRANSFER FOREIGN KEY (transfer_id) REFERENCES transfer (id);

ALTER TABLE transfer_variant
    ADD CONSTRAINT FK_TRANSFER_VARIANT_ON_VARIANT FOREIGN KEY (variant_id) REFERENCES variant (id);

CREATE TABLE storage_location (
   id BIGINT AUTO_INCREMENT NOT NULL,
   created_at datetime NOT NULL,
   updated_at datetime NOT NULL,
   created_by BIGINT NULL,
   updated_by BIGINT NULL,
   storage_location_id BIGINT NOT NULL,
   warehouse_id BIGINT NOT NULL,
   name VARCHAR(255) NULL,
   CONSTRAINT pk_storage_location PRIMARY KEY (id)
);

ALTER TABLE storage_location ADD CONSTRAINT uc_storage_location_storage_location UNIQUE (storage_location_id);

ALTER TABLE storage_location ADD CONSTRAINT FK_STORAGE_LOCATION_ON_STORAGE_LOCATION FOREIGN KEY (storage_location_id) REFERENCES variant (id);

ALTER TABLE storage_location ADD CONSTRAINT FK_STORAGE_LOCATION_ON_WAREHOUSE FOREIGN KEY (warehouse_id) REFERENCES warehouse (id);


CREATE TABLE purchase_order (
  id BIGINT AUTO_INCREMENT NOT NULL,
   created_at datetime NOT NULL,
   updated_at datetime NOT NULL,
   created_by BIGINT NULL,
   updated_by BIGINT NULL,
   code VARCHAR(255) NULL,
   supplier_id BIGINT NOT NULL,
   destination_id BIGINT NOT NULL,
   total_amount DOUBLE NULL,
   note VARCHAR(255) NULL,
   status TINYINT NOT NULL,
   CONSTRAINT pk_purchase_order PRIMARY KEY (id)
);

ALTER TABLE purchase_order ADD CONSTRAINT FK_PURCHASE_ORDER_ON_DESTINATION FOREIGN KEY (destination_id) REFERENCES destination (id);

ALTER TABLE purchase_order ADD CONSTRAINT FK_PURCHASE_ORDER_ON_SUPPLIER FOREIGN KEY (supplier_id) REFERENCES supplier (id);

CREATE TABLE purchase_order_variant (
   cost DOUBLE NOT NULL,
   quantity INT NOT NULL,
   amount DOUBLE NOT NULL,
   purchase_order_id BIGINT NOT NULL,
   variant_id BIGINT NOT NULL,
   CONSTRAINT pk_purchase_order_variant PRIMARY KEY (purchase_order_id, variant_id)
);

ALTER TABLE purchase_order_variant ADD CONSTRAINT FK_PURCHASE_ORDER_VARIANT_ON_PURCHASE_ORDER FOREIGN KEY (purchase_order_id) REFERENCES purchase_order (id);

ALTER TABLE purchase_order_variant ADD CONSTRAINT FK_PURCHASE_ORDER_VARIANT_ON_VARIANT FOREIGN KEY (variant_id) REFERENCES variant (id);

CREATE TABLE docket (
  id BIGINT AUTO_INCREMENT NOT NULL,
   created_at datetime NOT NULL,
   updated_at datetime NOT NULL,
   created_by BIGINT NULL,
   updated_by BIGINT NULL,
   type INT NULL,
   code VARCHAR(255) NULL,
   reason_id BIGINT NULL,
   warehouse_id BIGINT NOT NULL,
   note VARCHAR(255) NULL,
   status TINYINT NOT NULL,
   purchase_order_id BIGINT NOT NULL,
   CONSTRAINT pk_docket PRIMARY KEY (id)
);

ALTER TABLE docket ADD CONSTRAINT FK_DOCKET_ON_PURCHASE_ORDER FOREIGN KEY (purchase_order_id) REFERENCES purchase_order (id);

ALTER TABLE docket ADD CONSTRAINT FK_DOCKET_ON_REASON FOREIGN KEY (reason_id) REFERENCES docket_reason (id);

ALTER TABLE docket ADD CONSTRAINT FK_DOCKET_ON_WAREHOUSE FOREIGN KEY (warehouse_id) REFERENCES warehouse (id);

CREATE TABLE docket_variant (
   quantity INT NOT NULL,
   docket_id BIGINT NOT NULL,
   variant_id BIGINT NOT NULL,
   CONSTRAINT pk_docket_variant PRIMARY KEY (docket_id, variant_id)
);

ALTER TABLE docket_variant ADD CONSTRAINT FK_DOCKET_VARIANT_ON_DOCKET FOREIGN KEY (docket_id) REFERENCES docket (id);

ALTER TABLE docket_variant ADD CONSTRAINT FK_DOCKET_VARIANT_ON_VARIANT FOREIGN KEY (variant_id) REFERENCES variant (id);

CREATE TABLE room (
  id BIGINT AUTO_INCREMENT NOT NULL,
   created_at datetime NOT NULL,
   updated_at datetime NOT NULL,
   created_by BIGINT NULL,
   updated_by BIGINT NULL,
   name VARCHAR(255) NOT NULL,
   user_id BIGINT NOT NULL,
   last_message_id BIGINT NULL,
   CONSTRAINT pk_room PRIMARY KEY (id)
);

CREATE TABLE message (
  id BIGINT AUTO_INCREMENT NOT NULL,
   created_at datetime NOT NULL,
   updated_at datetime NOT NULL,
   created_by BIGINT NULL,
   updated_by BIGINT NULL,
   content VARCHAR(255) NULL,
   status TINYINT NOT NULL,
   user_id BIGINT NULL,
   room_id BIGINT NULL,
   CONSTRAINT pk_message PRIMARY KEY (id)
);

ALTER TABLE room ADD CONSTRAINT uc_room_last_message UNIQUE (last_message_id);

ALTER TABLE room ADD CONSTRAINT uc_room_user UNIQUE (user_id);

ALTER TABLE room ADD CONSTRAINT FK_ROOM_ON_LAST_MESSAGE FOREIGN KEY (last_message_id) REFERENCES message (id);

ALTER TABLE room ADD CONSTRAINT FK_ROOM_ON_USER FOREIGN KEY (user_id) REFERENCES user (id);

ALTER TABLE message ADD CONSTRAINT FK_MESSAGE_ON_ROOM FOREIGN KEY (room_id) REFERENCES room (id);

ALTER TABLE message ADD CONSTRAINT FK_MESSAGE_ON_USER FOREIGN KEY (user_id) REFERENCES user (id);

CREATE TABLE verification (
  id BIGINT AUTO_INCREMENT NOT NULL,
   created_at datetime NOT NULL,
   updated_at datetime NOT NULL,
   created_by BIGINT NULL,
   updated_by BIGINT NULL,
   user_id BIGINT NOT NULL,
   token VARCHAR(255) NOT NULL,
   expired_at datetime NOT NULL,
   CONSTRAINT pk_verification PRIMARY KEY (id)
);

ALTER TABLE verification ADD CONSTRAINT uc_verification_user UNIQUE (user_id);

ALTER TABLE verification ADD CONSTRAINT FK_VERIFICATION_ON_USER FOREIGN KEY (user_id) REFERENCES user (id);

ALTER TABLE user ADD CONSTRAINT uc_user_email UNIQUE (email);

ALTER TABLE user ADD CONSTRAINT uc_user_username UNIQUE (username);
