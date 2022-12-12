package com.urfavoriteott.ufo.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	// DispatcherServlet -> LoginInterceptor -> Controller (선처리용)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			                 Object handler) throws Exception {

		// Session 객체 생성
		HttpSession session = request.getSession();

		// 로그인 유무 검사
		if(session.getAttribute("loginUser") != null) {

			// 요청을 전달한 사용자가 로그인 상태라면 Controller 실행
			return true;
		}
		else {

			// "로그인 후 이용 가능한 서비스입니다." 알람 메세지 함께 전달
			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");

			// 응답 페이지 지정 (메인 페이지로 url 재요청)
			response.sendRedirect(request.getContextPath());

			// 요청을 전달한 사용자가 로그인 상태가 아니라면 Controller 실행하지 않음
			return false;
		}
	}
}