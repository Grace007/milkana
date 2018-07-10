package com.bds.milkana.filter;

import com.bds.milkana.action.BaseAction;
import com.bds.milkana.model.TCompany;
import com.bds.milkana.model.TUser;
import com.bds.milkana.model.common.UserSession;
import com.bds.milkana.utils.Const;
import com.bds.milkana.utils.CookieUtils;
import com.bds.milkana.utils.DESUtil;
import org.apache.commons.lang.StringUtils;
import org.nutz.dao.Cnd;
import org.nutz.dao.impl.NutDao;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Set;



public class SessionInterceptor extends BaseAction implements HandlerInterceptor {
	private Set<String> writeUrls;
	private NutDao dao;

	public SessionInterceptor(NutDao dao) {
		this.dao = dao;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		boolean pass = false;

		String path = request.getServletPath();

		UserSession user = getUserSession(request);

		if (user != null) {
			path = path.substring(1, path.length());
			return true;
		} else {

			// 不需要登录验证
			if (writeUrls != null) {
				for (String url : writeUrls) {
					if (path.matches(url)) {
						pass = true;
					}
				}
			}

			if (pass) {
				return true;
			} else {

				try {
					Cookie cookie = CookieUtils.getCookieByName(request, "bds_milkana_token");
					if (cookie != null) {
						String token = cookie.getValue();
						Charset CHARSET = Charset.forName("utf-8");
						String ret = DESUtil.decrypt(token, CHARSET, Const.DESKEY);
						if (StringUtils.isNotEmpty(ret)) {
							TUser u = dao.fetch(TUser.class, Cnd.where("id", "=", ret));
							List<TCompany> tcompanyList = dao.query(TCompany.class,
									Cnd.where("status", "=", 1).asc("id"));
							if (u != null) {
								UserSession userSession = new UserSession(u);
								if (tcompanyList != null && tcompanyList.size() > 0) {
									userSession.setCompany_id(tcompanyList.get(0).getCompany_id());
								} else {
									userSession.setCompany_id(0+"");
								}
								request.getSession().setAttribute(UserSession.sessionKey, userSession);
								return true;
							} else {
								pass = false;
							}
						} else {
							pass = false;
						}

					} else {
						pass = false;
					}
				} catch (Exception e) {
					e.printStackTrace();
					pass = false;

				}
				if (pass) {
					return true;
				} else {
					String context = request.getContextPath();
					response.sendRedirect(context + "/login.html");
					return false;
				}

			}
		}

	}

	@Override
	public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
			Object o, Exception e) throws Exception {

	}

	public Set<String> getWriteUrls() {
		return writeUrls;
	}

	public void setWriteUrls(Set<String> writeUrls) {
		this.writeUrls = writeUrls;
	}

}
