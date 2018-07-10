package com.bds.milkana.action;

import com.bds.milkana.model.TUser;
import com.bds.milkana.model.common.UserSession;
import com.bds.milkana.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class IndexController extends BaseAction {
	// 默认每10mb生成一个log文件
	Logger log = LoggerFactory.getLogger(getClass());
	// @Value("${application.hello:Hello Angel}")

	@Autowired
	private UserService userService;

	@RequestMapping("/")
	public String index(Map<String, Object> map, HttpServletRequest request) {

		// 判断是否登陆
		if (getUserSession(request) != null) {
			UserSession userSession = getUserSession(request);

			map.put("username", userSession.getUser_name());
			return "/service/company/showlist";
		}
		return "redirect:login.html";
	}

	@RequestMapping("/user/lock")
	public String lock(Map<String, Object> map, HttpServletRequest request) {
		TUser user = userService.getCurrentUserInfoBySession(request);
		String username = user.getUsername();
		String email = user.getEmail();
		if (username == null) {
			username = "";
		}
		if (email == null) {
			email = "";
		}

		map.put("username", username);
		map.put("email", email);
		return "ftl/lock";
	}

	// 个人信息
	@RequestMapping("/service/user/user_profile")
	public String analyticsExtra_profile(Map<String, Object> map, HttpServletRequest request) {
		TUser user = userService.getCurrentUserInfoBySession(request);
		String username = user.getUsername();
		String phone_number = user.getPhone();
		String email = user.getEmail();
		if (username == null) {
			username = "";
		}
		if (phone_number == null) {
			phone_number = "";
		}
		if (email == null) {
			email = "";
		}

		map.put("username", username);
		map.put("phone_number", phone_number);
		map.put("email", email);
		return "ftl/user_profile";
	}

	// 密码
	@RequestMapping("/service/user/user_pass")
	public String user_pwd(Map<String, Object> map, HttpServletRequest request) {
		TUser user = userService.getCurrentUserInfoBySession(request);
		String username = user.getUsername();
		String phone_number = user.getPhone();
		String email = user.getEmail();
		if (username == null) {
			username = "";
		}
		if (phone_number == null) {
			phone_number = "";
		}
		if (email == null) {
			email = "";
		}

		map.put("username", username);
		map.put("phone_number", phone_number);
		map.put("email", email);
		return "ftl/user_pass";
	}

}
