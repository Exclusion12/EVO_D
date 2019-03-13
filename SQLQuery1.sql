create table rolespermissions(
role_id int identity(1,1) primary key,
role_name nvarchar(50) unique not null
);

create table branches(
branch_id int identity(1,1) primary key,
branch_name nvarchar(50) NOT NULL unique,
branch_address nvarchar(50) not null,
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
foreign key(role_id) references rolespermissions,
branch_id int NOT NULL,
foreign key(branch_id) references branches
);



create table banks(
bank_id int identity(1,1) primary key,
name nvarchar(50) not null,
branch nvarchar(50) not null,
bank_address nvarchar(50) not null
);

create table accounts(
account_id int identity(1,1) primary key,
bank_id int not null,
account_num nvarchar(50) not null,
balance float not null,
foreign key(bank_id) references banks
);


create table customers(
customer_id int identity(1,1) primary key,
customer_name nvarchar(50) not null,
customer_balance float not null,
customer_mail nvarchar(50),
customer_phone nvarchar(50)
);

create table dealers(
dealer_id int identity(1,1) primary key,
dealer_name nvarchar(50) not null,
dealer_balance float not null,
dealer_mail nvarchar(50),
dealer_phone nvarchar(50)
);

create table shifts(
shift_id int identity(1,1) primary key,
shift_name nvarchar(50) unique not null,
shift_start_time time not null,
shift_end_time time not null,
);

create table attendence(
attendence_id int identity(1,1) primary key,
user_id int not null,
start_time datetime,
end_time datetime,
shift_id int,
foreign key (shift_id) references shifts
);

create table manages(
manage_id int identity(1,1) primary key,
user_id int not null,
branch_id int not null,
foreign key (user_id) references users,
foreign key (branch_id) references branches
);