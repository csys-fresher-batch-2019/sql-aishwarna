# Railway Reservation Management
-->http://www.rail.co.in
## Features
.User can able to view all the trains 

## Feature 1- List all the trains 
```sql
create table trains(train_id number,train_name varchar2(100) not null,journey_starts varchar2(100)not null,journey_ends varchar 2(100) not null,birth_type varchar2(100) not null,train_time date not null,
constraint train_id_pk primary key(train_id));
```

###Query
```sql
insert into trains(train_id,train_name)values(1,'kovai express','chennai','kovai',sitting',to_date('2019-dec-31 17:30,'YYYY-MM-DD HH24:MI');


select * from trains;
```
