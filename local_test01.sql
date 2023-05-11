create table test_fun (
    id number, num varchar2(20)
);

insert into test_fun values (1, '34.5678');
select *from test_fun;
select *from test_fun where id =1;

--round : 소수점 자름(반올림)
select round (num,2) from test_fun where id=1;
--round 연산 가능
select round (num/2,2) from test_fun where id=1;
--trunc : 버림
select trunc (num,2) from test_fun where id=1;
--trunc 연산 가능
select trunc (num/2,2) from test_fun where id=1;

--mod : 나머지
insert into test_fun values (2,'55');
select mod (num,2)from test_fun where id=2;
--문제 1
insert into test_fun values (3,'55');
insert into test_fun values (4,'46');
insert into test_fun values (5,'86');
insert into test_fun values (6,'34');
insert into test_fun values (7,'889');
insert into test_fun values (8,'234');
insert into test_fun values (9,'557');
insert into test_fun values (10,'3');
--문제1 답안
select * from test_fun where mod(id,2) = 1;
select id, round(num/2,2) from test_fun where mod(id,2)=0;  
--
insert into test_fun values (11, 'welcome to oracle');
select * from test_fun where id = 11;
--upper & lower : 대문자& 소문자 변환
select upper(name) from test_company;
select lower(name) from test_company;
--initcap : 문장 첫 문자만 대문자
select initcap(name) from test_company ;



--문제 2
create table test_company(
  name varchar2(20),
  연봉 varchar2(20),
  class varchar2(20)
);

insert into test_company values('hong gil dong_M','3600','Manager');
insert into test_company values('kim gea ddong_M','2555','ManaGer');
insert into test_company values('Go gil dong_M','2800','ManaGER');
insert into test_company values('hong gil dong_E','3111','EmpLoyee');
insert into test_company values('kim gea ddong_E','2600','EmpLoYee');
insert into test_company values('Go gil dong_E','2950','employee');

select * from test_company;

--문제 2 답안
select * from test_company where class = 'ManaGER';

select *from test_company where class ='EmpLoyee' and 연봉>=2800;

select initcap(name), round(연봉/12) from test_company ;
--강사님 답안
select * from test_company where lower(class)='manager';
select * from test_company where lower(class)='employee' and 연봉>=2800;
select initcap(name),trunc(연봉/12,0),class from test_company;

--그룹 함수 예제
create table test_class(class varchar2(10), score number);
Insert into test_class values('A반',11);
insert into test_class values('A반',12);
insert into test_class values('A반',13);
insert into test_class values('B반',21);
insert into test_class values('B반',22);
insert into test_class values('B반',23);
insert into test_class values('1',31);
insert into test_class values('1',32);
insert into test_class values('1',33);
insert into test_class values('',40);

select * from test_class;
--sum : 총 합 구함
select sum(score) from test_class;
--avg : 평균
select avg(score) from test_class;
--max, nim :최대값, 최솟값
select max(score),min(score) from test_class;
--null값 처리 X 개수
select count(class) from test_class;
--null값 포함 개수
select count(*) from test_class;
--group by : 그루핑 연산
select class, sum(score) from test_class group by class; --구하려는 컬럼 이 같아야함(class)
--having : 그룸에 조건 달기
select class, sum(score) from test_class
group by class having sum(score)>60; --총 점 60이상 의 그룹을 나타냄

--문제 3 답안
select class, count(class) from test_class group by class;

select class, avg(score) from test_class group by class order by avg(score) desc;

select class, max(score), min(score) from test_class group by class; 
--**내림차순, 오름 차순 사용 시 무조건 order by [조건] desc & asc;
--강사님 답안
select class, count(*) from testClass group by class;

select class, avg(score) from testClass  group by class order by avg(score) desc;

select class, max(score), min(score) from testClass group by class;

