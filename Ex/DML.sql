--테이블 생성--
--author테이블
create table author(
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key(author_id)
);
--book테이블
create table book(
    book_id number(10),
    title varchar2(100) not null,
    pubs varchar2(100),
    pub_date date,
    author_id number(10),
    primary key(book_id),--pk
    constraint book_fk foreign key(author_id)
    references author(author_id)--fk
);
---------------------DML-------------------------
--컬럼추가--
insert into author 
values(1, '박경림', '토지 작가'); --컬럼내용 추가

insert into author(author_id, author_name) --부분컬럼내용 추가
values(3, '기안84');

--컬럼변경--
update author
set author_desc = '삼국지 작가'
where author_id = 2; --컬럼내용을 원하는 내용으로 변경 where에 바꿀값 지정

--컬럼삭제--
delete from author
where author_id = 1; --컬럼내용 삭제 where에 바꿀값 지정

truncate table author; --모든 컬럼 삭제


--book 컬럼추가--
insert into book
values(1, '토지', '마로니에북스', '2012-08-15', 1);

insert into book
values(2, '삼국지', '민음사', '2002-03-01', 2);






select *
from author;

select *
from book;

