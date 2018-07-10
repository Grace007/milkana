package com.bds.milkana.service;

import com.bds.milkana.model.TCompany;
import com.bds.milkana.model.TUser;
import com.bds.milkana.model.common.Result;
import com.bds.milkana.model.common.UserSession;
import com.bds.milkana.utils.Const;
import com.bds.milkana.utils.CookieUtils;
import com.bds.milkana.utils.MD5Util;
import org.apache.commons.lang.StringUtils;
import org.nutz.dao.Chain;
import org.nutz.dao.Cnd;
import org.nutz.dao.Condition;
import org.nutz.dao.impl.NutDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by guoyu on 2018/1/29.
 */
@Service
public class UserService {
	private org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(UserService.class);
	@Resource
	private NutDao dao;

	public Result updatePassword(String username,String password,String historyPassword){
		Result result = new Result();
		result.setResult(Const.FAIL,"update password fail");
		TUser tUser =null;
		Condition c = Cnd.where("username", "=", username).and("password", "=", MD5Util.MD5(historyPassword))
				.and("status", "=", 1);
		tUser = dao.fetch(TUser.class, c);
		if (tUser != null){
			tUser.setPassword(MD5Util.MD5(password));
			dao.update(tUser);
			result.setResult(Const.SUC,"update password success");
		}
		return result;

	}


	public Result login(HttpServletRequest request, String username, String password) {
		Result ret = new Result();
		TUser u = null;

		try {
			HttpSession session = request.getSession();

			session.setAttribute(Const.SESSION_USERNAME, username);
			String session_id = session.getId();

			if (password == null || password.equals("")) {
				u = getCurrentUserInfo(request);
			} else {
				Condition c = Cnd.where("username", "=", username).and("password", "=", MD5Util.MD5(password))
						.and("status", "=", 1);
				u = dao.fetch(TUser.class, c);
			}
			if (u != null) {

				// 0:待审批
				// 1:正常
				// 2:审批不通过
				// 3:禁用
				dao.update(TUser.class, Chain.make("session_id", session_id), Cnd.where("id", "=", u.getId()));
				UserSession userSession = new UserSession(u);
				List<TCompany> tcompanyList = dao.query(TCompany.class,
						Cnd.where("status", "=", 1).asc("id"));
				
				if (tcompanyList != null && tcompanyList.size() > 0) {
					userSession.setCompany_id(tcompanyList.get(0).getCompany_id());
				} else {
					userSession.setCompany_id(0+"");
				}
				request.getSession().setAttribute(UserSession.sessionKey, userSession);
				ret.setData(u);
				ret.setResult(Const.SUC, "登陆成功");
			} else {
				ret.setResult(Const.FAIL, "用户或者密码错误");
			}
		} catch (Exception e) {
			ret.setResult(Const.FAIL, "检查用户名密码出错");
			LOGGER.error("检查用户名密码出错", e);

		}
		ret.setData(u);
		return ret;
	}

	public Result signUp(HttpServletRequest request, String username, String password) {
		Result ret = new Result();
		TUser u = null;

		try {
			Condition c = Cnd.where("username", "=", username).and("status", "=", 1);
			u = dao.fetch(TUser.class, c);

			if (u == null) {
				u = new TUser();

				u.setCreate_time(new Date());
				u.setStatus(1);
				u.setRole("user");
				u.setUsername(username);
				u.setPassword(MD5Util.MD5(password));

				dao.insert(u);

				ret.setResult(Const.SUC, "注册成功");
			} else {
				ret.setResult(Const.FAIL, "用户已存在");
			}
		} catch (Exception e) {
			ret.setResult(Const.FAIL, "注册异常");
			LOGGER.error("注册异常", e);

		}
		return ret;
	}

	private TUser getCurrentUserInfo(HttpServletRequest request) {
		TUser user = null;

		try {
			Cookie[] cookies = request.getCookies();
			if (cookies == null || cookies.length == 0) {
				return user;
			}

			for (int i = 0; i < cookies.length; ++i) {
				if ("username".equalsIgnoreCase(cookies[i].getName())) {
					String key = cookies[i].getValue();
					if (!StringUtils.isEmpty(key)) {
						Condition c = Cnd.where("username", "=", key).and("status", "=", 1);
						user = dao.fetch(TUser.class, c);
						if (user != null) {
							return user;
						}
					}
				}
			}
		} catch (Exception e) {
			// logger.error(var6.getMessage(), new Throwable(var6));
		}

		return user;
	}

	// 根据session获取
	public TUser getCurrentUserInfoBySession(HttpServletRequest request) {
		TUser user = null;
		Cookie cookie = CookieUtils.getCookieByName(request, "bds_milkana_username");
		String key = cookie.getValue();
		if (!StringUtils.isEmpty(key)) {
			Condition c = Cnd.where("username", "=", key).and("status", "=", 1);
			user = dao.fetch(TUser.class, c);
			if (user != null) {
				return user;
			}
		}
		return user;
	}

	// 修改个人信息
	public boolean updateUserInfo(String username, String password, String phone_number, String email) {
		try {
			// 改资料
			if (password == null) {
				dao.update(TUser.class, Chain.make("phone", phone_number).add("email", email),
						Cnd.where("username", "=", username));
			} else { // 改密码
				dao.update(TUser.class, Chain.make("password", MD5Util.MD5(password)),
						Cnd.where("username", "=", username));
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
