SELECT * FROM tbl_score;

-- 테이블 생성
-- 성적정보 저장 테이블

CREATE TABLE TBL_SCORE (
	name varchar2(4) NOT NULL,
	kor NUMBER(3) NOT NULL CHECK(kor>0 AND kor<=100),
	eng NUMBER(3) NOT NULL CHECK(eng>0 AND eng<=100),
	math NUMBER(3) NOT NULL CHECK(math>0 AND math<=100),
	total NUMBER(3) NULL, -- 안쓰면 자동으로 NULL 들어감
	avarage NUMBER(5,2),
	grade char(1),
	stu_num NUMBER(6) ,
	
	--pk 거는법
	CONSTRAINT pk_stu_num
	PRIMARY KEY (stu_num)
);
-- 테이블 생성 후 pk 걸기
ALTER TABLE TBL_SCORE 
add	CONSTRAINT pk_stu_num
	PRIMARY KEY (stu_num);

-- 컬럼 생성
ALTER TABLE TBL_SCORE 
ADD (sci NUMBER(3) NOT NULL);

-- 컬럼 제거하기
ALTER TABLE TBL_SCORE 
DROP COLUMN sci;

-- 테이블 복사 (tb_emp)
-- CTAS
CREATE TABLE tb_emp_copy
AS SELECT * FROM tb_emp;

--복사 테이블 조회
SELECT * from tb_emp_copy;

--drop table
DROP TABLE tb_emp_copy;

--TRUNCATE table
--내용만 삭제
TRUNCATE TABLE tb_emp_copy;


-- 예시테이블
CREATE TABLE goods (
   id NUMBER(6) PRIMARY KEY,
   g_name VARCHAR2(10) NOT NULL,
   price NUMBER(10) DEFAULT 1000,
   reg_date DATE
);


-- INSERT
INSERT INTO goods
-- 순서 상관 업음
	(id, G_NAME, PRICE,REG_DATE)
VALUES ( 1, '선풍기', '120000',sysdate);

	
-- UPDATE 
UPDATE GOODS
SET id = 4
WHERE id=6
;

SELECT * FROM GOODS;

-- SELECT 조회
SELECT ALL 
      CERTI_CD 
      ,CERTI_NM 
      , ISSUE_INSTI_NM
FROM TB_CERTI;

SELECT ALL -- ALL 생략되어있음
      CERTI_CD 
FROM TB_CERTI;

SELECT DISTINCT 
      ISSUE_INSTI_NM
FROM TB_CERTI;