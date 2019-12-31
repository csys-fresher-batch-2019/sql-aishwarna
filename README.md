# Railway Reservation Management
-->http://www.rail.co.in
## Features
.User can able to view all the trains 

## Feature 1- List all the trains 
```sql
create table trains(
train_id number,
train_name varchar2(100) not null unique ,
journey_starts varchar2(100) not null,
journey_ends varchar2(100) not null,
birth_type varchar2(100) not null,
status varchar2(100) not null,
constraint train_id_pk primary key(train_id),
constraint birth_type_ch check(birth_type in('sleeper','sitting','ac_sleeper','ac_sitting')),
constraint status_ch check(status in('Available','Not_Available','Waiting_List'))
);

```

###Query
```sql
insert into trains(train_id,train_name,journey_starts,journey_ends,birth_type,
status)values(1234,'kovai_express','chennai','coimbatore','sitting','Available');


insert into trains(train_id,train_name,journey_starts,journey_ends,birth_type,
status)values(5678,'yercard_express','erode','chennai','sleeper','Waiting_List');

insert into trains(train_id,train_name,journey_starts,journey_ends,birth_type,
status)values(3245,'pandian_express','trichy','chennai','ac_sleeper','Not_Available');




select * from trains;
```


| train_id | train_name      | journey_starts | journey_ends | birth_type | status        |
|----------|-----------------|----------------|--------------|------------|---------------|
| 1234     | kovai_express   | chennai        | coimbatore   | sitting    | Available     |
| 5678     | yercard_express | erode          | chennai      | sleeper    | Waiting_List  |
| 3245     | pandian_express | trichy         | chennai      | ac_sleeper | Not_Available |


## Feature 2-passenger details 
```sql
  create table passenger
(passenger_id number,
 passenger_name varchar2(100) not null,
 train_id number not null,
 gender varchar2(10) not null,
 contact_number number not null,
 adhar_number number not null unique,
 constraint train_id_fk foreign key(train_id) references trains(train_id),
 constraint passenger_id_pk primary key(passenger_id),
 constraint gender_ch check(gender in('male','female'))
 );
  ```
  ## Query 
  ```sql
 insert into passenger(passenger_id,passenger_name,train_id,gender,contact_number,adhar_number)
 values(1111,'chandra',1234,'female',9937808765,1000549873);
 
 
  insert into passenger(passenger_id,passenger_name,train_id,gender,contact_number,adhar_number)
 values(2222,'kailasam',5678,'male',9600928765,100065398822);
 
 
 insert into passenger(passenger_id,passenger_name,train_id,gender,contact_number,adhar_number)
 values(3333,'aishwaryaa',3245,'female',9003711907,188770487634);
 
 select * from passenger;
  ```
   
 
  
  
  ## Feature 3----booking details 
  
 ```sql
create table booking_detail(
tr_id number not null, 
pn_id number not null, 
arrival_time date not null,
depature_time date not null,
compartment_no varchar2(10)not null,
coach_type varchar2(20) not null,
birth_type varchar2(20) not null,
constraint pn_id_fk foreign key(pn_id) references passenger(passenger_id), 
constraint tr_id_fk foreign key(tr_id) references trains(train_id)
);
```



  );
  
  
  
  
  
  
  
