-- SQLPLUS system/oracle;
-- CREATE USER parking IDENTIFIED by parking;
-- GRANT CONNECT, RESOURCE TO parking;
-- CONN parking/1234;

-----------------------------------------------------------------------------------
--190907 Table Modified : 
--USERHISTORY 컬럼삭제 latitude, longitude, parkinglot_name, parkinglot_addr
--            컬럼추가 userhistory_parking_code
--            FK추가 userhistory_parking_code -> parking_seoul.ps_parking_code
--PAYMENTHISTORY 컬럼명변경 paymenthistory_purchase_amount -> paymenthistory_payment
--PAYMENTHISTORY 컬럼삭제 instt_name, instt_phone
--PAYMENTHISTORY 컬럼추가 paymenthistory_parking_code, paymenthistory_userhistory_no, 
--               FK추가 paymenthistory_userhistory_no -> userhistory_no
--REIVEW 컬럼추가 review_userhistory_no
--       FK추가 review_userhistory_no -> userhistory_no
--BOOKMARK 컬럼삭제 latitude, longitude
--         컬럼추가 parking_code (엑셀파일에 있는 주차 코드)
--COUPON + pecent name (cookie로 expiredate jasa logic) issuedate, terminate
--        mypage 올떄마다 coupon expire 결정
--각테이블 user_code 컬럼명 변경  user_code -> tablename_user_code
--PARKING_SEOUL ps_parking_code, ps_addr, ps_parking_name, ps_latitude, ps_longitude
-----------------------------------------------------------------------------------

SELECT user_code, email, pw,phone, user_name, user_addr,
  TO_CHAR(created_date, 'yyyy-MM-dd hh24:mi:ss') AS created_date,
  TO_CHAR(login_date, 'yyyy-MM-dd hh24:mi:ss') AS login_date,
  sms_yn, email_yn, email_verified
FROM MEMBER;
--DELETE FROM MEMBER;

SELECT * FROM TAB;
--update member set email='dbsduthd123@nate.com' where user_code='482581';

COMMIT;
--update member set created_date=TO_DATE('2019/08/26 01:30:44', 'yyyy/mm/dd hh24:mi:ss') where user_code='482581';

--SELECT * FROM MEMBER;
--SELECT * FROM USERHISTORY;
--SELECT * FROM CAR;
--SELECT * FROM PAYMENTHISTORY;
--SELECT * FROM REVIEW;
--SELECT * FROM QNABOARD;
--SELECT * FROM NOTICE;
--SELECT * FROM BOOKMARK;
--SELECT * FROM COUPON;

-- TABLE
--DROP TABLE MEMBER CASCADE CONSTRAINTS;
--DROP TABLE USERHISTORY CASCADE CONSTRAINTS;
--DROP TABLE CAR CASCADE CONSTRAINTS;
--DROP TABLE PAYMENTHISTORY CASCADE CONSTRAINTS;
--DROP TABLE REVIEW CASCADE CONSTRAINTS;
--DROP TABLE QNABOARD CASCADE CONSTRAINTS;
--DROP TABLE NOTICE CASCADE CONSTRAINTS;
--DROP TABLE BOOKMARK CASCADE CONSTRAINTS;
--DROP TABLE COUPON CASCADE CONSTRAINTS;
--
--DROP SEQUENCE USERHISTORY_SEQ;
--DROP SEQUENCE PAYMENTHISTORY_SEQ;
--DROP SEQUENCE REVIEW_SEQ;
--DROP SEQUENCE QNABOARD_SEQ;
--DROP SEQUENCE NOTICE_SEQ;
--DROP SEQUENCE BOOKMARK_SEQ;
--
--DROP TRIGGER USERHISTORY_trg;
--DROP TRIGGER PAYMENTHISTORY_trg;
--DROP trigger REVIEW_trg;
--DROP trigger QNABOARD_trg;
--DROP trigger NOTICE_trg;
--DROP trigger BOOKMARK_trg;

SELECT * FROM user_constraints WHERE table_name IN
  ('MEMBER', 'USERHISTORY', 'CAR', 'PAYMENTHISTORY', 'REVIEW', 'QNABOARD', 'NOTICE', 'BOOKMARK', 'COUPON');

CREATE TABLE MEMBER (
  user_code CHAR(6) NOT NULL,
  email VARCHAR2(50) NOT NULL,
  pw VARCHAR2(300) NOT NULL,
  phone VARCHAR2(20) NOT NULL,
  user_name VARCHAR2(50) NOT NULL,
  user_addr VARCHAR2(300) NOT NULL,
  created_date DATE DEFAULT SYSDATE,
  login_date DATE,
  sms_yn NUMBER(1,0) NOT NULL,
  email_yn NUMBER(1,0) NOT NULL,
  email_verified NUMBER(1,0) DEFAULT 0
);

COMMENT ON COLUMN MEMBER.user_code IS '회원코드';
COMMENT ON COLUMN MEMBER.email IS '이메일';
COMMENT ON COLUMN MEMBER.pw IS '비밀번호';
COMMENT ON COLUMN MEMBER.phone IS '폰번호';
COMMENT ON COLUMN MEMBER.user_name IS '회원이름';
COMMENT ON COLUMN MEMBER.user_addr IS '회원주소';
COMMENT ON COLUMN MEMBER.created_date IS '가입날짜';
COMMENT ON COLUMN MEMBER.login_date IS '최근 로그인날짜';
COMMENT ON COLUMN MEMBER.sms_yn IS '문자 수신여부(1/0)';
COMMENT ON COLUMN MEMBER.email_yn IS '이메일 수신여부(1/0)';
COMMENT ON COLUMN MEMBER.email_verified IS '이메일 인증여부(1/0)';

ALTER TABLE MEMBER 
  ADD CONSTRAINT pk_user PRIMARY KEY(user_code);
ALTER TABLE MEMBER 
  ADD CONSTRAINT uq_user UNIQUE (email);
ALTER TABLE MEMBER 
  ADD CONSTRAINT chk_user_sms CHECK (sms_yn in (1,0));
ALTER TABLE MEMBER 
  ADD CONSTRAINT chk_user_email CHECK (email_yn in (1,0));
ALTER TABLE MEMBER 
  ADD CONSTRAINT chk_user_verified CHECK (email_verified in (1,0));


--drop table parking_seoul cascade constraints;

CREATE TABLE PARKING_SEOUL(
  ps_parking_code CHAR(7) NOT NULL,
  ps_addr VARCHAR2(200) NOT NULL,
  ps_latitude NUMBER(10,8) NOT NULL,
  ps_longitude NUMBER(11,8) NOT NULL
);
COMMENT ON COLUMN PARKING_SEOUL.ps_parking_code IS '주차장코드';
COMMENT ON COLUMN PARKING_SEOUL.ps_addr IS '주차장주소';
COMMENT ON COLUMN PARKING_SEOUL.ps_latitude IS '주차장위도(0~90)';
COMMENT ON COLUMN PARKING_SEOUL.ps_longitude IS '주차장경도(0~180)';

ALTER TABLE PARKING_SEOUL
  ADD CONSTRAINT pk_ps PRIMARY KEY(ps_parking_code);


--DROP TABLE USERHISTORY CASCADE CONSTRAINTS;

CREATE TABLE USERHISTORY(
  userhistory_no NUMBER(5) NOT NULL,
  userhistory_user_code CHAR(6) NOT NULL,
  userhistory_parking_code CHAR(7) NOT NULL,
  userhistory_parking_date DATE DEFAULT SYSDATE
);
COMMENT ON COLUMN USERHISTORY.userhistory_no IS '이용내역번호';
COMMENT ON COLUMN USERHISTORY.userhistory_user_code IS '회원코드';
COMMENT ON COLUMN USERHISTORY.userhistory_parking_code IS '주차장코드';
COMMENT ON COLUMN USERHISTORY.userhistory_parking_date IS '주차날짜';


CREATE SEQUENCE USERHISTORY_SEQ START WITH 1;

CREATE OR REPLACE TRIGGER USERHISTORY_TRG
BEFORE INSERT ON USERHISTORY
FOR EACH ROW
BEGIN
 SELECT USERHISTORY_SEQ.NEXTVAL
 INTO :NEW.userhistory_no
 FROM DUAL;
END;
/

ALTER TABLE USERHISTORY
  ADD CONSTRAINT pk_userhist PRIMARY KEY(userhistory_no);
ALTER TABLE USERHISTORY
  ADD CONSTRAINT fk_userhist_member FOREIGN KEY(userhistory_user_code) REFERENCES MEMBER(user_code)
  ON DELETE CASCADE;
ALTER TABLE USERHISTORY
  ADD CONSTRAINT fk_userhist_ps FOREIGN KEY(userhistory_parking_code)
        REFERENCES PARKING_SEOUL(ps_parking_code)
  ON DELETE CASCADE;

--drop table paymenthistory CASCADE CONSTRAINTS;

CREATE TABLE PAYMENTHISTORY(
  paymenthistory_no NUMBER(5) NOT NULL,
  paymenthistory_userhistory_no NUMBER(5) NOT NULL,
  paymenthistory_purchase_amount NUMBER(7) DEFAULT 0,
  paymenthistory_parking_code CHAR(7) NOT NULL,
  paymenthistory_payment_date DATE DEFAULT SYSDATE
);
COMMENT ON COLUMN PAYMENTHISTORY.paymenthistory_no IS '결제내역번호';
COMMENT ON COLUMN PAYMENTHISTORY.paymenthistory_userhistory_no IS '이용내역번호';
COMMENT ON COLUMN PAYMENTHISTORY.paymenthistory_purchase_amount IS '주차요금 결제액';
COMMENT ON COLUMN PAYMENTHISTORY.paymenthistory_parking_code IS '주차장코드';
COMMENT ON COLUMN PAYMENTHISTORY.paymenthistory_payment_date IS '주차요금 결제일';

--drop table paymenthistory;
--drop sequence paymenthistory_seq;
--drop trigger paymenthistory_trg;
CREATE SEQUENCE PAYMENTHISTORY_SEQ START WITH 1;

CREATE OR REPLACE TRIGGER PAYMENTHISTORY_TRG
BEFORE INSERT ON PAYMENTHISTORY
FOR EACH ROW
BEGIN
 SELECT PAYMENTHISTORY_SEQ.NEXTVAL
 INTO :NEW.paymenthistory_no
 FROM DUAL;
END;
/

ALTER TABLE PAYMENTHISTORY
  ADD CONSTRAINT pk_pmthist PRIMARY KEY(paymenthistory_no);
ALTER TABLE PAYMENTHISTORY
  ADD CONSTRAINT fk_pmthist_userhist_no FOREIGN KEY(paymenthistory_userhistory_no) 
     REFERENCES userhistory(userhistory_no)
  ON DELETE CASCADE;
ALTER TABLE PAYMENTHISTORY
  ADD CONSTRAINT fk_pmthist_userhist_pc FOREIGN KEY(paymenthistory_parking_code)
        REFERENCES PARKING_SEOUL(ps_parking_code)
  ON DELETE CASCADE;

--drop table review;

CREATE TABLE REVIEW(
 review_no NUMBER(5) NOT NULL,
 review_userhistory_no CHAR(7) NOT NULL,
 review_title VARCHAR2(50) NOT NULL,
 review_content VARCHAR2(300) NOT NULL,
 review_created_date DATE DEFAULT SYSDATE,
 review_rating NUMBER(1) NOT NULL
);
COMMENT ON COLUMN REVIEW.review_no IS '코드번호';
COMMENT ON COLUMN REVIEW.review_userhistory_no IS '이용내역번호';
COMMENT ON COLUMN REVIEW.review_title IS '리뷰 제목';
COMMENT ON COLUMN REVIEW.review_content IS '리뷰 작성글';
COMMENT ON COLUMN REVIEW.review_created_date IS '작성날짜';
COMMENT ON COLUMN REVIEW.review_rating IS '평점(1~5 정수)';

--drop sequence review_seq;
CREATE SEQUENCE REVIEW_SEQ START WITH 1;

--drop trigger review_trg;

CREATE OR REPLACE TRIGGER REVIEW_TRG
BEFORE INSERT ON REVIEW
FOR EACH ROW
BEGIN
 SELECT REVIEW_SEQ.NEXTVAL
 INTO :NEW.review_no
 FROM DUAL;
END;
/

ALTER TABLE REVIEW
  ADD CONSTRAINT pk_review PRIMARY KEY(review_no);
ALTER TABLE REVIEW
  ADD CONSTRAINT fk_review_userhist FOREIGN KEY(review_no)
        REFERENCES userhistory(userhistory_no)
  ON DELETE CASCADE;
ALTER TABLE REVIEW
  ADD CONSTRAINT chk_review_rating CHECK (review_rating in (1,2,3,4,5));


CREATE TABLE QNABOARD(
  qna_no NUMBER(5) NOT NULL,
  qna_title VARCHAR2(50) NOT NULL,
  qna_user_code CHAR(6) NOT NULL,
  qna_content VARCHAR2(300) NOT NULL,
  qna_original_filename VARCHAR2(100),
  qna_renamed_filename VARCHAR2(100),
  qna_created_date DATE DEFAULT SYSDATE,
  qna_readcount NUMBER DEFAULT 0
);
COMMENT ON COLUMN QNABOARD.qna_no IS '문의글번호';
COMMENT ON COLUMN QNABOARD.qna_title IS '문의글 제목';
COMMENT ON COLUMN QNABOARD.qna_user_code IS '회원코드';
COMMENT ON COLUMN QNABOARD.qna_content IS '문의글 내용';
COMMENT ON COLUMN QNABOARD.qna_original_filename IS '첨부파일원래이름';
COMMENT ON COLUMN QNABOARD.qna_renamed_filename IS '첨부파일변경이름';
COMMENT ON COLUMN QNABOARD.qna_created_date IS '작성날짜';
COMMENT ON COLUMN QNABOARD.qna_readcount IS '조회수';

CREATE SEQUENCE QNABOARD_SEQ START WITH 1;

CREATE OR REPLACE TRIGGER QNABOARD_TRG
BEFORE INSERT ON QNABOARD
FOR EACH ROW
BEGIN
 SELECT QNABOARD_SEQ.NEXTVAL
 INTO :NEW.qna_no
 FROM DUAL;
END;
/

ALTER TABLE QNABOARD
  ADD CONSTRAINT pk_qna PRIMARY KEY(qna_no);
ALTER TABLE QNABOARD
  ADD CONSTRAINT fk_qna_member FOREIGN KEY(qna_user_code) REFERENCES MEMBER(user_code)
  ON DELETE CASCADE;


--DROP TABLE QNABOARD;
--DROP TRIGGER QNABOARD_TRG;
--DROP SEQUENCE QNABOARD_SEQ;
--select * from qnaboard;
--select count(*) from qnaboard;
insert into qnaboard values(DEFAULT,'a_title', '822353', 'this is a content1', null,null, default, default);
insert into qnaboard values(DEFAULT,'b_title', '822353', 'this is a content2', null,null, default, default);
insert into qnaboard values(DEFAULT,'c_title', '822353', 'this is a content3', null,null, default, default);
insert into qnaboard values(DEFAULT,'d_title', '822353', 'this is a content4', null,null, default, default);
insert into qnaboard values(DEFAULT,'e_title', '822353', 'this is a content5', null,null, default, default);
insert into qnaboard values(DEFAULT,'f_title', '822353', 'this is a content6', null,null, default, default);
insert into qnaboard values(DEFAULT,'g_title', '822353', 'this is a content7', null,null, default, default);
insert into qnaboard values(DEFAULT,'h_title', '822353', 'this is a content8', null,null, default, default);
insert into qnaboard values(DEFAULT,'i_title', '822353', 'this is a content9', null,null, default, default);
insert into qnaboard values(DEFAULT,'j_title', '822353', 'this is a content10', null,null, default, default);
insert into qnaboard values(DEFAULT,'k_title', '822353', 'this is a content11', null,null, default, default);
insert into qnaboard values(DEFAULT,'l_title', '822353', 'this is a content12', null,null, default, default);
insert into qnaboard values(DEFAULT,'m_title', '822353', 'this is a content13', null,null, default, default);
insert into qnaboard values(DEFAULT,'n_title', '822353', 'this is a content14', null,null, default, default);
insert into qnaboard values(DEFAULT,'o_title', '797321', 'this is a content15', null,null, default, default);
insert into qnaboard values(DEFAULT,'p_title', '797321', 'this is a content16', null,null, default, default);
insert into qnaboard values(DEFAULT,'q_title', '797321', 'this is a content17', null,null, default, default);
insert into qnaboard values(DEFAULT,'r_title', '797321', 'this is a content18', null,null, default, default);
insert into qnaboard values(DEFAULT,'s_title', '797321', 'this is a content19', null,null, default, default);
insert into qnaboard values(DEFAULT,'t_title', '797321', 'this is a content20', null,null, default, default);
insert into qnaboard values(DEFAULT,'u_title', '797321', 'this is a content21', null,null, default, default);
insert into qnaboard values(DEFAULT,'v_title', '797321', 'this is a content22', null,null, default, default);
insert into qnaboard values(DEFAULT,'w_title', '797321', 'this is a content23', null,null, default, default);
insert into qnaboard values(DEFAULT,'x_title', '797321', 'this is a content24', null,null, default, default);
insert into qnaboard values(DEFAULT,'y_title', '797321', 'this is a content25', null,null, default, default);
insert into qnaboard values(DEFAULT,'z_title', '797321', 'this is a content26', null,null, default, default);
insert into qnaboard values(DEFAULT,'zzz_title', '797321', 'this is a content27', null,null, default, default);
commit;


--DROP TABLE NOTICE;

CREATE TABLE NOTICE(
  notice_no NUMBER(5) NOT NULL,
  notice_user_code CHAR(6) NOT NULL,
  notice_title VARCHAR2(50) NOT NULL,
  notice_content VARCHAR2(300) NOT NULL,
  notice_created_date DATE DEFAULT SYSDATE,
  notice_readcount NUMBER DEFAULT 0
);
COMMENT ON COLUMN NOTICE.notice_no IS '공지사항글번호';
COMMENT ON COLUMN NOTICE.notice_user_code IS '회원코드';
COMMENT ON COLUMN NOTICE.notice_title IS '공지사항 제목';
COMMENT ON COLUMN NOTICE.notice_content IS '공지사항 내용';
COMMENT ON COLUMN NOTICE.notice_created_date IS '작성날짜';
COMMENT ON COLUMN NOTICE.notice_readcount IS '조회수';

--drop sequence notice_seq;
--drop trigger notice_trg;

CREATE SEQUENCE NOTICE_SEQ START WITH 1;

CREATE OR REPLACE TRIGGER NOTICE_TRG
BEFORE INSERT ON NOTICE
FOR EACH ROW
BEGIN
 SELECT NOTICE_SEQ.NEXTVAL
 INTO :NEW.notice_no
 FROM DUAL;
END;
/

ALTER TABLE NOTICE 
  ADD CONSTRAINT pk_notice PRIMARY KEY(notice_no);
ALTER TABLE NOTICE
  ADD CONSTRAINT fk_notice_member FOREIGN KEY(notice_user_code) REFERENCES MEMBER(user_code)
  ON DELETE CASCADE;


--drop table bookmark;
--drop sequence bookmark_seq;
CREATE TABLE BOOKMARK(
  bookmark_no NUMBER(3) NOT NULL,
  bookmark_user_code CHAR(6) NOT NULL,
  bookmark_parking_code CHAR(7) NOT NULL
);
COMMENT ON COLUMN BOOKMARK.bookmark_no IS '북마크번호';
COMMENT ON COLUMN BOOKMARK.bookmark_user_code IS '회원코드';
COMMENT ON COLUMN BOOKMARK.bookmark_parking_code IS '주차코드';

--drop sequence bookmark_seq;
--drop trigger bookmark_trg;
CREATE SEQUENCE BOOKMARK_SEQ START WITH 1;

CREATE OR REPLACE TRIGGER BOOKMARK_TRG
BEFORE INSERT ON BOOKMARK
FOR EACH ROW
BEGIN
 SELECT BOOKMARK_SEQ.NEXTVAL
 INTO :NEW.bookmark_no
 FROM DUAL;
END;
/

ALTER TABLE BOOKMARK 
  ADD CONSTRAINT pk_bookmark PRIMARY KEY(bookmark_no);
ALTER TABLE BOOKMARK
  ADD CONSTRAINT fk_bookmark_member FOREIGN KEY(bookmark_user_code) REFERENCES MEMBER(user_code)
  ON DELETE CASCADE;


--DROP table coupon cascade constraints;

CREATE TABLE COUPON(
  coupon_code CHAR(16) NOT NULL,
  coupon_user_code CHAR(6) NOT NULL,
  coupon_discount_rate NUMBER(2) NOT NULL,
  coupon_duration NUMBER(1) NOT NULL,
  coupon_expired_yn NUMBER(1,0)
);
COMMENT ON COLUMN COUPON.coupon_code IS '쿠폰번호';
COMMENT ON COLUMN COUPON.coupon_user_code IS '회원코드';
COMMENT ON COLUMN COUPON.coupon_discount_rate IS '할인율';
COMMENT ON COLUMN COUPON.coupon_duration IS '쿠폰기한';
COMMENT ON COLUMN COUPON.coupon_expired_yn IS '쿠폰 사용기한 초과여부(1/0)'; 

ALTER TABLE COUPON
  ADD CONSTRAINT pk_coupon PRIMARY KEY(coupon_code);
ALTER TABLE COUPON
  ADD CONSTRAINT fk_coupon_member FOREIGN KEY(coupon_user_code) REFERENCES MEMBER(user_code)
  ON DELETE CASCADE;
ALTER TABLE COUPON
  ADD CONSTRAINT chk_coupon_expired_yn CHECK (coupon_expired_yn in(1, 0));

--drop table car CASCADE CONSTRAINTS;

CREATE TABLE CAR(
  car_user_code CHAR(6) NOT NULL,
  car_capcity NUMBER(2) DEFAULT 0,
  car_type VARCHAR2(100),
  car_model VARCHAR2(100)
);
COMMENT ON COLUMN CAR.car_user_code IS '회원코드';
COMMENT ON COLUMN CAR.car_capcity IS '차량 인승';
COMMENT ON COLUMN CAR.car_type IS '차량종류';
COMMENT ON COLUMN CAR.car_model IS '차량모델명';

ALTER TABLE CAR
  ADD CONSTRAINT fk_car_member FOREIGN KEY(car_user_code) REFERENCES MEMBER(user_code)
  ON DELETE CASCADE;


COMMIT;
