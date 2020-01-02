drop table if exists tbl_config;
create table tbl_config(
 id bigint not null primary key auto_increment,
 type varchar(32) not null,
 cfg_key varchar(32) not null,
 cfg_value varchar(128) not null,
 sub_type varchar(32),
 status varchar(10) not null default 'ON',
 description varchar(128) not null,
 create_time datetime not null default current_timestamp,
 update_time datetime on update current_timestamp
)

drop table if exists tbl_dict;
create table tbl_dict(
	id bigint not null primary key auto_increment,
	dict_key varchar(32) not null,
	dict_value varchar(512) not null,
	lang varchar(10) not null,
	description varchar(128) not null,
	create_time datetime not null default current_timestamp,
  update_time datetime on update current_timestamp

);

drop table if exists tbl_menu;
create table tbl_menu(
	id bigint not null primary key auto_increment,
	code varchar(32) not null unique,
	auth varchar(64),
	description varchar(64) not null,
	parent bigint,
	path varchar(128) not null unique,
	status varchar(10) not null default 'ON',
	icon varchar(32),
	priority integer not null default 0,
	create_time datetime not null default current_timestamp,
	update_time datetime on update current_timestamp

);

drop table if exists tbl_user;
create table tbl_user(
	id bigint not null primary key auto_increment,
	username varchar(32),
	password varchar(64),
	account varchar(32),
	avatar varchar(128),
	nickname varchar(64),
	mobile varchar(16),
	email varchar(128),
	status varchar(10) not null default 'ACTIVE',
	device_id varchar(128),
	create_time datetime not null default current_timestamp,
	update_time datetime on update current_timestamp
) auto_increment=1000000;
create index idx_user_name on tbl_user(username);
create index idx_user_account on tbl_user(account);
create index idx_user_mobile on tbl_user(mobile);

drop table if exists tbl_authr;
create table tbl_authr(
 id bigint not null primary key auto_increment,
 user_id bigint not null,
 resource varchar(128) not null,
 authr integer not null default 0,
 create_time datetime not null default current_timestamp,
 update_time datetime on update current_timestamp
);
create index idx_authr_uid on tbl_authr(user_id);
