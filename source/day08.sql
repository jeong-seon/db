-- day 08

/*
    시퀀스(Sequence)
    ==> 우리가 테이블을 만들면 각각의 행을 구분할 수 있는 기본키가
        거의 필수적으로 존재해야한다.
        
        예를들어
        사원을 관리하는 테이블을 만들면
        각각의 사원을 구별할 수 있는 무언가가 있어야하고
        따라서 우리가 가지고있는 EMP 테이블에서는
        사원번호(empno)를 이용해서 이것을 처리하고 있다.
        
        몇몇개의 테이블은 이것을 명확하게 구분하여 처리할 수 있지만
        그렇지 못한 테이블도 있다.
        
        예를 들어 게시판 내용을 관리하는 테이블을 만들게 되면
            제목, 글쓴이, 내용, 작성일, ...
        등이 있지만 이것중에서 명확하게 한 글의 데이터를 구분할 수 있는
        역할을 하는 필드가 보이지 않는다.
        이런 경우 대부분 일련번호를 이용해서 이 역할을 하도록 하고 있다.
        
        따라서 일련번호는 절대로 중복되어서는 안되고
        절대로 생략되어서도 안된다.
        (Primary Key == Unique + Not Null)
        ==> 데이터베이스에 내용을 입력하는 사람이 문제가 발생할 수 있다.
        
        시퀀스는 이런 문제점을 해결하기 위해서 나타난 개념으로
        자동적으로 일련번호를 발생시켜 주기 위한 도구이다.
        
        방법
            1. 시퀀스를 만들어 놓는다.
            2. 데이터베이스에 일련번호의 입력이 필요하면
                만들어놓은 시퀀스에게 일련번호를 만들어 달라고 요청한다.
                ==> 즉, 데이터를 INSERT 시킬 때 일련번호 부분은
                    입력하는 사람이 입력하는 것이 아니고
                    시퀀스에게 맡긴다.
                    
    시퀀스 생성 방법
    
        형식 ]
            
            CREATE SEQUENCE 시퀀스이름
                START WITH 숫자
                    ==> 발생시킬 일련번호의 시작값
                        생략하면 1 부터 시작한다.
                        
                INCREMENT BY 숫자
                    ==> 발생할 일련번호의 증가값
                        생략하면 1 씩 증가한다.
                        
                MAXVALUE    숫자
                MINVALUE    숫자
                    ==> 발생시킬 일련번호의 최대값과 최소값을 의미
                        생략하면 NO 를 사용한다.
                        
                CYCLE 또는 NOCYCLE
                    ==> 발생시킬 일련번호가 최대값에 도달하면 다시 처음부터
                        시작할지 여부를 지정하는 옵션
                        생략하면 NOCYCLE
                        
                CACHE 숫자 또는 NOCACHE
                    ==> 일련번호 발생시 임시 메모리를 사용할 지 여부를 지정하는 옵션
                        (미리 일정 갯수를 만들어 놓고 메모리에 기억시킨 후 사용한다.)
                        사용하게 되면 속도는 빨라지는데 메모리가 줄어든다.
                        사용하지 않으면 속도는 느려지지만 메모리가 줄지 않는다.
           
    --------------------------------------------------------------------------
    시퀀스 사용방법
    ==> 데이터를 입력할 때 자동으로 일련번호를 발생하기 위해서 만든것이 시퀀스이다.
        
        따라서 주로 INSERT 에서 사용하며
        형식은
            
            시퀀스이름.NEXTVAL
            
            참고 ]
                시퀀스가 마지막으로 만든 번호 확인하는 방법
                
                    시퀀스이름.CURRVAL
                    
    시퀀스의 문제점
    ==> 시퀀스는 테이블에 독립적이다.
        즉, 한번 만든 시퀀스는 여러 테이블에서 사용할 수 있다.
        이 때 어떤 테이블에서 시퀀스를 사용하던지 간에
        항상 다음 일련번호를 만들어준다.
    
    참고 ]
        시퀀스의 수정
            형식 ]
                ALTER SEQUENCE 시퀀스이름
                    INCREMENT BY 숫자
                    MAXVALUE    숫자[ 또는 NOMAXVALUE ]
                    MINVALUE    숫자[ 또는 NOMINVALUE ]
                    CYCLE[ 또는 NOCYCLE ]
                    CACHE 숫자[ 또는 NOCACHE ]
                    
            참고 ]
                시퀀스를 수정하는 경우
                시작값은 수정할 수 없다.
                왜냐하면 이미 발생한 번호가 있기 때문에
                시작번호는 전에 만들어 놓은 번호가 자동 시작값이 된다.
    
    시퀀스의 삭제
        형식 ]
            DROP SEQUENCE 시퀀스이름;
*/

-- 문제 1 ] 1 에서 1 씩 증가하는 시퀀스 test_seq 를 만든다.
-- 단, 최대값은 10 으로 한다.

CREATE SEQUENCE test_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 10
;

SELECT test_seq.CURRVAL FROM dual;

SELECT test_seq.NEXTVAL 다음번호, test_seq.CURRVAL 마지막번호 FROM dual;

SELECT test_seq.CURRVAL FROM dual;

SELECT test_seq.NEXTVAL FROM dual;

SELECT test_seq.CURRVAL FROM dual;

ALTER SEQUENCE test_seq
    MAXVALUE 10
    CACHE 10
;
/*
    회원번호를 자동으로 만들어 줄 시퀀스를 생성하세요.
    이름은 MEMBSEQ
    시작값은 1001
    증가값은 1  ==> 생략가능...
    최대값은 9999
    다시 반복해서 만들지 않도록 하고  ==> 생략하면 NOCYCLE
    
*/
CREATE SEQUENCE MEMBSEQ
    START WITH 1001
    INCREMENT BY 1
    MAXVALUE 9999
    MINVALUE 1001
    NOCYCLE
    NOCACHE
;

-- 아바타 테이블 데이터 추가
INSERT INTO
    avatar
VALUES(
    10, 'noimage', 'noimage.jpg', 'noimage.jpg', '/img/avatar/', 6000, 'N', sysdate, 'Y'
);

INSERT INTO
    avatar
VALUES(
    11, 'man1', 'img_avatar1.png', 'img_avatar1.png', '/img/avatar/', 11000, 'M', sysdate, 'Y'
);

INSERT INTO
    avatar
VALUES(
    12, 'man2', 'img_avatar2.png', 'img_avatar2.png', '/img/avatar/', 8000, 'M', sysdate, 'Y'
);

INSERT INTO
    avatar
VALUES(
    13, 'man3', 'img_avatar3.png', 'img_avatar3.png', '/img/avatar/', 8000, 'M', sysdate, 'Y'
);

INSERT INTO
    avatar
VALUES(
    14, 'woman1', 'img_avatar4.png', 'img_avatar4.png', '/img/avatar/', 8000, 'F', sysdate, 'Y'
);

INSERT INTO
    avatar
VALUES(
    15, 'woman2', 'img_avatar5.png', 'img_avatar5.png', '/img/avatar/', 8000, 'F', sysdate, 'Y'
);

INSERT INTO
    avatar
VALUES(
    16, 'woman3', 'img_avatar6.png', 'img_avatar6.png', '/img/avatar/', 8000, 'F', sysdate, 'Y'
);


-- 만들어 놓은 시퀀스를 사용해서 회원데이터를 입력하세요.
INSERT INTO
    member(mno, name, id, pw, mail, tel, avt, gen)
VALUES(
    1000, '전은석', 'euns', '12345', 'euns@githrd.com', '010-3175-9042', 11, 'M'
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, avt, gen)
VALUES(
    membseq.NEXTVAL, '제니', 'jennie', '12345', 'jennie@githrd.com', '010-1111-1111', 14, 'F'
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, avt, gen)
VALUES(
    membseq.NEXTVAL, '리사', 'lisa', '12345', 'lisa@githrd.com', '010-2424-2424', 15, 'F'
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, avt, gen)
VALUES(
    membseq.NEXTVAL, '로제', 'rose', '12345', 'rose@githrd.com', '010-5252-5252', 16, 'F'
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, avt, gen)
VALUES(
    membseq.NEXTVAL, '지수', 'jisoo', '12345', 'jisoo@githrd.com', '010-2929-2929', 16, 'F'
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, avt, gen)
VALUES(
    membseq.NEXTVAL, '양동수', 'dsoo', '12345', 'dsoo@githrd.com', '010-2106-1940', 12, 'M'
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, gen)
VALUES(
    membseq.NEXTVAL, '박형근', 'phk', '12345', 'phk@githrd.com', '010-8630-0515', 'M'
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, avt, gen)
VALUES(
    membseq.NEXTVAL, '김태현', 'thyun', '12345', 'thyun@githrd.com', '010-7556-1196', 12, 'M'
);

commit;

-------------------------------------------------------------------------------
-- 방명록 테이블 생성
CREATE TABLE guestboard (
    gno NUMBER(4)
        CONSTRAINT GBRD_NO_PK PRIMARY KEY,
    writer NUMBER(4)
        CONSTRAINT GBRD_WRITER_FK REFERENCES member(mno)
        CONSTRAINT GBRD_WRITER_UK UNIQUE
        CONSTRAINT GBRD_WRITER_NN NOT NULL,
    body VARCHAR2(4000)
        CONSTRAINT GBRD_BODY_NN NOT NULL,
    wdate DATE DEFAULT sysdate
        CONSTRAINT GBRD_DATE_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT GBRD_SHOW_CK CHECK(isshow IN('Y', 'N'))
        CONSTRAINT GBRD_SHOW_NN NOT NULL
);

-- 게시글 등록에 사용할 글번호를 생성해주는 시퀀스 GBRDSEQ 를 만드세요.
-- 시작번호는 1001, 최대값은 9999, 최대값에 도달하더라도 다시 반복하지 않음
-- 캐시는 사용하지 않는 것으로 한다.
CREATE SEQUENCE GBRDSEQ
    START WITH 1001
    INCREMENT BY 1
    MAXVALUE 9999
    NOCYCLE
    NOCACHE
;

-- 방명록에 GBRDSEQ 를 이용해서 글을 등록해보자.
INSERT INTO
    guestboard(gno, writer, body)
VALUES(
    gbrdseq.NEXTVAL, 1000, '게시판 오픈 감축드립니다.'
);

INSERT INTO
    guestboard(gno, writer, body)
VALUES(
    gbrdseq.NEXTVAL, 1005, '오픈 축하합니다.'
);

INSERT INTO
    guestboard(gno, writer, body)
VALUES(
    gbrdseq.NEXTVAL, 1006, '나 왔다갑니다.'
);

INSERT INTO
    guestboard(gno, writer, body)
VALUES(
    gbrdseq.NEXTVAL, 1001, '사업 번창하세요.'
);

INSERT INTO
    guestboard(gno, writer, body)
VALUES(
    gbrdseq.NEXTVAL, 1007, '안녕하세요.'
);

INSERT INTO
    guestboard(gno, writer, body)
VALUES(
    gbrdseq.NEXTVAL, 1001, '사업 번창하세요.'
);

INSERT INTO
    guestboard(gno, writer, body)
VALUES(
    gbrdseq.NEXTVAL, 1004, '제니 바보...!'
);

-- 방명록에서
-- 글번호, 작성자 아이디, 작성자 성별, 작성자 아바타 저장이름, 
-- 글내용, 작성일 을 조회하세요.
SELECT
    gno 글번호, id 아이디, m.gen 성별, savename 아바타저장이름, 
    body 글내용, TO_CHAR(wdate, 'YYYY"년 "MM"월 "DD"일"') 작성일
FROM
    guestboard g, member m, avatar a
WHERE
    writer = mno
    AND avt = ano
;

select * from member;
-- 'lisa' 그리고 'rose' 아이디만 알고있다는 가정하에서
-- 방명록에 글을 등록하세요.

-- 리사
INSERT INTO
    guestboard(gno, writer, body)
VALUES(
    GBRDSEQ.NEXTVAL,
    (SELECT mno FROM member WHERE id = 'lisa'), '동수씨 바보!!!' 
);
-- 로제
INSERT INTO
    guestboard(gno, writer, body)
VALUES(
    GBRDSEQ.NEXTVAL,
    (SELECT mno FROM member WHERE id = 'rose'), '동수씨 정말 바보!!!' 
);

-------------------------------------------------------------------------------
/*
    인덱스 (Index)
    ==> 검색속도를 빠르게 하기 위해서 B-Tree 기법으로
        색인을 만들어서 SELECT 를 빠른 속도로 처리할 수 있도록 하는 것.
        
    참고 ]
        인덱스를 만들면 안되는 경우
            1. 데이터양이 적은 경우는 오히려 속도가 떨어진다.
                시스템에 따라서 달라지지만
                최소한 몇십만개 이상의 데이터가 있는 경우에만
                빨라진다.
            2. 데이터의 입출력이 빈번한 경우는 오히려 속도가 떨어진다.
                왜냐하면 데이터가 입력될 때 마다
                계속해서 색인(인덱스)을 수정해야 하므로 오히려 불편하다.
                
    참고 ]
        인덱스를 만들면 효과가 좋아지는 경우
            
            1. JOIN 등이 많이 사용되는 필드가 존재하는 경우
            2. NULL 값이 많이 존재하는 경우
            3. WHERE 조건절에 많이 사용되는 필드가 존재하는 경우
            
    참고 ]
        제약조건을 추가할 때
        기본키 그리고 유일키를 부여하면
        자동적으로 해당 필드는 인덱스가 만들어진다.
        
인덱스 만드는 방법
    
    형식 1 ] 일반 인덱스 만드는 방법(NON UNIQUE INDEX)
    
        CREATE INDEX 인덱스이름
        ON
            테이블이름(인덱스에 사용할 필드이름)
        ;
        
        참고 ]
            일반 인덱스는 데이터가 중복되어도 상관이 없다.
        
    형식 2 ] UNIQUE 인덱스 만들기
        ==> 인덱스용 데이터가 반드시 UNIQUE 하다는 보장이 있는 경우에 한해서
            인덱스를 만드는 방법
            
            CREATE UNIQUE INDEX 인덱스이름
            ON
                테이블이름(필드이름);
            
            참고 ]
                이 때 지정한 필드의 내용은 반드시 유일하다는 보장이 있어야 한다.
            
            장점 ]
                일반 인덱스보다 처리속도가 무척 빠르다.
                왜냐하면 이진 검색을 사용하기 때문에...
                
    형식 3 ] 결합 인덱스
        ==> 여러개의 필드르 결합해서 하나의 인덱스를 만드는 방법
            이때도 전제조건이 있는데
            여러개의 필드의 조합이 반드시 유일해야 한다.
        
            즉, 하나의 필드만 가지고는 유니크 인덱스를 만들지 못하는 경우
            여러개의 필드를 합쳐서 유니크 인덱스를 만들어서 사용하는 방법
            
                CREATE UNIQUE 
            
        참고 ] 복합키 제약조건 추가하기
            CREATE TABLE 테이블이름(
                필드1 데이터타입(길이),
                필드2 데이터타입(길이),
                필드3 데이터타입(길이),
                ...
                CONSTRAINT 제약조건이름 PRIMARY KEY(필드이름1, 필드이름2), ==> 복합키...
            );
        
    형식 4 ] 비트 인덱스
        ==> 주로 그 안에 들어있는 데이터가 몇가지 중 하나인 경우에 많이 사용되는 방법
            예 ]
                GEN 필드에는 'F', 'M', 'N' 만 입력 될 것이다.
                
                deptno 필드에는 10, 20, 30, 40 만 입력될 것이다.
                
            이것은 내부적으로 데이터를 이용해서 인덱스를 만들어서 사용하는 방법
            
            CREATE BITMAP INDEX 인덱스이름
            ON
                테이블이름(필드이름);
*/

-- 회원테이블의 이름을 이용해서 인덱스를 만드세요.
CREATE INDEX name_idx
ON
    member(name);
-------------------------------------------------------------------------------
/*
    인라인 뷰(InLine View)
    ==> 조회질의명령(SELECT 명령)을 내리면 결과가 발생한다.
        이 때 발생한 결과를 '인라인 뷰' 라고 말한다.
        
        즉, 뷰는 인라인 뷰 중에서 자주 사용하는 인라인 뷰를
        등록해서 사용하는 개념일 뿐이다.
        
    그런데 인라인 뷰는 하나의 가상의 테이블이다.
    (테이블이란 레코드와 필드로 구성된 데이터를 입력하는 단위)
    
    따라서 인라인 뷰는 하나의 테이블로 다시 재사용이 가능하다.
    즉, 테이블을 사용해야 하는 곳에 인라인 뷰를 대신 사용할 수 있다.
    
인라인 뷰를 사용해야 하는 이유?
    ==> 실제 테이블에 존재하지 않는 데이터를
        추가해서 사용해야 하는 경우에 많이 인라인 뷰를 사용한다.
        
        참고 ]
            ROWNUM
            ==> 이것은 가상의 필드로 데이터가 조회된 순서를 표시하는 필드
*/

/*
    인라인 뷰의 결과중에서 회원번호와 이름만 꺼내세요
*/
SELECT
    mno, name
FROM
    (SELECT * FROM member)
;

-- 에러가 발생하는 경우
SELECT
    mno, id, name, joindate
FROM
    (SELECT mno, id, name, mail FROM member)
    -- 인라인 뷰의 결과에서 joindate 필드는 만들어지지 않았다.
;

SELECT
    *
FROM
    (
    SELECT
        ROWNUM rno, g.*
    FROM
        (
            SELECT
                gno, writer, body, wdate
            FROM
                guestboard
            WHERE
                isshow = 'Y'
            ORDER BY
                wdate DESC
        ) g
    )
WHERE
    rno BETWEEN 4 AND 6
;

SELECT
    ROWNUM rno, g.*
FROM
    (
        SELECT
            gno, writer, body, wdate
        FROM
            guestboard
        WHERE
            isshow = 'Y'
        ORDER BY
            wdate DESC
    ) g
WHERE
    ROWNUM BETWEEN 1 AND 3
;

-- 문제 ]
-- 회원 테이블의 회원들을 조회하는데 ROWNUM 기준으로 4 ~ 6 회원만 조회하세요.
-- 단 정렬은 이름기준 내림차순 정렬하세요.


SELECT
    *
FROM
    (
    SELECT
        ROWNUM rno, m.*
    FROM
        (
            SELECT
                mno, name, id, pw, mail, tel, m.gen, joindate, avt, savename
            FROM
                member m, avatar a
            WHERE
                avt = ano
            ORDER BY
                name DESC
        ) m
    )
WHERE
    rno BETWEEN 4 AND 6
;






