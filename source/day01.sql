/*
    자바 주석 처리 부분
    
    sqldeveloper 에서만 가능한 주석
    
    ------------------------------------------------------------------------
    질의명령
        질의 : 물어본다. 의미
        
        데이터베이스 관리시스템한테 해당 데이터가 어디있는지
        문의를 한다고 해서 질의명령이라고 한다.
        
    ------------------------------------------------------------------------
    
    SQL : Structured Qurey Language 의 약자
            구조화된 쿼리 언어
            
            이미 구조화 되어있는 명령어를 사용해서 데이터를 조작하는 언어
            프로그램이 불가능하다는 점이 특징이다.
    
        명령 종류 ]
            1. DML 명령
                - Database Manipulation Language (데이터 조작 언어)
                ==> 데이터를 추가, 수정, 삭제, 조회하는 작업을 하는 명령
                
                    데이터를 조작하는 방법
                          의미        명령
                    C   - CREATE    - INSERT
                    R   - READ      - SELECT
                    U   - UPDATE    - UPDATE
                    D   - DELETE    - DELETE
                    
            2. DDL 명령
                - Database Definition Language (데이터 정의 언어)
                ==> 개체를 만들고 수정하는 언어
                
                    CREATE      - 개체(테이블, 사용자, 함수, 인덱스, ...)
                                - 를 만들 때 사용하는 명령
                    ALTER       - 개체를 수정하는 명령
                    DROP        - 개체를 삭제하는 명령
                    TRUNCATE    - 테이블을 잘라내는 명령
            
            3. DCL 명령
                - Database Control Language(데이터 제어 언어)
                ==> 작업을 적용시킨다던지
                    (TCL 명령 : Transaction Control Language)
                    권한을 준다던지.
                    
                    COMMIT
                    ROLLBACK
                    
                    GRANT
                    REVOKE
    ------------------------------------------------------------------------
*/

-- 이것은 오라클 주석 ==> 어디서든지 사용할 수 있는 주석

select * from emp;

select
    empno, ename, job, mgr, hiredate, sal, comm, dname, loc
from
    emp e, dept d
where
    d,deptno = e.deptno;
    
/*
    참고 ]
        오라클의 명령은 명령을 구분하는 문자로 ; 을 사용한다.
        
        따라서 질의명령을 작성하는데 ;(세미콜론) 을 적지 않으면
        명령이 끝나지 않은 것으로 간주한다.
        
        하나의 명령이 종료되면 반드시 세미콜론(;) 을 적어줘야 한다.
*/

select * from emp;

----------------------------------------------------------------------------
/*
    테이블 구조를 조회해보는 명령
    형식 ]
        describe    테이블이름;
        desc        테이블이름;
*/

-- emp 테이블의 구조를 조회해보자.
describe emp;

desc emp;
/*
    오라클의 데이터 타입
    
        숫자
            NUMBER, NUMBER(숫자) ==> 사용 자릿수
            NUMBER(유효자릿수, 소수이하자릿수)
        문자
            CHAR
            ==> 고정 문자수 문자열데이터타입
            
                형식 ]
                    CHAR(숫자) ==> 바이트수만큼의 문자 기억
                    CHAR(숫자 CHAR) ==> 숫자갯수만큼의 문자 기억
            VARCHAR2
            ==> 가변 문자수 문자열데이터타입
                    VARCHAR2(숫자) ==> 숫자수만큼의 바이트만큼 문자 기억
                    VARCHAR2(숫자 CHAR) ==> 숫자갯수만큼의 문자를 기억
                    
            예 ]
                
                CHAR(10)
                ==> 'A' ==> 이 문자를 기억할 때 10바이트를 모두 사용한다.
                VARCHAR2(10)
                ==> 'A' ==> 1바이트로 문자를 기억
                
        날짜
            Date
                형식 ]
                    Date
*/
-----------------------------------------------------------------------------
/*
    SELCET
        컬럼이름들... 콤마(,) 로 구분해서 나열한다.
    FROM
        테이블이름들... 콤마(,)로 구분해서 나열
    WHERE
    
    [GROUP BY
    
    [HAVING
    
                ]]
            
    [ORDER BY
                ]
    ;
*/

-----------------------------------------------------------------------------
-- 부서정보 테이블의 정보를 조회하세요
SELECT
    deptno, dname, loc
FROM
    dept
;

-- 1 + 4 의 결과를 조회하세요.
select 1+4 from emp;

select '양동수' from emp;

/*
    문자열 데이터 표현 : '' 에 데이터 표현한다.
    오라클에서는 문자와 문자열을 구분하지 않는다.
    
    참고 ]
        오라클에서 테이블이름, 컬럼이름, 연산자, 명령어, 함수이름
        대소문자를 구분하지 않는다.
        
        하지만 주의 사항으로
        데이터자체는 반드시 대소문자를 구분해줘야 한다.
*/

-- 조건 검색
/*
    SELCET
        컬럼이름
    FROM
        테이블이름
    WHERE
        조건(결과값이 반드시 논리값이 되어야한다.)
        
    조건 ]
        비교연산자
        =   : 같다
        >   : 크다
        <   : 작다
        <=  : 작거나 같다
        >=  : 크거나 같다
        !=  : 다르다
        <>  : 다르다
        
        역시 오라클에서도 동시에 두개를 비교하는 것은 안된다.
            예 ]
                
                700 < SAL < 1200 ==> ( X )
                
    참고 ]
        오라클은 데이터의 형태를 매우 중요시한다.
        원칙적으로 문자는 문자끼리만 비교할 수 있고
        숫자는 숫자끼리만 비교할 수 있다.
        단,
            날짜는 문자처럼 비교할 수 있다.
            이 때, 날짜 데이터와 문자데이터를 비교하는 것이 아니고
            문자데이터를 날짜데이터로 변환한 후 비교하게 된다.
            
    참고 ]
        오라클은 문자도 크기비교가 가능하다.
        아스키코드값으로 비교를 하기 때문에...
        
    참고 ]
        오라클은 문자와 문자열의 구분이 없다.
        대신 문자열데이터의 대소문자는 반드시
        
    참고 ]
        조건을 비교하는 방법은 오라클이 한 줄을 출력할 때 마다
        그 행이 조건에 맞는지를 확인한 후
        조건이 맞으면 출력하게 된다.
        
    참고 ]
        조건절에 조건을 여러 개 나열하는 경우는
        AND 또는 OR 연산자를 이용해서 나열한다.
        
        이 때 조회시간은 처음 조건이 많이 걸러내는 조건일수록 짧아진다.
*/
-- 사원 이름이 'smith' 인 사원의 급여를 조회하세요.
SELECT sal FROM emp WHERE ename = 'smith';
-- 데이터 자체는 대소문자를 구분해줘야한다
------------------------------------------------------------------------------
-- 사원 중 직급이 MANAGER 이고 부서번호가 10번인 사원의 이름을 조회하세요.
SELECT ename FROM emp WHERE job = 'MANAGER' AND deptno = 10;
------------------------------------------------------------------------------
/*
    EMP 테이블
        
        EMPNO       : 사원번호
        ENAME       : 사원이름
        JOB         : 사원직급
        MGR         : 상사번호
        HIREDATE    : 입사일
        SAL         : 급여
        COMM        : 커미션
        DEPTNO      : 부서번호null
*/

/*
    1.
    사원 이름이 SMITH 인 사원의
        이름, 직급, 입사일을 조회하세요.
*/
SELECT ename, job, hiredate FROM emp WHERE ename = 'SMITH';
/*
    2.
    직급이 MANAGER 인 사원의
        이름, 직급, 급여
    를 조회하세요.
*/
SELECT ename, job, sal FROM emp WHERE job = 'MANAGER';
/*
    3.
    급여가 1500을 넘는 사원들의
        사원이름, 직급, 급여를
    조회하세요.
*/
SELECT ename, job, sal FROM emp WHERE sal > 1500;
/*
    4.
    이름이 'S' 이후의 문자로 시작하는 사원들의(S 포함)
        사원이름, 직급, 급여
    를 조회하세요.
*/
SELECT ename, job, sal FROM emp WHERE ename >= 'S' AND ename >= 'S*';

-- 입사일이 '81/08' 이전에 입사한 사원들의
-- 사원이름, 입사일, 급여를 조회하세요.
SELECT ename, hiredate, sal FROM emp WHERE hiredate < '81/08/01';

-- 부서번호가 10 번 또는 30번인 사원들의
-- 사원이름, 직급, 부서번호를 조회하세요.
SELECT ename, job, deptno FROM emp WHERE deptno IN (10, 30);

/*
    NOT 연산자
    ==> 조건식의 결과를 부정하는 연산자
    
        형식 ]
            WHERE
                NOT 조건식
*/
-- 부서번호가 10번이 아닌 사원들의 사원이름, 직급, 부서번호를 조회하세요.
SELECT ename, job, deptno FROM emp WHERE NOT deptno = 10;
-- WHERE --> NOT deptno = 10 == deptno != == deptno <>

-------------------------------------------------------------------------------
/*
    5.
        급여가 1000 ~ 3000 인 사람들의
        사원이름, 직급, 급여
        를 조회하세요.
*/
SELECT ename, job, sal FROM emp WHERE sal >= 1000 AND sal <= 3000;
/*
    6.
        직급이 MANAGER 이면서
        급여가 1000 이상인 사원들의
        사원이름, 직급, 입사일, 급여
        를 조회하세요.
*/
SELECT ename, job, hiredate, sal FROM emp WHERE job = 'MANAGER' AND sal >= 1000;

-------------------------------------------------------------------------------
/*
    특별한 조건 연산자
    
    1. BETWEEN ~ AND
    ==> 데이터가 특정 범위 안에 있는지를 확인하는 연산자
    
        형식 ]
            
            컬럼이름    BETWEEN     데이터1    AND     데이터2
            ==>
            컬럼의 내용이 데이터1 과 데이터2 사이에 있는지를 검사한다.
            주의 ]
                값이 작은 데이터가 데이터1 에 와야한다.
                
                부정을 할 경우는 between 앞에 not 을 붙여준다.
    2. IN
    ==> 데이터가 주어진 데이터들 중 하나인지를 검사하는 연산자
    
        형식 ]
            필드      IN(데이터1, 데이터2, ...)
            
    3. LIKE (문자열 비교 연산자)
    ==> 문자열을 처리하는 경우에만 사용하는 방법으로
        문자열의 일부분을 와일드카드 처리하여
        조건식을 제시하는 방법
        
        형식 ]
            필드  LIKE    '와일드카드'
            
        의미 ]
            데이터가 지정한 문자열 형식과 동일한지를 판단
            
        참고 ]
            와일드카드 사용법
            
                _   : 한 개당 한글자만을 와일드카드로 지정하는 것
                %   : 글자수에 관계없이 모든 문자를 포함하는 와일드카드
                문자를 쓰게되면 그 위치에 문자가 와야한다.
                
                
                예 ]
                    'M%'  - M 으로 시작하는 모든 문자열
                    'M__' - M 으로 시작하는 세문자로 이루어진 문자열
                    '%M%' - M 을 포함하는 모든 문자열
                    '%M'  - M 으로 끝나는 문자열
                    
*/

/*
    예 ]
        급여가 1000 ~ 3000 인 사원들의 사원이름, 급여를 조회하세요.
        
*/
SELECT ename, sal FROM emp WHERE sal BETWEEN 1000 AND 3000;

-- 부서번호가 10, 30 번인 사원들의 사원이름, 직급, 부서번호를 조회하세요.
SELECT ename, job, deptno FROM emp WHERE deptno IN(10, 30);
SELECT ename, job, deptno FROM emp WHERE deptno NOT IN(10, 30);

/*
    직급이 MANAGER, SALESMAN 이 아닌 사원들의
    사원이름, 직급, 급여를 조회하세요.
*/
SELECT ename, job, sal FROM emp WHERE NOT job IN('MANAGER', 'SALESMAN');

/*
    이름이 다섯글자인 사원들의
    사원이름, 직급을 조회하세요.
*/
SELECT ename, job FROM emp WHERE ename LIKE '_____';

-- 입사일이 1월인 사원들의 사원이름, 입사일을 조회하세요.
SELECT ename, hiredate FROM emp WHERE hiredate LIKE '__/01/__';


/*
    참고 ]
        조회되는 컬럼에 별칭을 부여해서 조회할 수 있다.
        
        형식 ]
            
            컬럼이름    별칭
            
            컬럼이름    AS      별칭
            
            컬럼이름    "별 칭"
            
            컬럼이름    AS  "별 칭"
            
            참고 ]
                별칭 중간에 공백이 있을 경우에만
                "" 로 감싸준다.
*/
-------------------------------------------------------------------------------
/*
    문제 1 ]
        부서번호가 10번인 사원들의
            이름, 직급, 입사일, 부서번호
        를 조회하세요
*/
SELECT ename 사원이름, job 직급, hiredate 입사일, deptno 부서번호
FROM emp
WHERE deptno = 10;
/*
    문제 2 ]
        직급이 'SALESMAN' 인 사원들의
        사원이름, 직급, 급여
        를 조회하세요.
        단, 필드이름은 제시한 이름으로 조회되게 하세요.
*/
SELECT ename 사원이름, job 직급, sal 급여
FROM emp
WHERE job = 'SALESMAN';
/*
    문제 3 ]
        급여가 1000 보다 적은 사원들의
        이름, 직급, 급여를 조회하세요.
        
*/
SELECT ename 사원이름, job 직급, sal 급여
FROM emp
WHERE sal < 1000;
/*
    문제 4 ]
        사원이름이 'M' 이전의 문자로 시작하는 사원들의
        사원이름, 직급, 급여를 조회하세요.
        ('M' 이라는 사원은 조회안되게)
*/
SELECT ename 사원이름, job 직급, sal 급여
FROM emp
WHERE ename LIKE '%M%' AND ename NOT LIKE 'M%';
/*
    문제 5 ]
        입사일이 1981년 9월 8일에 입사한 사원의
        사원이름, 직급, 입사일을 조회하세요.
*/
SELECT ename 사원이름, job 직급, hiredate 입사일
FROM emp
WHERE hiredate = '81/09/08';
/*
    문제 6 ]
        사원이름이 'M' 이후 문자로 시작하는 사원중
        급여가 1000 이상인 사원의
        사원이름, 급여, 직급을 조회하세요.
*/
SELECT ename 사원이름, sal 급여, job 직급
FROM emp
WHERE ename LIKE 'M%' AND sal >= 1000;
/*
    문제 7 ]
        직급이 'MANAGER' 이고 급여가 1000 보다 크고
        부서번호가 10번인 사원의
        사원이름, 직급, 급여, 부서번호를 조회하세요.
*/
SELECT ename 사원이름, job 직급, sal 급여, deptno 부서번호
FROM emp
WHERE job = 'MANAGER' AND sal > 1000 AND deptno = 10;
/*
    문제 8 ]
        직급이 'MANAGER' 인 사원을 제외한 사원들의
        사원이름, 직급, 입사일을 조회하세요.
        단, NOT 연산자를 사용하세요.
*/
SELECT ename 사원이름, job 직급, hiredate 입사일
FROM emp
WHERE NOT job = 'MANAGER';
/*
    문제 9 ]
        사원이름이 'C' 로 시작하는 것보다 크고
        'M' 으로 시작하는 것보다 작은 사원만
        사원이름, 직급, 급여를 조회하세요.
        ('C' 와 'M' 으로 시작하는 사람도 포함)
        단, BETWEEN 연산자를 사용하세요.
*/
SELECT ename 사원이름, job 직급, sal 급여
FROM emp
WHERE ename BETWEEN 'C%' AND 'M%';
/*
    문제 10 ]
        급여가 800, 950 이 아닌 사원들의
        사원이름, 직급, 급여를 조회하세요.
        단, IN 연산자를 사용하세요.
*/
SELECT ename 사원이름, job 직급, sal 급여
FROM emp
WHERE NOT sal IN(800, 950);
/*
    문제 11 ]
        사원이름이 'S' 로 시작하고 다섯글자인 사원의
        사원이름, 직급, 급여를 조회하세요.
*/
SELECT ename 사원이름, job 직급, sal 급여
FROM emp
WHERE ename LIKE 'S____';
/*
    문제 12 ]
        입사일이 3일인 사원들의
        사원이름, 직급, 입사일을 조회하세요.
*/
SELECT ename 사원이름, job 직급, hiredate 입사일
FROM emp
WHERE hiredate LIKE '__/__/03';
/*
    문제 13 ]
        사원이름의 글자수가 4글자이거나 5글자인 사원들의
        사원이름, 직급을 조회하세요.
*/
SELECT ename 사원이름, job 직급
FROM emp
WHERE ename LIKE '____' OR ename LIKE '_____';
/*
    문제 14 ]
        입사년도가 81년도 이거나 82년도인 사원들의
        사원이름, 급여, 입사일을 조회하세요.
*/
SELECT ename 사원이름, sal 급여, hiredate 입사일
FROM emp
WHERE hiredate LIKE '81%' OR hiredate LIKE '82%';
/*
    문제 15 ]
        사원이름이 'S' 로 끝나는 사원의
        사원이름, 급여, 커미션을 조회하세요.
*/
SELECT ename 사원이름, sal 급여, comm 커미션
FROM emp
WHERE ename LIKE '%S';

-- 이렇게도 가능
SELECT ename || ' 님' 사원이름, sal 이전급여, (sal * 2) 인상급여 FROM emp;

------------------------------------------------------------------------------
/*
    데이터 결합 연산자
        형식 ]
            
            데이터1 || 데이터2
*/

SELECT 10 || 20 FROM dual;

-- 사원들 이름에 Mr. 을 붙여서 조회하세요.
SELECT 'Mr.' || ename 사원이름, sal || ' 달러' 급여, hiredate 입사일
FROM emp;

SELECT ename 사원이름, sal "원 급여", (sal + 1000) "보너스 적용 급여", 
        (sal * 1.5) 인상급여, sal * 12 연봉
FROM emp;