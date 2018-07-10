package com.bds.milkana.model;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

import java.util.Date;

/**
 * @author ebin
 * @date 2018/2/1 12:21
 */
@Table("t_chart_type")
public class TChartType {
	@Id
	private Long id;
	@Column
	private String chart_type;
	@Column
	private String pos;

	@Column
	private Date create_time;
	
	@Column
	private String type;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getChart_type() {
		return chart_type;
	}

	public void setChart_type(String chart_type) {
		this.chart_type = chart_type;
	}

	public String getPos() {
		return pos;
	}

	public void setPos(String pos) {
		this.pos = pos;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
