CREATE TABLE membership
(
    m_id      VARCHAR2(20)    NULL, 
    m_pw      VARCHAR2(20)    NULL, 
    m_name    VARCHAR2(20)    NULL, 
    m_addr    VARCHAR2(20)    NULL, 
     PRIMARY KEY (m_id)
);

CREATE TABLE board
(
    b_num        INT             NOT NULL, 
    b_id         VARCHAR2(20)    NULL, 
    b_title      VARCHAR2(20)    NULL, 
    b_content    VARCHAR2(20)    NULL, 
    b_date       DATE            NULL, 
     PRIMARY KEY (b_num)
);
--�ڵ� ���� ����
CREATE SEQUENCE board_SEQ
START WITH 1
INCREMENT BY 1;
--�ܷ�Ű 
ALTER TABLE board
    ADD CONSTRAINT FK_board_b_id_membership_m_id FOREIGN KEY (b_id)
        REFERENCES membership (m_id) ;
--membership�� ����
insert into membership (m_id,m_pw,m_name,m_addr)
    values ('aaa','aaa','ȫ�浿','���¥��');

select * from membership;

--board �� ����
insert into board(b_num,b_id,b_title,b_content,b_date )
    values(board_seq.nextval,'aaa','����','����',sysdate);

select * from board;
delete from board where b_num=2;

--�������� ���� : �θ� ���̺� bbb���̵� ����(�ܷ�Ű ����)
insert into board(b_num,b_id,b_title,b_content,b_date )
    values(board_seq.nextval,'bbb','����','����',sysdate);
    
--membership(�θ����̺�) ���� ���� �� board ����
insert into membership (m_id,m_pw,m_name,m_addr)
    values ('bbb','bbb','ȫ�浿','���¥��');   
--�ڽ� ���� ���� �� �θ� ���� ����    
delete from membership where m_id='aaa';
delete from board where b_id='aaa';
    
delete from membership where m_id='bbb';
delete from board where b_id='bbb';

-- Foreign Key ���� SQL - board(b_id)
-- �������� ���� ����
 ALTER TABLE board
   DROP CONSTRAINT FK_board_b_id_membership_m_id;    

--�ٽ��߰� ���� : ���� ������ ���̺� ���Ի����� �����ο�
insert into board(b_num,b_id,b_title,b_content,b_date )
    values(board_seq.nextval,'bbb','����','����',sysdate);
    
insert into membership (m_id,m_pw,m_name,m_addr)
    values ('bbb','bbb','ȫ�浿','���¥��');   
  
select * from membership;   
select * from board;   

--�������� �缳�� + ���� ����(�θ� ����+�ڽ� ����)
ALTER TABLE board
    ADD CONSTRAINT FK_board_b_id_m_id FOREIGN KEY (b_id)
        REFERENCES membership (m_id) on delete CASCADE ;
        
insert into membership (m_id,m_pw,m_name,m_addr)
    values ('bbb','aaa','ȫ�浿','���¥��');         
        
insert into board(b_num,b_id,b_title,b_content,b_date )
    values(board_seq.nextval,'bbb','����','����',sysdate);
-- �Խ��� b_id ='bbb' ���� ���� ��    
delete form membership where m_id='bbb';
--���� ���� + ����          
drop table membership CASCADE CONSTRAINTS;


-- ����1

--���̺� ����
CREATE TABLE member
(
    m_id      VARCHAR2(20)    NOT NULL, 
    m_pwd     VARCHAR2(20)    NULL, 
    m_name    VARCHAR2(20)    NULL, 
    m_addr    VARCHAR2(20)    NULL, 
     PRIMARY KEY (m_id)
);
CREATE TABLE goods_seq
(
    g_num          INT             NOT NULL, 
    g_id           VARCHAR2(20)    NULL, 
    g_name         VARCHAR2(20)    NULL, 
    g_price        INT             NULL, 
    g_count        INT             NULL, 
    g_price_sum    INT             NULL, 
    g_date         DATE            NULL, 
     PRIMARY KEY (g_num)
);

select * from member;
select * from goods_seq;
--������ ����
CREATE SEQUENCE goods_seq_SEQ
START WITH 1
INCREMENT BY 1;

--�ܷ�Ű ����
ALTER TABLE goods_seq
    ADD CONSTRAINT g_id_m_id FOREIGN KEY (g_id)
        REFERENCES member (m_id) ;
        
--�θ� ���̺� �� ����  
insert into member (m_id, m_pwd, m_name, m_addr) 
    values ('aaa','aaa','ȫ�浿','���¥��');
insert into member (m_id, m_pwd, m_name, m_addr) 
    values ('bbb','bbb','�谳��','���˺�');
insert into member (m_id, m_pwd, m_name, m_addr) 
    values ('ccc','ccc','��浿','������');
insert into member (m_id, m_pwd, m_name, m_addr) 
    values ('ddd','ddd','�踻��','�н���');

--delete from member where m_id='aaa';

--�ڽ� ���̺� �� ����        
insert into goods_seq(g_num,g_id, g_name,g_price,g_count,g_price_sum,g_date)
    values(goods_seq_SEQ.nextval,'aaa','�ȭ',75000,2,150000,sysdate); 
    
insert into goods_seq(g_num,g_id, g_name,g_price,g_count,g_price_sum,g_date)
    values(goods_seq_SEQ.nextval,'aaa','Ƽ����',15000,5,75000,sysdate);   
    
insert into goods_seq(g_num,g_id, g_name,g_price,g_count,g_price_sum,g_date)
    values(goods_seq_SEQ.nextval,'bbb','����',450000,1,450000,sysdate);   
    
insert into goods_seq(g_num,g_id, g_name,g_price,g_count,g_price_sum,g_date)
    values(goods_seq_SEQ.nextval,'bbb','å',35000,2,70000,sysdate);       
    
--���� 1 ��� ���
SELECT * FROM member M INNER JOIN goods_seq G ON M.m_id = G.g_id;    

select M.*, G.* from member M 
 inner join goods_seq G on M.m_id = G.g_id ;
 
select M.m_id, M.m_name, G.g_name, G.g_price_sum from member M 
inner join goods_seq G on M.m_id = G.g_id;

select M.m_id, M.m_name, G.g_name, sum(G.g_price_sum) from member M
   inner join goods_seq G on M.m_id = G.g_id 
   group by M.m_id, M.m_name, G.g_name
   order by M.m_id asc ;

select M.m_id, M.m_name, M.m_addr , sum(G.g_price_sum)from member M
    inner join goods_seq G on M.m_id = G.g_id 
    group by M.m_id, M.m_name, M.m_addr 
    order by M.m_id asc ;
/*    
--����� Ǯ��
CREATE TABLE member(
    m_id      VARCHAR2(20)   , 
    m_pwd     VARCHAR2(20) , 
    m_name    VARCHAR2(20) , 
    m_addr    VARCHAR2(20)  , 
     PRIMARY KEY (m_id)
);

CREATE TABLE goods( g_num INT  PRIMARY KEY, 
    g_id VARCHAR2(20), g_name VARCHAR2(20) , 
    g_price INT , g_count INT , g_price_sum INT , g_date DATE );
CREATE SEQUENCE g_seq;
ALTER TABLE goods ADD CONSTRAINT g_id_m_id FOREIGN KEY (g_id)
        REFERENCES member (m_id) ON DELETE CASCADE;

insert into goods(g_num, g_id, g_name, g_price, g_count, g_price_sum, g_date)
values(g_seq.nextval,'aaa','�ȭ',75000,2,150000,sysdate);

insert into goods(g_num, g_id, g_name, g_price, g_count, g_price_sum, g_date)
values(g_seq.nextval,'aaa','Ƽ����',15000,5,75000,sysdate);

insert into goods(g_num, g_id, g_name, g_price, g_count, g_price_sum, g_date)
values(g_seq.nextval,'bbb','����',450000,1,450000,sysdate);

insert into goods(g_num, g_id, g_name, g_price, g_count, g_price_sum, g_date)
values(g_seq.nextval,'bbb','å',35000,2,70000,sysdate);


select M.*, G.* from member M inner join goods G ON M.m_id = G.g_id;

select M.m_id,M.m_name,G.g_name,G.g_price_sum from member M inner join goods G ON M.m_id = G.g_id;


select M.m_id,M.m_name,M.m_addr, sum(G.g_price_sum) from member M inner join goods G ON M.m_id = G.g_id GROUP BY M.m_id, M.m_name, M.m_addr;

*/


--���� ����


