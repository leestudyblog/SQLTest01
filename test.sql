--����
create table person(
-- �̸� �ڷ��� (ũ�� ����)
    num number,
    name varchar2(20) not null,
    birth varchar2(20),
    tel varchar2(20),
-- �ߺ� ���X �⺻Ű ����    
    primary key (num)
);

-- ����� Ȯ��
select * from tab;

-- ������ �߰�
-- ������ ������ ���� ����ǥ ''
insert into person values (1001, 'ȫ�浿','20230516','010-1234-5678');
insert into person values (1003, '������','19995872','010-1234-5678');
-- �ٸ� ���
insert into person (num, name, birth, tel)
                    values(1002, '�����','19730617','010-1234-5678'); 

--���̺� ��������
select * from person; 
-- Ư�� ���� ��������
select num, name from person;

--Ư�� �� ã��
select *from person where name = 'ȫ�浿';
select *from person where num = 1000;

-- �� �����ϱ�
delete from person;
--Ư�� �� ����
delete from person where num =1002;
-- ���̺� Ȯ��
select *from person;

--���̺� ����
update person set name='�谳��',tel='111' where num =1002;

--�ӽ������ DB�� ����
commit;
--������ �ǵ�����
rollback;



