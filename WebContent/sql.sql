create table user_info(
	id varchar2(40),
	pw varchar2(80),
	tel varchar2(80),
	license varchar2(40)
)

insert into user_info values('test','123','010-0000-0000','123456789')

select * from user_info

create table pills(
	name varchar2(100),			/*  약 이름  */
	brand varchar2(80),			/*  브랜드   */
	gender varchar2(40),		/*  성별     */
	age varchar2(30),			/*  연령대   */
	ingredient varchar2(1500),	/*  성분     */
	efficacy varchar2(100),		/*  효능     */
	price varchar2(20),			/*  가격     */
	note varchar2(200)			/* 주의 사항 */
)

insert into pills values('키즈튼튼 멀티비타민','키즈튼튼','공용','유아/청소년','비타민A, 비타민D, 비타민E, 비타민B1, 비타민B2, 비타민B6, 비타민B12, 비타민C, 철, 망간','성장발육','12,900','')

select * from pills

create table issue (
    num number(38),             /*게시글 번호*/
	title varchar2(100),
	user_id varchar2(30),
    up_date date,    			 /*등록날짜, 현재시간으로 설정*/
    content varchar2(2000),
    available number(38),
    primary key(num)        /*기본키를 게시글 번호로 설정*/
)

alter table issue add issueimg varchar2(2000)
alter table issue rename column num to IDX

CREATE SEQUENCE issue_seq
    START WITH 1
    INCREMENT BY 1;
    
select * from ISSUE

drop table issue