package com.bds.milkana.action;

import com.bds.milkana.model.TUser;
import com.bds.milkana.model.common.Result;
import com.bds.milkana.service.UserService;
import com.bds.milkana.utils.Const;
import com.bds.milkana.utils.CookieUtils;
import com.bds.milkana.utils.DESUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.Charset;

@Controller
public class UserController extends BaseAction {
	private static final org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(UserController.class);

	@Autowired
	UserService userService;

	@RequestMapping(value = "/service/user/loginto", method = RequestMethod.POST)
	@ResponseBody
	public Result login(HttpServletRequest httpRequest, HttpServletResponse httpResponse, String username,
			String password) throws IOException {
		Result ret = new Result();
		try {
			ret = userService.login(httpRequest, username, password);
			if (ret.getCode().equals(Const.SUC)) {
				ret.setCode(Const.SUC);
				ret.setData(ret.getData());

				TUser u = (TUser) ret.getData();
				CookieUtils.addCookie("bds_milkana_username", u.getUsername(), httpRequest.getServerName(), 691200, "/",
						httpResponse);
				Long uid = u.getId();
				Charset CHARSET = Charset.forName("utf-8");
				String encryptResult = DESUtil.encrypt(uid + "", CHARSET, Const.DESKEY);
				CookieUtils.addCookie("bds_milkana_token", encryptResult, httpRequest.getServerName(), 691200, "/",
						httpResponse);
				return ret;
			} else {
				ret.setCode(Const.FAIL);
			}
		} catch (Exception e) {
			LOGGER.error("用户登录异常", e);
			ret.setResult(Const.FAIL, "用户登录异常");
		}
		return ret;

	}

	@RequestMapping(value = "/service/user/signUp", method = RequestMethod.POST)
	@ResponseBody
	public Result signUp(HttpServletRequest httpRequest, HttpServletResponse httpResponse, String username,
			String password) throws IOException {
		Result ret = new Result();
		try {
			if (username == null || username.equals("") || password == null || password.equals("")) {
				ret.setResult(Const.FAIL, "请填写完整信息");
				return ret;
			}
			ret = userService.signUp(httpRequest, username, password);
		} catch (Exception e) {
			LOGGER.error("用户注册异常", e);
			ret.setResult(Const.FAIL, "用户注册异常");
		}
		return ret;

	}

	// 退出登陆
	@RequestMapping(value = "/service/user/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest httpRequest, HttpServletResponse httpResponse) throws IOException {
		// Result ret = new Result();
		// ret.setResult("已退出", "ss");
		httpRequest.getSession().invalidate();
		return "redirect:/login.html";
	}

	// 修改个人信息
	@RequestMapping(value = "/service/user/update", method = RequestMethod.POST)
	@ResponseBody
	public Result updateUserinfo(HttpServletRequest httpRequest, String username, String password, String phone_number,
			String email,String historyPassword) throws IOException {
		Result ret = new Result();

		ret = userService.updatePassword(username,password,historyPassword);
//		boolean r = userService.updateUserInfo(username, password, phone_number, email);
//		if (r) {
//			ret.setCode(Const.SUC);
//		} else {
//			ret.setCode(Const.FAIL);
//		}
		return ret;
	}

}
