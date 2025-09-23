-- drop schema eventmanagement;
create schema eventmanagement;

-- drop table eventmanagement.events;
create table eventmanagement.events(
id int primary key auto_increment,
event_name varchar(250),
event_type varchar(250),
description varchar(250),
price double,
seats_count int,
unreserved_seats_count int,
-- image longblob,
event_date_time varchar(255),
created_by varchar(255),
created_timestamp TIMESTAMP default CURRENT_TIMESTAMP,
updated_by varchar(255),
updated_timestamp TIMESTAMP
);

-- drop table eventmanagement.user;
create table eventmanagement.user(
id int primary key auto_increment,
full_name varchar(255),
user_name varchar(255),
password varchar(255),
email_id varchar(255),
passout_year varchar(10),
phone_no varchar(255),
gender varchar(255),
created_by varchar(255),
created_timestamp TIMESTAMP default CURRENT_TIMESTAMP,
updated_by varchar(255),
updated_timestamp TIMESTAMP
);


-- drop table eventmanagement.user_bookings;
create table eventmanagement.user_bookings(
id int primary key auto_increment,
user_id int,
events_id int,
created_by varchar(255),
created_timestamp TIMESTAMP default CURRENT_TIMESTAMP,
updated_by varchar(255),
updated_timestamp TIMESTAMP
);













---- drop schema eventmanagement;
--create schema eventmanagement;
--
---- drop table eventmanagement.events;
--create table eventmanagement.events(
--id int primary key auto_increment,
--event_name varchar(250),
--event_type varchar(250),
--description varchar(250),
--price double,
--seats_count int,
--image longblob,
--event_date varchar(255),
--event_time varchar(255),
--created_by varchar(255),
--created_timestamp TIMESTAMP default CURRENT_TIMESTAMP,
--updated_by varchar(255),
--updated_timestamp TIMESTAMP
--);
--
---- drop table eventmanagement.user;
--create table eventmanagement.user(
--id int primary key auto_increment,
--full_name varchar(250),
--email_id varchar(250),
--passout_year varchar(10),
--phone_no varchar(255),
--gender varchar(255),
--created_by varchar(255),
--created_timestamp TIMESTAMP default CURRENT_TIMESTAMP,
--updated_by varchar(255),
--updated_timestamp TIMESTAMP
--);






