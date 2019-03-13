create PROCEDURE insert_user @username nvarchar(50) , @password nvarchar(50) , @fname nvarchar(50) ,@mname nvarchar(50) = NULL ,@lname nvarchar(50) ,@regestered_date datetime ,@role nvarchar(50) , @shift_name nvarchar(50)
AS
begin try
declare @role_id int 
set @role_id = (select role_id from rolespermissions where role_name = @role);
declare @shift_id int 
set @shift_id = (select shift_id from shifts where shift_name = @shift_name);
insert into users(username,password,fname,mname,lname,regestered_date,role_id,active,shift_id)
values(@username,@password,@fname,@mname,@lname,@regestered_date,@role_id,1,@shift_id)
return 1;
end try
begin catch
return -1
end catch
Go


create procedure insert_bank @bank_name nvarchar(50) ,@bank_branch nvarchar(50) ,@bank_address nvarchar(50)
as
begin try
insert into banks(bank_name,bank_branch,bank_address) values(@bank_name,@bank_branch,@bank_address)
return 1
end try
begin catch
return -1
end catch
go

create procedure insert_shift @shift_name nvarchar(50) ,@shift_start time ,@shift_end time
as
begin try
insert into shifts(shift_name,shift_start_time,shift_end_time) values(@shift_name,@shift_start,@shift_end)
return 1
end try
begin catch
return -1
end catch
go

create procedure insert_dealer @dealer_name nvarchar(50) ,@dealer_balance float ,@dealer_mail nvarchar(50) , @dealer_phone nvarchar(50)
as
begin try
insert into dealers(dealer_name,dealer_balance,dealer_mail,dealer_phone) values(@dealer_name,@dealer_balance,@dealer_mail,@dealer_phone)
return 1
end try
begin catch
return -1
end catch
go

create procedure insert_customer @customer_name nvarchar(50) ,@customer_balance float ,@customer_mail nvarchar(50) , @customer_phone nvarchar(50)
as
begin try
insert into customers(customer_name,customer_balance,customer_mail,customer_phone) values(@customer_name,@customer_balance,@customer_mail,@customer_phone)
return 1
end try
begin catch
return -1
end catch
go

create procedure insert_account @bank_name nvarchar(50) ,@account_balance float ,@account_num nvarchar(50)
as
declare @bank_id int 
set @bank_id = (select bank_id from banks where bank_name = @bank_name);
begin try
insert into accounts(bank_id,account_num,account_balance) values(@bank_id,@account_num,@account_balance)
return 1
end try
begin catch
return -1
end catch
go

create procedure insert_attendence @username nvarchar(50) ,@password nvarchar(50) ,@start_time datetime ,@end_time datetime
as
declare @active bit
set @active = (select active from users where username = @username and password = @password)
if @active = 0
return 0
else
declare @user_id int ,@shift_id int
set @user_id  = (select user_id from users where username = @username and password = @password)
set @shift_id = (select shift_id from users where username = @username and password = @password)
begin try
insert into attendence(user_id,start_time,end_time,shift_id) values (@user_id,@start_time,@end_time,@shift_id)
return 1
end try
begin catch
return -1
end catch
go

insert into rolespermissions(role_name) values ('admin')
declare @check_if_user_inserted int
exec @check_if_user_inserted = insert_user @username = 'admin' , @password = 'admin' , @fname = 'ahmed' , @mname = 'mohamed' , @lname = 'wasfy' , @regestered_date = '12-03-2019 12:12:12' , @role = 'admin' , @branch = 'cairo'
print @check_if_user_inserted
exec insert_branch @branch_name = 'cairo' , @branch_address = '21 street'
