-- DML (INSERT, UPDATE, DELETE)
/*
    ���� 1 ]
        emp1 ���̺� ���� �����͸� �Է��ϼ���.
        �̸� : �Ѹ�
        ���� : �ӽ�
        �޿� : 10
        �Ի��� : ����ð�
*/
INSERT INTO
    emp1(empno, ename, job, sal)
VALUES(
    1005, '�Ѹ�', '�ӽ�', 10
);
/*
    ���� 2 ]
        emp1 ���̺� ���� �����͸� �Է��ϼ���.
        �̸� : ��浿
        ���� : �ֿϵ���
        �Ի��� : 2022�� 03�� 21��
*/
ALTER TABLE emp1
MODIFY job VARCHAR2(10 CHAR);

DELETE
    
FROM
    emp1
WHERE
    ename = '��浿'
;

INSERT INTO
    emp1(empno, ename, job, hiredate)
VALUES(
    1006, '��浿', '�ֿϵ���', TO_DATE('2022�� 03�� 21��', 'YYYY"�� "MM"�� "DD"��"')
);
/*
    ���� 3 ]
        emp1 ���̺� ���� �����͸� �Է��ϼ���.
        �̸� : ����
        ���� : ����
        �޿� : NULL
        �Ի��� : 2022�� 01�� 01��
*/
DELETE
FROM
    emp1
WHERE
    ename = '����'
;

INSERT INTO
    emp1(empno, ename, job, hiredate)
VALUES(
    1007, '����', '����', TO_DATE('2022�� 01�� 01��', 'YYYY"�� "MM"�� "DD"��"')
);
-- ������ ����
/*
    ���� 4 ]
        emp1 ���̺��� ���� �����͸� �����ϼ���.
        ����, ����, ����, ����
        ����� �̸��� �̸��տ� 'Miss.' �� �ٿ���
        �̸��� ��������� �����ϼ���.
        ������ ������� �̸��տ� 'Mr.' �� �ٿ���
        �����ϼ���.
*/
ALTER TABLE emp1
MODIFY ename VARCHAR2(10 CHAR);

UPDATE
    emp1
SET
    ename = DECODE(ename, '����' , CONCAT('Ms.', ename),
                        '����', CONCAT('Ms.', ename),
                        '����', CONCAT('Ms.', ename),
                        '����', CONCAT('Ms.', ename),
                        CONCAT('Mr.', ename))
;
/*
    ���� 5 ]
        emp1 ���̺���
        �Ի�⵵�� 81���� �����
        �޿��� 25% �λ��ϴµ� 10���� ���ϴ�
        �������� ó���ϼ���.
*/
UPDATE
    emp1
SET
    sal = TRUNC(sal * 1.25, -2)
WHERE
    TO_CHAR(hiredate, 'yy') = '81'
;
rollback;
-- �ٸ� ���̺��� ������ ����
/*
    ���� 6 ]
        emp ���̺��� 'SMITH' ����� �����͸� �����ؼ�
        emp1 ���̺� �Է��ϼ���.
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
-- ������ ����
/*
    ���� 7 ]
        emp1 ���̺��� �μ���ȣ�� 10���� ����� �����ϼ���.
*/
DELETE
FROM
    emp1
WHERE
    deptno = 10
;
/*
    ���� 8 ]
        emp1 ���̺��� �̸��� 'H' �� ������ ����� �����ϼ���.
*/
DELETE
FROM
    emp1
WHERE
    ename LIKE '%H'
;