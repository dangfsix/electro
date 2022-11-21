
    drop table if exists prod.address;

    drop table if exists prod.brand;

    drop table if exists prod.category;

    drop table if exists prod.count;

    drop table if exists prod.count_variant;

    drop table if exists prod.customer;

    drop table if exists prod.customer_group;

    drop table if exists prod.customer_resource;

    drop table if exists prod.customer_status;

    drop table if exists prod.department;

    drop table if exists prod.destination;

    drop table if exists prod.district;

    drop table if exists prod.docket;

    drop table if exists prod.docket_reason;

    drop table if exists prod.docket_variant;

    drop table if exists prod.employee;

    drop table if exists prod.guarantee;

    drop table if exists prod.job_level;

    drop table if exists prod.job_title;

    drop table if exists prod.job_type;

    drop table if exists prod.message;

    drop table if exists prod.office;

    drop table if exists prod.product;

    drop table if exists prod.product_inventory_limit;

    drop table if exists prod.product_tag;

    drop table if exists prod.property;

    drop table if exists prod.province;

    drop table if exists prod.purchase_order;

    drop table if exists prod.purchase_order_variant;

    drop table if exists prod.role;

    drop table if exists prod.room;

    drop table if exists prod.specification;

    drop table if exists prod.storage_location;

    drop table if exists prod.supplier;

    drop table if exists prod.tag;

    drop table if exists prod.transfer;

    drop table if exists prod.transfer_variant;

    drop table if exists prod.unit;

    drop table if exists prod.user;

    drop table if exists prod.user_role;

    drop table if exists prod.variant;

    drop table if exists prod.variant_inventory_limit;

    drop table if exists prod.verification;

    drop table if exists prod.warehouse;

    create table prod.address (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        line varchar(255),
        district_id bigint,
        province_id bigint,
        primary key (id)
    ) engine=MyISAM;

    create table prod.brand (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        code varchar(35) not null,
        description varchar(255),
        name varchar(255) not null,
        status TINYINT not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.category (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        description varchar(255),
        name varchar(255) not null,
        slug varchar(255) not null,
        status TINYINT not null,
        thumbnail varchar(255),
        category_id bigint,
        primary key (id)
    ) engine=MyISAM;

    create table prod.count (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        code varchar(255) not null,
        note varchar(255),
        status TINYINT not null,
        warehouse_id bigint not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.count_variant (
       count_id bigint not null,
        variant_id bigint not null,
        actual_inventory integer not null,
        inventory integer not null,
        primary key (count_id, variant_id)
    ) engine=MyISAM;

    create table prod.customer (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        customer_group_id bigint not null,
        customer_resource_id bigint not null,
        customer_status_id bigint not null,
        user_id bigint not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.customer_group (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        code varchar(255) not null,
        color varchar(255) not null,
        description varchar(255) not null,
        name varchar(255) not null,
        status TINYINT not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.customer_resource (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        code varchar(255) not null,
        color varchar(255) not null,
        description varchar(255) not null,
        name varchar(255) not null,
        status TINYINT not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.customer_status (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        code varchar(255) not null,
        color varchar(255) not null,
        description varchar(255) not null,
        name varchar(255) not null,
        status TINYINT not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.department (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        name varchar(255) not null,
        status TINYINT not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.destination (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        contact_email varchar(255),
        contact_fullname varchar(255),
        contact_phone varchar(255),
        status TINYINT not null,
        address_id bigint not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.district (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        code varchar(35) not null,
        name varchar(255) not null,
        province_id bigint not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.docket (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        code varchar(255),
        note varchar(255),
        status TINYINT not null,
        type integer,
        purchase_order_id bigint not null,
        reason_id bigint,
        warehouse_id bigint not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.docket_reason (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        name varchar(255) not null,
        status TINYINT not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.docket_variant (
       docket_id bigint not null,
        variant_id bigint not null,
        quantity integer not null,
        primary key (docket_id, variant_id)
    ) engine=MyISAM;

    create table prod.employee (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        department_id bigint not null,
        job_level_id bigint not null,
        job_title_id bigint not null,
        job_type_id bigint not null,
        office_id bigint not null,
        user_id bigint not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.guarantee (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        description varchar(255),
        name varchar(255) not null,
        status TINYINT not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.job_level (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        name varchar(255) not null,
        status TINYINT not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.job_title (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        name varchar(255) not null,
        status TINYINT not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.job_type (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        name varchar(255) not null,
        status TINYINT not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.message (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        content varchar(255),
        status TINYINT not null,
        room_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=MyISAM;

    create table prod.office (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        name varchar(255) not null,
        status TINYINT not null,
        address_id bigint not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.product (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        code varchar(255) not null,
        description varchar(255),
        images JSON,
        name varchar(255) not null,
        properties JSON,
        short_description varchar(255),
        slug varchar(255) not null,
        specifications JSON,
        status TINYINT not null,
        thumbnail varchar(255),
        weight double precision,
        brand_id bigint,
        category_id bigint,
        guarantee_id bigint,
        supplier_id bigint,
        unit_id bigint,
        primary key (id)
    ) engine=MyISAM;

    create table prod.product_inventory_limit (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        maximum_limit integer,
        minimum_limit integer,
        product_id bigint not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.product_tag (
       product_id bigint not null,
        tag_id bigint not null,
        primary key (product_id, tag_id)
    ) engine=MyISAM;

    create table prod.property (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        code varchar(255) not null,
        description varchar(255),
        name varchar(255) not null,
        status TINYINT not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.province (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        code varchar(35) not null,
        name varchar(255) not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.purchase_order (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        code varchar(255),
        note varchar(255),
        status TINYINT not null,
        total_amount double precision,
        destination_id bigint not null,
        supplier_id bigint not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.purchase_order_variant (
       purchase_order_id bigint not null,
        variant_id bigint not null,
        amount double precision not null,
        cost double precision not null,
        quantity integer not null,
        primary key (purchase_order_id, variant_id)
    ) engine=MyISAM;

    create table prod.role (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        code varchar(35) not null,
        name varchar(255) not null,
        status TINYINT not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.room (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        name varchar(255) not null,
        last_message_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.specification (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        code varchar(255) not null,
        description varchar(255),
        name varchar(255) not null,
        status TINYINT not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.storage_location (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        name varchar(255),
        storage_location_id bigint not null,
        warehouse_id bigint not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.supplier (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        code varchar(255) not null,
        company_name varchar(255),
        contact_email varchar(255),
        contact_fullname varchar(255),
        contact_phone varchar(255),
        description varchar(255),
        display_name varchar(255) not null,
        email varchar(255),
        fax varchar(255),
        note varchar(255),
        phone varchar(255),
        status TINYINT not null,
        tax_code varchar(255),
        website varchar(255),
        address_id bigint,
        primary key (id)
    ) engine=MyISAM;

    create table prod.tag (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        name varchar(255) not null,
        slug varchar(255) not null,
        status TINYINT not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.transfer (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        code varchar(255) not null,
        note varchar(255),
        status TINYINT not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.transfer_variant (
       transfer_id bigint not null,
        variant_id bigint not null,
        quantity integer not null,
        primary key (transfer_id, variant_id)
    ) engine=MyISAM;

    create table prod.unit (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        name varchar(255) not null,
        status TINYINT not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.user (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        avatar varchar(255),
        email varchar(255) not null,
        fullname varchar(255) not null,
        gender CHAR not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        status TINYINT not null,
        username varchar(255) not null,
        address_id bigint not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.user_role (
       user_id bigint not null,
        role_id bigint not null,
        primary key (user_id, role_id)
    ) engine=MyISAM;

    create table prod.variant (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        cost double precision not null,
        images JSON,
        price double precision not null,
        properties JSON,
        sku varchar(255) not null,
        status TINYINT not null,
        product_id bigint not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.variant_inventory_limit (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        maximum_limit integer,
        minimum_limit integer,
        variant_id bigint not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.verification (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        expired_at datetime not null,
        token varchar(255) not null,
        user_id bigint not null,
        primary key (id)
    ) engine=MyISAM;

    create table prod.warehouse (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        code varchar(255) not null,
        name varchar(255) not null,
        status TINYINT not null,
        address_id bigint,
        primary key (id)
    ) engine=MyISAM;

    alter table prod.brand 
       add constraint UK_g7ft8mes72rnsk746b7ibyln2 unique (code);

    alter table prod.category 
       add constraint UK_hqknmjh5423vchi4xkyhxlhg2 unique (slug);

    alter table prod.count 
       add constraint UK_18vr7dtwv2bmr0gya58j9aoem unique (code);

    alter table prod.customer 
       add constraint UK_j7ja2xvrxudhvssosd4nu1o92 unique (user_id);

    alter table prod.customer_group 
       add constraint UK_sq3i7v7mcfuu5wyo1k09fau29 unique (code);

    alter table prod.customer_resource 
       add constraint UK_7hysyb2oivjudrlfofqxhmtba unique (code);

    alter table prod.customer_status 
       add constraint UK_d3q20t05sxaaxpshsfv94cfms unique (code);

    alter table prod.destination 
       add constraint UK_a99mkfyhl65vc2n78ijodyoje unique (address_id);

    alter table prod.employee 
       add constraint UK_mpps3d3r9pdvyjx3iqixi96fi unique (user_id);

    alter table prod.office 
       add constraint UK_mlsa2m6po5222mgtojis7rnow unique (address_id);

    alter table prod.product 
       add constraint UK_h3w5r1mx6d0e5c6um32dgyjej unique (code);

    alter table prod.product 
       add constraint UK_88yb4l9100epddqsrdvxerhq9 unique (slug);

    alter table prod.product_inventory_limit 
       add constraint UK_b2qaaqlye3no6xy07jm62qetq unique (product_id);

    alter table prod.property 
       add constraint UK_17f03s5ron7wrua25qyg8tx2v unique (code);

    alter table prod.role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table prod.room 
       add constraint UK_p6gc8ipudo7mwq8wwq2t05iov unique (last_message_id);

    alter table prod.room 
       add constraint UK_q0m921ecs8v2s58xh95nppp5c unique (user_id);

    alter table prod.specification 
       add constraint UK_3lssqgpri39w9a5y932fgdvsa unique (code);

    alter table prod.storage_location 
       add constraint UK_ha0hf7i67ueyx4yiloeesde5k unique (storage_location_id);

    alter table prod.supplier 
       add constraint UK_u0lh6hby20ok7au7646wrewl unique (code);

    alter table prod.supplier 
       add constraint UK_78419iap4p0q918rhlcr1phkl unique (address_id);

    alter table prod.tag 
       add constraint UK_1afk1y1o95l8oxxjxsqvelm3o unique (slug);

    alter table prod.transfer 
       add constraint UK_pvng2ahmu3ketx3y7xm2cbssc unique (code);

    alter table prod.user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table prod.user 
       add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (username);

    alter table prod.user 
       add constraint UK_dhlcfg8h1drrgu0irs1ro3ohb unique (address_id);

    alter table prod.variant 
       add constraint UK_llpabmolrn143l5uh3dp92bgy unique (sku);

    alter table prod.variant_inventory_limit 
       add constraint UK_shw9q4qx2l9f0jgminqo19351 unique (variant_id);

    alter table prod.verification 
       add constraint UK_a0iaxio0f0unln4qmdryyfiqg unique (user_id);

    alter table prod.warehouse 
       add constraint UK_9wk4ocyt0wv0hpffpr41aoweu unique (code);

    alter table prod.warehouse 
       add constraint UK_5hyew1b3bewu839bc54o2jo05 unique (address_id);

    alter table prod.address 
       add constraint FKqbjwfi50pdenou8j14knnffrh 
       foreign key (district_id) 
       references prod.district (id);

    alter table prod.address 
       add constraint FKf8x0jfwoo94op8u88og1ohdcn 
       foreign key (province_id) 
       references prod.province (id);

    alter table prod.category 
       add constraint FKap0cnk1255oj4bwam7in1hxxv 
       foreign key (category_id) 
       references prod.category (id);

    alter table prod.count 
       add constraint FK5fvpdf9v0472mrnb22hqihg8l 
       foreign key (warehouse_id) 
       references prod.warehouse (id);

    alter table prod.count_variant 
       add constraint FKtbly4gx9isdexbdsk58sqs0m0 
       foreign key (count_id) 
       references prod.count (id);

    alter table prod.count_variant 
       add constraint FK36g86gt9dsdw5pjayqqlgsfgq 
       foreign key (variant_id) 
       references prod.variant (id);

    alter table prod.customer 
       add constraint FK9ogndo8hll7edx5iloyu2uegy 
       foreign key (customer_group_id) 
       references prod.customer_group (id);

    alter table prod.customer 
       add constraint FKp8952xfwntg9alu1r6b4vhsuj 
       foreign key (customer_resource_id) 
       references prod.customer_resource (id);

    alter table prod.customer 
       add constraint FK2r41502dbwehta0hpw1h1iml0 
       foreign key (customer_status_id) 
       references prod.customer_status (id);

    alter table prod.customer 
       add constraint FKj8dlm21j202cadsbfkoem0s58 
       foreign key (user_id) 
       references prod.user (id);

    alter table prod.destination 
       add constraint FKn0obgfthaq1r8ku3ysej74yk 
       foreign key (address_id) 
       references prod.address (id);

    alter table prod.district 
       add constraint FK276utu38g5lgqeth6pwfm3rw2 
       foreign key (province_id) 
       references prod.province (id);

    alter table prod.docket 
       add constraint FKckq6rph63qir38nenagh535vb 
       foreign key (purchase_order_id) 
       references prod.purchase_order (id);

    alter table prod.docket 
       add constraint FKcsyjfas113aro12r3cbpq599 
       foreign key (reason_id) 
       references prod.docket_reason (id);

    alter table prod.docket 
       add constraint FKoj8a1a4df4f01954wlf6usrcv 
       foreign key (warehouse_id) 
       references prod.warehouse (id);

    alter table prod.docket_variant 
       add constraint FK2rkqg8145y1g3eobexpab8xxj 
       foreign key (docket_id) 
       references prod.docket (id);

    alter table prod.docket_variant 
       add constraint FKln55e0ivaxua5yq25pl1tk9hk 
       foreign key (variant_id) 
       references prod.variant (id);

    alter table prod.employee 
       add constraint FKbejtwvg9bxus2mffsm3swj3u9 
       foreign key (department_id) 
       references prod.department (id);

    alter table prod.employee 
       add constraint FKor1u9v6xi7l1pocx10h0hqier 
       foreign key (job_level_id) 
       references prod.job_level (id);

    alter table prod.employee 
       add constraint FKp3gjxglyx92kclcf5u6gwpt8v 
       foreign key (job_title_id) 
       references prod.job_title (id);

    alter table prod.employee 
       add constraint FKp0ih3swro21lfpnk4fcdob6lk 
       foreign key (job_type_id) 
       references prod.job_type (id);

    alter table prod.employee 
       add constraint FKjurhambl7fs34cp8i36xpd5yp 
       foreign key (office_id) 
       references prod.office (id);

    alter table prod.employee 
       add constraint FK6lk0xml9r7okjdq0onka4ytju 
       foreign key (user_id) 
       references prod.user (id);

    alter table prod.message 
       add constraint FKl1kg5a2471cv6pkew0gdgjrmo 
       foreign key (room_id) 
       references prod.room (id);

    alter table prod.message 
       add constraint FKb3y6etti1cfougkdr0qiiemgv 
       foreign key (user_id) 
       references prod.user (id);

    alter table prod.office 
       add constraint FKak81m3gkj8xq5t48xuflbj0kn 
       foreign key (address_id) 
       references prod.address (id);

    alter table prod.product 
       add constraint FKs6cydsualtsrprvlf2bb3lcam 
       foreign key (brand_id) 
       references prod.brand (id);

    alter table prod.product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references prod.category (id);

    alter table prod.product 
       add constraint FKgfhdydadolarv86kxk0my2uj3 
       foreign key (guarantee_id) 
       references prod.guarantee (id);

    alter table prod.product 
       add constraint FK2kxvbr72tmtscjvyp9yqb12by 
       foreign key (supplier_id) 
       references prod.supplier (id);

    alter table prod.product 
       add constraint FKndrubbm6whifirg6o2bpdcf6b 
       foreign key (unit_id) 
       references prod.unit (id);

    alter table prod.product_inventory_limit 
       add constraint FKgty8thbjnwann6fcm9q5gibvx 
       foreign key (product_id) 
       references prod.product (id);

    alter table prod.product_tag 
       add constraint FK3b3a7hu5g2kh24wf0cwv3lgsm 
       foreign key (tag_id) 
       references prod.tag (id);

    alter table prod.product_tag 
       add constraint FK2rf7w3d88x20p7vuc2m9mvv91 
       foreign key (product_id) 
       references prod.product (id);

    alter table prod.purchase_order 
       add constraint FK13alrtuvkdl5mevgqvpwjp0ma 
       foreign key (destination_id) 
       references prod.destination (id);

    alter table prod.purchase_order 
       add constraint FK4traogu3jriq9u7e8rvm86k7i 
       foreign key (supplier_id) 
       references prod.supplier (id);

    alter table prod.purchase_order_variant 
       add constraint FKcknb9rwvu7dfki70nyye7x2ww 
       foreign key (purchase_order_id) 
       references prod.purchase_order (id);

    alter table prod.purchase_order_variant 
       add constraint FKs0ol41wsfln8hjuv3pkgkk60i 
       foreign key (variant_id) 
       references prod.variant (id);

    alter table prod.room 
       add constraint FKgklsfkcs5o94kiti4qlrsb3pq 
       foreign key (last_message_id) 
       references prod.message (id);

    alter table prod.room 
       add constraint FKj8a5tk6wghd3x2sxgksj2fv3o 
       foreign key (user_id) 
       references prod.user (id);

    alter table prod.storage_location 
       add constraint FK5ot86kqkl4h9vcb8u5wntgqo6 
       foreign key (storage_location_id) 
       references prod.variant (id);

    alter table prod.storage_location 
       add constraint FK956y7ykytekn259p907onqkiw 
       foreign key (warehouse_id) 
       references prod.warehouse (id);

    alter table prod.supplier 
       add constraint FK95a8oipih48obtbhltjy7hgvb 
       foreign key (address_id) 
       references prod.address (id);

    alter table prod.transfer_variant 
       add constraint FK8nqj79dxjl442elxpc333pwj6 
       foreign key (transfer_id) 
       references prod.transfer (id);

    alter table prod.transfer_variant 
       add constraint FKe9484a4kgr0i94tgycb8q517p 
       foreign key (variant_id) 
       references prod.variant (id);

    alter table prod.user 
       add constraint FKddefmvbrws3hvl5t0hnnsv8ox 
       foreign key (address_id) 
       references prod.address (id);

    alter table prod.user_role 
       add constraint FKa68196081fvovjhkek5m97n3y 
       foreign key (role_id) 
       references prod.role (id);

    alter table prod.user_role 
       add constraint FK859n2jvi8ivhui0rl0esws6o 
       foreign key (user_id) 
       references prod.user (id);

    alter table prod.variant 
       add constraint FKjjpllnln6hk6hj98uesgxno00 
       foreign key (product_id) 
       references prod.product (id);

    alter table prod.variant_inventory_limit 
       add constraint FKmyp7te4img1nhhmfwj7yr1ss7 
       foreign key (variant_id) 
       references prod.variant (id);

    alter table prod.verification 
       add constraint FKlhkcrvgj83d37uxew4gvjm684 
       foreign key (user_id) 
       references prod.user (id);

    alter table prod.warehouse 
       add constraint FKp7xymgre8vt94ihf75e9movyt 
       foreign key (address_id) 
       references prod.address (id);
