-- test02 �������� �����ؼ� �۾�

ALTER TABLE test02 RENAME TO test01;

CREATE OR REPLACE VIEW showno
AS
    SELECT
        no
    FROM
        test01
;

GRANT CREATE VIEW TO test01;

GRANT SELECT ANY TABLE TO test01;

REVOKE CREATE VIEW FROM test01;


SELECT
    *
FROM
    scott.emp
WHERE
    deptno = 10
;

SELECT
    *
FROM
    jennie.member
;

-- test01 ���� ������ �� �� �ִ� ���ѱ��� �����ؼ� scott.emp ��ȸ�ϴ� ������ �ּ���.
GRANT SELECT ON scott.emp TO test01 WITH GRANT OPTION;



