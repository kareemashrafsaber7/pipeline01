create database sales_info
on
(name = sales_info_data, filename = 'E:\sql db\salesinfodat.mdf', size = 10mb, maxsize = 30mb, filegrowth = 5mb)
log on
(name = sales_info_log, filename = 'E:\sql db\salesinfolog.ldf', size = 5mb, maxsize = 20mb, filegrowth = 5mb);
use sales_info;
create table customers(
customer_id int identity,
first_name nchar(20) not null,
last_name nchar(20) not null,
delivery_address varchar (50) not null,
phone_no varchar(25),
email varchar(20) not null,
credit decimal(10, 3) not null,
constraint customers_pkey primary key (customer_id),
constraint customers_unq unique (phone_no))

create table branches(
branch_id int identity primary key,
address varchar(50) not null,
branch_name varchar(20) not null)

create table staff(
staff_id int identity primary key,
first_name nchar(15) not null,
last_name nchar(15) not null,
address varchar(50) not null,
phone_no varchar(25) not null,
salary decimal(6, 3) not null,
staff_branch_id int not null,
constraint staff_fkey foreign key(staff_branch_id) references branches(branch_id),
constraint staff_chk check (salary between 3000 and 100000)) 
create table orders(
order_id int identity primary key,
order_total decimal(10,3) not null,
order_customer_id int not null,
order_staff_id int not null,
order_branch_id int not null,
constraint order_fkey foreign key (order_staff_id) references staff(staff_id),
constraint order_fkey2 foreign key (order_branch_id) references branches(branch_id))
create table brands(
brand_id int identity primary key,
brand_name varchar(15) not null,
brand_phone_no varchar(15) unique,
brand_email varchar(20) not null)
create table products(
product_id int identity primary key,
brand_id int not null,
product_type varchar(20) not null,
constraint products_fkey foreign key (brand_id) references brands(brand_id))
create table order_items(
product_id int not null,
brand_id int not null,
price varchar(10) not null,
amount numeric(3, 0) not null,
constraint oi_fkey foreign key (product_id) references products(product_id),
constraint oi_fkey2 foreign key (brand_id) references brands(brand_id))
