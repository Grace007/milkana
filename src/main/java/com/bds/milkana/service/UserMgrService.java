package com.bds.milkana.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.nutz.dao.Chain;
import org.nutz.dao.Cnd;
import org.nutz.dao.impl.NutDao;
import org.nutz.dao.pager.Pager;
import org.nutz.dao.sql.Criteria;
import org.springframework.stereotype.Service;

import com.bds.milkana.model.TUser;
import com.bds.milkana.model.common.Page;
import com.bds.milkana.model.common.Result;
import com.bds.milkana.utils.Const;
import com.bds.milkana.utils.MD5Util;

/**
 * @author kevin
 * @date 2018/2/5
 */
@Service
public class UserMgrService {

	private final Logger logger = Logger.getLogger(UserMgrService.class);
	@Resource
	private NutDao dao;

	public Page getQueryList(Integer pageNum, Integer pageSize, String username, String role) {
		Pager pager = dao.createPager(pageNum, pageSize);
		Criteria cri = Cnd.cri();
		cri.where().and("status", "=", 1);
		if (StringUtils.isNotEmpty(username)) {
			cri.where().and("username", "like", "%" + username + "%");
		}
		if (StringUtils.isNotEmpty(role)) {
			cri.where().and("username", "=", role);
		}
		List<TUser> list = dao.query(TUser.class, cri, pager);
		int count = dao.count(TUser.class, cri);
		Page p = new Page(count, pager.getPageNumber(), pager.getPageSize());
		p.setCode(Const.SUC);
		p.setData(list);
		return p;
	}

	public boolean deleteById(int id) {
		boolean temp = false;
		try {
			dao.update(TUser.class, Chain.make("status", 3), Cnd.where("id", "=", id));
			temp = true;
		} catch (Exception e) {
			logger.error(e);
		}
		return temp;
	};

	public Result add(TUser user) {
		Result result = new Result();
		user.setCreate_time(new Date());
		user.setStatus(1);

		user.setPassword(MD5Util.MD5(user.getPassword()));
		try {
			dao.insert(user);
			result.setResult(Const.SUC, "添加成功");
		} catch (Exception e) {
			logger.error(e);
			result.setResult(Const.FAIL, "添加失败");
		}
		return result;
	};

	public Result queryById(int id) {
		Result result = new Result();
		TUser user = new TUser();
		try {
			user = dao.fetch(TUser.class, Cnd.where("id", "=", id).and("status", "=", "1"));
			result.setResult(Const.SUC, user);
		} catch (Exception e) {
			logger.error(e);
			result.setResult(Const.FAIL, user);
		}
		return result;
	};

	public Result update(TUser user) {
		Result result = new Result();
		try {
			user.setStatus(1);
			user.setPassword(null);
			user.setUpdate_time(new Date());
			dao.updateIgnoreNull(user);
			result.setResult(Const.SUC, "update success");
		} catch (Exception e) {
			logger.error(e);
			result.setResult(Const.FAIL, "update fail");
		}

		return result;
	}
}
