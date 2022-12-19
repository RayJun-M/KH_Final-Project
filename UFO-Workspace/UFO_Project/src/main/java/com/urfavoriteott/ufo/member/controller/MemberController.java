package com.urfavoriteott.ufo.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.common.template.Pagination;
import com.urfavoriteott.ufo.contents.model.vo.Review;
import com.urfavoriteott.ufo.member.model.service.MemberService;
import com.urfavoriteott.ufo.member.model.vo.Member;
import com.urfavoriteott.ufo.member.model.vo.NaverLoginBO;


@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	/* NaverLoginBO */
	@Autowired
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	// 비밀번호 암호화를 위한 변수
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 이메일 인증을 위한 변수
	@Autowired
	private MailSendService mailService;
		
	/**
	 * 회원 로그인창을 띄워주는 메소드 - 작성자 : 동민
	 * 네이버 간편 로그인 화면 요청 메소드 - 작성자 : 장희연
	 * @return
	 */
	@RequestMapping("loginForm.me")
	public ModelAndView loginForm(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		// 네이버 로그인
		mv.addObject("naver_url", naverAuthUrl);
		
		mv.setViewName("member/userLogin");
		
		return mv;
	}
	
	/**
	 * 회원 로그인용 메소드 - 작성자 : 동민
	 * @param m : 로그인할 사용자의 계정 
	 * @param mv
	 * @param session
	 * @param saveId : 아이디 중복 체크용 아이디
	 * @param response
	 * @return
	 */
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m,
			                        ModelAndView mv,
			                        HttpSession session,
			                        String saveId,
			                        HttpServletResponse response) {
		
		
		
		if(saveId != null && saveId.equals("y")) {
			
			Cookie cookie = new Cookie("saveId", m.getUserId());
			cookie.setMaxAge(24 * 60 * 60 * 1); // 유효기간 1일
			response.addCookie(cookie);
		}
		else {
			
			Cookie cookie = new Cookie("saveId", m.getUserId());
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			
		}
		
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser != null &&
				bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			
			// 비밀번호도 일치한다면 => 로그인 성공
			session.setAttribute("loginUser", loginUser);
			
			// session.setAttribute("alertMsg", "로그인에 성공하였습니다.");
			
			System.out.println("로그인 성공");
			
			mv.setViewName("redirect:/");
			
		}
		else {
			
			// 로그인 실패
			mv.addObject("errorMsg", "로그인 실패");
			
			// /WEB-INF/views/common/errorPage.jsp
			mv.setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	/**
	 * 회원 로그아웃용 메소드 - 작성자 : 동민
	 * @param session
	 * @return
	 */
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		// 세션을 무효화하는 메소드 : session.invalidate();
		session.invalidate();
		
		// 메인페이지로 url 요청
		return "redirect:/";
		
	}
	
	/**
	 * 회원가입창을 띄워주는 메소드 - 작성자 : 동민
	 * @return
	 */
	@RequestMapping("userEnrollForm.me")
	public String enrollForm() {

		return "member/userEnroll";
		
	}
	
	/**
	 * 회원가입용 메소드 - 작성자 : 동민
	 * @param userId1 : 이메일 @ 앞주소
	 * @param userId2 : 이메일 @ 뒷주소
	 * @param userPwd : 사용자 비밀번호
	 * @param nickName : 사용자 닉네임
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("insert.me")
	public String insertMember(String userId1
							 , String userId2
							 , String userPwd
							 , String userNickname
			                 , Model model
			                 , HttpSession session) {
		
		// user 아이디 이메일 주소로 합치기
		String userId = userId1 + "@" + userId2;
		
		// 멤버 객체에 변수들 set
		Member m = new Member();
		m.setUserId(userId);
		m.setUserPwd(userPwd);
		m.setUserNickname(userNickname);
		
		// 암호화 작업 (암호문을 만들어내는 과정)
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPwd);
		
		int result = memberService.insertMember(m);
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 회원가입이 되었습니다.");
			
			return "redirect:/";
			
		}
		
		else { // 실패
			
			model.addAttribute("errorMsg", "회원가입 실패");
			
			return "common/errorPage";
			
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="idCheck.me", produces="text/html; charset=UTF-8")
	/**
	 * 아이디 중복체크용 메소드 - 작성자 : 동민
	 * @param checkId : 중복체크할 이메일 주소
	 * @return
	 */
	public String idCheck(String checkId) {
		
		int count = memberService.idCheck(checkId);
		
		// 삼항연산자 이용
		return (count > 0) ? "NNNNN" : "NNNNY";
		
		
	}
	
	/**
	 * 이메일 인증용 메소드 - 작성자 : 동민
	 * @param email : 인증할 이메일 주소
	 * @return
	 */
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}
	
	/**
	 * 회원 비밀번호 재설정 화면을 띄워주는 메소드 - 작성자 : 동민
	 * @return
	 */
	@RequestMapping("updatePasswordForm.me")
	public String updatePasswordForm() {
		
		return "member/userPasswordUpdate";
	}
  
	/**
	 * 회원 비밀번호 재설정 메소드 - 작성자 : 동민
	 * @param userId1 : 사용자 이메일 @ 앞주소(사용자 체크용)
	 * @param userId2 : 사용자 이메일 @ 뒷주소
	 * @param updatePwd : 변경할 비밀번호
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("updatePassword.me")
	public String updatePassword(String userId1
			                   , String userId2
			                   , String updatePwd
			                   , Model model
			                   , HttpSession session) {
		
		// user 아이디 이메일 주소로 합치기
		String userId = userId1 + "@" + userId2;
		
		// 멤버 객체에 변수들 set
		Member m = new Member();
		m.setUserId(userId);
		m.setUserPwd(updatePwd);
		
		// 암호화 작업 (암호문을 만들어내는 과정) => 비밀번호 재설정시 다시 재 암호화돼서 DB에 담기게 됨
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPwd);
		
		int result = memberService.passwordUpdate(m);
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "비밀번호가 성공적으로 변경되었습니다.");
			
			return "redirect:/";
			
		}
		
		else { // 실패
			
			session.setAttribute("alertMsg", "유효한 아이디인지 다시 확인해주세요.");
			
			return "redirect:updatePasswordForm.me";
			
		}
		
	}
  
  /**
	 * 카카오 로그인 메소드 - 작성자 : 동민
	 * @param code
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session) throws Exception {
		System.out.println("#########" + code);
		String access_Token = memberService.getAccessToken(code);
		Member userInfo = memberService.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		// System.out.println("###nickname#### : " + userInfo.get_name("nickname"));
		// System.out.println("###email#### : " + userInfo.get_UserId("email"));
	    
		// 아래 코드가 추가되는 내용
		// session.invalidate();
		// 위 코드는 session객체에 담긴 정보를 초기화 하는 코드.
		// session.setAttribute("kakaoN", userInfo.getUserNickname());
		session.setAttribute("alertMsg", "로그인에 성공하였습니다.");
		session.setAttribute("loginUser", userInfo);
		// 위 2개의 코드는 닉네임과 이메일을 session객체에 담는 코드
		// jsp에서 ${sessionScope.kakaoN} 이런 형식으로 사용할 수 있다.
	    
	    // 리턴값은 용도에 맞게 변경하세요~
		return "redirect:/";
   }
	
	/**
	 * 마이페이지 화면을 띄우는 메소드 - 작성자 : 장희연
	 * @return
	 */
	@RequestMapping("myPage.me")
	public String myPage() {
		
		return "member/myPage";
	}
	
	/**
	 * 회원정보 수정 화면을 띄우는 메소드 - 작성자 : 장희연
	 * @return
	 */
	@RequestMapping("updateForm.me")
	public String updateForm() {
		
		return "member/memberUpdateForm";
	}
	
	/**
     * 네이버 로그인 성공시 callback호출 메소드 - 작성자 : 장희연
     * @param model
     * @param code
     * @param state
     * @param session
     * @return
     * @throws IOException
     * @throws ParseException 
     */
    @RequestMapping("callback")
    public String callback(Model model, String code, String state, HttpSession session) throws IOException, ParseException {
        
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		// System.out.println("apiResult: " + apiResult);
		/** apiResult json 구조
		{"resultcode":"00",
		"message":"success",
		"response":{"id":"33666449","nickname":"****", "email":"bbbb@naver.com"}}
		**/
		
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response의 nickname, email값 파싱
		String userNickname = (String)response_obj.get("nickname");
		String userId = (String)response_obj.get("email");
		
		// System.out.println("userNickname:" + userNickname);
		// System.out.println("userId:" + userId);
		
		// 멤버 객체에 변수들 set
		Member m = new Member();
		m.setUserId(userId);
		m.setUserNickname(userNickname);
		
		// 네이버 간편로그인 정보 확인 - 정보가 존재하면 로그인 처리
		Member mem = memberService.findNaver(userId);
		
		if(mem == null) { // 해당 정보가 없음 => 정보를 DB에 저장
			
			int result = memberService.insertNaver(m);
			
			if(result > 0) { // 정보저장 성공
				
				mem = memberService.findNaver(userId); // 정보확인
				session.setAttribute("loginUser", mem);
				// session.setAttribute("alertMsg", "로그인에 성공하였습니다.");
				return "redirect:/";
			} else { // 정보저장 실패
				
				model.addAttribute("errorMsg", "로그인 실패");
				return "common/errorPage";
			}
		} else { // 해당 정보가 존재 => 정보에 해당하는 사용자를 return
			
			session.setAttribute("loginUser", mem);
			// session.setAttribute("alertMsg", "로그인에 성공하였습니다.");
	        return "redirect:/";
		}
    }
    
	
	/**
	 * 사용자 - 닉네임 중복체크용 메소드 - 작성자 : 장희연
	 * @param checkNickname : 중복체크할 사용자의 닉네임
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="nicknameCheck.me", produces="text/html; charset=UTF-8")
	public String nicknameCheck(String checkNickName) {
		
		int count = memberService.nicknameCheck(checkNickName);
		
		return (count > 0) ? "NNNNN" : "NNNNY";
	}
	
	/**
	 * 사용자 - 회원 정보 수정용 메소드 - 작성자 : 장희연
	 * @param m : 사용자의 수정할 회원 정보(아이디, 회원번호, 프로필, 닉네임)
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("update.me")
	public String updateMember(Member m, Model model, HttpSession session) {
		
		int result = memberService.updateMember(m);
		
		if(result > 0) {
			
			Member updateMem = memberService.loginMember(m);
			session.setAttribute("loginUser", updateMem);
			
			// session.setAttribute("alertMsg", "회원정보 수정 성공");
			return "redirect:/myPage.me";
		} else {
			
			model.addAttribute("errorMsg", "회원정보 수정 실패");
			return "common/errorPage";
		}
	}
	
	/**
	 * 사용자 - 마이페이지에서 비밀번호 변경 화면 띄우는 메소드 - 작성자 : 장희연
	 * @return
	 */
	@RequestMapping("myPageupdatePwdForm.me")
	public String updatePwdForm() {
		
		return "member/userPasswordUpdate";
	}
	
	/**
	 * 사용자 - 회원 탈퇴용 메소드 - 작성자 : 장희연
	 * @param userNo : 로그인한 사용자(탈퇴할 회원)의 회원 번호
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("delete.me")
	public String deleteMember(int userNo, String userPwd, Model model, HttpSession session) {
		
		String encPwd = ((Member)session.getAttribute("loginUser")).getUserPwd();
		
		// 비밀번호 대조작업
		if(bcryptPasswordEncoder.matches(userPwd, encPwd)) {
			
			// 비밀번호가 맞을 경우 => 탈퇴처리
			int result = memberService.deleteMember(userNo);
			
			if(result > 0) { // 탈퇴처리 성공
				
				// 로그아웃 처리후 일회성 알람 메세지 담기, 메인페이지로 url 재요청
				session.removeAttribute("loginUser"); // 로그인한 회원의 정보만 지우고 session은 살림
				session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다. 그동안 이용해주셔서 감사합니다.");
				
				return "redirect:/";
				
			} else { // 탈퇴처리 실패 => 에러문구를 담아서 에러페이지로 포워딩
				
				model.addAttribute("errorMsg", "회원 탈퇴 실패");
				
				return "common/errorPage";
			}
		} else {
			
			session.setAttribute("alertMsg", "비밀번호를 잘못 입력하였습니다. 확인해주세요.");
			return "redirect:/myPage.me";
		}
	}

  /**
	 * 마이 페이지 별점 및 코멘트 내역에서 사용할 페이징 바, 기본 접속 시 내가 쓴 전체 코멘트 조회 - 작성자 : 수빈
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@RequestMapping(value="myComment.me")
	public String selectMyCommentList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String loginUserNo, Model model) {
		
		// System.out.println("loginUserNo:" + loginUserNo);
		
		// int loginUser = Integer.parseInt(loginUserNo);
		//System.out.println(loginUser);
		
		int listCount = memberService.selectMyCommentListCount(loginUserNo);
		
		// System.out.println("listCount: " + listCount);
		
		int pageLimit = 10;
		int boardLimit = 10;
			
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Review> list = memberService.selectMyCommentList(pi, loginUserNo);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "member/myPageComment";
	}
	
	/**
	 * 마이 페이지 별점 및 코멘트 내역에서 선택된 리뷰 삭제 메소드 - 작성자: 수빈
	 * @param reviewNoArr
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="deleteComment.me", produces="application/json; charset=UTF-8")
	public int deleteMyComment(@RequestParam(value="reviewNoArr[]") List<String> reviewNoArr) {
		
		// System.out.println(reviewNoArr); // 체크박스에 담긴 리뷰 번호가 [4, 3] 와 같이 찍힘
		
		int result = 0;
		int checkNum = 0; // 리뷰번호는 1부터 시작함
		
		for(String str : reviewNoArr) {
			checkNum = Integer.parseInt(str);
			// System.out.println(checkNum); // 4, 3이 차례로 찍힘
			memberService.deleteMyComment(checkNum);
			result++;
		}
		
		return result;
	}
}
