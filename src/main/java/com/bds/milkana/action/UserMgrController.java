package com.bds.milkana.action;

import com.bds.milkana.model.TUser;
import com.bds.milkana.model.common.Page;
import com.bds.milkana.model.common.Result;
import com.bds.milkana.service.UserMgrService;
import com.bds.milkana.utils.Const;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Controller
public class UserMgrController {
	private org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(UserMgrController.class);
	@Resource
	private UserMgrService userMgrService;

	@RequestMapping("/service/usermgr/showlist")
	public String showList(Map<String, Object> map) {
		return "ftl/user_mgr";
	}

	@RequestMapping(value = "/service/usermgr/getQueryList")
	@ResponseBody
	public Page getQueryList(HttpServletRequest request, HttpServletResponse response, Integer pageNum,
			Integer pageSize, String username, String role) throws Exception {
		Page page = new Page();
		try {
			page = userMgrService.getQueryList(pageNum, pageSize, username, role);
		} catch (Exception e) {
			page.setCode(Const.FAIL);
			LOGGER.error("", e);
		}
		return page;
	}

	@RequestMapping(value = "/service/usermgr/delete", method = RequestMethod.GET)
	@ResponseBody
	public Result deleteById(Map<String, Object> map, @RequestParam int id) {
		boolean temp = userMgrService.deleteById(id);
		Result result = new Result();
		result.setResult(Const.SUC, temp);
		return result;
	}

	@RequestMapping(value = "/service/usermgr/add", method = RequestMethod.POST)
	@ResponseBody
	public Result add(TUser user) {
		Result result = userMgrService.add(user);
		return result;
	}

	@RequestMapping(value = "/service/usermgr/queryById", method = RequestMethod.GET)
	@ResponseBody
	public Result queryById(@RequestParam int id) {
		Result result = userMgrService.queryById(id);
		return result;
	}

	@RequestMapping(value = "/service/usermgr/update", method = RequestMethod.POST)
	@ResponseBody
	public Result update(TUser user) {
		Result result = userMgrService.update(user);
		return result;
	}
}
