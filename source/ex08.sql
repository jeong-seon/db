-- EMPLOYEES ���̺��� ����� ��
-- ��ȭ��ȣ�� 011 �� �����ϴ� ����鸸 ��ȸ�ؼ�
-- �ټ��� �� �������� �����ַ��� �Ѵ�.
-- 3�������� ǥ�õ� ������� ��ȸ�ϼ���.
-- �̸������� �����ؼ� �����ּ���.

SELECT
    *
FROM
    (
    SELECT
        ROWNUM rno, e.*
    FROM
        (
        SELECT
            *
        FROM
            employees
        WHERE
            PHONE_NUMBER LIKE '011%'
        ORDER BY
            FIRST_NAME
        ) e
    )
WHERE
    rno BETWEEN 11 AND 15
;