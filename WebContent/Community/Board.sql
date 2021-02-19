CREATE TABLE user_info(
	id VARCHAR2(40),
	pw VARCHAR2(80),
	tel VARCHAR2(80),
	license VARCHAR2(40)
)

INSERT INTO user_info VALUES('user3', '1234', null, null)

CREATE TABLE board (
	b_num NUMBER PRIMARY KEY,
	b_username VARCHAR2(100),
	b_password VARCHAR2(15),
	b_title VARCHAR2(100),
	b_content NCLOB,
	b_date DATE,
	b_view NUMBER,
	b_like NUMBER
)

CREATE TABLE comm(
	b_num NUMBER,
	c_num NUMBER,
	c_username VARCHAR2(100),
	c_password VARCHAR2(100),
	c_content NCLOB,
	c_date DATE,
	c_like NUMBER,
		CONSTRAINT comm_FK_b_num FOREIGN KEY(b_num)
		REFERENCES board(b_num) ON DELETE CASCADE
)

CREATE TABLE qna(
	q_num NUMBER PRIMARY KEY,
	q_username VARCHAR2(100),
	q_password VARCHAR2(15),
	q_title VARCHAR2(100),
	q_content NCLOB,
	q_date DATE,
	q_view NUMBER,
	q_like NUMBER
)

CREATE TABLE rqna(
	q_num NUMBER,
	rq_num NUMBER,
	rq_username VARCHAR2(100),
	rq_password VARCHAR2(15),
	rq_title VARCHAR2(100),
	rq_content NCLOB,
	rq_date DATE,
	rq_like NUMBER,
		CONSTRAINT rqna_FK_q_num FOREIGN KEY(q_num)
		REFERENCES qna(q_num) ON DELETE CASCADE
)

CREATE SEQUENCE num_board
START WITH 1
INCREMENT BY 1

CREATE SEQUENCE num_comm
START WITH 1
INCREMENT BY 1

CREATE SEQUENCE num_qna
START WITH 1
INCREMENT BY 1

CREATE SEQUENCE num_rqna
START WITH 1
INCREMENT BY 1

DROP TABLE user_info
DROP TABLE comm
DROP TABLE board
DROP TABLE rqna
DROP TABLE qna
DROP SEQUENCE num_board
DROP SEQUENCE num_comm
DROP SEQUENCE num_qna
DROP SEQUENCE num_rqna

SELECT * FROM user_info;
SELECT * FROM board;
SELECT * FROM comm;
SELECT * FROM qna;
SELECT * FROM rqna;

/*NCLOB ���� Ȯ���ϴ� �ڵ�*/
SELECT DBMS_LOB.SUBSTR(rq_content, DBMS_LOB.GETLENGTH(rq_content)) FROM rqna

delete from rqna where rq_num = 21;
delete from board where b_username = 'testname';

INSERT INTO board VALUES (num_board.nextval, 'testname1', '1234', 'testtitle1', 'testcontent1', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname2', '1234', 'testtitle2', 'testcontent2', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname3', '1234', 'testtitle3', 'testcontent3', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname4', '1234', 'testtitle4', 'testcontent4', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname5', '1234', 'testtitle5', 'testcontent5', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname6', '1234', 'testtitle6', 'testcontent6', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname7', '1234', 'testtitle7', 'testcontent7', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname8', '1234', 'testtitle8', 'testcontent8', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname9', '1234', 'testtitle9', 'testcontent9', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname10', '1234', 'testtitle10', 'testcontent10', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname11', '1234', 'testtitle11', 'testcontent11', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname12', '1234', 'testtitle12', 'testcontent12', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname13', '1234', 'testtitle13', 'testcontent13', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname14', '1234', 'testtitle14', 'testcontent14', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname15', '1234', 'testtitle15', 'testcontent15', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname16', '1234', 'testtitle16', 'testcontent16', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname17', '1234', 'testtitle17', 'testcontent17', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname18', '1234', 'testtitle18', 'testcontent18', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname19', '1234', 'testtitle19', 'testcontent19', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname20', '1234', 'testtitle20', 'testcontent20', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname21', '1234', 'testtitle21', 'testcontent21', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname22', '1234', 'testtitle22', 'testcontent22', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname23', '1234', 'testtitle23', 'testcontent23', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname24', '1234', 'testtitle24', 'testcontent24', sysdate, 0, 0)
INSERT INTO board VALUES (num_board.nextval, 'testname25', '1234', 'testtitle25', 'testcontent25', sysdate, 0, 0)

INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�1', '1234', '�׽�Ʈ����1', '�׽�Ʈ����1', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�2', '1234', '�׽�Ʈ����2', '�׽�Ʈ����2', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�3', '1234', '�׽�Ʈ����3', '�׽�Ʈ����3', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�4', '1234', '�׽�Ʈ����4', '�׽�Ʈ����4', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�5', '1234', '�׽�Ʈ����5', '�׽�Ʈ����5', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�6', '1234', '�׽�Ʈ����6', '�׽�Ʈ����6', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�7', '1234', '�׽�Ʈ����7', '�׽�Ʈ����7', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�8', '1234', '�׽�Ʈ����8', '�׽�Ʈ����8', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�9', '1234', '�׽�Ʈ����9', '�׽�Ʈ����9', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�10', '1234', '�׽�Ʈ����10', '�׽�Ʈ����10', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�11', '1234', '�׽�Ʈ����11', '�׽�Ʈ����11', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�12', '1234', '�׽�Ʈ����12', '�׽�Ʈ����12', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�13', '1234', '�׽�Ʈ����13', '�׽�Ʈ����13', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�14', '1234', '�׽�Ʈ����14', '�׽�Ʈ����14', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�15', '1234', '�׽�Ʈ����15', '�׽�Ʈ����15', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�16', '1234', '�׽�Ʈ����16', '�׽�Ʈ����16', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�17', '1234', '�׽�Ʈ����17', '�׽�Ʈ����17', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�18', '1234', '�׽�Ʈ����18', '�׽�Ʈ����18', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�19', '1234', '�׽�Ʈ����19', '�׽�Ʈ����19', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�20', '1234', '�׽�Ʈ����20', '�׽�Ʈ����20', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�21', '1234', '�׽�Ʈ����21', '�׽�Ʈ����21', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�22', '1234', '�׽�Ʈ����22', '�׽�Ʈ����22', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�23', '1234', '�׽�Ʈ����23', '�׽�Ʈ����23', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�24', '1234', '�׽�Ʈ����24', '�׽�Ʈ����24', sysdate, 0, 0)
INSERT INTO qna VALUES (num_qna.nextval, '�׽�Ʈ�̸�25', '1234', '�׽�Ʈ����25', '�׽�Ʈ����25', sysdate, 0, 0)


