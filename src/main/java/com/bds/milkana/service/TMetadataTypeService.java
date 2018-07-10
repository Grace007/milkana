package com.bds.milkana.service;

import com.bds.milkana.model.TChartType;
import com.bds.milkana.model.TMetadata;
import com.bds.milkana.model.TMetadataType;
import com.bds.milkana.model.common.Page;
import com.bds.milkana.model.common.Result;
import com.bds.milkana.utils.Const;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.nutz.dao.Cnd;
import org.nutz.dao.impl.NutDao;
import org.nutz.dao.pager.Pager;
import org.nutz.dao.sql.Criteria;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author eli
 * @date 2018/2/5 10:27
 */
@Service
public class TMetadataTypeService {
	private final Logger logger = Logger.getLogger(TMetadataTypeService.class);
	@Resource
	private NutDao dao;

	public List<TMetadataType> getList() {
		List<TMetadataType> list = dao.query(TMetadataType.class, null);
		return list;
	};

	public List<TMetadataType> getTypeList(String chartType,String company_id) {
		List<TMetadataType> list = dao.query(TMetadataType.class, Cnd.where("chart_type", "=", chartType).and("company_id","=",company_id));
		return list;
	};

	public List<TChartType> getChartTypeList() {
		List<TChartType> list = dao.query(TChartType.class, Cnd.where("type", "=","hand"));
		return list;
	};

	public Page getDataList(Integer pageNum, Integer pageSize, String company_id,String unit_category) {

		Pager pager = dao.createPager(pageNum, pageSize);
		Criteria cri = Cnd.cri();

		cri.getOrderBy().desc("id");
		cri.where().and("status", "=", 1);
		List<TMetadataType> list = new ArrayList<>();
		if (!StringUtils.isEmpty(company_id)) {
			cri.where().and("company_id", "=", company_id);
		}
		if (!StringUtils.isEmpty(unit_category)){
			cri.where().and("unit_category","=",unit_category);
		}

		// 筛选条件
		list = dao.query(TMetadataType.class, cri, pager);
		int count = dao.count(TMetadataType.class, cri);
		Page p = new Page(count, pager.getPageNumber(), pager.getPageSize());
		p.setCode(Const.SUC);
		p.setData(list);

		return p;

	}

	public void updateData(TMetadataType product) {
		product.setStatus(1);
		dao.updateIgnoreNull(product);
	}

	public Result saveData(TMetadataType product) {
		Result ret = new Result();
		try {

			int maxid = dao.getMaxId(TMetadataType.class);
			product.setMetadata_type_id("p" + maxid);
			product.setCreate_time(new Date());
			product.setStatus(1);
			switch (product.getUnit()){
				case "billion" : product.setUnit_category("RMB"); break;
				case "million" : product.setUnit_category("RMB"); break;
				case "ton" : product.setUnit_category("weight"); break;
				case "%" : product.setUnit_category("percentage"); break;
				case "head" : product.setUnit_category("head"); break;
				default: product.setUnit_category("other");break;
			}

			dao.fastInsert(product);
			ret.setCode(Const.SUC);
		} catch (Exception e) {
			logger.error("", e);
		}
		return ret;

	}

	public boolean deleteById(int id) {
		boolean temp = false;
		try {
//			dao.update(TMetadataType.class, Chain.make("status", 3), Cnd.where("id", "=", id));
			TMetadataType tMetadataType = dao.fetch(TMetadataType.class,Cnd.where("id","=",id));
			String metadata_type_id = tMetadataType.getMetadata_type_id();
			dao.clear(TMetadata.class,Cnd.where("metadata_type_id","=",metadata_type_id));
			dao.delete(TMetadataType.class,id);
			temp = true;
		} catch (Exception e) {
			logger.error(e);
		}
		return temp;
	}

}
