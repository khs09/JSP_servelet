
alter session set "_ORACLE_SCRIPT"=true;

CREATE USER musthave IDENTIFIED BY 1234; 
GRANT connect, resource, unlimited tablespace TO musthave;
-- 테이블 스페이스 조회 확인
SELECT tablespace_name, status, contents FROM dba_tablespaces;

-- 테이블 스페이스별 가용 공간 확인
SELECT tablespace_name, sum(bytes), max(bytes) from dba_free_space
    GROUP BY tablespace_name;
-- musthave 계정 사용하는 테이블 스페이스 확인
SELECT username, default_tablespace  FROM dba_users
    WHERE username in upper('musthave');
ALTER USER musthave QUOTA 5m ON users;

SELECT * FROM tab;

DROP TABLE member;
DROP TABLE board;
DROP TABLE seq_board_num;


CREATE TABLE member
(
	id VARCHAR2(10) NOT NULL,
	pass VARCHAR2(10) NOT NULL,
	name VARCHAR2(30) NOT NULL,
	regidate DATE DEFAULT SYSDATE not null,
	PRIMARY KEY (id)
);


insert into member (id, pass, name) values ('musthave', '1234', '머스트헤브'



commit;


CREATE TABLE board
(
    num number primary key,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    id varchar2(10) not null, 
    postdate date default sysdate not null,
    visitcount number (6)
);

-- 외래키 설정
alter table board
    add constraint board_mem_fk foreign key (id)
    references member(id);



insert into member (id, pass, name) values ('musthave', '1234', '머스트헤브');


create sequence seq_board_num
    increment by 1  -- 1씩 증가
    start with 1    -- 시작값 1
    minvalue 1      -- 최소값 1
    nomaxvalue      -- 최대값은 무한대
    nocycle         -- 순환하지 않음.
    nocache;        -- 캐시 안 함.
    
-- 아래를 먼저 입력하면 에러남 => 무결성 제약조건(MUSTHAVE.BOARD_MEM_FK)이 
-- 위배되었습니다- 부모 키가 없습니다. 그래서 위테이블 먼저 입력
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '제목1입니다.', '내용1입니다.', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 봄입니다', '봄의왈츠', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 여름입니다', '여름향기', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 가을입니다', '가을동화', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 겨울입니다', '겨울연가', 'musthave', sysdate, 0);
commit;
create table myfile (
    idx number primary key,
    title varchar2(200) not null,
    cate varchar2(100),
    ofile varchar2(100) not null,
    sfile varchar2(30) not null,
    postdate date default sysdate not null
);
