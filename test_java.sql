create user java identified by 1234;
grant dba to java;

create table STUDENT(
     id varchar (10) primary key,
     name varchar(10),
     kor varchar(5),
     eng varchar (5),
     math varchar(5) 
   
);
select *from STUDENT;
select * from tab;

insert into STUDENT values ('20191111','김','40','20','30' );
insert into STUDENT values('20201111','이','40','20','30' );
insert into STUDENT values('20221111','박','40','20','30' );

update STUDENT set  kor='20', math='50', eng ='100' where id ='20191111';
update STUDENT set  kor='90', math='100', eng ='100' where id ='20191111';

commit;

--delete from STUDENT;

--rollback;

select * from STUDENT;
--연산
select * from STUDENT where kor != 100;
select * from STUDENT where kor = 100;
select math from STUDENT where name='김';
select math/2 from STUDENT where name='김';
select math*2 from STUDENT where name='김';

--논리연산
select * from STUDENT where kor >= 90 and math=100;
select * from STUDENT where kor >= 90 or math=100;
select * from STUDENT where not math=100;
--and between
select * from STUDENT where kor between 90 and 100;

--number 자료형
create table test_number(
    numps number (5,2), -- 전체자리수(5자리),소수점 두번째자리까지 표현 00.00
    nump number(3),--전체자리수 3, 소수점X
    num number -- 그대로 전부 출력
);
insert into test_number values (1.12345, 1.12345, 1.12345);
insert into test_number values (123.12345, 123.12345, 123.12345);
--자리수 증가 오류 5개 넘음
insert into test_number values (1234.12345, 1234.12345, 1234.12345);
select * from test_number;

--날짜 관련 명령어
create table test_date(my_date date);
--현재 날자 출력
insert into test_date values(sysdate);
select * from test_date;
--날짜 지정 입력
insert into test_date values('2000/12/24');
-- 형식 변환
alter session set nls_date_format = 'yyyy/mm/dd HH:MI:SS';
--날짜 비교 연산
select * from test_date where my_date < '2019/12/12';

--문자열
create table test_char(
    ch char(2),
    vch varchar(20)
);

insert into test_char values('1','1');
select lengthb(ch), lengthb(vch) from test_char;

--문제 1

create table employee (
    name varchar2(15),
    salary number,
    jobname varchar2(20),
    join_company date
);

insert into employee values ('홍길동',2000000,'컴퓨터','2222/12/24');
select * from employee;
alter session set  nls_date_format = 'YYYY/MM/DD';


insert into employee values('설까치',1800000,'삼성','2017/10/24');
insert into employee values('로버트',1850000,'애플','2019/01/04');
insert into employee values('고도리',2200000,'엘지','2017/11/06');
insert into employee values('김개똥',2500000,'SK','2017/04/14');
insert into employee values('리우뚱',2410000,'샤오미','2018/01/09');
insert into employee values('강민',1900000,'삼성','2019/10/24');
insert into employee values('할리',1800000,'애플','2019/12/04');
insert into employee values('심심해',4630000,'엘지','2015/04/02');
insert into employee values('놀아줘',2770000,'SK','2017/01/24');
insert into employee values('왕만두',3650000,'샤오미','2016/08/04');
insert into employee values('머리빨',4210000,'삼성','2015/03/18');
insert into employee values('마리오',2720000,'애플','2017/01/04');
insert into employee values('최치우',4320000,'엘지','2015/06/07');
insert into employee values('안깔쌈',3490000,'SK','2015/09/07');
insert into employee values('끝짱',2200000,'샤오미','2017/05/04');
insert into employee values('막장',1920000,'삼성','2018/11/24');
insert into employee values('드라마',3420000,'애플','2016/07/29');
insert into employee values('개똥이',1800000,'엘지','2018/12/24');
insert into employee values('마포구',2230000,'SK','2018/01/05');
insert into employee values('소고기',1800000,'샤오미','2019/01/09');
insert into employee values('짜장면',2100000,'삼성','2017/10/24');
insert into employee values('소곱창',2200000,'애플','2017/11/04');
insert into employee values('참이슬',1950000,'엘지','2017/10/24');
insert into employee values('뤼우뚱',1800000,'SK','2018/10/24');
insert into employee values('위메프',1800000,'샤오미','2019/12/07');
insert into employee values('북경시',1880000,'삼성','2018/11/14');
insert into employee values('스미스',1970000,'애플','2019/06/04');
insert into employee values('핸드폰',7200000,'엘지','2010/01/27');
insert into employee values('빅스비',3570000,'SK','2015/02/17');
insert into employee values('노라줘',3200000,'샤오미','2015/11/24');
insert into employee values('사이다',2400000,'삼성','2017/09/26');
insert into employee values('김말이',7000000,'애플','2010/01/21');
insert into employee values('오도독',6230000,'엘지','2011/08/19');

insert into employee values('쌈지돈',3710000,'SK','2015/08/19');
insert into employee values('화장지',1770000,'샤오미','2019/04/28');
insert into employee values('소화기',1920000,'삼성','2019/10/07');
insert into employee values('박효신',2670000,'애플','2017/11/24');
insert into employee values('판빙빙',3120000,'엘지','2016/05/19');
insert into employee values('김재욱',4190000,'SK','2015/01/02');
insert into employee values('송혜교',4280000,'샤오미','2015/01/02');
insert into employee values('송중기',3700000,'삼성','2016/02/17');
insert into employee values('손홍민',2220000,'애플','2018/02/04');
insert into employee values('백종원',2760000,'엘지','2017/10/14');
insert into employee values('오창석',2620000,'SK','2017/09/04');
insert into employee values('스텔라',2500000,'샤오미','2017/11/20');
insert into employee values('멕스웰',1970000,'삼성','2017/10/30');
insert into employee values('조현',  2720000,'애플','2018/11/11');
insert into employee values('류현진',2600000,'엘지','2015/11/19');
insert into employee values('은지원',5670000,'SK','2017/10/16');
insert into employee values('전효성',3750000,'샤오미','2015/09/15');
insert into employee values('이채은',3400000,'삼성','2016/02/09');
insert into employee values('최고봉',8900000,'애플','2010/01/04');
insert into employee values('광화문',1860000,'엘지','2017/10/24');
insert into employee values('동대문',1790000,'SK','2017/10/24');
insert into employee values('서대문',2880000,'샤오미','2016/02/27');
insert into employee values('대통령',2320000,'삼성','2016/05/24');
insert into employee values('예지원',1780000,'애플','2019/01/09');
insert into employee values('정소민',2900000,'엘지','2016/10/22');
insert into employee values('워너원',3000000,'SK','2015/10/10');
insert into employee values('북한군',3200000,'샤오미','2015/11/11');
insert into employee values('남한군',2500000,'삼성','2016/12/19');
insert into employee values('짜투리',1850000,'애플','2018/04/03');
insert into employee values('이승기',1900000,'엘지','2018/01/01');
insert into employee values('기차길',1790000,'SK','2018/05/02');
insert into employee values('길거리',2700000,'샤오미','2016/07/20');
--문제 2 
select * from employee;

select * from employee where salary * 12 >=100000000;

select name, join_company from employee where join_company < '2015/01/01';

select * from employee where salary >=2800000 and salary<=3000000;
select * from employee where salary  between 2800000 and 3000000;

--like절
select *from employee where name like '김%';
select *from employee where name like '%민';
--'이'라는 단어가 들어가면 앞뒤 상관없이 가져오기
select *from employee where name like '%이%';

--정렬
select * from employee order by join_company desc; --내림차순
select * from employee order by join_company asc; --오름차순
--여러 조건 정렬
select * from employee order by join_company asc, name desc;


--문제3
select * from employee where join_company <'2015/12/31' and salary <=60000000;

select * from employee where jobname ='삼성' or jobname='엘지'
and salary <=50000000;

--문제4
select * from employee where name like '김%'and salary <=30000000 
order by jobname asc , salary desc;

commit;




