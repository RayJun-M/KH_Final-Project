package com.urfavoriteott.ufo.member.controller;

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

import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.common.template.Pagination;
import com.urfavoriteott.ufo.member.model.service.MemberService;
import com.urfavoriteott.ufo.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	// 비밀번호 암호화를 위한 변수
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
		
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
}
