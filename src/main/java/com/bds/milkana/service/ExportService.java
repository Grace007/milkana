package com.bds.milkana.service;

import com.bds.milkana.model.TChartType;
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
public class ExportService {
	private final Logger logger = Logger.getLogger(ExportService.class);
	@Resource
	private NutDao dao;

	public List<TMetadataType> getList() {
		List<TMetadataType> list = dao.query(TMetadataType.class, null);
		return list;
	};
	
	
	public List<TMetadataType> getTypeList(String chartType) {
		List<TMetadataType> list = dao.query(TMetadataType.class, Cnd.where("chart_type", "=", chartType));
		return list;
	};

	public List<TChartType> getChartTypeList() {
		List<TChartType> list = dao.query(TChartType.class, null);
		return list;
	};

	public Page getDataList(Integer pageNum, Integer pageSize, String keyword) {

		Pager pager = dao.createPager(pageNum, pageSize);
		Criteria cri = Cnd.cri();

		cri.getOrderBy().desc("id");
		cri.where().and("status", "=", 1);
		List<TMetadataType> list = new ArrayList<>();
		if (!StringUtils.isEmpty(keyword)) {
			cri.where().and("product_name", "like", "%" + keyword + "%");
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
			dao.delete(TMetadataType.class,id);
			temp = true;
		} catch (Exception e) {
			logger.error(e);
		}
		return temp;
	}

}
