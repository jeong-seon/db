/*
    ���� 1 ]
        ������ MANAGER �� �����
        ����̸�, ����, �Ի���, �޿�, �μ��̸��� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, TO_CHAR(hiredate, 'YYYY"�� "MM"�� "DD"��"') �Ի���, sal �޿�, dname �μ��̸�
FROM
    emp e, dept d
WHERE
    e.deptno = d.deptno
    AND e.job = 'MANAGER'
;
/*
    ���� 2 ]
        ����̸��� 5������ �������
        ����̸�, ����, �Ի���, �޿�, �޿������ ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, TO_CHAR(hiredate, 'YYYY"�� "MM"�� "DD"��"') �Ի���, sal �޿�, grade �޿����
FROM
    emp e, salgrade s
WHERE
    e.sal BETWEEN losal AND hisal
    AND LENGTH(ename) = 5
;
/*
    ���� 3 ]
        �Ի����� 81���̰�
        ������ MANAGER �� �������
        ����̸�, ����, �Ի���, �޿�, �޿����, �μ��̸�, �μ���ġ�� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, TO_CHAR(hiredate, 'YYYY"�� "MM"�� "DD"��"') �Ի���,
    sal �޿�, grade �޿����, dname �μ��̸�, loc �μ���ġ
FROM
    emp e, salgrade s, dept d
WHERE
    e.sal BETWEEN losal AND hisal
    AND e.deptno = d.deptno
    AND TO_CHAR(hiredate, 'yy') = '81' AND job = 'MANAGER'
;
/*
    ���� 4 ]
        �������
        ����̸�, ����, �޿�, �޿����, ����̸�
        �� ��ȸ�ϼ���.
        
        ���ʽ� ]
            ��簡 ���� ����� ����̸��� '������' ���� ��ȸ�ϼ���.
*/
SELECT
    e.ename ����̸�, e.job �������, e.sal ����޿�, grade �޿����, NVL(s.ename, '������') ����̸�
FROM
    emp e, salgrade, emp s
WHERE
    e.sal BETWEEN losal AND hisal AND
    e.mgr = s.empno(+) -- ����� ����ȣ�� ����� �����ȣ�� ����.
    
;
/*
    ���� 5 ]
        �������
        ����̸�, ����, �޿�, ����̸�, �μ��̸�, �޿������ ��ȸ�ϼ���.
*/
SELECT
    e1.ename ����̸�, e1.job �������, e1.sal ����޿�, NVL(e2.ename, '������') ����̸�, dname ����μ��̸�, grade ����޿����
FROM
    emp e1, salgrade, emp e2, dept d
WHERE
    e1.sal BETWEEN losal AND hisal AND
    e1.mgr = e2.empno(+) AND
    e1.deptno = d.deptno
;

------------------------------------------------------------------------------
-- �� �������� ANSI JOIN �� ����� ���Ǹ���� �ۼ��ϼ���.
/*
    ���� 1 ]
        ������ MANAGER �� �����
        ����̸�, ����, �Ի���, �޿�, �μ��̸��� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, TO_CHAR(hiredate, 'YYYY"�� "MM"�� "DD"��"') �Ի���, sal �޿�, dname �μ��̸�
FROM
    emp
JOIN
    dept
ON
    emp.deptno = dept.deptno
;
/*
    ���� 2 ]
        ����̸��� 5������ �������
        ����̸�, ����, �Ի���, �޿�, �޿������ ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, TO_CHAR(hiredate, 'YYYY"�� "MM"�� "DD"��"') �Ի���, sal �޿�, grade �޿����
FROM
    emp e
JOIN
    salgrade
ON
    e.sal BETWEEN losal AND hisal
    AND LENGTH(ename) = 5
;
/*
    ���� 3 ]
        �Ի����� 81���̰�
        ������ MANAGER �� �������
        ����̸�, ����, �Ի���, �޿�, �޿����, �μ��̸�, �μ���ġ�� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, TO_CHAR(hiredate, 'YYYY"�� "MM"�� "DD"��"') �Ի���,
    sal �޿�, grade �޿����, dname �μ��̸�, loc �μ���ġ
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
    ���� 4 ]
        �������
        ����̸�, ����, �޿�, �޿����, ����̸�
        �� ��ȸ�ϼ���.
        
        ���ʽ� ]
            ��簡 ���� ����� ����̸��� '������' ���� ��ȸ�ϼ���.
*/
SELECT
    e.ename ����̸�, e.job �������, e.sal ����޿�, grade �޿����, NVL(s.ename, '������') ����̸�
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
    ���� 5 ]
        �������
        ����̸�, ����, �޿�, ����̸�, �μ��̸�, �޿������ ��ȸ�ϼ���.
*/
SELECT
    e1.ename ����̸�, e1.job �������, e1.sal ����޿�, NVL(e2.ename, '������') ����̸�, dname ����μ��̸�, grade ����޿����
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