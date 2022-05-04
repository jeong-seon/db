-- day 09

-- system �������� �����ؼ� �ۼ��ϰ� ����
begin dbms_xdb.sethttpport('9090');
end;
/

/*
    ����� ���� : ������ �������� ������ �����ϴ� ���
    
        �����̶�
        ==> ������ ����� ���� �����̴�.
            �ϳ��� ������ �ѻ���� ����� �� �ֵ���
            ������ �ѻ���� ����� �� �ִ� ���� ���� ������ �����ͺ��̽��̴�.
            
        1. ����� ����� (��������)
            1) ������ ���� ������ �Ѵ�.
                
                sqlplus / as sysdba
                ==> �� ����� �������� ������ �Ǹ� ������ ��������
                    ����Ŭ�� ������ ���°� �ȴ�.
                    
            2) ����� �����
            
                ���� ]
                    
                    CREATE USER �����̸� IDENTIFIED BY ��й�ȣ [ACCOUNT UNLOCK];
                    
                    ==> ACCOUNT UNLOCK : ������ ��ݻ��¸� �����ϴ� �ɼ�
                    
                �� ]
                
                    CREATE USER test01 IDENTIFIED BY 12345 ACCOUNT UNLOCK;                    
                    ==> test01 �̶�� ������ ��й�ȣ�� 12345 �� �ؼ� �����
                        �ٷ� ��밡���ϵ��� ����ڴ�.
                    
                        
        ���� ]
            ���� ���� ������ � �������� �˾ƺ��� ���
            
                SHOW USER;
                
        ���� ]
            ������ ����� �Ǹ� ���� �� ������ �ƹ��� ���ѵ� ���� ���߱� ������
            � �۾��� �� �� ���� ���·� ���������.
        
        
        2. ���� �ֱ�
            ���� ]
                DCL ���
                    Ʈ����� ó�� ���
                        commit
                        rollback
                        savepoint
                        
                    ���� ���� ���
                        GRANT
                        REVOKE
                    
        ���� ]
            GRANT   �����̸�1, �����̸�2, ... TO �����̸�;
                
            ���� ]
                SESSION �̶�?
                ==> ���� ���ؼ� ����Ŭ���� ������ �ǹ��Ѵ�.
                    ����Ŭ�� �����ϸ� ����Ŭ�� �����ϴ� �Ǹ��� ���ϸ�
                    ����Ŭ�� ���ݿ� ���� �����Ǵ� ������ �޶�����.
                
        2) ��Ÿ ������ ������ ������ ���Ŀ� ���ؼ� �ʿ��� ������ �ο��ϸ� �ȴ�.

            �� ]
                ���̺��� ���� �� �ִ� ������ test01 ���� �ο��ϰ��� �Ѵٸ�
                
                GRANT UNLIMITED TABLESPACE, CREATE TABLE TO test01;
*/

/*
    ���� 1 ]
        test02 ������ 67890 �̶�� ��й�ȣ�� ���弼��.
*/
CREATE USER test02 IDENTIFIED BY 67890 ACCOUNT UNLOCK;

-- test02 ������ ���̺��� ���� �� �ִ� ����, ������ �� �ִ� ������ �ο��ϼ���.
GRANT UNLIMITED TABLESPACE, CREATE TABLE, CREATE SESSION TO test02;

------------------------------------------------------------------------------
/*
    ���� ]
        ������ �ο��� �� ���Ǵ� �ɼ�
            
            WITH ADMIN OPTION
            ==> ������ ������ ���ӹ��� �� �ֵ��� �ϴ� �ɼ�
                �ο��ϴ� ���ѿ� ���ؼ��� ������ ������ �ο��ϴ� �ɼ�
*/

-- test02 �������� �並 ���� �� �ִ� ������ ������ ���ѱ��� �����ؼ� �ο��ϼ���
GRANT CREATE VIEW TO test02 WITH ADMIN OPTION;

------------------------------------------------------------------------------
/*
    3. �ٸ� ������ ���̺� ����ϱ�
        ==> ��Ģ������ �ϳ��� ������ �� ���� ���� ���̺� ����� �� �ִ�.
            
            ������, ���� �������� �ٸ� ������ ���̺��� �������� ����� �� �ִ�.
            �̷��� �Ϸ��� �׿����� ������ ��������� �Ѵ�.
            
            �ٸ� ���� ���̺��� ��ȸ�� �� �ִ� ������ �ο��ϴ� ���
            
            GRANT SELECT ON ����.���̺��̸� TO ���ѹ�������;
            
*/

-- scott ������ emp ���̺��� ��ȸ�� �� �ִ� ������ test02 �������� �ο��ϼ���.
GRANT SELECT ON scott.emp TO test02 WITH GRANT OPTION;

-- test02 �������� ��� ������ ���̺��� ��ȸ�� �� �ִ� ������ �ο��ϼ���.
GRANT SELECT ANY TABLE TO test02;

------------------------------------------------------------------------------
/*
    4. �����ڿ��� �ο����� ������ �ٸ� �������� �����ϱ�
        
        GRANT �����̸� TO ���� WITH GRANT OPTION;
*/

CREATE USER test03 IDENTIFIED BY 12345 ACCOUNT UNLOCK;

GRANT CREATE SESSION, UNLIMITED TABLESPACE TO test03;

------------------------------------------------------------------------------
/*
    5. ����� ���� ����
        ��� ]
            GRANT ����� ����ؼ� �ش� �������� ������ �ο��ϸ� �ȴ�.
            
    6. ���� ȸ���ϱ�
        ���� ]
            REVOKE �����̸� FROM �����̸�;
            
    7. ���� �����ϱ�
    
        ���� ]
            DROP USER �����̸� CASCADE;
*/

-- test01, test02, test03 ������ �����ϼ���.
DROP USER test01 CASCADE;
DROP USER test02 CASCADE;
DROP USER test03 CASCADE;

------------------------------------------------------------------------------
/*
    ��(ROLE)�� �̿��� ���� �ο�
    ==> ���� �ο��� �����ڰ� ������ �������� �ʿ��� ������
        �ϳ��� �����ؼ� �ִ� ������� ó���Ѵ�.
        
        ��(ROLE) �̶�
        ==> ���õ� ������ ������� ��ü(���ѵ��� ��Ʈ)�� �ǹ��ϴ� ���
        
        ���� ���� ����� ���Ѻο���
        �������� ������ ���ÿ� �ο��ϴ� ����̴�.
        
        ��� ]
            1. �̹� ������� ���� �̿��ϴ� ���
                �̹� ������� ���� ����
                
                    1) CONNECT
                        ==> �ַ� CREATE �� ���õ� ������ ������� ��
                        
                    2) RESOURCE
                        ==> ����� ��ü ������ ���õ� ������ ������� ��
                        
                    3) DBA
                        ==> ������ �������� ó���� �� �ִ�
                            ������ ������ ������� ��
                            
                ������ �ִ� ���
                    
                    GRANT ���̸� TO �����̸�;
                    
            2. ���� ���� ���� �ο��ϴ� ���
                ==> �� �ȿ� �� �ѿ� �ʿ��� ������ ����ڰ� �����ؼ� ���� ��
                    �ο��ϴ� ���
                
                ***
                ���� ����� ���
                
                    1. ���� �����
                        CREATE ROLE ���̸�;
                    2. �ѿ� ������ �ο��ϰ�
                        GRANT �����̸�, �����̸�, ... TO ���̸�;
                    3. ������� ���� �������� �ο��Ѵ�.
                        GRANT ���̸� TO �����̸�;
                        
    �ο��� ���� ȸ���ϴ� ���
    ==> ���� �̿��ؼ� �ο��� ������ ȸ���ϴ� ���
    
        ���� ]
            REVOKE ���̸� FROM �����̸�;
            
    ���� �����ϴ� ���
    
        ���� ]
            DROP ROLE ���̸�;
*/

------------------------------------------------------------------------------
-- 1. test01/12345 ������ ���弼��.
CREATE USER test01 IDENTIFIED BY 12345 ACCOUNT UNLOCK;
-- 2. ���̺����̽��� ���õ� ���Ѱ� ������ ����� �ִ� ����,
--      connect, resource �� ������ ������ USERROLE01 �� �����
--      �� ���� �̿��ؼ� test01 ���� ������ �ο��ϼ���.

-- 1) ���� �����
CREATE ROLE USERROLE01;

-- 2) �ѿ� ���� �ο�
GRANT CREATE SESSION, UNLIMITED TABLESPACE, CONNECT, RESOURCE TO USERROLE01;

-- 3) �������� �ѷ� ���� �ο�
GRANT USERROLE01 TO test01;

-- �ѿ� �ο��� ���� ��ȸ
-- USERROLE01 �ѿ� �ο��� ���� ��ȸ
SELECT
    grantee, privilege
FROM
    dba_sys_privs
WHERE
    grantee = 'USERROLE01'
UNION
SELECT
    grantee, granted_role
FROM
    dba_sys_privs
WHERE
    grantee = 'USERROLE01'
;

--USERROLE01 �ѿ� �ο��� ��� ���� Ȯ��
-- �ο��� ��� ���� Ȯ��
SELECT
    grantee, privilege
FROM
    dba_sys_privs
WHERE
    grantee IN ('USERROLE01', 'CONNECT', 'RESOURCE')
;
------------------------------------------------------------------------------
/*
    ���Ǿ�(SYNONYM)
    ==> ���̺� ��ü�� ��Ī�� �ο��ؼ� ���� ����ڰ�
        ������ �̸����� �ϳ��� ���̺��� ����ϵ��� �ϴ� ��.
        
        ��, ���� ��ü(���̺�, ��, ������, ���ν���) �� �̸��� ���߰�
        ����ڿ��Դ� ��Ī�� �ο��ؼ�
        ��ü�� ��ȣ�ϵ��� �� �� �ִ� ���
        
        �츮�� ���л���Ʈ���� �츮�� �̸��� ��ſ� ���̵� ����ϴ� �Ͱ�
        ���������� ���� ��ȣ�� �������� ���� �̸��� ���߱� ���� ��.

        �ַ� �ٸ� ������ ����ϴ� ����ڰ�
        ���̺� �̸��� �˸� ����ϱ� ������
        �̵鿡�Դ� ���� ���̺� �̸��� �˷��ָ鼭
        ���� ���̺� �̸��� ���߱� ���� �������� ����Ѵ�.
        
        ���� ]
            CREATE [PUBLIC] SYNONYM ���Ǿ��̸�
            FOR �����̸�;
            
            ���� ]
                PUBLIC �� �����Ǹ� �� ���Ǿ�� ���� ���������� ����� �� �ִ� ���Ǿ �ȴ�.
                (���� ������ �ָ� �ٸ� ���������� ����� �� �ֱ�� �ϴ�.)
                PUBLIC �� ���Ǹ� �ڵ������� �ٸ� ����������
                ���� ���Ǿ �̿��ؼ� ���̺��� ����� �� �ְ� �ȴ�.
                
            ���� ]
                PUBLIC ���Ǿ ����ϱ� ���ؼ���
                �ش� ��ü�� PUBLIC �������� �ο��޾ƾ� �Ѵ�.
                
    PUBLIC ���Ǿ� ����
        PUBLIC SYNONYM
        ==> ��� �������� Ư�� ��ü(���̺�, ��, ������, ...) �� ����� �� �ֵ��� �ϴ� ��.
        
            1. ���Ǿ ���� �������� PUBLIC SYNONYM �� �����
            2. ������ �������� ������ ���Ǿ PUBLIC �������� �ο��ϰ�
            3. �ٸ��������� ����ϸ� �ȴ�.
                
*/
------------------------------------------------------------------------------
-- jennie �������� �۾��� ��.
INSERT INTO
    member(mno, name, id, pw, mail, tel, gen, avt)
VALUES(
    MEMBSEQ.nextval, 'yuna', 'yuna', '12345', 'yuna@githrd.com', '010-6464-6464', 'F', 14
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, gen, avt)
VALUES(
    MEMBSEQ.nextval, 'seora', 'seora', '12345', 'seora@githrd.com', '010-3434-3434', 'F', 15
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, gen, avt)
VALUES(
    MEMBSEQ.nextval, '�鼭��', 'sjin', '12345', 'sjin@githrd.com', '010-3737-3737', 'F', 16
);

UPDATE
    member
SET
    name = '������'
WHERE
    name = 'yuna'
;

UPDATE
    member
SET
    name = '�Ѽ���'
WHERE
    name = 'seora'
;

commit;

CREATE OR REPLACE VIEW buddy
AS
    SELECT
        mno, name, id, gen
    FROM
        member
;

SELECT
    *
FROM
    buddy
;

SELECT
    *
FROM
    scott.emp
;

CREATE SYNONYM jemp
FOR scott.emp;

SELECT
    *
FROM
    jemp
;

CREATE PUBLIC SYNONYM pemp
FOR scott.emp;

CREATE OR REPLACE VIEW TVIEW
AS
    SELECT
        mno, name, id
    FROM
        member
;

CREATE PUBLIC SYNONYM tmp
FOR tview;

-- ������� jennie �۾� ��.
------------------------------------------------------------------------------

-- ���Ǿ� ����
-- jennie �������� scott �� ������ �ִ� emp ���̺��� ��ȸ�� �� �ִ� ������ �ְ�
GRANT SELECT ON scott.emp TO jennie;

GRANT CREATE SYNONYM TO jennie;

GRANT CREATE PUBLIC SYNONYM TO jennie;

GRANT SELECT ON pemp TO PUBLIC;
-- jennie �� ���� ���� ���Ǿ �ٸ� �������� ����� �� �ֵ��� ����
SELECT
    *
FROM
    pemp
;

------------------------------------------------------------------------------
-- SYS ���� ��ȸ
SELECT grantee, privilege, admin_option FROM dba_sys_privs WHERE grantee = 'JENNIE';

SELECT grantee, privilege, admin_option FROM dba_sys_privs; -- ��������

-- �������� �۾�
SELECT grantee, OWNER, TABLE_NAME, PRIVILEGE, GRANTOR FROM USER_TAB_PRIVS;

SELECT * FROM USER_TAB_PRIVS;   -- ��ü����

DESC USER_TAB_PRIVS;

-- �ѿ� �ο��� ����ȸ
SELECT
    *
FROM
    USER_ROLE_PRIVS
;

-- �ѿ� �ο��� ���� ��ȸ
SELECT grantee, privilege
FROM dba_sys_privs
WHERE grantee = 'USERROLE01'
UNION
SELECT grantee, granted_role
FROM dba_sys_privs
WHERE grantee = 'USERROLE01'
;

-- �ο��� ��� ���� Ȯ��
SELECT
    grantee, privilege
FROM
    dba_sys_privs
WHERE
    grantee IN ('USERROLE01', 'CONNECT', 'RESOURCE')
;
------------------------------------------------------------------------------
GRANT SELECT ON tmp TO PUBLIC;

/*
���� 5 ]
emp ���̺��� �����ȣ, ����̸�, ����, �ٹ����� ���� ��ȸ�Ϸ��� �Ѵ�.
����� �̸��� ó�� �� ���ڴ� ǥ���ϰ� �������� * �� ǥ�õǰ� ���Ǹ���� �ۼ��ϼ���.
�÷��̸� ]
�����ȣ : empno, ����̸� : ename, ���� : job, �Ի��� : hiredate
��� �� ]
SMITH: SM***
*/
SELECT
	empno �����ȣ,
	RPAD(SUBSTR(ename,1, 2), LENGTH(ename),'*') ����̸�,
	job ����, CONCAT(FLOOR(MONTHS_BETWEEN(sysdate, hiredate)), '����') �ٹ�������
FROM
	emp
;
/*
���� 6 ]
emp ���̺��� comm�� �޴� ����� �ο����� ��ȸ�Ϸ��� �Ѵ�.
�׷��Լ��� ����ؼ� ��comm �޴� ����� �̶�� ��Ī���� ��ȸ�ǰ�
���Ǹ���� �ۼ��ϼ���.
*/
SELECT
    COUNT(*) "comm �޴� ���"
FROM
    emp
WHERE
    comm IS NOT NULL
;
/*
���� 7 ]
emp ���̺���
�����ȣ, ����̸�, �޿�, �μ��ִ�޿����� ����, �μ��ִ�޿�, �μ���ձ޿���
�ζ��� �並 ����ؼ� JOIN�� ����ؼ� ��ȸ�ϼ���.
* ��������� ������ ��Ī���� ��µǰ� �ϼ���.
* �Ҽ��� ���� �ڸ��� ��� ��µǰ� �ϼ���.
�÷��̸� ]
�����ȣ : empno, ����̸� : ename, �޿� : sal
*/
SELECT
    empno �����ȣ, ename ����̸�, sal �޿�, max - sal "�μ�max�޿����� ����",
    max �μ��ִ�޿�, avg �μ���ձ޿�
FROM
    emp,
    (
        SELECT
            deptno dno, MAX(sal) max, AVG(sal) avg
        FROM
            emp
        GROUP BY
            deptno
    )
WHERE
    deptno = dno
;