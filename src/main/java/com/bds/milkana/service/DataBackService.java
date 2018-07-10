package com.bds.milkana.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.nutz.dao.Chain;
import org.nutz.dao.Cnd;
import org.nutz.dao.Sqls;
import org.nutz.dao.entity.Record;
import org.nutz.dao.impl.NutDao;
import org.nutz.dao.pager.Pager;
import org.nutz.dao.sql.Criteria;
import org.nutz.dao.sql.Sql;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bds.milkana.model.TDataBack;
import com.bds.milkana.model.common.Page;
import com.bds.milkana.model.common.Result;
import com.bds.milkana.utils.Const;

/**
 * @author eli
 * @date 2018/2/5 10:27
 */
@Service
public class DataBackService {
	private final Logger logger = Logger.getLogger(DataBackService.class);
	@Resource
	private NutDao dao;

	private static SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");

	public List<TDataBack> getList() {
		List<TDataBack> list = dao.query(TDataBack.class, Cnd.where("status", "=", 1));
		return list;
	};

	public Page queryList(Integer pageNum, Integer pageSize, String name, String user_name) {
		Pager pager = dao.createPager(pageNum, pageSize);
		Criteria cri = Cnd.cri();
		cri.getOrderBy().asc("id");
		cri.where().and("status", "<>", 3);

		if (StringUtils.isNotEmpty(name)) {
			cri.where().and("name", "like", "%" + name + "%");
		}
		List<TDataBack> list = dao.query(TDataBack.class, cri, pager);

		for (TDataBack back : list) {
			back.setOp_user(user_name);
		}

		int count = dao.count(TDataBack.class, cri);
		Page p = new Page(count, pager.getPageNumber(), pager.getPageSize());
		p.setCode(Const.SUC);
		p.setData(list);

		return p;
	};

	public JSONArray getTableStruct(String table) {

		JSONArray arry = new JSONArray();
		List<Record> rlist = dao.query("INFORMATION_SCHEMA.COLUMNS", Cnd.where("TABLE_NAME", "=", table));

		if (rlist != null && rlist.size() > 0) {

			for (Record r : rlist) {
				JSONObject json = new JSONObject();
				String field = r.getString("column_name");
				String type = r.getString("data_type");
				json.put("column", field);
				json.put("type", type);
				if (!StringUtils.isEmpty(field) && field.equalsIgnoreCase("id")) {
					json.put("pk", true);
				} else {
					json.put("pk", false);
				}
				arry.add(json);
			}

		} else {
			return null;
		}

		return arry;
	}

	public Result create(Long user_id, String name, String remark) {
		String[] tables = { "t_chart_type_copy", "t_company_copy", "t_company_field_copy", "t_field_copy",
				"t_metadata_copy", "t_metadata_type_copy" };
		Result ret = new Result();
		try {

			StringBuffer insertSql = new StringBuffer();
			for (String table : tables) {
				List<Record> vs = dao.query(table, null);

				JSONArray arry = this.getTableStruct(table);
				for (Record re : vs) {
					StringBuffer colbuff = new StringBuffer("INSERT INTO " + table + "(");
					StringBuffer valbuff = new StringBuffer("(");

					for (int i = 0; i < arry.size(); i++) {
						JSONObject col = arry.getJSONObject(i);
						if (!col.getBooleanValue("pk")) {
							String field = col.getString("column");
							colbuff.append(field + ",");
							if (col.getString("type").equalsIgnoreCase("datetime")) {
								if (StringUtils.isEmpty(re.getString(field))) {
									valbuff.append(null + ",");
								} else {
									valbuff.append("'" + re.getString(field) + "',");
								}

							}

							else if (col.getString("type").equalsIgnoreCase("numeric")) {
								if (StringUtils.isEmpty(re.getString(field))) {
									valbuff.append(null + ",");
								} else {
									valbuff.append(re.getString(field) + ",");
								}
							} else if (col.getString("type").equalsIgnoreCase("varchar")
									|| col.getString("type").equalsIgnoreCase("nvarchar")) {
								if (StringUtils.isEmpty(re.getString(field))) {
									valbuff.append(null + ",");
								} else {
									valbuff.append("'" + re.getString(field) + "',");
								}
							}

							else {
								valbuff.append("'" + re.getString(field) + "',");
							}

						}

					}

					colbuff = colbuff.deleteCharAt(colbuff.length() - 1);
					valbuff = valbuff.deleteCharAt(valbuff.length() - 1);
					colbuff.append(")");
					valbuff.append(")");
					insertSql.append(colbuff.toString() + " VALUES " + valbuff.toString() + "\r\n");
				}
				insertSql.append("\r\n\r\n\r\n\r\n");

			}

			TDataBack back = new TDataBack();
			back.setCreate_time(new Date());
			back.setName(name);
			back.setStatus(1);
			back.setRemark(remark);
			back.setUser_id(user_id);
			back.setSql(insertSql.toString());
			dao.fastInsert(back);

			ret.setCode(Const.SUC);
			ret.setMsg("操作成功");
		} catch (Exception e) {
			logger.error("", e);
		}
		return ret;
	}

	public Result apply(Long user_id, Long id) {
		String[] tables = { "t_chart_type_copy", "t_company_copy", "t_company_field_copy", "t_field_copy",
				"t_metadata_copy", "t_metadata_type_copy" };

		Result ret = new Result();
		try {

			for (String table : tables) {

				dao.clear(table);
			}

			TDataBack back = dao.fetch(TDataBack.class, Cnd.where("id", "=", id));
			Sql sql = Sqls.create(back.getSql());
			dao.execute(sql);
			back.setRestore_time(new Date());
			back.setOp_user_id(user_id);
			back.setStatus(2);
			back.setUpdate_time(new Date());
			dao.updateIgnoreNull(back);
			ret.setCode(Const.SUC);
			ret.setMsg("操作成功");
		} catch (Exception e) {
			dao.update(TDataBack.class, Chain.make("status", 3).add("op_user_id", user_id).add("restore_time", new Date())
					.add("update_time", new Date()), Cnd.where("id", "=", id));

			logger.error("", e);
			ret.setCode(Const.FAIL);
			ret.setMsg("apply data failed");
		}
		return ret;
	}

	public Result delete(Long user_id, Long id) {

		Result ret = new Result();
		try {
			dao.update(TDataBack.class, Chain.make("status", 0).add("op_user", user_id).add("update_time", new Date()),
					Cnd.where("id", "=", id));
			ret.setCode(Const.SUC);
			ret.setMsg("操作成功");
		} catch (Exception e) {
			logger.error("", e);
			ret.setCode(Const.FAIL);
			ret.setMsg("delete failed");
		}
		return ret;
	}

}
