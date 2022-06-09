
    drop table if exists prod.address;

    drop table if exists prod.department;

    drop table if exists prod.district;

    drop table if exists prod.employee;

    drop table if exists prod.job_level;

    drop table if exists prod.job_title;

    drop table if exists prod.job_type;

    drop table if exists prod.office;

    drop table if exists prod.province;

    drop table if exists prod.role;

    drop table if exists prod.user;

    drop table if exists prod.user_role;

    create table prod.address (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        line varchar(255) not null,
        district_id bigint not null,
        province_id bigint not null,
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

    create table prod.office (
       id bigint not null auto_increment,
        created_at datetime not null,
        created_by bigint,
        updated_at datetime not null,
        updated_by bigint,
        name varchar(255) not null,
        status integer not null,
        address_id bigint not null,
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

    alter table prod.employee 
       add constraint UK_mpps3d3r9pdvyjx3iqixi96fi unique (user_id);

    alter table prod.office 
       add constraint UK_mlsa2m6po5222mgtojis7rnow unique (address_id);

    alter table prod.user 
       add constraint UK_dhlcfg8h1drrgu0irs1ro3ohb unique (address_id);

    alter table prod.address 
       add constraint FKqbjwfi50pdenou8j14knnffrh 
       foreign key (district_id) 
       references prod.district (id);

    alter table prod.address 
       add constraint FKf8x0jfwoo94op8u88og1ohdcn 
       foreign key (province_id) 
       references prod.province (id);

    alter table prod.district 
       add constraint FK276utu38g5lgqeth6pwfm3rw2 
       foreign key (province_id) 
       references prod.province (id);

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

    alter table prod.office 
       add constraint FKak81m3gkj8xq5t48xuflbj0kn 
       foreign key (address_id) 
       references prod.address (id);

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
