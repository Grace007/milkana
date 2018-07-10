package com.bds.milkana.model;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

import java.util.Date;

/**
 * @author eli
 * @date 2018/2/1 12:21
 */
@Table("t_metadata_type")
public class TMetadataType {
	@Id
	private Long id;
	@Column
	private String metadata_type_id;
	@Column
	private String metadata_type_name;
	@Column
	private int status;
	@Column
	private String chart_type;
	@Column
	private Date create_time;
	@Column
	private String unit;
	@Column
	private String company_id;
	@Column
	private String unit_category;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	

	public String getMetadata_type_id() {
		return metadata_type_id;
	}

	public void setMetadata_type_id(String metadata_type_id) {
		this.metadata_type_id = metadata_type_id;
	}

	public String getMetadata_type_name() {
		return metadata_type_name;
	}

	public void setMetadata_type_name(String metadata_type_name) {
		this.metadata_type_name = metadata_type_name;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getChart_type() {
		return chart_type;
	}

	public void setChart_type(String chart_type) {
		this.chart_type = chart_type;
	}

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	public String getUnit_category() {
		return unit_category;
	}

	public void setUnit_category(String unit_category) {
		this.unit_category = unit_category;
	}
}
