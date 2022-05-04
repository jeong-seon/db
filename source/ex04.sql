/*
    문제 1 ]
        직급이 MANAGER 인 사원의
        사원이름, 직급, 입사일, 급여, 부서이름을 조회하세요.
*/
SELECT
    ename 사원이름, job 직급, TO_CHAR(hiredate, 'YYYY"년 "MM"월 "DD"일"') 입사일, sal 급여, dname 부서이름
FROM
    emp e, dept d
WHERE
    e.deptno = d.deptno
    AND e.job = 'MANAGER'
;
/*
    문제 2 ]
        사원이름이 5글자인 사원들의
        사원이름, 직급, 입사일, 급여, 급여등급을 조회하세요.
*/
SELECT
    ename 사원이름, job 직급, TO_CHAR(hiredate, 'YYYY"년 "MM"월 "DD"일"') 입사일, sal 급여, grade 급여등급
FROM
    emp e, salgrade s
WHERE
    e.sal BETWEEN losal AND hisal
    AND LENGTH(ename) = 5
;
/*
    문제 3 ]
        입사일이 81년이고
        직급이 MANAGER 인 사원들의
        사원이름, 직급, 입사일, 급여, 급여등급, 부서이름, 부서위치를 조회하세요.
*/
SELECT
    ename 사원이름, job 직급, TO_CHAR(hiredate, 'YYYY"년 "MM"월 "DD"일"') 입사일,
    sal 급여, grade 급여등급, dname 부서이름, loc 부서위치
FROM
    emp e, salgrade s, dept d
WHERE
    e.sal BETWEEN losal AND hisal
    AND e.deptno = d.deptno
    AND TO_CHAR(hiredate, 'yy') = '81' AND job = 'MANAGER'
;
/*
    문제 4 ]
        사원들의
        사원이름, 직급, 급여, 급여등급, 상사이름
        을 조회하세요.
        
        보너스 ]
            상사가 없는 사원은 상사이름을 '상사없음' 으로 조회하세요.
*/
SELECT
    e.ename 사원이름, e.job 사원직급, e.sal 사원급여, grade 급여등급, NVL(s.ename, '상사없음') 상사이름
FROM
    emp e, salgrade, emp s
WHERE
    e.sal BETWEEN losal AND hisal AND
    e.mgr = s.empno(+) -- 사원의 상사번호는 상사의 사원번호와 같다.
    
;
/*
    문제 5 ]
        사원들의
        사원이름, 직급, 급여, 상사이름, 부서이름, 급여등급을 조회하세요.
*/
SELECT
    e1.ename 사원이름, e1.job 사원직급, e1.sal 사원급여, NVL(e2.ename, '상사없음') 상사이름, dname 사원부서이름, grade 사원급여등급
FROM
    emp e1, salgrade, emp e2, dept d
WHERE
    e1.sal BETWEEN losal AND hisal AND
    e1.mgr = e2.empno(+) AND
    e1.deptno = d.deptno
;

------------------------------------------------------------------------------
-- 위 문제들을 ANSI JOIN 을 사용한 질의명령을 작성하세요.
/*
    문제 1 ]
        직급이 MANAGER 인 사원의
        사원이름, 직급, 입사일, 급여, 부서이름을 조회하세요.
*/
SELECT
    ename 사원이름, job 직급, TO_CHAR(hiredate, 'YYYY"년 "MM"월 "DD"일"') 입사일, sal 급여, dname 부서이름
FROM
    emp
JOIN
    dept
ON
    emp.deptno = dept.deptno
;
/*
    문제 2 ]
        사원이름이 5글자인 사원들의
        사원이름, 직급, 입사일, 급여, 급여등급을 조회하세요.
*/
SELECT
    ename 사원이름, job 직급, TO_CHAR(hiredate, 'YYYY"년 "MM"월 "DD"일"') 입사일, sal 급여, grade 급여등급
FROM
    emp e
JOIN
    salgrade
ON
    e.sal BETWEEN losal AND hisal
    AND LENGTH(ename) = 5
;
/*
    문제 3 ]
        입사일이 81년이고
        직급이 MANAGER 인 사원들의
        사원이름, 직급, 입사일, 급여, 급여등급, 부서이름, 부서위치를 조회하세요.
*/
SELECT
    ename 사원이름, job 직급, TO_CHAR(hiredate, 'YYYY"년 "MM"월 "DD"일"') 입사일,
    sal 급여, grade 급여등급, dname 부서이름, loc 부서위치
FROM
    emp e
JOIN
    salgrade
ON
    e.sal BETWEEN losal AND hisal
JOIN
    dept d
ON
    e.deptno = d.deptno
WHERE
    TO_CHAR(hiredate, 'yy') = '81' AND job = 'MANAGER'
;
/*
    문제 4 ]
        사원들의
        사원이름, 직급, 급여, 급여등급, 상사이름
        을 조회하세요.
        
        보너스 ]
            상사가 없는 사원은 상사이름을 '상사없음' 으로 조회하세요.
*/
SELECT
    e.ename 사원이름, e.job 사원직급, e.sal 사원급여, grade 급여등급, NVL(s.ename, '상사없음') 상사이름
FROM
    emp e LEFT OUTER JOIN emp s
ON
    e.mgr = s.empno
JOIN
    salgrade
ON
    e.sal BETWEEN losal AND hisal
;
/*
    문제 5 ]
        사원들의
        사원이름, 직급, 급여, 상사이름, 부서이름, 급여등급을 조회하세요.
*/
SELECT
    e1.ename 사원이름, e1.job 사원직급, e1.sal 사원급여, NVL(e2.ename, '상사없음') 상사이름, dname 사원부서이름, grade 사원급여등급
FROM
    emp e1
JOIN
    salgrade
ON
    e1.sal BETWEEN losal AND hisal
LEFT OUTER JOIN
    emp e2
ON
    e1.mgr = e2.empno
JOIN
    dept d
ON
    e1.deptno = d.deptno
;