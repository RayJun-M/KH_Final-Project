package com.urfavoriteott.ufo.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.urfavoriteott.ufo.member.model.dao.MemberDao;
import com.urfavoriteott.ufo.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}
	
	@Override
	public int insertMember(Member m) {
		
		return memberDao.insertMember(sqlSession, m);
		
	}
	
	@Override
	public int idCheck(String checkId) {
		
		return memberDao.idCheck(sqlSession, checkId);
	}
	
	@Override
	public int passwordUpdate(Member m) {
		
		return memberDao.passwordUpdate(sqlSession, m);
	}
	
	@Override
	public int nicknameCheck(String checkNickname) {
		
		return memberDao.nicknameCheck(sqlSession, checkNickname);
	}

	@Override
	public int updateMember(Member m) {
		
		return memberDao.updateMember(sqlSession, m);
	}
	
	@Override
	public int deleteMember(int userNo) {
		
		return memberDao.deleteMember(sqlSession, userNo);
	}
	
	@Override
	public String getAccessToken (String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
            
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
            
			sb.append("&client_id=70777bd61209002dcf057ee5cc50c3a4"); //본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8282/urfavoriteott/kakaoLogin"); // 본인이 설정한 주소
            
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
            
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
            
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
            
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
            
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
            
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
            
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}
	
	// 메서드 리턴타입 KakaoDTO로 변경 및 import.
	@Override
	public Member getUserInfo(String access_Token) {
			HashMap<String, Object> userInfo = new HashMap<String, Object>();
			String reqURL = "https://kapi.kakao.com/v2/user/me";
			try {
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");
				conn.setRequestProperty("Authorization", "Bearer " + access_Token);
				int responseCode = conn.getResponseCode();
				System.out.println("responseCode : " + responseCode);
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = "";
				String result = "";
				while ((line = br.readLine()) != null) {
					result += line;
				}
				System.out.println("response body : " + result);
				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(result);
				JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
				JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
				String nickname = properties.getAsJsonObject().get("nickname").getAsString();
				String email = kakao_account.getAsJsonObject().get("email").getAsString();
				userInfo.put("nickname", nickname);
				System.out.println("카카오 닉네임 값 : " + nickname);
				userInfo.put("email", email);
				System.out.println("카카오 이메일 값 : " + email);
			} catch (IOException e) {
				e.printStackTrace();
			}

			// catch 아래 코드 추가.
			Member result = memberDao.findkakao(sqlSession, userInfo);
			// 위 코드는 먼저 정보가 저장되있는지 확인하는 코드.
			System.out.println("S:" + result);
			if(result==null) {
			// result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
				memberDao.kakaoinsert(sqlSession, userInfo);
				// 위 코드가 정보를 저장하기 위해 Repository로 보내는 코드임.
				return memberDao.findkakao(sqlSession, userInfo);
				// 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
				//  result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
			} else {
				return result;
				// 정보가 이미 있기 때문에 result를 리턴함.
			}
	        
		}


	
}
