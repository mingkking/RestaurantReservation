CREATE TABLE MEMBER(
    ID VARCHAR2(30) PRIMARY KEY,
    NAME VARCHAR2(10),
    PHONE VARCHAR2(20),
    PASSWORD VARCHAR2(60),
    NICKNAME VARCHAR2(20),
    AUTHORITY VARCHAR2(50),
    ENABLED NUMBER(1, 0),
    REGDATE DATE
);

CREATE TABLE MENU(
   MENUNAME VARCHAR2(50) PRIMARY KEY, 
   STORENO NUMBER, 
   PRICE NUMBER, 
   MENUINFO VARCHAR2(100), 
   MENUPHOTO VARCHAR2(500), 
   ORDERNO NUMBER, 
    FOREIGN KEY(STORENO) REFERENCES STORE(STORENO)
);
  
CREATE TABLE STORE(
    STORENO NUMBER PRIMARY KEY,
    ID VARCHAR2(30),
    STORENAME VARCHAR2(20),
    PHOTO VARCHAR2(30),
    LOCATION VARCHAR2(30),
    CATEGORY VARCHAR2(30),
    STORE_PHONE VARCHAR2(20),
    PARKING VARCHAR2(10),
    HOLYDAY VARCHAR2(20),
    INTRODUCE VARCHAR2(500),
    NOTICE VARCHAR2(500),
    FOREIGN KEY (ID) REFERENCES MEMBER(ID)
);

CREATE TABLE RESERVEPOSSIBLE(
    STORENO NUMBER,
    DAY DATE UNIQUE,
    TIME VARCHAR2(50),
    CAPACITY NUMBER,
    SEAT NUMBER,
    FOREIGN KEY (STORENO) REFERENCES STORE(STORENO)
);

create table reviewLike(
    reviewLikeNo number primary key,
    storeNo int not null,
    id varChar2(30) not null,
    
    CONSTRAINT reviewLikeNo  FOREIGN key(storeNo) references store(storeNo) on delete cascade,
    FOREIGN KEY(ID) REFERENCES MEMBER(ID)
);

create table review(
    reviewNo number primary key,
    rating number(1,2) not null,
    reviewNickName varChar2(20) not null,
    storeNo number not null,
    reviewPhoto varChar(50),
    reviewContent varChar(100) not null,
    reviewRDate date not null,
    
    CONSTRAINT reviewNo FOREIGN key(storeNo) references store(storeNo) on delete cascade
);
CREATE TABLE RESERVATION(
    RESERVENO NUMBER PRIMARY KEY,
    ID VARCHAR2(30),
    STORENO NUMBER,
    PEOPLE NUMBER,
    VISITDAY DATE,
    VISITTIME VARCHAR2(20),
    VISITNAME VARCHAR2(20),
    VISITPHONE VARCHAR2(20),
    REGDATE DATE,
    FOREIGN KEY (ID) REFERENCES MEMBER(ID),
    FOREIGN KEY (STORENO) REFERENCES STORE(STORENO)
);

CREATE TABLE SERVICEBOARD(
    SERVICENO NUMBER PRIMARY KEY,
    ID VARCHAR2(30),
    TITLE VARCHAR2(20),
    CONTENT VARCHAR2(500),
    VIEWS NUMBER,
    REGDATE DATE,
    FOREIGN KEY (ID) REFERENCES MEMBER(ID)
);

CREATE TABLE REPLY (
    REPLYNO NUMBER PRIMARY KEY,
    SERVICENO NUMBER,
    ID VARCHAR2(30),
    ANSWER VARCHAR2(500),
    REGDATE DATE,
    FOREIGN KEY (ID) REFERENCES MEMBER(ID),
    FOREIGN KEY (SERVICENO) REFERENCES SERVICEBOARD(SERVICENO)
);

CREATE SEQUENCE reviewNo_SEQ
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 100000
    NOCYCLE
    NOCACHE;
    
CREATE SEQUENCE STORENO_SEQ
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 2000
    NOCYCLE
    NOCACHE;
    
CREATE SEQUENCE RESERVENO_SEQ
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 2000
    NOCYCLE
    NOCACHE;

CREATE SEQUENCE SERVICENO_SEQ
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 2000
    NOCYCLE
    NOCACHE;
    
CREATE SEQUENCE REPLYNO_SEQ
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 2000
    NOCYCLE
    NOCACHE;
    
   
   CREATE TABLE REVIEWCOMMENT(
    REVIEWCOMMENTNO NUMBER PRIMARY KEY,
    REVIEWNO NUMBER NOT NULL,
	ID VARCHAR2(30) NOT NULL,
	REVIEWCOMMENTCONTENT VARCHAR2(500) NOT NULL,
	REVIEWCOMMENTRDATE DATE NOT NULL, 
    FOREIGN KEY(REVIEWNO) REFERENCES REVIEW(REVIEWNO) ON DELETE CASCADE ENABLE
)
    
    
    
  CREATE TABLE "C##RRS"."REVIEWCOMMENT" 
   (	"REVIEWCOMMENTNO" NUMBER, 
	"REVIEWNO" NUMBER NOT NULL ENABLE, 
	"ID" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"REVIEWCOMMENTCONTENT" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"REVIEWCOMMENTRDATE" DATE NOT NULL ENABLE, 
	 PRIMARY KEY ("REVIEWCOMMENTNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "REVIEWCOMMENTNO" FOREIGN KEY ("REVIEWNO")
	  REFERENCES "C##RRS"."REVIEW" ("REVIEWNO") ON DELETE CASCADE ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

  