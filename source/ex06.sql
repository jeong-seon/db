-- DML (INSERT, UPDATE, DELETE)
/*
    문제 1 ]
        emp1 테이블에 다음 데이터를 입력하세요.
        이름 : 둘리
        직급 : 머슴
        급여 : 10
        입사일 : 현재시간
*/
INSERT INTO
    emp1(empno, ename, job, sal)
VALUES(
    1005, '둘리', '머슴', 10
);
/*
    문제 2 ]
        emp1 테이블에 다음 데이터를 입력하세요.
        이름 : 고길동
        직급 : 애완동물
        입사일 : 2022년 03월 21일
*/
ALTER TABLE emp1
MODIFY job VARCHAR2(10 CHAR);

DELETE
    
FROM
    emp1
WHERE
    ename = '고길동'
;

INSERT INTO
    emp1(empno, ename, job, hiredate)
VALUES(
    1006, '고길동', '애완동물', TO_DATE('2022년 03월 21일', 'YYYY"년 "MM"월 "DD"일"')
);
/*
    문제 3 ]
        emp1 테이블에 다음 데이터를 입력하세요.
        이름 : 희동이
        직급 : 대장
        급여 : NULL
        입사일 : 2022년 01월 01일
*/
DELETE
FROM
    emp1
WHERE
    ename = '희동이'
;

INSERT INTO
    emp1(empno, ename, job, hiredate)
VALUES(
    1007, '희동이', '대장', TO_DATE('2022년 01월 01일', 'YYYY"년 "MM"월 "DD"일"')
);
-- 데이터 수정
/*
    문제 4 ]
        emp1 테이블에서 다음 데이터를 수정하세요.
        제니, 로제, 리사, 지수
        사원의 이름을 이름앞에 'Miss.' 를 붙여서
        이름이 만들어지게 수정하세요.
        나머지 사원들은 이름앞에 'Mr.' 을 붙여서
        수정하세요.
*/
ALTER TABLE emp1
MODIFY ename VARCHAR2(10 CHAR);

UPDATE
    emp1
SET
    ename = DECODE(ename, '제니' , CONCAT('Ms.', ename),
                        '로제', CONCAT('Ms.', ename),
                        '리사', CONCAT('Ms.', ename),
                        '지수', CONCAT('Ms.', ename),
                        CONCAT('Mr.', ename))
;
/*
    문제 5 ]
        emp1 테이블에서
        입사년도가 81년인 사원만
        급여를 25% 인상하는데 10단위 이하는
        버림으로 처리하세요.
*/
UPDATE
    emp1
SET
    sal = TRUNC(sal * 1.25, -2)
WHERE
    TO_CHAR(hiredate, 'yy') = '81'
;
rollback;
-- 다른 테이블의 데이터 복사
/*
    문제 6 ]
        emp 테이블의 'SMITH' 사원의 데이터를 복사해서
        emp1 테이블에 입력하세요.
*/
INSERT INTO
    emp1
(
    SELECT
        *
    FROM
        emp
    WHERE
        ename = 'SMITH'
)
;
-- 데이터 삭제
/*
    문제 7 ]
        emp1 테이블에서 부서번호가 10번인 사원만 삭제하세요.
*/
DELETE
FROM
    emp1
WHERE
    deptno = 10
;
/*
    문제 8 ]
        emp1 테이블에서 이름이 'H' 로 끝나는 사원만 삭제하세요.
*/
DELETE
FROM
    emp1
WHERE
    ename LIKE '%H'
;