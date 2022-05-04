-- �з����̺� Classinfo
CREATE TABLE classinfo (
    cno NUMBER(4)
        CONSTRAINT CLASS_NO_PK PRIMARY KEY,
    cname VARCHAR2(10 CHAR)
        CONSTRAINT CLASS_NAME_NN NOT NULL,
    ccno NUMBER(4)
);

-- �������� ���̺� Bookinfo
CREATE TABLE bookinfo (
    bno NUMBER(4)
        CONSTRAINT BOOK_NO_PK PRIMARY KEY,
    title VARCHAR2(50 CHAR)
        CONSTRAINT BOOK_TITLE_NN NOT NULL,
    writer VARCHAR2(20 CHAR)
        CONSTRAINT BOOK_WRITER_NN NOT NULL,
    trans VARCHAR2(20 CHAR)
        CONSTRAINT BOOK_TRANS_NN NOT NULL,
    div CHAR(1) DEFAULT 'K'
        CONSTRAINT BOOK_DIV_CK CHECK(div IN('K', 'F'))
        CONSTRAINT BOOK_DIV_NN NOT NULL,
    pub VARCHAR2(10 CHAR)
        CONSTRAINT BOOK_PUB_NN NOT NULL,
    edition NUMBER(2),
    fedate DATE,
    edate DATE
        CONSTRAINT BOOK_EDATE_NN NOT NULL,
    adate DATE,
    isget CHAR(1) DEFAULT 'Y'
        CONSTRAINT BOOK_ISGET_CK CHECK(isget IN('Y', 'N'))
        CONSTRAINT BOOK_ISGET_NN NOT NULL
);