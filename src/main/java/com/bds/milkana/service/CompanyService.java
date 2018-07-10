package com.bds.milkana.service;

import com.bds.milkana.model.TCompany;
import com.bds.milkana.model.common.Page;
import com.bds.milkana.model.common.Result;
import com.bds.milkana.utils.Const;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.nutz.dao.Chain;
import org.nutz.dao.Cnd;
import org.nutz.dao.Sqls;
import org.nutz.dao.impl.NutDao;
import org.nutz.dao.pager.Pager;
import org.nutz.dao.sql.Criteria;
import org.nutz.dao.sql.Sql;
import org.nutz.dao.util.cri.Static;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author eli
 * @date 2018/2/5 10:27
 */
@Service
public class CompanyService {
	private final Logger logger = Logger.getLogger(CompanyService.class);
	@Resource
	private NutDao dao;

	private static SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");

	public List<TCompany> getList() {
		List<TCompany> list = dao.query(TCompany.class, Cnd.where("status", "=", 1));
		return list;
	};

	public Page queryList(Integer pageNum, Integer pageSize, String companyName, String establishment,String cheese) {
		Pager pager = dao.createPager(pageNum, pageSize);
		Criteria cri = Cnd.cri();

		cri.where().and("status", "=", 1);
		if (StringUtils.isNotEmpty(companyName)) {
			cri.where().and("company_name", "like", "%" + companyName + "%");
		}
		if (StringUtils.isNotEmpty(establishment)) {
			cri.where().and("establishment", "like", "%" + establishment + "%");
		}

		Sql sql = Sqls.create("");
		if (cheese!=null) {
			if (StringUtils.equals(cheese, "Yes")) {
				//cri.where().and("ISNULL(datalength (cheese),0) >0");
				cri.where().and(new Static("ISNULL(datalength (cheese),0) >0"));
			} else if (StringUtils.equals(cheese, "No")){
//				cri.where().and("cheese", "is", null).or("cheese","=","");
				cri.where().and(new Static("ISNULL(datalength (cheese),0) =0"));
			}
		}
		cri.getOrderBy().asc("id");

		List<TCompany> list = dao.query(TCompany.class, cri, pager);
		// List<TCompany> list = dao.query(TCompany.class,
		// Cnd.where("company_name","like","%"+keyword+"%").and("status","=",1),
		// pager);
		int count = dao.count(TCompany.class, cri);
		Page p = new Page(count, pager.getPageNumber(), pager.getPageSize());
		p.setCode(Const.SUC);
		p.setData(list);

		return p;
	};

	public boolean deleteById(int id) {
		boolean temp = false;
		try {
			dao.update(TCompany.class, Chain.make("status", 3), Cnd.where("id", "=", id));
			temp = true;
		} catch (Exception e) {
			logger.error(e);
		}
		return temp;
	};

	public TCompany queryById(Long id) {
		TCompany company = new TCompany();
		try {
			company = dao.fetch(TCompany.class, Cnd.where("id", "=", id).and("status", "=", "1"));
		} catch (Exception e) {
			logger.error(e);
		}
		return company;
	};
	public TCompany queryByCompanyId(String  company_id) {
		TCompany company = new TCompany();
		try {
			company = dao.fetch(TCompany.class, Cnd.where("company_id", "=", company_id).and("status", "=", "1"));
		} catch (Exception e) {
			logger.error(e);
		}
		return company;
	};

	public TCompany update(TCompany company) {
		TCompany companytemp = new TCompany();
		try {
			dao.update(TCompany.class,Chain.make("company_name",company.getCompany_name())
					.add("establishment",company.getEstablishment())
					.add("remark",company.getRemark())
					.add("cheese",company.getCheese())
					.add("update_time",new Date())
					,Cnd.where("id","=",company.getId()));
			companytemp = dao.fetch(TCompany.class, Cnd.where("id", "=", company.getId()));
			// result.setResult(Const.SUC, "update success");
		} catch (Exception e) {
			logger.error(e);
			// result.setResult(Const.FAIL, "update fail");
		}

		return companytemp;
	}

	public Result add(TCompany company) {

		/*
		 * Result result = new Result(); String timestr =
		 * simpleDateFormat.format(new Date()); int maxCompany =
		 * dao.getMaxId(TCompany.class); String maxid = String.format("%04",
		 * maxCompany); String company_id = "M" + timestr + maxid;
		 * company.setCreate_time(new Date()); company.setStatus(1);
		 * company.setUpdate_time(new Date());
		 * company.setCompany_id(company_id); try { dao.insert(company);
		 * result.setResult(Const.SUC, "添加成功"); } catch (Exception e) {
		 * logger.error(e); result.setResult(Const.FAIL, "添加失败"); } return
		 * result;
		 */
		Result result = new Result();
		String timestr = simpleDateFormat.format(new Date());
		String maxCompany = "";
		int maxid = dao.getMaxId(TCompany.class);
		maxCompany = Integer.toString(maxid);
		for (int i = maxCompany.length(); i < 4; i++) {
			maxCompany = "0" + maxCompany;
		}

		String company_id = "M" + timestr + maxCompany;
		company.setCreate_time(new Date());
		company.setStatus(1);
		company.setUpdate_time(new Date());
		company.setCompany_id(company_id);
		try {
			dao.insert(company);
			result.setResult(Const.SUC, "添加成功");
		} catch (Exception e) {
			logger.error(e);
			result.setResult(Const.FAIL, "添加失败");
		}
		return result;
	};

	public Page getCompanyList(Integer pageNum, Integer pageSize) {
		Pager pager = dao.createPager(pageNum, pageSize);
		Criteria cri = Cnd.cri();
		cri.getOrderBy().asc("id");
		cri.where().and("status", "=", 1);
		List<TCompany> list = dao.query(TCompany.class, cri, pager);
		int count = dao.count(TCompany.class, cri);
		Page p = new Page(count, pager.getPageNumber(), pager.getPageSize());
		p.setCode(Const.SUC);
		p.setData(list);

		return p;

	}

}
