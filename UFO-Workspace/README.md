# πΈ <span style="color: #64ffda;">νλ‘μ νΈ κ΅¬ν</span> πΈ
<br>

### π©π»βπ» Spring Project μμ± λ° νκ²½ μ€μ 
1. μν¬μ€νμ΄μ€ ν΄λ μμ± (UFO-Workspace)
2. κ°λ° νκ²½ : νλ©΄ μ€μ 
3. κ°λ° νκ²½ : μΈμ½λ© μ€μ  (UTF-8)
4. κ°λ° νκ²½ : μλ² νκ²½ μ€μ  (Apache Tomcat v8.5 Β· ν¬νΈ - 8282)
5. κ°λ° νκ²½ : Perspective μ€μ 
6. κ°λ° νκ²½ : Code Template μ€μ 
7. κ°λ° νκ²½ : Maven μ€μ 
8. Spring Legacy Project μμ± (UFO_Project : com.urfavoriteott.ufo)
9. index.jsp νμΌ μμ± + μλ²μ νλ‘μ νΈ μΆκ° ν κ΅¬λ νμΈ
10. μλ° λ²μ  μ€μ  (Java SE 1.8)
11. Spring λΌμ΄λΈλ¬λ¦¬ λ²μ  μ€μ  (5.3.23)
12. μΆκ° λΌμ΄λΈλ¬λ¦¬ λ±λ‘ (Maven)
13. lib ν΄λ μμ± + λΌμ΄λΈλ¬λ¦¬ νμΌ μΆκ° (.jar)
<br>

### π¨π»βπ» DB μμ± SQLλ¬Έ μμ±
1. κ΄λ¦¬μ κ³μ μμ UFO κ³μ  μμ± λ° κΆν λΆμ¬
2. μμ±λ UFO κ³μ μΌλ‘ λ°μ΄ν°λ² μ΄μ€ μ μ μ€μ 
3. νμν TABLE λ° SEQUENCE μ­μ  κ΅¬λ¬Έ μμ±
4. νμν TABLE λ° SEQUENCE μμ± κ΅¬λ¬Έ μμ±
5. λλ―Έ λ°μ΄ν° μ½μ κ΅¬λ¬Έ μμ±
6. μ€ν¬λ¦½νΈ μ€ν ν νμΈ
<br>

### π©π»βπ» UFO Project κΈ°λ³Έ κ΅¬μ‘° μ€μ 
1. ν΄λ λ° ν¨ν€μ§ μμ±
2. νμν Controller Β· Service Β· DAO Β· VO ν΄λμ€ λ° μΈν°νμ΄μ€ μμ±
3. νμ΄μ§ μ²λ¦¬λ₯Ό μν ν΄λμ€ μμ±
	- PageInfo Β· Pagination
4. XML Catalog μ€μ  (configuration Β· mapper)
5. νμν mapper.xml νμΌ μμ±
6. mybatis-config.xml μμ±
	1. settings : jdbcTypeForNull=NULL (DBμ μ λ¬ν  κ°μ΄ μμ λ NULL μ λ¬)
	2. typeAliases : μμ±ν  μ½λ μ€μ΄κΈ° μν μλ° νμμ λ³μΉ­ μ€μ 
	3. mappers : SQL λ§€ν νμΌ λ±λ‘
7. root-context.xml : DB μ°κ²° μ€μ 
	1. DB μ°κ²° λκ΅¬ λ±λ‘ : BasicDataSource
		- μ μν  DB μ€μ  : UFO
	2. SQLλ¬Έ μ€ν λκ΅¬ μμ±μ νμν λκ΅¬ λ±λ‘ : SqlSessionFactoryBean
		- MyBatis μ€μ  κ° μ°λ : mybatis-config.xml
		- DB μ°κ²° λκ΅¬ μ°Έμ‘° μ€μ 
	3. SQLλ¬Έ μ€ν λκ΅¬ λ±λ‘ : SqlSessionTemplate
		- SqlSessionFactoryBean μ°Έμ‘° μ€μ 
8. root-context.xml : μ΄λ©μΌ μΈμ¦μ μν λκ΅¬ λ±λ‘
	1. μ΄λ©μΌ λ°μ‘ λκ΅¬ λ±λ‘ : JavaMailSenderImpl
		- Gmail μ¬μ© μ€μ 
		- Gmail λ³΄μ μλ°μ΄νΈλ‘ smtp μ¬μ© μν΄ SSLSocketFactory μΆκ°
9. μ΄λΈνμ΄μ μ΄μ©ν λκ΅¬ λ±λ‘
10. web.xml : Spring μΈμ½λ© νν° λ±λ‘
	1. Spring μΈμ½λ© νν° λ±λ‘
		- μΈμ½λ© νν°λͺ λͺμ : CharacterEncodingFilter
		- μΈμ½λ© λ°©μ μ€μ  (UTF-8)
		- μΆ©λ μ κ°μ  μΈμ½λ© μ€μ  (UTF-8)
	2. μΈμ½λ© νν° λͺ¨λ  μμ²­μ μ μ©νλλ‘ μ€μ 
11. μΆκ° λΌμ΄λΈλ¬λ¦¬ λ±λ‘ (Maven)
12. VO ν΄λμ€ μμ±
13. λΉλ°λ²νΈ μνΈνλ₯Ό μν μ€μ  νμΌ μμ± λ° μμ±
	1. pom.xml
		- Spring Security λΌμ΄λΈλ¬λ¦¬ λ±λ‘ (Maven)
	2. spring-security.xml
		- λΉλ°λ²νΈ μνΈν λκ΅¬ λ±λ‘ : BcryptPasswordEncoder
	3. web.xml
		- μ΅μμ Spring μ€μ  νμΌ κ²½λ‘ μ€μ  : spring-security.xml
14. λ‘κ·ΈμΈ μ λ¬΄ κ²μ¬λ₯Ό μν Interceptor μμ± ν λ±λ‘
	1. LoginInterceptor ν΄λμ€ μμ±
	2. servlet-context.xml
		- DispatcherServlet κ³Ό Controller μ¬μ΄μ νΉμ  μμ²­μ Interceptor λ₯Ό ν΅νλλ‘ μ€μ 
15. λΌμ΄μΌμ€ λ° .gitignore νμΌ μ€μ 
<br>

#### π μΆκ° λΌμ΄λΈλ¬λ¦¬ (Maven)
1. DB κ΄λ ¨ λΌμ΄λΈλ¬λ¦¬
	1. ojdbc6 (11.2.0.4) : DB μ μμ νμν Oracle JDBC Driver
	2. Spring JDBC (5.3.23) : Springμμ JDBC μ¬μ©ν  μ μκ² μ€μ 
	3. MyBatis (3.5.11) : SQL Mapper νλ μμν¬
	4. MyBatis Spring (1.3.2) : Springμμ MyBatis μ¬μ©ν  μ μκ² μ€μ 
	5. Commons DBCP (1.4) : Connection κ°μ²΄ μ¬νμ© κ°λ₯ν Connection Pool
2. Lombok (1.18.24) : Getter Β· Setter Β· μμ±μ λ±μ μ΄λΈνμ΄μμΌλ‘ μλ μμ±
3. Spring Security (5.7.3) : μ¬μ©μ μΈμ¦κ³Ό μ κ·Ό κΆν κ΄λ¦¬
	1. Spring Security Core
	2. Spring Security Web
	3. Spring Security Config
4. JSON κ΄λ ¨ λΌμ΄λΈλ¬λ¦¬
	1. JSON.simple (1.1.1) : JSON λ°μ΄ν° μ²λ¦¬
	2. Gson (2.10) : JSONμ μλ° μ€λΈμ νΈμ μ§λ ¬ν Β· μ­μ§λ ¬ν μ²λ¦¬
5. μ΄λ©μΌ μΈμ¦ κ΄λ ¨ λΌμ΄λΈλ¬λ¦¬
	1. JavaMail (1.4.7) : μ΄λ©μΌ λ°μ‘
	2. Spring Context Support (5.3.23) : Springμμ JavaMail μ¬μ©ν  μ μκ² μ€μ 
6. i'mport (0.2.22) : PG κ²°μ  μ°λ
<br>

#### π μΆκ° λΌμ΄λΈλ¬λ¦¬ (.jar)
1. JSTL 1.0 μ§μ λΌμ΄λΈλ¬λ¦¬
	1. Apache Standard Taglib 1.0 Compatibility (1.2.5)
	2. Apache Standard Taglib Implementation (1.2.5)
	3. Apache Standard Taglib 1.0 EL Support (1.2.5)
	4. Apache Standard Taglib Specification API (1.2.5)