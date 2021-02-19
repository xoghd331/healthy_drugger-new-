CREATE TABLE board (
	b_num number PRIMARY KEY,
	b_username varchar2(100),
	b_password varchar2(15),
	b_title varchar2(100),
	b_content NCLOB,
	b_date date,
	b_view number,
	b_like number
)

CREATE TABLE comm(
	b_num number,
	c_num number,
	c_username varchar2(100),
	c_password varchar2(100),
	c_content NCLOB,
	c_date date,
	c_like number,
		CONSTRAINT comm_FK_b_num FOREIGN KEY(b_num)
		REFERENCES board(b_num) ON DELETE CASCADE
)



create sequence num_board
start with 1
increment by 1

create sequence num_comm
start with 1
increment by 1

DROP TABLE board
DROP TABLE comm
DROP SEQUENCE num_board
DROP SEQUENCE num_comm

SELECT * FROM board;
SELECT * FROM comm;
