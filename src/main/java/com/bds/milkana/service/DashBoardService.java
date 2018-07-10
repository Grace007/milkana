package com.bds.milkana.service;

import com.bds.milkana.model.TChartXYS;
import com.bds.milkana.model.TCompany;
import com.bds.milkana.model.TMetadata;
import com.bds.milkana.model.TMetadataType;
import com.bds.milkana.utils.DoubleFormatUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.nutz.dao.Cnd;
import org.nutz.dao.Sqls;
import org.nutz.dao.entity.Record;
import org.nutz.dao.impl.NutDao;
import org.nutz.dao.sql.Sql;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

@Service
public class DashBoardService {

	private final Logger logger = Logger.getLogger(DashBoardService.class);
	@Resource
	private NutDao dao;

	public List<TCompany> getCompanyList() {
		List<TCompany> tcompanyList = dao.query(TCompany.class, Cnd.where("status", "=", 1).asc("id"));

		return tcompanyList;
	}

	public TCompany getCompanyInfo(String companyId) {
		TCompany tcompanyList = dao.fetch(TCompany.class,
				Cnd.where("status", "=", 1).and("company_id", "=", companyId));

		return tcompanyList;
	}

	public TChartXYS getTurnover(String company_id,String chart_type) {
		TChartXYS xys = new TChartXYS();
		try {
			List<String> indexs = this.getTurnoverIndex(company_id, chart_type);
			if (indexs == null || indexs.size() < 2) {
				return xys;
			}
			String bar = indexs.get(0);
			String line = indexs.get(1);
			String unit ="";

			try {
				unit = dao.fetch(TMetadataType.class,Cnd.where("chart_type", "=", chart_type).and("status", "=", 1).and("company_id", "=", company_id).and("metadata_type_id","=",bar)).getUnit();
				xys.setUnit(unit);
			} catch (Exception e) {
				//logger.error(e);
			}

			List<String> xs = new ArrayList<String>();

			List<Integer> years = this.getTurnoverYear(company_id);

			List<Record> rsBar = dao.query("t_metadata", Cnd.where("company_id", "=", company_id)
					.and("chart_type", "=",chart_type).and("metadata_type_id", "=", bar).and("status", "=", 1));

			List<Record> rsLine = dao.query("t_metadata", Cnd.where("company_id", "=", company_id)
					.and("chart_type", "=",chart_type).and("metadata_type_id", "=", line).and("status", "=", 1));


			Double[] ssBar = new Double[years.size()];
			Double[] ssLine = new Double[years.size()];
			for (int i = 0; i < years.size(); i++) {
				int y = years.get(i);

				double sbar = 0.0;

				double sline = 0.0;
				for (Record r : rsBar) {
					Integer year = r.getInt("year");
					Double val = r.getDouble("val");
					if (year != null && year.equals(y)) {

						sbar = val;
					}

				}

				for (Record r : rsLine) {
					Integer year = r.getInt("year");
					Double val = r.getDouble("val");
					if (year != null && year.equals(y)) {

						sline = val;
					}

				}
				ssBar[i] = sbar;
				ssLine[i] = sline;
				xs.add(y + "<br/>" + DoubleFormatUtil.formatDecimal(sline,"##0.0")+"%");
			}
			xys.setCompany_id(company_id);
			xys.getSs().put("bar", ssBar);
			xys.getSs().put("line", ssLine);
			xys.setX(years);
			xys.setXs(xs);
		} catch (Exception e) {
			logger.error("", e);
		}
		return xys;
	}

	public List<String> getTurnoverIndex(String company_id, String chart_type) {
		List<String> metadataList = new ArrayList<String>();
		try {

			List<TMetadataType> types = dao.query(TMetadataType.class,
					Cnd.where("chart_type", "=", chart_type).and("status", "=", 1).and("company_id", "=", company_id));

			if (StringUtils.equals(chart_type,"top1")){
				metadataList.add("");
				metadataList.add("");
				for (TMetadataType t : types) {
					if (StringUtils.equalsIgnoreCase(t.getUnit_category(),"RMB")) {
						metadataList.set(0,t.getMetadata_type_id());
					}else if (StringUtils.equalsIgnoreCase(t.getUnit_category(),"percentage")){
						metadataList.set(1,t.getMetadata_type_id());
					}

				}
			}else {
				for (TMetadataType t : types) {
					metadataList.add(t.getMetadata_type_id());
				}
			}

		} catch (Exception e) {
			logger.error("", e);
		}
		return metadataList;
	}

	public List<Integer> getTurnoverYear(String company_id) {
		List<Integer> metadataList = new ArrayList<Integer>();
		try {
			String turnoverSql = "";
			turnoverSql = "SELECT DISTINCT(year) FROM [dbo].[t_metadata] where chart_type='top1' and company_id='"
					+ company_id + "' and status=1";
			Sql sq = Sqls.create(turnoverSql);
			sq.setCallback(Sqls.callback.ints());
			dao.execute(sq);
			metadataList = sq.getList(Integer.class);

		} catch (Exception e) {
			logger.error("", e);
		}
		return metadataList;
	}

	public TChartXYS getBottomTable(String company_id,String chart_type) {

		TChartXYS xys = new TChartXYS();
		try {
			List<Record> rs = new ArrayList<Record>();
			Sql yearsSql = Sqls
					.create("SELECT DISTINCT(year) FROM [dbo].[t_metadata] WHERE chart_type = '"+chart_type+"' AND company_id = '"
							+ company_id + "' and status=1");

			yearsSql.setCallback(Sqls.callback.ints());

			dao.execute(yearsSql);
			List<Integer> years = yearsSql.getList(Integer.class);
			if (years.size() < 1) {
				return xys;
			}
			List<TMetadataType> types = dao.query(TMetadataType.class,
					Cnd.where("chart_type", "=", chart_type).and("status", "=", 1).and("company_id", "=", company_id));

			for (TMetadataType t : types) {
				List<TMetadata> ts = dao.query(TMetadata.class,
						Cnd.where("metadata_type_id", "=", t.getMetadata_type_id()).and("company_id", "=", company_id)
								.asc("year"));
				List<Integer> exitYY = new ArrayList<Integer>();
				Map<Integer, TMetadata> map = new HashMap<Integer, TMetadata>();
				for (TMetadata tm : ts) {
					exitYY.add(tm.getYear());
					map.put(tm.getYear(), tm);
				}
				for (Integer yy : years) {
					if (!exitYY.contains(yy)) {
						map.put(yy, null);
					}
				}
				Map<Integer, TMetadata> newMp = this.sortMapByKey(map);
				Record r = new Record();
				r.put("ts", newMp);
				r.put("name", t.getMetadata_type_name());
				r.put("id", t.getMetadata_type_id());
				rs.add(r);

			}
			xys.setX(years);
			xys.setYs(rs);

		} catch (Exception e) {
			logger.error("", e);
		}
		return xys;
	}

	public Map<Integer, TMetadata> sortMapByKey(Map<Integer, TMetadata> map) {
		if (map == null || map.isEmpty()) {
			return null;
		}

		Map<Integer, TMetadata> sortMap = new TreeMap<Integer, TMetadata>(new Comparator<Integer>() {

			@Override
			public int compare(Integer o1, Integer o2) {
				return o2.compareTo(o1);
			}

		});

		sortMap.putAll(map);

		return sortMap;
	}

	public TChartXYS getRightBar(String company_id, String charType) {
		TChartXYS xys = new TChartXYS();
		try {

			Sql yearSql = Sqls.create("SELECT year FROM [dbo].[t_metadata] where company_id='" + company_id
					+ "' and chart_type='" + charType + "' and status=1 GROUP BY year ORDER BY year");
			yearSql.setCallback(Sqls.callback.ints());

			dao.execute(yearSql);
			List<Integer> list = yearSql.getList(Integer.class);
			if (list.size() < 1) {
				return xys;
			}
			int min = list.get(0);
			int max = list.get(list.size() - 1);
			String unit ="";

			try {
				unit = dao.fetch(TMetadataType.class,Cnd.where("chart_type", "=", charType).and("status", "=", 1).and("company_id", "=", company_id)).getUnit();
				xys.setUnit(unit);
			} catch (Exception e) {
				logger.error(e);
			}

			List<TMetadataType> types = dao.query(TMetadataType.class,
					Cnd.where("chart_type", "=", charType).and("status", "=", 1).and("company_id", "=", company_id));
			List<Record> rs = new ArrayList<Record>();
			for (TMetadataType t : types) {
				List<TMetadata> ts = dao.query(TMetadata.class,
						Cnd.where("metadata_type_id", "=", t.getMetadata_type_id()).and("year", ">=", min)
								.and("year", "<=", max).and("company_id", "=", company_id).asc("year"));
				List<Integer> exitYY = new ArrayList<Integer>();
				Map<Integer, TMetadata> map = new HashMap<Integer, TMetadata>();
				for (TMetadata tm : ts) {
					exitYY.add(tm.getYear());
					map.put(tm.getYear(), tm);
				}
				for (Integer yy : list) {
					if (!exitYY.contains(yy)) {
						map.put(yy, null);
					}
				}

				Record r = new Record();
				r.put("ts", map);
				r.put("name", t.getMetadata_type_name());
				r.put("id", t.getMetadata_type_id());
				rs.add(r);

			}
			xys.setCompany_id(company_id);
			xys.setX(list);
			xys.setYs(rs);

		} catch (Exception e) {
			logger.error("", e);
		}
		return xys;
	}

	public List<TMetadata> getLeftBar(String company_id, Integer year, String char_type) {

		List<TMetadata> metadataList = new ArrayList<TMetadata>();
		try {
			List<TMetadata> ts = dao.query(TMetadata.class,
					Cnd.where("year", "=", year).and("chart_type", "=", char_type).and("company_id", "=", company_id).and("status", "=", 1));
			for (TMetadata m : ts) {
				TMetadataType t = dao.fetch(TMetadataType.class,
						Cnd.where("metadata_type_id", "=", m.getMetadata_type_id()));
				m.setTt(t);
			}
			metadataList = ts;
		} catch (Exception e) {
			logger.error("", e);
		}
		return metadataList;
	}

	public String getMetadata_name(String metadata_type_id){
		String name ="";
		TMetadataType metadataType =  dao.fetch(TMetadataType.class,Cnd.where("metadata_type_id","=",metadata_type_id));
		if (metadataType !=null){
			name=metadataType.getMetadata_type_name();
		}
		return name;
	}

	public List<Boolean> getcheck_type(String company_id){
		List<TMetadataType>  tMetadataTypeList= dao.query(TMetadataType.class,Cnd.where("company_id","=",company_id));
		List<Boolean> booleanList = new ArrayList<>();
		booleanList.add(0,false);
		booleanList.add(1,false);
		booleanList.add(2,false);
		for (int i = 0; i < tMetadataTypeList.size(); i++) {
			if (StringUtils.equals(tMetadataTypeList.get(i).getChart_type(),"top1")){
				booleanList.set(0,true);
			}
			else if (StringUtils.equals(tMetadataTypeList.get(i).getChart_type(),"top2_right")){
				booleanList.set(1,true);
			}
			else if (StringUtils.equals(tMetadataTypeList.get(i).getChart_type(),"bottom")){
				booleanList.set(2,true);
			}
		}
		return  booleanList;

	}
}
