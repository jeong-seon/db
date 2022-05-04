/*
    ��������
    ==> �����Ͱ� �Էµ� �� �̻��� �ִ� �����Ͱ� ���� ����� ����Ŭ ��ü
    
    ���� ]
        �����ͺ��̽��� �̻������� ������ �������� ���
        
    ���� ]
        �⺻Ű(PRIMARY KEY) ��������
            -   �Ӽ������� �����͸� ������ �� �־�� �Ѵ�.
                �⺻Ű ���������� �ʼ��� �ƴ�����
                �ǵ����̸� �⺻Ű ���������� �߰��ϴ� ���� ����.
                
                �⺻Ű�� ����Ű + NOT NULL ��������
                
        ����Ű(UNIQUE) ��������
            ==> �Ӽ����� �ٸ� �����Ϳ� ������ �Ǿ�� �Ѵ�.
                NULL �����ʹ� �Է��� �� �ִ�.
                
        ����Ű(�ܷ�Ű, FOREIGN KEY) ��������
            ==> �����ϴ� ���̺��� Ű���� �ݵ�� ����ؾ� �ϴ� ��������
                �Էµ��� ���� Ű���� �Է����� ���ϵ��� ���� ��������
                ���� ���̺��� �����Ϸ��� �ϸ�
                ���� �����ϰ� �ִ� ���̺��� �����ϰ� �ش� ���̺��� �����ؾ� �Ѵ�.
                
        NOT NULL ��������
            ==> �Ӽ������� NULL �����Ͱ� �Էµ��� �ʵ��� ���� ��������
            
        CHECK ��������
            ==> �ԷµǾ�� �� �Ӽ����� ������ �ִ� ���(�� ] ����, ���⿩��)
                �Էµ� �Ӽ��� �̿��� ���� �ԷµǴ� ���� �����ϴ� ��������
*/
-- emp ���̺� �Ѹ� ����� �Է��ϴµ� ����� �Ի����� ���� �ð����� �ϰ�
-- �μ��� 50�� �μ��� �Է��ϼ���.
INSERT INTO
    emp(empno, ename, hiredate, deptno)
VALUES(
    (
        SELECT
            NVL(MAX(empno) + 1, 1001)
        FROM
            emp
    ),
    '�Ѹ�', sysdate, 50
);


/*
    ���� ]
        ������ ������� �Ѵ�.
        ������ ȸ�������� �ϸ� �� �������� �ڵ� ��ȯ�ǵ��� �� �����̴�.
        ���Ͽ��� ȸ�����̵�� �λ��� ���ԵǾ�� �Ѵ�.
        
        ������ ER Model Diagram, ER-D, ���̺� ����,
        DDL ���Ǹ�� �� �ۼ��ϼ���.
*/
CREATE TABLE guest (
    gid VARCHAR2(15 CHAR)
        CONSTRAINT GUEST_ID_PK PRIMARY KEY
        CONSTRAINT GUEST_ID_FK REFERENCES MEMB(id),
    ghi VARCHAR2(4000)
        CONSTRAINT GUEST_HI_NN NOT NULL
);

/*
    ����Ŭ���� ����� �� �ִ� ������ ����
    
        1. ������
            CHAR
                ==> ���������� ������
                
                ���� ]
                    CHAR(�ִ����)
                    ==> �� �� ��밡���� �ִ� ���̴� 2000 byte ������ ����� �� �ִ�.
                    
            VARCHAR2
                ==> ���������� ������
                
                ���� ]
                    VARCHAR2(�ִ����)
                    ==> �ִ���̴� 4000byte ���� ����� �� �ִ�.
                    
            LONG
                ==> ���������� ������
                
                ���� ]
                    LONG
                    ==> �ִ���� 2Gb ���� ����� �� �ִ�.
                    
            CLOB
                ==> ���������� ������
                
                ���� ]
                    CLOB
                    ==> �ִ���̴� 4Gb ���� ����� �� �ִ�.
                
                ==> �� Ÿ���� VARCHAR2 �� 4Kb ������ ����ϱ� ������
                    �� �̻��� ���ڼ��� ���� �����ʹ� �Է¹��� ���Ѵ�.
                    �� ������ �ذ��ϱ� ���� ������� �������� Ÿ���̴�.
                    
    ���� ]
        �������� ������ ( ó���ӵ��� CHAR �� ������. )
            ==> ������ ���̸� �̸� ������ ��
                �Է��� ���ڰ� ���̺��� �����ϸ� ������ �̿��ؼ�
                �ݵ�� ���� ������ ���ڸ� ���� �Է��ϴ� ���
                ==> �����ȣ�� ���� ���̰� ������ ������ �����Ϳ� ���ؼ�
                    �ַ� ���Ǵ� Ÿ��.
                    
        �������� ������
            ==> �Է��� ������ ���̿� ���� ������ ����ϴ� ������ �����ؼ�
                ���ڿ��� ���̸� �Է��� ������ ���̿� ���ߴ� ����
                ==> �������� ���̸� �� �� ���� ��쿡 �ַ� ���� ����Ѵ�.
                
                    
        2. ������
            NUMBER
                
                ���� ]
                    NUMBER(����1[, ����2])
                    
                    ����1 : ��ü �ڸ����� �ǹ�(��ȿ�ڸ���)
                    ����2 : �Ҽ� ���� �ڸ����� �ǹ�
                    
                    ���� ]
                        ����1 ���� ū ���� �Է¹��� ���Ѵ�.
                        ����2 ���� �Ҽ����ϰ� ������ �ڵ����� �ݿø��ؼ� �Է��Ѵ�.
                        
        3. ��¥��
            DATE
                
                ���� ]
                    DATE
                    
    ���� ]
        �����ͺ��̽��� ���� ������ ���µ� �ణ�� �޶�����.
        ANSI ������ ���¶�� �ؼ�
        ��� �����ͺ��̽��� ���� ������ ���� ���¸� ǥ��ȭ ��ȸ���� �����ϰ� �ִ�.
        
-------------------------------------------------------------------------------

1. ���̺� �����

    ���� ]
        CREATE TABLE ���̺��̸�(
            �ʵ��̸�    ������Ÿ��(����),
            �ʵ��̸�    ������Ÿ��(����),
            ...
        );
        
    ���̺��� ��������ִ��� Ȯ���ϴ� ���
    
        SELECT tname FROM tab;
        
    ���̺� ������ �����ϰ� Ȯ���ϴ� ���
        
        DESCRIBE ���̺��̸�;
        DESC     ���̺��̸�;
        
        
        
*/
-- jennie ���� ����
CREATE USER jennie IDENTIFIED BY "12345" ACCOUNT UNLOCK;
-- ���� �ο�
GRANT resource, connect TO jennie;
-- table ����� ���� Ȯ��
ALTER USER jennie DEFAULT TABLESPACE USERS;

-- jennie �������� ����
-- Memb ���̺� ����
CREATE TABLE memb(
    mno NUMBER(4),
    name VARCHAR2(20 CHAR),
    id VARCHAR2(15 CHAR),
    pw VARCHAR2(15 CHAR),
    mail VARCHAR2(50 CHAR),
    tel VARCHAR2(13 CHAR),
    addr VARCHAR2(100 CHAR),
    gen CHAR(1),
    joindate DATE DEFAULT sysdate,
    isShow CHAR(1) DEFAULT 'Y'
);

/*
    �������� �ο��ϴ� ���
        ���� ]
            ���������� �̸��� �ο��ϴ� ��Ģ
            
                ���̺��̸�_�ʵ��̸�_��������
                �� ���·� �ο��ϸ� �ȴ�.
                �� ]
                    memb ���̺��� �⺻Ű��������
                    ==> MEMB_NO_PK
    
        1. ���̺� ������ �� �߰��ϴ� ���
        
            *****
            1-1. �ʵ带 ������ �� �߰��ϴ� ���
                ���� ]
                    �ʵ��̸�    ������Ÿ��(����)
                        CONSTRAINT  ���������̸�  ��������1
                        CONSTRAINT  ���������̸�  ��������2
                        
                ���� ]
                    ����Ű ��������
                        CONSTRAINT  ���������̸�  REFERENCES  ���̺��̸�(�ʵ�)
                    üũ ��������
                        CONSTRAINT  ���������̸�  CHECK (�ʵ��̸� IN (������1, ������2, ...))
                        
            
            1-2. �ʵ带 �̸� �����ϰ� ���߿� ���������� �߰��ϴ� ���
            
            1-3. ���� ������������ ����ϴ� ���
            
*/
-- memb ���̺� ����
DROP TABLE memb;

-- ���� ��������
CREATE TABLE memb(
    mno NUMBER(4) PRIMARY KEY,
    name VARCHAR2(20 CHAR),
    id VARCHAR2(15 CHAR),
    pw VARCHAR2(15 CHAR),
    mail VARCHAR2(50 CHAR),
    tel VARCHAR2(13 CHAR),
    addr VARCHAR2(100 CHAR),
    gen CHAR(1),
    joindate DATE DEFAULT sysdate,
    isShow CHAR(1) DEFAULT 'Y'
);

INSERT INTO
    memb(mno, name)
VALUES(
    1001, '��浿'
);

INSERT INTO
    memb(mno, name)
VALUES(
    1001, '��ġ'
);

-- �ʵ带 �����ϸ鼭 ���������� �߰��ϴ� ���
CREATE TABLE memb(
    mno NUMBER(4) 
        CONSTRAINT MEMB_NO_PK PRIMARY KEY,
    name VARCHAR2(20 CHAR)
        CONSTRAINT MEMB_NAME_NN NOT NULL,
    id VARCHAR2(15 CHAR)
        CONSTRAINT MEMB_ID_UK UNIQUE
        CONSTRAINT MEMB_ID_NN NOT NULL,
    pw VARCHAR2(15 CHAR)
        CONSTRAINT MEMB_PW_NN NOT NULL,
    mail VARCHAR2(50 CHAR)
        CONSTRAINT MEMB_MAIL_UK UNIQUE
        CONSTRAINT MEMB_MAIL_NN NOT NULL,
    tel VARCHAR2(13 CHAR)
        CONSTRAINT MEMB_TEL_UK UNIQUE
        CONSTRAINT MEMB_TEL_NN NOT NULL,
    addr VARCHAR2(100 CHAR)
        CONSTRAINT MEMB_ADDR_NN NOT NULL,
    gen CHAR(1)
        CONSTRAINT MEMB_GEN_CK CHECK(gen IN('F', 'M'))
        CONSTRAINT MEMB_GEN_NN NOT NULL,
    joindate DATE DEFAULT sysdate
        CONSTRAINT MEMB_JOIN_NN NOT NULL,
    isShow CHAR(1) DEFAULT 'Y'
        CONSTRAINT MEMB_SHOW_CK CHECK(isShow IN('Y', 'N'))
        CONSTRAINT MEMB_SHOW_NN NOT NULL
);

-- �Խ��� ���̺�� ÷������ ���̺��� ����� ���Ǹ���� �ۼ��ϼ���.

-- GESI
CREATE TABLE gesi(
    bno NUMBER(6)
        CONSTRAINT GESI_NO_PK PRIMARY KEY,
    upno NUMBER(6),
    bmno NUMBER(4)
        CONSTRAINT GESI_NAME_FK REFERENCES MEMB(mno)
        CONSTRAINT GESI_NAME_NN NOT NULL,
    title VARCHAR2(30 CHAR)
        CONSTRAINT GESI_TITLE_NN NOT NULL,
    body VARCHAR2(4000)
        CONSTRAINT GESI_BODY_NN NOT NULL,
    bdate DATE DEFAULT sysdate
        CONSTRAINT GESI_BDATE_NN NOT NULL,
    edate DATE,
    click NUMBER(6) DEFAULT 0
        CONSTRAINT GESI_CLICK_NN NOT NULL,
    isShow CHAR(1) DEFAULT 'Y'
        CONSTRAINT GESI_SHOW_CK CHECK(isShow IN('Y', 'N'))
        CONSTRAINT GESI_SHOW_NN NOT NULL
);
-- CHUMBU
CREATE TABLE chumbu(
    fno NUMBER(7)
        CONSTRAINT CHUMBU_NO_PK PRIMARY KEY,
    fbno NUMBER(6)
        CONSTRAINT CHUMBU_FBNO_FK REFERENCES GESI(bno)
        CONSTRAINT CHUMBU_FBNO_NN NOT NULL,
    oname VARCHAR2(50 CHAR)
        CONSTRAINT CHUMBU_ONAME_NN NOT NULL,
    fname VARCHAR2(50 CHAR)
        CONSTRAINT CHUMBU_FNAME_UK UNIQUE
        CONSTRAINT CHUMBU_FNAME_NN NOT NULL,
    fcd VARCHAR2(200 CHAR)
        CONSTRAINT CHUMBU_FCD_NN NOT NULL,
    fsize NUMBER(12)
        CONSTRAINT CHUMBU_FSIZE_NN NOT NULL,
    fdown NUMBER(6)
        CONSTRAINT CHUMBU_FDOWN_NN NOT NULL,
    isShow CHAR(1) DEFAULT 'N'
        CONSTRAINT CHUMBU_SHOW_CK CHECK(isShow IN('Y', 'N'))
        CONSTRAINT CHUMBU_SHOW_NN NOT NULL
);













------------------------------------------------------------------------------









