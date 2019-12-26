create table worker(status_id notnull,work varchar2(60)not null,to_whom varchar2(50)not null,finishing_date date,
finished_date date);
insert into worker(status_id,work,to_whom,finishing_date,finished_date)values('1','oracle','aish',to _date('26-12-19','dd-MM-yy'),to_date
('23-12-19','dd-MM-yy'));
select * from worker;
alter table worker add(priority number);
insert into worker(status_id,work,to_whom,finishing_date,finished_date,priority)values('2','sql','sam',to_date('24-12-19','dd-MM-yy'),
to_date('22-12-19','dd-MM-yy'),1);
select * from worker;
