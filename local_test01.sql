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
select class, count(*) from test_class group by class;

select class, avg(score) from test_class group by class order by avg(score) desc;

select class, max(score), min(score) from test_class group by class; 
--**내림차순, 오름 차순 사용 시 무조건 order by [조건] desc & a
--강사님 답안
select class, count(*) from testClass group by class;

select class, avg(score) from testClass  group by class order by avg(score) desc;

select class, max(score), min(score) from testClass group by class;

--예제 3

create table testName(id varchar2(20), class varchar2(20));
insert into testName values('홍길동','A반');
insert into testName values('김개똥','B반');
insert into testName values('고길동','C반');

create table testLesson(id varchar2(20), lesson varchar2(20), score number);
insert into testLesson values('홍길동','python',80);
insert into testLesson values('홍길동','java',90);
insert into testLesson values('홍길동','c언어',70);
insert into testLesson values('김개똥','server2012',70);
insert into testLesson values('김개똥','linux',90);
insert into testLesson values('고길동','jsp',100);

select * from testName;
select * from testLesson;
--테이블 함께 가져오기
select * from testName, testLesson; --보기 힘듦
--별칭 생성(* 모든 내용 조회)
select N.*, L.lesson, L.score from testName N, testLesson L;

--inner join :아이디가 일치하는 것끼리 합쳐서 조회
select * from testName N inner join testLesson L on N.id =L.id;
select N.*, L.lesson, L.score from testName N 
inner join testLesson L on N.id =L.id;

--문제 4 답안
select N.id, N.class, L.lesson,L.score from 
testName N inner join testLesson L on N.id =L.id and N.id='홍길동';

select N.id, N.class , sum(L.score), avg(L.score) from 
    testName N inner join testLesson L on N.id=L.id group by N.id,N.class order by class asc;



--강사님 답안

select N.id,N.class,L.lesson,L.score from 
    testName N inner join testlesson L on N.id=L.id and N.id='홍길동';

select N.id, N.CLASS, sum(L.score), avg(L.score) from 
        testName N inner join testlesson L on N.id=L.id group by N.id,N.CLASS order by class asc;


commit;
























