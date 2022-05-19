--------------------------------------------------------------------------------
--테이블 생성--
create table author(
	author_id number(10),
	author_name varchar2(100) not null,
	author_desc varchar2(500),
	primary key(author_id)	
);

create table book(
    book_id number(10),
    title varchar2(500),
    pubs varchar2(100),
    pub_date date,
    author_id number(10),
    primary key (book_id),
    constraint book_fk foreign key(author_id)
    references author(author_id)
);
--------------------------------------------------------------------------------
--작가 시퀸스 만들기
create sequence seq_author_id
increment by 1
nocache;
--책 시퀸스 만들기
create sequence seq_book_id
increment by 1
nocache;
--시퀀스 조회하기
select *
from user_sequences;
--------------------------------------------------------------------------------
--작가컬럼 추가--
insert into author
values(seq_author_id.nextval, '김문열', '경북 양양');
insert into author
values(seq_author_id.nextval, '박경리', '경상남도 통영');
insert into author
values(seq_author_id.nextval, '유시민', '17대 국회의원');
insert into author
values(seq_author_id.nextval, '기안84', '기안동에서 산 84년생');
insert into author
values(seq_author_id.nextval, '강풀', '온라인 만화가 1세대');
insert into author
values(seq_author_id.nextval, '김문열', '알쓸신잡');

--책컬럼 추가--
insert into book
values(seq_book_id.nextval, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);
insert into book
values(seq_book_id.nextval, '삼국지', '민음사', '2022-03-01', 1);
insert into book
values(seq_book_id.nextval, '토지', '마로니에북스', '2012-08-15', 2);
insert into book
values(seq_book_id.nextval, '유시민의 글쓰기 특강', '생각의길', '2015-04-01', 3);
insert into book
values(seq_book_id.nextval, '패션왕', '중앙북스(books)', '2012-02-22', 4);
insert into book
values(seq_book_id.nextval, '순정만화', '재미주의', '2011-08-03', 5);
insert into book
values(seq_book_id.nextval, '오직두사람', '문학동네', '2017-05-04', 6);
insert into book
values(seq_book_id.nextval, '26년', '재미주의', '2012-02-04', 5);
--------------------------------------------------------------------------------
--전체출력
select b.book_id,
       b.title,
       b.pubs,
       b.pub_date,
       b.author_id,
       a.author_name,
       a.author_desc
from author a, book b
where a.author_id = b.author_id;
--------------------------------------------------------------------------------
--커밋, 롤백
commit;
rollback;
--------------------------------------------------------------------------------
--강풀의 author_desc 정보를 ‘서울특별시’ 로 변경해 보세요
update author
set author_desc = '서울특별시'
where author_desc = '온라인 만화가 1세대';

--author 테이블에서 기안84 데이터를 삭제해 보세요  삭제 안됨
delete from author
where author_name = '기안84'; --불가능, 값이 무조건 들어가있어야함
