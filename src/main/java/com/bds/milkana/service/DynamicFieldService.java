package com.bds.milkana.service;

import com.alibaba.fastjson.JSON;
import com.bds.milkana.model.TCompanyField;
import com.bds.milkana.model.TField;
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
import org.nutz.dao.sql.SqlCallback;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

/**
 * @author eli
 * @date 2018/2/22 18:27
 */
@Service
public class DynamicFieldService {
	private final Logger logger = Logger.getLogger(DynamicFieldService.class);
	@Resource
	private NutDao dao;

	public List<TField> getAllList() {
		List<TField> list = dao.query(TField.class, null);
		return list;
	};
	public List<TField> getAllListByorder(){

		Sql sql = Sqls.create("SELECT field_id from t_company_field");
		sql.setCallback(new SqlCallback() {
			@Override
			public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {
				List<String> list = new LinkedList<String>();
				while (rs.next())
					list.add(rs.getString("field_id"));
				return list;
			}
		});
		dao.execute(sql);
		List<String> front_list = sql.getList(String.class);
		List<String> result_list =new ArrayList<>();
		for (int i = 0; i < front_list.size(); i++) {
			if (!result_list.contains(front_list.get(i))){
				result_list.add(front_list.get(i));
			}
		}

//		logger.info("前:"+front_list);
//		logger.info("后:"+result_list);

		List<TField> list = new ArrayList<>();
		for (int i = 0; i < result_list.size(); i++) {
			TField field = dao.fetch(TField.class,Cnd.where("field_id","=",result_list.get(i)));
			if (field != null){
				list.add(field);
			}
		}

		//对比两个list的内容是否一致
//		Boolean temp = true;
		List<TField> field_list = dao.query(TField.class, null);
//		List<String> field_id_list = new ArrayList<>();
//		for (int i = 0; i < field_list.size(); i++) {
//			field_id_list.add(field_list.get(i).getField_id());
//		}
		if (field_list.size() != list.size()) {
			return field_list;
		}


		return list;
	}

	public TCompanyField getCompanyFieldByParam(String company_id,String field_id){
		TCompanyField companyField = dao.fetch(TCompanyField.class,Cnd.where("company_id","=",company_id).and("field_id","=",field_id));
		return companyField;
	}

	public TField getFieldById(int id) {
		TField field = dao.fetch(TField.class, Cnd.where("id", "=", id));
		return field;
	}

	public Page getFieldList(Integer pageNum, Integer pageSize) {
		Pager pager = dao.createPager(pageNum, pageSize);
		Criteria cri = Cnd.cri();

		cri.getOrderBy().desc("id");
		cri.where().and("status", "<>", 0);

		List<TField> list = dao.query(TField.class, cri, pager);
		int count = dao.count(TField.class, cri);

		Page p = new Page(count, pager.getPageNumber(), pager.getPageSize());
		p.setCode(Const.SUC);
		p.setData(list);

		return p;

	}

	// 改原数据
	public void update(TField field) {
		field.setUpdate_time(new Date());
		field.setStatus(1);
		dao.update(field);
	}

	public Result save(TField field) {
		Result ret = new Result();
		try {
			int maxid = dao.getMaxId(TField.class);
			field.setField_id("f" + maxid);
			field.setStatus(1);
			field.setUpdate_time(new Date());
			field.setCreate_time(new Date());
			dao.fastInsert(field);

			ret.setCode(Const.SUC);
		} catch (Exception e) {
			logger.error("", e);
		}
		return ret;

	}

	// 删除元数据
	public boolean deleteById(int id) {
		boolean temp = false;
		try {
			TField field = dao.fetch(TField.class,id);
			List<TCompanyField> companyFieldList = dao.query(TCompanyField.class,Cnd.where("field_id","=",field.getField_id()));
			dao.delete(TField.class, id);
			dao.delete(companyFieldList);
			temp = true;
		} catch (Exception e) {
			logger.error(e);
		}
		return temp;
	}

	// TcompanyField管理

	/**
	 * 保存TcompanyField管理
	 * 
	 * @param company_id
	 * @param field_data
	 * @return
	 */
	public boolean saveCompanyField(String company_id, String field_data) {
		Boolean temp = true;
		try {
			Map<String, String> maps = (Map) JSON.parseObject(field_data);
			for (String key : maps.keySet()) {
				String fid = dao.fetch(TField.class, Cnd.where("field_id", "=", key)).getField_id();
				TCompanyField companyField = new TCompanyField();
				companyField.setCompany_id(company_id);
				companyField.setCreate_time(new Date());
				companyField.setField_value(maps.get(key));
				companyField.setUpdate_time(new Date());
				companyField.setField_id(fid);
				dao.fastInsert(companyField);
			}
		} catch (Exception e) {
			temp = false;
		}

		return temp;
	}

	/**
	 * 根据company_id,field_id修改 t_company_field
	 * 
	 * @param company_id
	 * @param field_data
	 * @return
	 */
	public boolean updateCompanyField(String company_id, String field_data) {
		Boolean temp = true;
		try {
			Map<String, String> maps = (Map) JSON.parseObject(field_data);
			for (String key : maps.keySet()) {
				TCompanyField companyField = dao.fetch(TCompanyField.class,
						Cnd.where("company_id", "=", company_id).and("field_id", "=", key));
				if (companyField != null) {
					dao.update(TCompanyField.class,
							Chain.make("field_value", maps.get(key)).add("update_time", new Date()),
							Cnd.where("company_id", "=", company_id).and("field_id", "=", key));
				} else if (!StringUtils.isEmpty(maps.get(key))) {
					// 会出现一次更新，全部字段都更新
					TCompanyField companyFieldadd = new TCompanyField();
					companyFieldadd.setCompany_id(company_id);
					companyFieldadd.setCreate_time(new Date());
					companyFieldadd.setField_value(maps.get(key));
					companyFieldadd.setUpdate_time(new Date());
					companyFieldadd.setField_id(key);
					dao.fastInsert(companyFieldadd);
				}
			}
		} catch (Exception e) {
			temp = false;
		}
		return temp;
	}

	public List<TCompanyField> getCompanyField(String company_id) {
		List<TCompanyField> companyFieldList = dao.query(TCompanyField.class, Cnd.where("company_id", "=", company_id));
		for (int i = 0; i < companyFieldList.size(); i++) {

			TField field = dao.fetch(TField.class, Cnd.where("field_id", "=", companyFieldList.get(i).getField_id()));
			TCompanyField f = companyFieldList.get(i);
			f.setField_type(field.getField_type());
			f.setField(field);

		}
		return companyFieldList;
	}

	public List<TCompanyField> getCompanyByFids(String company_id, String[] fids) {
		List<TCompanyField> companyFieldList = dao.query(TCompanyField.class,
				Cnd.where("company_id", "=", company_id).and("field_id", "in", fids));
		for (int i = 0; i < companyFieldList.size(); i++) {
			TField field = dao.fetch(TField.class, Cnd.where("field_id", "=", companyFieldList.get(i).getField_id()));
			TCompanyField f = companyFieldList.get(i);
			f.setField_type(field.getField_type());
			f.setField(field);
		}
		return companyFieldList;
	}

}
