create table test_fun (
    id number, num varchar2(20)
);

insert into test_fun values (1, '34.5678');
select *from test_fun;
select *from test_fun where id =1;

--round : �Ҽ��� �ڸ�(�ݿø�)
select round (num,2) from test_fun where id=1;
--round ���� ����
select round (num/2,2) from test_fun where id=1;
--trunc : ����
select trunc (num,2) from test_fun where id=1;
--trunc ���� ����
select trunc (num/2,2) from test_fun where id=1;

--mod : ������
insert into test_fun values (2,'55');
select mod (num,2)from test_fun where id=2;
--���� 1
insert into test_fun values (3,'55');
insert into test_fun values (4,'46');
insert into test_fun values (5,'86');
insert into test_fun values (6,'34');
insert into test_fun values (7,'889');
insert into test_fun values (8,'234');
insert into test_fun values (9,'557');
insert into test_fun values (10,'3');
--����1 ���
select * from test_fun where mod(id,2) = 1;
select id, round(num/2,2) from test_fun where mod(id,2)=0;  
--
insert into test_fun values (11, 'welcome to oracle');
select * from test_fun where id = 11;
--upper & lower : �빮��& �ҹ��� ��ȯ
select upper(name) from test_company;
select lower(name) from test_company;
--initcap : ���� ù ���ڸ� �빮��
select initcap(name) from test_company ;



--���� 2
create table test_company(
  name varchar2(20),
  ���� varchar2(20),
  class varchar2(20)
);

insert into test_company values('hong gil dong_M','3600','Manager');
insert into test_company values('kim gea ddong_M','2555','ManaGer');
insert into test_company values('Go gil dong_M','2800','ManaGER');
insert into test_company values('hong gil dong_E','3111','EmpLoyee');
insert into test_company values('kim gea ddong_E','2600','EmpLoYee');
insert into test_company values('Go gil dong_E','2950','employee');

select * from test_company;

--���� 2 ���
select * from test_company where class = 'ManaGER';

select *from test_company where class ='EmpLoyee' and ����>=2800;

select initcap(name), round(����/12) from test_company ;
--����� ���
select * from test_company where lower(class)='manager';
select * from test_company where lower(class)='employee' and ����>=2800;
select initcap(name),trunc(����/12,0),class from test_company;

--�׷� �Լ� ����
create table test_class(class varchar2(10), score number);
Insert into test_class values('A��',11);
insert into test_class values('A��',12);
insert into test_class values('A��',13);
insert into test_class values('B��',21);
insert into test_class values('B��',22);
insert into test_class values('B��',23);
insert into test_class values('1',31);
insert into test_class values('1',32);
insert into test_class values('1',33);
insert into test_class values('',40);

select * from test_class;
--sum : �� �� ����
select sum(score) from test_class;
--avg : ���
select avg(score) from test_class;
--max, nim :�ִ밪, �ּڰ�
select max(score),min(score) from test_class;
--null�� ó�� X ����
select count(class) from test_class;
--null�� ���� ����
select count(*) from test_class;
--group by : �׷��� ����
select class, sum(score) from test_class group by class; --���Ϸ��� �÷� �� ���ƾ���(class)
--having : �׷뿡 ���� �ޱ�
select class, sum(score) from test_class
group by class having sum(score)>60; --�� �� 60�̻� �� �׷��� ��Ÿ��

--���� 3 ���
select class, count(*) from test_class group by class;

select class, avg(score) from test_class group by class order by avg(score) desc;

select class, max(score), min(score) from test_class group by class; 
--**��������, ���� ���� ��� �� ������ order by [����] desc & a
--����� ���
select class, count(*) from testClass group by class;

select class, avg(score) from testClass  group by class order by avg(score) desc;

select class, max(score), min(score) from testClass group by class;

--���� 3

create table testName(id varchar2(20), class varchar2(20));
insert into testName values('ȫ�浿','A��');
insert into testName values('�谳��','B��');
insert into testName values('��浿','C��');

create table testLesson(id varchar2(20), lesson varchar2(20), score number);
insert into testLesson values('ȫ�浿','python',80);
insert into testLesson values('ȫ�浿','java',90);
insert into testLesson values('ȫ�浿','c���',70);
insert into testLesson values('�谳��','server2012',70);
insert into testLesson values('�谳��','linux',90);
insert into testLesson values('��浿','jsp',100);

select * from testName;
select * from testLesson;
--���̺� �Բ� ��������
select * from testName, testLesson; --���� ����
--��Ī ����(* ��� ���� ��ȸ)
select N.*, L.lesson, L.score from testName N, testLesson L;

--inner join :���̵� ��ġ�ϴ� �ͳ��� ���ļ� ��ȸ
select * from testName N inner join testLesson L on N.id =L.id;
select N.*, L.lesson, L.score from testName N 
inner join testLesson L on N.id =L.id;

--���� 4 ���
select N.id, N.class, L.lesson,L.score from 
testName N inner join testLesson L on N.id =L.id and N.id='ȫ�浿';

select N.id, N.class , sum(L.score), avg(L.score) from 
    testName N inner join testLesson L on N.id=L.id group by N.id,N.class order by class asc;



--����� ���

select N.id,N.class,L.lesson,L.score from 
    testName N inner join testlesson L on N.id=L.id and N.id='ȫ�浿';

select N.id, N.CLASS, sum(L.score), avg(L.score) from 
        testName N inner join testlesson L on N.id=L.id group by N.id,N.CLASS order by class asc;


commit;
























