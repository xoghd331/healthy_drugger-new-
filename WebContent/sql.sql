create table user_info(
	id varchar2(40),
	pw varchar2(80),
	tel varchar2(80),
	license varchar2(40)
)

insert into user_info values('test','123','010-0000-0000','123456789')

select * from user_info

create table pills(
	name varchar2(100),			/*  �� �̸�  */
	brand varchar2(80),			/*  �귣��   */
	gender varchar2(40),		/*  ����     */
	age varchar2(30),			/*  ���ɴ�   */
	ingredient varchar2(1500),	/*  ����     */
	efficacy varchar2(100),		/*  ȿ��     */
	price varchar2(20),			/*  ����     */
	note varchar2(200)			/* ���� ���� */
)

insert into pills values('Ű��ưư ��Ƽ��Ÿ��','Ű��ưư','����','����/û�ҳ�','��Ÿ��A, ��Ÿ��D, ��Ÿ��E, ��Ÿ��B1, ��Ÿ��B2, ��Ÿ��B6, ��Ÿ��B12, ��Ÿ��C, ö, ����','�������','12,900','')

select * from pills

create table issue (
    num number(38),             /*�Խñ� ��ȣ*/
	title varchar2(100),
	user_id varchar2(30),
    up_date date,    			 /*��ϳ�¥, ����ð����� ����*/
    content varchar2(2000),
    available number(38),
    primary key(num)        /*�⺻Ű�� �Խñ� ��ȣ�� ����*/
)

alter table issue add issueimg varchar2(2000)
alter table issue rename column num to IDX

CREATE SEQUENCE issue_seq
    START WITH 1
    INCREMENT BY 1;
    
select * from ISSUE
