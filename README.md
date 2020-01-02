# Railway Reservation Management
-->http://www.rail.co.in
## Features
.User can able to view all the trains 

## Feature 1- viewing train details
```sql
create table trains(
train_id number,
train_name varchar2(100) not null unique ,
journey_starts varchar2(100) not null,
journey_ends varchar2(100) not null,
arrival_time timestamp not null,
depature_time timestamp not null,
birth_type varchar2(100) not null,

constraint train_id_pk primary key(train_id),
constraint birth_type_ch check(birth_type in('sleeper','sitting','ac_sleeper','ac_sitting'))
);

```

###Query
```sql
insert into trains(train_id,
train_name,
journey_starts,
journey_ends,
arrival_time,
depature_time,
birth_type)
values(1234,'kovai_express','chennai','coimbatore',to_timestamp('1-jan-2020 07:10:34','DD-Mon-YYYY HH24:MI:SS'),to_timestamp('31-dec-2019 23:13:24','DD-Mon-YYYY HH24:MI:SS'),'sitting');


insert into trains
(train_id,
train_name,
journey_starts,
journey_ends,
arrival_time,
depature_time,
birth_type)
values(5678,'yercard_express',
'erode',
'chennai',
to_timestamp('1-jan-2020 05:10:34','DD-Mon-YYYY HH24:MI:SS'),
to_timestamp('31-dec-2019 21:13:24','DD-Mon-YYYY HH24:MI:SS'),'sleeper');


insert into trains
(train_id,
train_name,
journey_starts,
journey_ends,
arrival_time,
depature_time,
birth_type)
values(3245,'pandian_express',
'trichy',
'chennai',
to_timestamp('2-jan-2020 09:10:34','DD-Mon-YYYY HH24:MI:SS'),
to_timestamp('1-dec-2019 22:13:24','DD-Mon-YYYY HH24:MI:SS'),'ac_sleeper');





select * from trains;
```
| train_id | train_name      | journey_starts | journey_ends | arrival_time                  | depature_time                | birth_type |
|----------|-----------------|----------------|--------------|-------------------------------|------------------------------|-----------|
| 3245     | pandian_express | trichy         | chennai      | 02-JAN-20 09.10.34.000000 AM  | 01-DEC-19 10.13.24.000000 PM | ac_sleeper |
| 1234     | kovai_express   | chennai        | coimbatore   | 01-JAN-20 07.10.34.000000 AM  | 31-DEC-19 11.13.24.000000 PM | sitting    |
| 5678     | yercard_express | erode          | chennai      | 01-JAN-20 05.10.34.000000 AM  | 31-DEC-19 09.13.24.000000 PM | sleeper    


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
| passenger_id | passenger_name | train_id | gender | contact_number | adhar_number |
|--------------|----------------|----------|--------|----------------|--------------|
| 1111         | chandra        | 1234     | female | 9937808765     | 1000549873   |
| 2222         | kailasam       | 5678     | male   | 9600928765     | 100065398822 |
| 3333         | aishwaryaa     | 3245     | female | 9003711907     | 188770487634 |
 
  
  
  ## Feature 3----booking details 
  
 ```sql
create table booking_detail(
tr_id number not null, 
pn_id number not null, 
compartment_no varchar2(10)not null,
coach_type varchar2(20) not null,
birth_type varchar2(20) not null,
constraint pn_id_fk foreign key(pn_id) references passenger(passenger_id), 
constraint tr_id_fk foreign key(tr_id) references trains(train_id)
);
```



  );
  
  ## query
  ```sql
 
 insert into booking_detail(tr_id,pn_id,compartment_no,coach_type,
birth_type)values(1234,1111,
'S-3','NON_AC','sitting');

insert into booking_detail(tr_id,pn_id,compartment_no,coach_type,
birth_type)values(5678,2222,
'S-5','NON_AC','sleeper');

insert into booking_detail(tr_id,pn_id,compartment_no,coach_type,
birth_type)values(3245,3333,
'S-1','AC','ac_sleeper');
 
select * from booking_detail;
```
  
| TR_ID | PN_ID | COMPARTMENT_NO | COACH_TYPE | BIRTH_TYPE |
|-------|-------|----------------|------------|------------|
| 1234  | 1111  | S-3            | NON_AC     | sitting    |
| 5678  | 2222  | S-5            | NON_AC     | sleeper    |
| 3245  | 3333  | S-1            | AC         | ac_sleeper |
  
  
  
  ##Feature 4--viewing list of all train names
  
  ```sql
  select train_name from trains;
  
  ```
  
  | train_name  |
|-----------------|
| kovai_express   |
| pandian_express |
| yercard_express |


##Feature 5---we can view the passenger name and their train name 

```sql
select passenger_name,(select train_name from trains where trains.train_id=passenger.train_id) from passenger where trains.train_id=passenger.train_id;
```

| PASSENGER_NAME | TRAIN_NAME      |
|----------------|-----------------|
| chandra        | kovai_express   |
| kailasam       | yercard_express |
| aishwaryaa     | pandian_express |



##Feature 6----->By giving name of the train we can able to see where the train starts and ends and finally displaying it in ascending order

```sql
select train_name,journey_starts,journey_ends from trains order by train_name;
  ```
  
| TRAIN_NAME      | JOURNEY_STARTS | JOURNEY_ENDS |
|-----------------|----------------|--------------|
| kovai_express   | chennai        | coimbatore   |
| pandian_express | trichy         | chennai      |
| yercard_express | erode          | chennai      |


##feature 7---->count of trains moving from chennai
```sql
select count(journey_starts) from trains where journey_starts='chennai';
```
| COUNT(JOURNEY_STARTS) |
|-----------------------|
| 1                     |

  


  
