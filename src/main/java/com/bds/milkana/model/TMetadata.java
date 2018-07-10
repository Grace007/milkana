package com.bds.milkana.model;

import java.util.Date;
import java.util.List;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;
import org.nutz.dao.impl.NutDao;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

/**
 * @author eli
 * @date 2018/2/1 12:22
 */
@Table("t_metadata")
public class TMetadata {
	@Id
	private Long id;
	@Column
	private String company_id;
	@Column
	private Integer year;
	@Column
	private Double val;
//	@Column
//	private String unit;
	@Column
	private String metadata_type_id;
	@Column
	private String chart_type;
	@Column
	private Date create_time;
	@Column
	private Date update_time;
	@Column
	private String remark;
	@Column
	private int status;

	private TMetadataType tt;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	private Double turnover;

	private TCompany tCompany;


	private List<TMetadata> tMetadataList;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Double getVal() {
		return val;
	}

	public void setVal(Double val) {
		this.val = val;
	}

//	public String getUnit() {
//		return unit;
//	}
//
//	public void setUnit(String unit) {
//		this.unit = unit;
//	}

	public String getMetadata_type_id() {
		return metadata_type_id;
	}

	public void setMetadata_type_id(String metadata_type_id) {
		this.metadata_type_id = metadata_type_id;
	}

	public String getChart_type() {
		return chart_type;
	}

	public void setChart_type(String chart_type) {
		this.chart_type = chart_type;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public Date getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public TCompany gettCompany() {
		return tCompany;
	}

	public void settCompany(TCompany tCompany) {
		this.tCompany = tCompany;
	}

	public Double getTurnover() {
		return turnover;
	}

	public void setTurnover(Double turnover) {
		this.turnover = turnover;
	}



	public List<TMetadata> gettMetadataList() {
		return tMetadataList;
	}

	public void settMetadataList(List<TMetadata> tMetadataList) {
		this.tMetadataList = tMetadataList;
	}

	public TMetadataType getTt() {
		return tt;
	}

	public void setTt(TMetadataType tt) {
		this.tt = tt;
	}

	public static void main(String[] args) {
		ApplicationContext ctx = new FileSystemXmlApplicationContext("src/test/com/zhou/test/bds/milk/dataSource.xml");
		NutDao biDao = (NutDao) ctx.getBean("biDao");
		biDao.create(TMetadata.class, false);

	}

}
