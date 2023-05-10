--생성
create table person(
-- 이름 자료형 (크기 지정)
    num number,
    name varchar2(20) not null,
    birth varchar2(20),
    tel varchar2(20),
-- 중복 허용X 기본키 지정    
    primary key (num)
);

-- 저장소 확인
select * from tab;

-- 데이터 추가
-- 문자형 무조건 작은 따옴표 ''
insert into person values (1001, '홍길동','20230516','010-1234-5678');
insert into person values (1003, '김은지','19995872','010-1234-5678');
-- 다른 방식
insert into person (num, name, birth, tel)
                    values(1002, '이흥됴','19730617','010-1234-5678'); 

--테이블 가져오기
select * from person; 
-- 특정 값만 가져오기
select num, name from person;

--특정 값 찾기
select *from person where name = '홍길동';
select *from person where num = 1000;

-- 값 삭제하기
delete from person;
--특정 값 삭제
delete from person where num =1002;
-- 테이블 확인
select *from person;

--테이블 수정
update person set name='김개똥',tel='111' where num =1002;

--임시저장소 DB에 저장
commit;
--데이터 되돌리기
rollback;



