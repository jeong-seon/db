-- ��Ÿ�Լ��� ó��

/*
    ���� 1 ]
        �� ���޺��� �ѱ� ��������
        �������
            ����̸�, ����, �ѱ�����
        �� ��ȸ�ϼ���.
        
        MANAGER     : ������
        SALESMAN    : �������
        CLERK       : ����
        ...
*/
SELECT
    ename ����̸�, job ����,
    DECODE(job, 'MANAGER', '������',
                'SALESMAN', '�������',
                'CLERK', '����',
                'ANALYST', '�м���',
                        'ȸ��') �ѱ����� 
FROM
    emp
;
/*
    ���� 2 ]
        �� �μ����� �̹��� ���ʽ��� �ٸ��� �����Ϸ��� �Ѵ�.
            10�� �μ��� �޿��� 10%
            20�� �μ��� �޿��� 15%
            30�� �μ��� �޿��� 20%
        �� �����ϱ�� �ߴ�.
        �׸��� �ű⿡ ������ Ŀ�̼��� ���ؼ� �޿��� �����ϱ�� �ߴ�.
        Ŀ�̼��� ���� ����� Ŀ�̼��� 0 ���� �ؼ� ����ؼ�
        �������
            ����̸�, �μ���ȣ, �޿�, ���ޱ޿�
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, deptno �μ���ȣ, sal �޿�,
    DECODE(deptno, 10, sal * 1.1 + NVL(comm, 0),
                    20, sal * 1.15 + NVL(comm, 0),
                    30, sal * 1.2 + NVL(comm, 0)) ���ޱ޿�
FROM
    emp
;
/*
    ���� 3 ]
        �Ի�⵵�� �������� �ؼ�
            80�� 'A���'
            81�� 'B���'
            82�� 'C���'
            �� �̿��� �ؿ� �Ի��� ����� 'D���'
            ���� ��ȸ�ǵ���
            �������
                ����̸�, ����, �Ի���, ��� 
            �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, hiredate �Ի���,
    CASE WHEN hiredate < '81/01/01' THEN 'A���'
        WHEN hiredate < '82/01/01' THEN 'B���'
        WHEN hiredate < '83/01/01' THEN 'C���'
        ELSE 'D���'
    END ���
FROM
    emp
;

/*
    ���� 4 ]
        ����̸��� ���ڼ��� 4���ڸ� 'Mr.' �� �̸��տ� ���̰�
        4���ڰ� �ƴϸ� �ڿ� ' ��' ���� ��ȸ�ǵ���
        �������
            ����̸�, �̸����ڼ�, ��ȸ�̸�
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, LENGTH(ename) �̸����ڼ�,
    CASE WHEN LENGTH(ename) = 4 THEN 'Mr.' || ename
         ELSE ename || ' ��'
    END ��ȸ�̸�
FROM
    emp
;
/*
    ���� 5 ]
        �μ���ȣ�� 10 �Ǵ� 20���̸� �޿� + Ŀ�̼����� �����ϰ�
        �� �̿��� �μ��� �޿��� �����Ϸ��� �Ѵ�.
        �������
            ����̸�, ����, �μ���ȣ, �޿�, Ŀ�̼�, ���ޱ޿�
        �� ��ȸ�ϼ���.
        ��, Ŀ�̼��� ���� ���� 0���� ����ؼ� ����ϴ� ������ �Ѵ�.
*/
SELECT
    ename ����̸�, job ����, deptno �μ���ȣ, sal �޿�, comm Ŀ�̼�,
    CASE WHEN deptno IN(10, 20) THEN sal + NVL(comm, 0)
         ELSE sal
    END ���ޱ޿�
FROM
    emp
;
/*
    ���� 6 ]
        �Ի������ �����, �Ͽ��� �� �����
            �޿��� 20% ���ؼ� �����ϰ�
        �� �̿��� ���Ͽ� �Ի��� �����
            �޿��� 10% �� ���ؼ� �����Ϸ��� �Ѵ�.
        �������
            ����̸�, �޿�, �Ի���, �Ի����, ���ޱ޿�
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, sal �޿�, TO_CHAR(hiredate, 'YYYY/MM/DD') �Ի���, TO_CHAR(hiredate, 'DY') ����,
    DECODE(TO_CHAR(hiredate, 'DY'), '��', sal * 1.2,
                                    '��', sal * 1.2,
                                    sal * 1.1
    ) ���ޱ޿�
FROM
    emp
;


SELECT
    ename ����̸�, sal �޿�, hiredate �Ի���,
    NEXT_DAY(TO_DATE(hiredate), '��') ������Ի����,
    NEXT_DAY(TO_DATE(hiredate), '��') �Ͽ����Ի����,
    CASE WHEN hiredate = (NEXT_DAY(TO_DATE(hiredate), '��')) THEN sal * 1.2
         WHEN hiredate = (NEXT_DAY(TO_DATE(hiredate), '��')) THEN sal * 1.2
         ELSE sal * 1.1
    END ���ޱ޿�
FROM
    emp
;
/*
    ���� 7 ]
        �ٹ��������� 490������ �̻��� �����
            Ŀ�̼��� 500 �� �߰��ؼ� �����ϰ�
        �ٹ��������� 490���� �̸��� �����
            Ŀ�̼��� ���� Ŀ�̼Ǹ� �����ϵ��� �� �����̴�.
        �������
            ����̸�, Ŀ�̼�, �Ի���, �ٹ�������, ����Ŀ�̼�
        �� ��ȸ�ϼ���.
        ��, Ŀ�̼��� ���� ����� 0 ���� ����ϴ� ������ �Ѵ�.
*/
SELECT
    ename ����̸�, comm Ŀ�̼�, hiredate �Ի���,
    FLOOR(MONTHS_BETWEEN(sysdate, hiredate)) �ٹ�������,
    CASE WHEN FLOOR(MONTHS_BETWEEN(sysdate, hiredate)) >= 490 THEN NVL2(comm, comm + 500, 0)
         WHEN FLOOR(MONTHS_BETWEEN(sysdate, hiredate)) < 490 THEN NVL(comm, 0)
    END ����Ŀ�̼�
FROM
    emp
;
/*
    ���� 8 ]
        �̸� ���ڼ��� 5���� �̻��� ����� �̸���
            3����*** �� ǥ���ϰ�
        �̸� ���ڼ��� 4���� ������ ����� �״�� ����� �����̴�.
        �������
            ����̸�, �̸����ڼ�, ��ȸ�̸�
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, LENGTH(ename) �̸����ڼ�,
    CASE WHEN LENGTH(ename) >= 5 THEN RPAD(SUBSTR(ename, 1, 3), LENGTH(ename), '*')
         ELSE ename    
    END ��ȸ�̸�
FROM
    emp
;
------------------------------------------------------------------------------
-- GROUP BY

/*
    ���� 1 ]
        �� �μ����� �ּ� �޿��� ��ȸ�Ϸ��� �Ѵ�.
        ���μ���
            �μ���ȣ, �ּұ޿�
        �� ��ȸ�ϼ���.
*/
SELECT
    deptno �μ���ȣ, MIN(sal) �ּұ޿�
FROM
    emp
GROUP BY
    deptno
;
/*
    ���� 2 ]
        �� ���޺��� �޿��� �Ѿװ� ��ձ޿��� ���ް� �Բ� ��ȸ�ϼ���.
*/
SELECT
    job ����, SUM(sal) �޿��Ѿ�, FLOOR(AVG(sal)) ��ձ޿�
FROM
    emp
GROUP BY
    job
;
/*
    ���� 3 ]
        �Ի� �⵵���� ��� �޿��� �ѱ޿��� ��ȸ�ϼ���.
*/
SELECT
    CASE WHEN TO_CHAR(ROUND(hiredate, 'YEAR')) = '81/01/01' THEN '81�⵵'
         WHEN TO_CHAR(ROUND(hiredate, 'YEAR')) = '82/01/01' THEN '82�⵵'
         ELSE '87�⵵'
    END �Ի�⵵,
    FLOOR(AVG(sal)) ��ձ޿�, SUM(sal) �ѱ޿�
FROM
    emp
GROUP BY
    TO_CHAR(ROUND(hiredate, 'YEAR'))
;
/*
    ���� 4 ]
        �� �⵵���� �Ի��� ������� ��ȸ�ϼ���.
*/
SELECT
    CASE WHEN TO_CHAR(ROUND(hiredate, 'YEAR')) = '81/01/01' THEN '81�⵵'
         WHEN TO_CHAR(ROUND(hiredate, 'YEAR')) = '82/01/01' THEN '82�⵵'
         ELSE '87�⵵'
    END �Ի�⵵,
    COUNT(*) �����
FROM
    emp
GROUP BY
    TO_CHAR(ROUND(hiredate, 'YEAR'))
;
/*
    ���� 5 ]
        ��� �̸��� ���ڼ��� �������� �׷�ȭ�ؼ� ��ȸ�Ϸ��� �Ѵ�.
        ��� �̸��� ���ڼ��� 4, 5 ������ ����� ���� ��ȸ�ϼ���.
*/
SELECT
    LENGTH(ename) || '����' "�̸� ���ڼ�",
    COUNT(*) �����
FROM
    emp
GROUP BY
    LENGTH(ename)
HAVING
    LENGTH(ename) <= 5
;
/*
    ���� 6 ]
        81�⵵�� �Ի��� ����� ���� ���޺��� ��ȸ�ϼ���.
*/
SELECT
    CASE WHEN TO_CHAR(ROUND(hiredate, 'YEAR')) = '81/01/01' THEN '81�⵵'
         WHEN TO_CHAR(ROUND(hiredate, 'YEAR')) = '82/01/01' THEN '82�⵵'
         ELSE '87�⵵'
    END �Ի�⵵,
    job ����,
    COUNT(*) �����
FROM
    empnull
GROUP BY
    TO_CHAR(ROUND(hiredate, 'YEAR')), job
HAVING
    TO_CHAR(ROUND(hiredate, 'YEAR')) = '81/01/01'
;
/*
    ���� 7 ]
        ����̸��� ���ڼ��� 4, 5������ ����� ���� �μ����� ��ȸ�ϼ���.
        ��, ������� �ѻ�� ������ �μ��� ��ȸ���� �����ϼ���.
*/
SELECT
    deptno �μ���ȣ, LENGTH(ename) �̸����ڼ�, COUNT(*) �����
FROM
    emp
GROUP BY
    LENGTH(ename), deptno
HAVING
    LENGTH(ename) <= 5 AND COUNT(deptno) > 1
;
/*
    ���� 8 ]
        81�⵵ �Ի��� ����� ��ü �޿��� ���޺��� ��ȸ�ϼ���.
        ��, ���޺� ��� �޿��� 1000 �̸��� ������ ��ȸ���� �����ϼ���.
*/
SELECT
    job ����, SUM(sal) ��ü�޿�, FLOOR(AVG(sal)) ��ձ޿�
FROM
    emp
WHERE
    TO_CHAR(hiredate, 'yy') = '81'
GROUP BY
    job
HAVING
    AVG(sal) >= 1000
;

--SELECT job ����, AVG(sal) ��ձ޿� FROM emp GROUP BY job;
/*
    ���� 9 ]
        81�⵵ �Ի��� ����� �� �޿��� ����̸����ڼ� ���� �׷�ȭ�ϼ���.
        ��, �� �޿��� 2000 �̸��� ���� ��ȸ���� �����ϰ�
        �� �޿��� ���� �������� ���� ������� ��ȸ�ǰ� �ϼ���.
*/
SELECT
    LENGTH(ename) �̸����ڼ�, SUM(sal) �ѱ޿�
FROM
    emp
WHERE
    TO_CHAR(hiredate, 'yy') = '81'
GROUP BY
    LENGTH(ename)
HAVING
    SUM(sal) >= 2000
ORDER BY
    SUM(sal) DESC
;
/*
    ���� 10 ]
        ��� �̸� ���̰� 4, 5 ������ ����� �μ��� ������� ��ȸ�ϼ���.
        ��, ������� 0�� ���� ��ȸ���� �����ϰ�
        �μ���ȣ ������� ��ȸ�ϼ���.
*/
SELECT
    sal, hiredate, job
FROM
    emp;