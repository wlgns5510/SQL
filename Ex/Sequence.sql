--작가 시퀀스 만들기
create sequence seq_author_id
increment by 1 --옵션
start with 7
nocache;

--시퀀스 조회하는 방법--
select * 
from user_sequences; 

--시퀀스가 몇번째인지 조회하는 방법--
select seq_author_id.currval
from dual;

--다음 시퀀스가 몇번인지 조회하는 방법(다음번호를 실행시켜버림 3 --> 5번으로 가버림)--
select seq_author_id.nextval
from dual;

--시퀀스 삭제--
drop sequence seq_author_id;

commit; --실제로 정보를 저장(실시간 저장말고 데이트 같은것들)
rollback; --전 커밋으로 돌아감
-------------------------------------------------------------------------------------
--작가 테이블 만들기
create table author(
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key(author_id)
);

--작가 시퀀스 만들기
create sequence seq_author_id
increment by 1
start with 1
nocache;

--작가 시퀀스 조회하기
select *
from user_sequences;

--작가 데이터 추가
insert into author
values(seq_author_id.nextval, '박경리', '토지작가');

insert into author
values(seq_author_id.nextval, '이문열', '삼국지작가');

insert into author
values(seq_author_id.nextval, '기안84', '웹툰작가');

update author
set author_name = '자취84',
    author_desc = '나혼자산다 출연'
where author_id = 3;

select *
from author;

--------------------------------------







