package com.urfavoriteott.urfavoriteott.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

<<<<<<< HEAD
import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.common.template.Pagination;
import com.urfavoriteott.ufo.member.model.service.MemberService;
import com.urfavoriteott.ufo.member.model.vo.Member;

=======
import com.urfavoriteott.urfavoriteott.common.model.vo.PageInfo;
import com.urfavoriteott.urfavoriteott.common.template.Pagination;
import com.urfavoriteott.urfavoriteott.member.model.service.MemberService;
import com.urfavoriteott.urfavoriteott.member.model.vo.Member;
>>>>>>> upstream/main

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	// 비밀번호 암호화를 위한 변수
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
<<<<<<< HEAD
	
	/**
	 * 회원 로그인창을 띄워주는 메소드 - 작성자 : 동민
	 * @return
	 */
	@RequestMapping("loginForm.me")
	public String loginForm() {
=======
		
	@RequestMapping("myPage.me")
	public String myPage() {
		
		return "member/myPage";
	}
	
	@RequestMapping("updateForm.me")
	public String updateForm() {
		
		return "member/memberUpdateForm";
	}
	
	@RequestMapping("loginForm.me")
	public String loginForm() {
		
>>>>>>> upstream/main
		return "member/userLogin";
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
			
<<<<<<< HEAD
			session.setAttribute("alertMsg", "로그인에 성공하였습니다.");
=======
			// session.setAttribute("alertMsg", "로그인에 성공하였습니다.");
			
			System.out.println("로그인 성공");
>>>>>>> upstream/main
			
			mv.setViewName("redirect:/");
			
		}
		else {
			
<<<<<<< HEAD
			mv.addObject("errorMsg", "로그인 실패");
			
=======
			// 로그인 실패
			mv.addObject("errorMsg", "로그인 실패");
			
			// /WEB-INF/views/common/errorPage.jsp
>>>>>>> upstream/main
			mv.setViewName("common/errorPage");
		}
		
		return mv;
		
<<<<<<< HEAD
		
=======
>>>>>>> upstream/main
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
		
<<<<<<< HEAD
		
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
		
	@RequestMapping("myPage.me")
	public String myPage() {
		
		return "member/myPage";
	}
	
	@RequestMapping("updateForm.me")
	public String updateForm() {
		
		return "member/memberUpdateForm";
	}
	
	
	/**
=======
	}
	
	/**
>>>>>>> upstream/main
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
	 * 관리자 - 회원 리스트 조회용 메소드 - 작성자 : 장희연
	 * @param currentPage : 요청한 페이지번호
	 * @param model
	 * @return
	 */
	@RequestMapping("admin_list.me")
	public String selectList(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model) {
		
		int listCount = memberService.selectListCount();
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Member> list = memberService.selectList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/adminMemberListView";
	}
	
	/**
	 * 관리자 - 회원 검색 조회용 메소드 - 작성자 : 장희연
	 * @param currentPage : 요청한 페이지번호
	 * @param keyword : 검색조건(아이디, 닉네임)
	 * @param searchword : 검색어
	 * @param model
	 * @return
	 */
	@RequestMapping("admin_search.me")
	public String selectSearchList(@RequestParam(value="cpage", defaultValue="1")int currentPage, String keyword, String searchword, Model model) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("searchword", searchword);
		
		int searchCount = memberService.selectSearchCount(map);
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Member> list = memberService.selectSearchList(map, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchword", searchword);
		
		return "admin/adminMemberListView";
	}
	
	/**
	 * 관리자 - 비밀번호 초기화용 메소드 - 작성자 : 장희연
	 * @param userNo : 비밀번호를 초기화할 회원의 회원번호
	 * @param model 
	 * @param session
	 * @return
	 */
	@RequestMapping("updatePwd.me")
	public String updatePwd(int userNo, Model model, HttpSession session) {
		
		int result = memberService.updatePwd(userNo);
		
		if(result > 0) {
			
			// session.setAttribute("alertMsg", "비밀번호 초기화 성공");
			return "redirect:/admin_list.me";
		} else {
			
			model.addAttribute("errorMsg", "비밀번호 초기화 실패");
			return "common/errorPage";
		}
	}
	
	/**
	 * 관리자 - 회원 탈퇴 처리용 메소드 - 작성자 : 장희연
	 * @param userNo : 탈퇴 처리할 회원의 회원번호
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("delete.me")
	public String deleteMember(int userNo, Model model, HttpSession session) {
		
		int result = memberService.deleteMember(userNo);
		
		if(result > 0) {
			
			// session.setAttribute("alertMsg", "회원 탈퇴 처리 성공");
			return "redirect:/admin_list.me";
		} else {
			
			model.addAttribute("errorMsg", "회원 탈퇴 처리 실패");
			return "common/errorPage";
		}
	}
}
