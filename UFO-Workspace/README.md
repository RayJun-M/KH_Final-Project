# 🛸 <span style="color: #64ffda;">프로젝트 구현</span> 🛸
<br>

### 👩🏻‍💻 Spring Project 생성 및 환경 설정
1. 워크스페이스 폴더 생성 (UFO-Workspace)
2. 개발 환경 : 화면 설정
3. 개발 환경 : 인코딩 설정 (UTF-8)
4. 개발 환경 : 서버 환경 설정 (Apache Tomcat v8.5 · 포트 - 8282)
5. 개발 환경 : Perspective 설정
6. 개발 환경 : Code Template 설정
7. 개발 환경 : Maven 설정
8. Spring Legacy Project 생성 (UFO_Project : com.urfavoriteott.ufo)
9. index.jsp 파일 생성 + 서버에 프로젝트 추가 후 구동 확인
10. 자바 버전 설정 (Java SE 1.8)
11. Spring 라이브러리 버전 설정 (5.3.23)
12. 추가 라이브러리 등록 (Maven)
13. lib 폴더 생성 + 라이브러리 파일 추가 (.jar)
<br>

### 👨🏻‍💻 DB 생성 SQL문 작성
1. 관리자 계정에서 UFO 계정 생성 및 권한 부여
2. 생성된 UFO 계정으로 데이터베이스 접속 설정
3. 필요한 TABLE 및 SEQUENCE 삭제 구문 작성
4. 필요한 TABLE 및 SEQUENCE 생성 구문 작성
5. 더미 데이터 삽입 구문 작성
6. 스크립트 실행 후 확인
<br>

#### 📂 추가 라이브러리 (Maven)
1. DB 관련 라이브러리
	1. ojdbc6 라이브러리 (11.2.0.4) : DB 접속에 필요한 Oracle JDBC Driver
	2. Spring JDBC 라이브러리 (5.3.23) : Spring에서 JDBC 사용할 수 있게 설정
	3. MyBatis 라이브러리 (3.5.11) : SQL Mapper 프레임워크
	4. MyBatis Spring 라이브러리 (1.3.2) : Spring에서 MyBatis 사용할 수 있게 설정
	5. Commons DBCP 라이브러리 (1.4) : Connection 객체 재활용 가능한 Connection Pool
<br>

#### 📁 추가 라이브러리 (.jar)
1. JSTL 1.0 지원 라이브러리
	1. Apache Standard Taglib 1.0 Compatibility (1.2.5)
	2. Apache Standard Taglib Implementation (1.2.5)
	3. Apache Standard Taglib 1.0 EL Support (1.2.5)
	4. Apache Standard Taglib Specification API (1.2.5)