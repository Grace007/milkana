package com.bds.milkana.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bds.milkana.model.common.Page;
import com.bds.milkana.model.common.Result;
import com.bds.milkana.model.common.UserSession;
import com.bds.milkana.service.DataBackService;
import com.bds.milkana.utils.Const;

/**
 * @author eli
 * @date 2018/2/5 10:24
 */
@Controller
public class BackController extends BaseAction {
	private org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(BackController.class);

	@Resource
	private DataBackService dataBackService;

	@RequestMapping("/service/data/back/show")
	public String showList(Map<String, Object> map) {

		return "ftl/data_back";
	}

	@RequestMapping(value = "/service/data/back/list", method = RequestMethod.GET)
	@ResponseBody
	public Page queryList(HttpServletRequest request, HttpServletResponse response, Integer pageNum, Integer pageSize) {
		Page ret = new Page();
		try {
			UserSession u = this.getUserSession(request);
			ret = dataBackService.queryList(pageNum, pageSize, "", u.getUser_name());

		} catch (Exception e) {
			ret.setCode(Const.FAIL);
			LOGGER.error("", e);
		}
		return ret;
	}

	@RequestMapping(value = "/service/data/back/create", method = RequestMethod.POST)
	@ResponseBody
	public Result create(HttpServletRequest request, HttpServletResponse response, String name, String remark) {
		Result ret = new Result();
		try {
			Long user_id = this.getUserSession(request).getUser_id();
			ret = dataBackService.create(user_id, name, remark);

		} catch (Exception e) {
			ret.setCode(Const.FAIL);
			LOGGER.error("", e);
		}
		return ret;
	}

	@RequestMapping(value = "/service/data/back/apply", method = RequestMethod.POST)
	@ResponseBody
	public Result apply(HttpServletRequest request, HttpServletResponse response, Long id) {
		Result ret = new Result();
		try {
			UserSession u = this.getUserSession(request);
			ret = dataBackService.apply(u.getUser_id(), id);

		} catch (Exception e) {
			ret.setCode(Const.FAIL);
			LOGGER.error("", e);
		}
		return ret;
	}

	@RequestMapping(value = "/service/data/back/delete", method = RequestMethod.POST)
	@ResponseBody
	public Result delete(HttpServletRequest request, HttpServletResponse response, Long id) {
		Result ret = new Result();
		try {
			Long user_id = this.getUserSession(request).getUser_id();
			ret = dataBackService.delete(user_id, id);

		} catch (Exception e) {
			ret.setCode(Const.FAIL);
			LOGGER.error("", e);
		}
		return ret;
	}

}
