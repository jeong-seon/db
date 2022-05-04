/*
    ���� 1 ]
        �̸��� SMITH �� ����� ������ ������ ���� ������� ������ ����ϼ���.
*/
SELECT
    *
FROM
    emp
WHERE
    job = (
                SELECT
                    job
                FROM
                    emp
                WHERE
                    ename = 'SMITH'
            )
;

/*
    ���� 2 ]
        ȸ�� ��� �޿����� �޿��� ���� �޴� �������
        ����̸�, ����, �޿�[, ȸ����ձ޿�]
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, sal �޿�,
    (
    SELECT
        ROUND(AVG(sal), 2)
    FROM
        emp
    ) ȸ����ձ޿�
FROM
    emp e
WHERE
    sal < ALL (
            SELECT
                AVG(sal)
            FROM
                emp
            GROUP BY
                e.ename
        )
;
/*
    ���� 3 ]
        ������� �޿��� ���� ���� �����
        ����̸�, ����, �޿�[, �ְ�޿�]
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, sal �޿�,
    (
    SELECT
        MAX(sal)
    FROM
        emp
    ) �ְ�޿�
FROM
    emp
WHERE
    sal >= ALL (
            SELECT
                MAX(sal)
            FROM
                emp
            GROUP BY
                sal
        )
;
/*
    ���� 4 ]
        KING ������� ���Ŀ� �Ի��� �������
        ����̸�, ����, �Ի���[, KING ����Ի���]
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, hiredate �Ի���,
    (
    SELECT
        hiredate
    FROM
        emp
    WHERE
        ename = 'KING'
    ) "KING ����Ի���"
FROM
    emp
WHERE
    hiredate > ALL (
            SELECT
                hiredate
            FROM
                emp
            WHERE
                ename = 'KING'
            )
;
/*
    ���� 5 ]
        �� ����� �޿��� ȸ����ձ޿��� ���� ����ϼ���.
        ��ȸ������
            ����̸�, �޿�, �޿��� ��, ȸ����ձ޿�
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, sal �޿�,
    (
    SELECT
        e.sal - ROUND(AVG(sal), 2)
    FROM
        emp
    ) �޿���,
    (
    SELECT
        ROUND(AVG(sal), 2)
    FROM
        emp
    ) ȸ����ձ޿�
FROM
    emp e
;

/*
    ���� 6 ]
        �μ��� �޿��� ���� ���� ���� �μ� �������
        ����̸�, ����, �μ���ȣ, �μ��̸�, �μ��޿��հ�, �μ�����
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, deptno �μ���ȣ,
    (
    SELECT
        dname
    FROM
        dept
    WHERE
        deptno = e.deptno
    ) �μ��̸�,
    sum �μ��޿��հ�, cnt �μ�����
FROM
    emp e,
    (
        SELECT
            deptno dno, COUNT(*) cnt, SUM(sal) sum
        FROM
            emp
        GROUP BY
            deptno
    )
WHERE
    deptno = dno AND
    sum = ALL (
                SELECT
                    MAX(SUM(sal))
                FROM
                    emp
                GROUP BY
                    deptno
                )
;
/*
    ���� 7 ]
        Ŀ�̼��� �޴� ����� �Ѹ��̶� �ִ� �μ��� �������
        ����̸�, ����, �μ���ȣ, Ŀ�̼�
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, deptno �μ���ȣ, comm Ŀ�̼�
FROM
    emp
WHERE
    comm IS NOT NULL
;
/*
    ���� 8 ]
        ȸ�� ��ձ޿����� ����
        �̸��� 4, 5������ �������
        ����̸�, �޿�, �̸����ڱ���[, ȸ����ձ޿�]
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, sal �޿�, LENGTH(ename) �̸����ڱ���,
    (
    SELECT
        ROUND(AVG(sal), 2)
    FROM
        emp
    ) ȸ����ձ޿�
FROM
    emp e,
    (
        SELECT
            AVG(sal) avg
        FROM
            emp
    )
WHERE
    LENGTH(ename) BETWEEN 4 AND 5 AND
    e.sal >= ALL (
                SELECT
                    AVG(sal)
                FROM
                    emp
                GROUP BY
                    e.ename
                )
;
/*
    ���� 9 ]
        ����̸��� ���ڼ��� 4������ ����� ���� ������ ���� �������
        ����̸�, ����, �޿�
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, sal �޿�
FROM
    emp
WHERE
    job IN (
        SELECT
            job
        FROM
            emp
        WHERE
            LENGTH(ename) = 4
        )
;
/*
    ���� 10 ]
        �Ի�⵵�� 81���� �ƴ� ����� ���� �μ��� �ִ� �������
        ����̸�, ����, �޿�, �Ի���, �μ���ȣ
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, sal �޿�, hiredate �Ի���, deptno �μ���ȣ
FROM
    emp
WHERE
    deptno IN (
            SELECT
                deptno
            FROM
                emp
            WHERE
                NOT TO_CHAR(hiredate, 'yy') = '81'
            )
;
/*
    ���� 11 ]
        ���޺� ��ձ޿����� �� �����̶� �޿��� ���� �޴� �����
        ����̸�, ����, �޿�, �Ի���
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, sal �޿�, hiredate �Ի���
FROM
    emp
WHERE
    sal > ANY (
            SELECT
                AVG(sal)
            FROM
                emp
            GROUP BY
                job
            )
;
/*
    ���� 12 ]
        ��� �⵵�� �Ի����� ��� �޿����� ���� �޴� �������
        ����̸�, ����, �޿�, �Ի�⵵
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, sal �޿�, hiredate �Ի�⵵
FROM
    emp
WHERE
    sal > ANY (
            SELECT
                AVG(sal)
            FROM
                emp
            GROUP BY
                TO_CHAR(hiredate, 'yy')
            )
;
/*
    ���� 13 ]
        �ְ�޿����� �̸� ���ڼ��� ���� ���ڼ��� ������ �����ϸ�
        ��� ����� ����̸�, �̸����ڼ�, ����, �޿��� ��ȸ�ϰ�
        �������� ������ ������� ������.
*/
SELECT
    ename ����̸�, LENGTH(ename) �̸����ڼ�, job ����, sal �޿�
FROM
    emp,
    (
    SELECT
        LENGTH(ename) len, MAX(sal) max
    FROM
        emp
    GROUP BY
        LENGTH(ename)
    )
WHERE
    len = 4 AND
    max >= ALL (
                SELECT
                    MAX(sal)
                FROM
                    emp
                GROUP BY
                    LENGTH(ename)
                )
;