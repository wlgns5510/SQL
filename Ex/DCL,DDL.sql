------------------------테이블----------------------------------
--table 생성
create table book(
    book_id number(5),
    title varchar2(50),
    author varchar2(10),
    pub_date date
    );

--table 삭제
drop table book;

--table이름 변경
rename book to article; --book을 article로 변경

------------------------컬럼----------------------------------
--컬럼추가
alter table book add(pubs varchar2(50));

--컬럼삭제
alter table book drop(author); --author컬럼을 삭제

--컬럼크기 수정
alter table book modify(title varchar2(100));

--컬럼명 수정
alter table book rename column title to subject; --title을 subject로 변경







select *
from article;