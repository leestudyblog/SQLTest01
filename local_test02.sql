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
--자동 숫자 증가
CREATE SEQUENCE board_SEQ
START WITH 1
INCREMENT BY 1;
--외래키 
ALTER TABLE board
    ADD CONSTRAINT FK_board_b_id_membership_m_id FOREIGN KEY (b_id)
        REFERENCES membership (m_id) ;
--membership값 삽입
insert into membership (m_id,m_pw,m_name,m_addr)
    values ('aaa','aaa','홍길동','산골짜기');

select * from membership;

--board 값 삽입
insert into board(b_num,b_id,b_title,b_content,b_date )
    values(board_seq.nextval,'aaa','제목','내용',sysdate);

select * from board;
delete from board where b_num=2;

--제약조건 오류 : 부모 테이블에 bbb아이디 없음(외래키 오류)
insert into board(b_num,b_id,b_title,b_content,b_date )
    values(board_seq.nextval,'bbb','제목','내용',sysdate);
    
--membership(부모테이블) 먼저 삽입 후 board 삽입
insert into membership (m_id,m_pw,m_name,m_addr)
    values ('bbb','bbb','홍길동','산골짜기');   
--자식 먼저 삭제 후 부모 삭제 가능    
delete from membership where m_id='aaa';
delete from board where b_id='aaa';
    
delete from membership where m_id='bbb';
delete from board where b_id='bbb';

-- Foreign Key 삭제 SQL - board(b_id)
-- 제약조건 설정 해제
 ALTER TABLE board
   DROP CONSTRAINT FK_board_b_id_membership_m_id;    

--다시추가 현재 : 서로 무관한 테이블 삽입삭제가 자유로움
insert into board(b_num,b_id,b_title,b_content,b_date )
    values(board_seq.nextval,'bbb','제목','내용',sysdate);
    
insert into membership (m_id,m_pw,m_name,m_addr)
    values ('bbb','bbb','홍길동','산골짜기');   
  
select * from membership;   
select * from board;   

--제약조건 재설정 + 종속 삭제(부모 삭제+자식 삭제)
ALTER TABLE board
    ADD CONSTRAINT FK_board_b_id_m_id FOREIGN KEY (b_id)
        REFERENCES membership (m_id) on delete CASCADE ;
        
insert into membership (m_id,m_pw,m_name,m_addr)
    values ('bbb','aaa','홍길동','산골짜기');         
        
insert into board(b_num,b_id,b_title,b_content,b_date )
    values(board_seq.nextval,'bbb','제목','내용',sysdate);
-- 게시판 b_id ='bbb' 전부 삭제 됨    
delete form membership where m_id='bbb';
--종속 설정 + 삭제          
drop table membership CASCADE CONSTRAINTS;


-- 문제1

--테이블 생성
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
--시퀀스 생성
CREATE SEQUENCE goods_seq_SEQ
START WITH 1
INCREMENT BY 1;

--외래키 설정
ALTER TABLE goods_seq
    ADD CONSTRAINT g_id_m_id FOREIGN KEY (g_id)
        REFERENCES member (m_id) ;
        
--부모 테이블 값 삽입  
insert into member (m_id, m_pwd, m_name, m_addr) 
    values ('aaa','aaa','홍길동','산골짜기');
insert into member (m_id, m_pwd, m_name, m_addr) 
    values ('bbb','bbb','김개똥','개똥별');
insert into member (m_id, m_pwd, m_name, m_addr) 
    values ('ccc','ccc','고길동','마포구');
insert into member (m_id, m_pwd, m_name, m_addr) 
    values ('ddd','ddd','김말이','분식집');

--delete from member where m_id='aaa';

--자식 테이블 값 삽입        
insert into goods_seq(g_num,g_id, g_name,g_price,g_count,g_price_sum,g_date)
    values(goods_seq_SEQ.nextval,'aaa','운동화',75000,2,150000,sysdate); 
    
insert into goods_seq(g_num,g_id, g_name,g_price,g_count,g_price_sum,g_date)
    values(goods_seq_SEQ.nextval,'aaa','티셔츠',15000,5,75000,sysdate);   
    
insert into goods_seq(g_num,g_id, g_name,g_price,g_count,g_price_sum,g_date)
    values(goods_seq_SEQ.nextval,'bbb','가방',450000,1,450000,sysdate);   
    
insert into goods_seq(g_num,g_id, g_name,g_price,g_count,g_price_sum,g_date)
    values(goods_seq_SEQ.nextval,'bbb','책',35000,2,70000,sysdate);       
    
--문제 1 출력 답안
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
--강사님 풀이
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
values(g_seq.nextval,'aaa','운동화',75000,2,150000,sysdate);

insert into goods(g_num, g_id, g_name, g_price, g_count, g_price_sum, g_date)
values(g_seq.nextval,'aaa','티셔츠',15000,5,75000,sysdate);

insert into goods(g_num, g_id, g_name, g_price, g_count, g_price_sum, g_date)
values(g_seq.nextval,'bbb','가방',450000,1,450000,sysdate);

insert into goods(g_num, g_id, g_name, g_price, g_count, g_price_sum, g_date)
values(g_seq.nextval,'bbb','책',35000,2,70000,sysdate);


select M.*, G.* from member M inner join goods G ON M.m_id = G.g_id;

select M.m_id,M.m_name,G.g_name,G.g_price_sum from member M inner join goods G ON M.m_id = G.g_id;


select M.m_id,M.m_name,M.m_addr, sum(G.g_price_sum) from member M inner join goods G ON M.m_id = G.g_id GROUP BY M.m_id, M.m_name, M.m_addr;

*/


--오후 수업


