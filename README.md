# Railway Reservation Management
-->http://www.rail.co.in
## Features
.User can able to view all the trains 

## Feature 1- List all the trains 
```sql
create table trains(train_id number,train_name varchar2(100) not null,birth_type varchar2(100) not null,
ticket_vaccency varchar2(100)
not null,constraint train_id_pk primary key(train_id));
```

###Query
```sql
insert into trains(train_id,train_name)values(1,'kovai express','sitting',100);


select * from trains;
```
