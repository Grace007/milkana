package com.bds.milkana.service;

import com.bds.milkana.model.TMetadata;
import com.bds.milkana.model.TMetadataType;
import com.bds.milkana.model.common.Page;
import com.bds.milkana.model.common.Result;
import com.bds.milkana.model.transition.BatchUpdateModel;
import com.bds.milkana.utils.Const;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.nutz.dao.Cnd;
import org.nutz.dao.impl.NutDao;
import org.nutz.dao.pager.Pager;
import org.nutz.dao.sql.Criteria;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * @author eli
 * @date 2018/2/5 10:27
 */
@Service
public class DataService {
	private final Logger logger = Logger.getLogger(DataService.class);
	@Resource
	private NutDao dao;

	public Page getMetadataList(Integer pageNum, Integer pageSize, String company, String year, String chart_type) {
		Pager pager = dao.createPager(pageNum, pageSize);
		Criteria cri = Cnd.cri();

		cri.getOrderBy().desc("id");
		cri.where().and("status", "=", 1);

		// 筛选条件
		if (StringUtils.isNotEmpty(company)) {
			cri.where().and("company_id", "=", company);
		}
		if (StringUtils.isNotEmpty(year)) {
			cri.where().and("year", "=", year);
		}
		if (StringUtils.isNotEmpty(chart_type)) {
			cri.where().and("chart_type", "=", chart_type);
		}

		List<TMetadata> list = dao.query(TMetadata.class, cri, pager);
		int count = dao.count(TMetadata.class, cri);

		for (TMetadata m : list) {
			TMetadataType t = dao.fetch(TMetadataType.class,
					Cnd.where("metadata_type_id", "=", m.getMetadata_type_id()));
			m.setTt(t);
		}

		Page p = new Page(count, pager.getPageNumber(), pager.getPageSize());
		p.setCode(Const.SUC);
		p.setData(list);

		return p;

	}

	// 改原数据
	public void updateMetaData(TMetadata metadata) {
		metadata.setUpdate_time(new Date());
		metadata.setStatus(1);
		dao.update(metadata);
	}

	public TMetadata getMetaDataById(Long id){
		TMetadata metadata= dao.fetch(TMetadata.class,Cnd.where("id","=",id));
		return metadata;
	}


	public Result saveMetadata(TMetadata metadata) {
		Result ret = new Result();
		try {
			metadata.setStatus(1);
			metadata.setCreate_time(new Date());
			metadata.setUpdate_time(new Date());

			dao.fastInsert(metadata);

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
//			dao.update(TMetadata.class, Chain.make("status", 3).add("update_time",new Date()), Cnd.where("id", "=", id));
			dao.delete(TMetadata.class,id);
			temp = true;
		} catch (Exception e) {
			logger.error(e);
		}
		return temp;
	}

	//批量更改
	public Result batchUpdate(BatchUpdateModel batchUpdateModel){

		return null;
	}
}
