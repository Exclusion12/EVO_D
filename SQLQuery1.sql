create table rolespermissions(
role_id int identity(1,1) primary key,
role_name nvarchar(50) unique not null
);

create table shifts(
shift_id int identity(1,1) primary key,
shift_name nvarchar(50) unique not null,
shift_start_time time not null,
shift_end_time time not null,
);


create table users(
user_id int identity(1,1) primary key NOT NULL,
username nvarchar(50) unique NOT NULL,
password nvarchar(50) NOT NULL,
fname nvarchar(50) NOT NULL,
mname nvarchar(50) NOT NULL,
lname nvarchar(50) NOT NULL,
regestered_date datetime not null,
role_id int NOT NULL,
active bit not null,
shift_id int not null,
foreign key(shift_id) references shifts,
foreign key(role_id) references rolespermissions

);


create table banks(
bank_id int identity(1,1) primary key,
name nvarchar(50) not null,
bank_address nvarchar(50) not null,
bank_branch nvarchar(50) not null
);

create table accounts(
account_id int identity(1,1) primary key,
bank_id int not null,
account_num nvarchar(50) unique not null,
balance float not null,
foreign key(bank_id) references banks
);


create table customers(
customer_id int identity(1,1) primary key,
customer_name nvarchar(50) unique not null,
customer_balance float not null,
customer_mail nvarchar(50),
customer_phone nvarchar(50)
);

create table dealers(
dealer_id int identity(1,1) primary key,
dealer_name nvarchar(50) unique not null,
dealer_balance float not null,
dealer_mail nvarchar(50),
dealer_phone nvarchar(50)
);

create table attendence(
attendence_id int identity(1,1) primary key,
user_id int not null,
start_time datetime,
end_time datetime,
shift_id int,
foreign key (shift_id) references shifts
);


create table stores(
store_id int identity(1,1) primary key,
store_name nvarchar(50) unique not null,
store_address nvarchar(50)
);

create table kinds(
kind_id int identity(1,1) primary key,
kind_name nvarchar(50) unique not null,
);

create table goods(
good_id int identity(1,1) primary key,
kind_id int not null,
store_id int not null,
quantity float not null,
unique (store_id,kind_id),
foreign key (kind_id) references kinds,
foreign key (store_id) references stores
);

create table measurements(
m_id int identity(1,1) primary key,
measurement_name nvarchar(50) not null,
provider_price float not null,
seller_price float not null,
kind_id int not null,
foreign key (kind_id) references kinds 
);