package kr.co.project.common.access;

import javax.servlet.http.HttpSession;

public class LoginCheck {

	public static boolean loginCheck(HttpSession session) {
		Integer memberIdx = (Integer) session.getAttribute("no");
		
		if(memberIdx == null) {
			return false;
		} else {
			return true;
		}
	}
}