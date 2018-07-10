
package com.bds.milkana.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.bds.milkana.model.common.UserSession;




public abstract class BaseAction {
	private static Logger logger = Logger.getLogger(BaseAction.class);

	/**
	 * 得到ModelAndView
	 */
	public ModelAndView getModelAndView() {
		return new ModelAndView();
	}

	/**
	 * 得到request对象
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();

		return request;
	}

	public UserSession getUserSession(HttpServletRequest request) {
		UserSession us = null;
		Object session = request.getSession().getAttribute(UserSession.sessionKey);
		if (session != null) {
			us = (UserSession) session;
			return us;
		} else
			return null;

	}

	public String parseJson(Object obj) {
		String json = JSON.toJSONString(obj, SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullStringAsEmpty);
		return json;
	}

	public String parseDateJson(Object obj) {
		String json = JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd", SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullStringAsEmpty, SerializerFeature.WriteDateUseDateFormat);
		return json;
	}

	public String parseTimeJson(Object obj) {
		String json = JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd HH:mm:ss", SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullStringAsEmpty, SerializerFeature.WriteDateUseDateFormat);
		return json;
	}
}
