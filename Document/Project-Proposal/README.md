# 🛸 <span style="color: #64ffda;">프로젝트 기획 과정</span> 🛸
<br>

## 🧩 프로젝트 기획 과정 링크

- [2022-11-18 (금) : 유사 사이트 분석](https://github.com/RayJun-M/KH_Final-Project/blob/main/Document/Project-Proposal/Analysis_Similar-Websites.png)
- [2022-11-18 (금) : 전체 기능 설계](https://github.com/RayJun-M/KH_Final-Project/blob/main/Document/Project-Proposal/Functional-Design.png)
- [2022-11-22 (화) : 전체 기능 설계 확정](https://github.com/RayJun-M/KH_Final-Project/blob/main/Document/Project-Proposal/Functional-Design_Feedback.png)
- [2022-11-22 (화) : 기능 구현 업무 분담](https://github.com/RayJun-M/KH_Final-Project/blob/main/Document/Project-Proposal/Function-Implementation_Role.png)
- [2022-11-23 (수) : 유스케이스 다이어그램](https://github.com/RayJun-M/KH_Final-Project/blob/main/Document/Project-Proposal/Use-Case-Diagram.jpg)
- [2022-11-23 (수) : ERD](https://github.com/RayJun-M/KH_Final-Project/blob/main/Document/Project-Proposal/ERD.png)
- [2022-11-25 (금) : DB 테이블 기술서](https://github.com/RayJun-M/KH_Final-Project/blob/main/Document/Project-Proposal/DB-Table_Description.pdf)
<br><br>

### 프로젝트 기획
1. 유사 사이트 분석
	- OTT 서비스
		- [NETFLIX](https://www.netflix.com/kr/)
		- [TVING](https://www.tving.com/onboarding)
		- [Wavve](https://www.wavve.com/index.html)
	- 커뮤니티 서비스
		- [WATCHA PEDIA](https://pedia.watcha.com/ko-KR)
2. 전체 기능 구상 (실제 구현 가능 여부 조사)
	- 간편 로그인 API : Kakao
	- 메일 인증 API
	- 정기 결제 API
	- IFrame Player API : YouTube
		- 시청 기록 : 재생 시간 확인 가능
3. 전체 기능 설계
	- 메인 화면
	- 회원 서비스
	- 콘텐츠 서비스
	- 커뮤니티 서비스
	- 고객센터
	- 관리자
4. 웹 사이트명 선정 : UFO (Ur Favorite OTT)
5. 프로젝트 팀명 선정 : 3.T. (3 Team · E.T.)
6. 웹 사이트 컨셉 및 테마 색상 선정 : 우주 · 민트(#64ffda)
7. 11/22 (화) : 전체 기능 컨펌
	- 카카오 간편 로그인 · 가입 : 필수 기능 모두 구현 후 추가적인 기능으로 보류 추천
	- 이용권 결제 : DB 일반/정기 분리 | 영수증 이메일 발송 기능 구현 추천
	- 고객센터 : 아이디가 따로 없으므로 이메일 주소 잊어버린 경우 안내 필수
	- 회원 관리 : 회원 탈퇴 기능 회원과 관리자 모두 가능하게 구현
	- 콘텐츠 관리 : 용량 큰 파일은 외부 DB 데이터 사용 (우리 DB에는 해당 주소 저장)
	- 콘텐츠 관리 : 파일 제외한 데이터의 수정 포함한 CRUD 화면 및 기능 구현
	- 신고 관리 : 신고 내역 외에도 커뮤니티와 별점·코멘트 조회/삭제 기능 구현
8. 전체 기능 설계 확정
	1. 회원 서비스
		- 로그인 : 일반 로그인 · 카카오 간편 로그인
		- 회원가입 : 일반 회원가입 · 카카오 간편 가입
		- 로그인 · 마이 페이지 : 비밀번호 재설정
		- 마이 페이지 : 내 정보 조회 · 수정 · 탈퇴
		- 마이 페이지 : 시청 내역 조회 · 삭제
		- 마이 페이지 : 콘텐츠 찜 목록 조회 · 삭제
		- 마이 페이지 : 내 별점/코멘트 조회 · 삭제
		- 마이 페이지 : 내 커뮤니티 글 조회 · 삭제 | 내 커뮤니티 댓글 조회 · 삭제
		- 마이 페이지 : 이용권 내역 조회 · 해지
	2. 콘텐츠 서비스
		- 콘텐츠 조회 · 검색 · 필터 · 정렬 · 시청 · 찜 | 콘텐츠 회차/시리즈 조회 · 필터 · 정렬
		- 별점/코멘트 조회 · 등록 · 수정 · 삭제 · 신고
		- 한 달 이용권 결제 | 월간 이용권 결제
	3. 커뮤니티 서비스
		- 커뮤니티 글 조회 · 검색 · 작성 · 수정 · 삭제 · 신고
		- 커뮤니티 댓글 조회 · 작성 · 수정 · 삭제 · 신고
	4. 고객센터 서비스
		- 1:1 문의 챗봇
		- FAQ 조회
		- 공지사항 조회
	5. 관리자
		- 회원 관리 : 회원 조회 · 검색 · 비밀번호 초기화 · 탈퇴 처리
		- 콘텐츠 관리 : 콘텐츠 조회 · 검색 · 필터 · 정렬 · 등록 · 수정 · 삭제
		- 별점/코멘트 관리 : 별점/코멘트 조회 · 검색 · 신고 내역 조회 · 삭제
		- 이용권 관리 : 이용권 결제 내역 조회 · 검색 · 필터 · 해지
		- 커뮤니티 관리 : 커뮤니티 글/댓글 조회 · 검색 · 신고 내역 조회 · 삭제
		- 고객센터 관리 : 공지사항 조회 · 작성 · 수정 · 삭제
		- 통계 관리 : 매출 통계 조회 · 필터 | 조회수 통계 조회 · 필터
9. 기능 구현 업무 분담
	- 한다은 : 콘텐츠 · 챗봇
	- 김수빈 : 별점/코멘트
	- 박성현 : 이용권
	- 신동민 : 회원 · 고객센터
	- 장희연 : 회원 · 통계
	- 황혜진 : 커뮤니티
10. 유스케이스 다이어그램 작성
11. ERD 작성
12. DB 테이블 기술서 작성