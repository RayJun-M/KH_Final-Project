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

### 👩🏻‍💻 UFO Project 기본 구조 설정
1. 폴더 및 패키지 생성
2. 필요한 Controller · Service · DAO · VO 클래스 및 인터페이스 생성
3. 페이징 처리를 위한 클래스 작성
	- PageInfo · Pagination
4. XML Catalog 설정 (configuration · mapper)
5. 필요한 mapper.xml 파일 생성
6. mybatis-config.xml 작성
	1. settings : jdbcTypeForNull=NULL (DB에 전달할 값이 없을 때 NULL 전달)
	2. typeAliases : 작성할 코드 줄이기 위한 자바 타입의 별칭 설정
	3. mappers : SQL 매핑 파일 등록
7. root-context.xml : DB 연결 설정
	1. DB 연결 도구 등록 : BasicDataSource
		- 접속할 DB 설정 : UFO
	2. SQL문 실행 도구 생성에 필요한 도구 등록 : SqlSessionFactoryBean
		- MyBatis 설정 값 연동 : mybatis-config.xml
		- DB 연결 도구 참조 설정
	3. SQL문 실행 도구 등록 : SqlSessionTemplate
		- SqlSessionFactoryBean 참조 설정
8. root-context.xml : 이메일 인증을 위한 도구 등록
	1. 이메일 발송 도구 등록 : JavaMailSenderImpl
		- Gmail 사용 설정
		- Gmail 보안 업데이트로 smtp 사용 위해 SSLSocketFactory 추가
9. 어노테이션 이용한 도구 등록
10. web.xml : Spring 인코딩 필터 등록
	1. Spring 인코딩 필터 등록
		- 인코딩 필터명 명시 : CharacterEncodingFilter
		- 인코딩 방식 설정 (UTF-8)
		- 충돌 시 강제 인코딩 설정 (UTF-8)
	2. 인코딩 필터 모든 요청에 적용하도록 설정
11. 추가 라이브러리 등록 (Maven)
12. VO 클래스 작성
13. 비밀번호 암호화를 위한 설정 파일 생성 및 작성
	1. pom.xml
		- Spring Security 라이브러리 등록 (Maven)
	2. spring-security.xml
		- 비밀번호 암호화 도구 등록 : BcryptPasswordEncoder
	3. web.xml
		- 최상위 Spring 설정 파일 경로 설정 : spring-security.xml
14. 로그인 유무 검사를 위한 Interceptor 작성 후 등록
	1. LoginInterceptor 클래스 작성
	2. servlet-context.xml
		- DispatcherServlet 과 Controller 사이의 특정 요청을 Interceptor 를 통하도록 설정
15. 라이센스 및 .gitignore 파일 설정
<br>

#### 📂 추가 라이브러리 (Maven)
1. DB 관련 라이브러리
	1. ojdbc6 (11.2.0.4) : DB 접속에 필요한 Oracle JDBC Driver
	2. Spring JDBC (5.3.23) : Spring에서 JDBC 사용할 수 있게 설정
	3. MyBatis (3.5.11) : SQL Mapper 프레임워크
	4. MyBatis Spring (1.3.2) : Spring에서 MyBatis 사용할 수 있게 설정
	5. Commons DBCP (1.4) : Connection 객체 재활용 가능한 Connection Pool
2. Lombok (1.18.24) : Getter · Setter · 생성자 등을 어노테이션으로 자동 생성
3. Spring Security (5.7.3) : 사용자 인증과 접근 권한 관리
	1. Spring Security Core
	2. Spring Security Web
	3. Spring Security Config
4. JSON 관련 라이브러리
	1. JSON.simple (1.1.1) : JSON 데이터 처리
	2. Gson (2.10) : JSON의 자바 오브젝트의 직렬화 · 역직렬화 처리
5. 이메일 인증 관련 라이브러리
	1. JavaMail (1.4.7) : 이메일 발송
	2. Spring Context Support (5.3.23) : Spring에서 JavaMail 사용할 수 있게 설정
6. i'mport (0.2.22) : PG 결제 연동
<br>

#### 📁 추가 라이브러리 (.jar)
1. JSTL 1.0 지원 라이브러리
	1. Apache Standard Taglib 1.0 Compatibility (1.2.5)
	2. Apache Standard Taglib Implementation (1.2.5)
	3. Apache Standard Taglib 1.0 EL Support (1.2.5)
	4. Apache Standard Taglib Specification API (1.2.5)