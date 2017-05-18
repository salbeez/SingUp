# guest project is simple guest book Web project

1. config
	1-1.	lib : jstl,tomcat jdbc,ojdbc6,ibatis
	1-2.  oracle table : 

								CREATE TABLE GUEST
						  		(ID NUMBER pk, 
									NAME VARCHAR2(15) NOT NULL, 
									PASS VARCHAR2(15) NOT NULL, 
									EMAIL VARCHAR2(30), 
									TEL VARCHAR2(15), 
									CONTENTS VARCHAR2(200), 
									GDATE DATE);						

								CREATE SEQUENCE  GUEST_SEQ  
										MINVALUE 1 MAXVALUE 9999999999999999999999999999 
										INCREMENT BY 1 START WITH 27 
										NOCACHE  
										NOORDER  
										NOCYCLE ;	
	1-3.start with -> com.guest.cont -> guestCont.java !!
