package com.bds.milkana.model;

import org.nutz.dao.entity.Record;

import java.util.List;
import java.util.Map;

public class TChartXY {

	private String company_id;
	private Integer x;

	private Record y;

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	public Integer getX() {
		return x;
	}

	public void setX(Integer x) {
		this.x = x;
	}

	public Record getY() {
		return y;
	}

	public void setY(Record y) {
		this.y = y;
	}

}
