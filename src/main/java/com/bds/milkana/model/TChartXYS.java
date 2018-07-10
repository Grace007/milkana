package com.bds.milkana.model;

import org.nutz.dao.entity.Record;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TChartXYS {

	private String company_id;
	private String unit;
	private List<Integer> x;
	private List<Integer> y;
	private List<Record> ys;
	private List<String> xs;
	private Map<String,Double[]> ss =  new HashMap<String,Double[]>();
	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	

	public List<String> getXs() {
		return xs;
	}

	public void setXs(List<String> xs) {
		this.xs = xs;
	}

	public List<Integer> getX() {
		return x;
	}

	public void setX(List<Integer> x) {
		this.x = x;
	}

	public List<Record> getYs() {
		return ys;
	}

	public void setYs(List<Record> ys) {
		this.ys = ys;
	}

	public List<Integer> getY() {
		return y;
	}

	public void setY(List<Integer> y) {
		this.y = y;
	}

	public Map<String, Double[]> getSs() {
		return ss;
	}

	public void setSs(Map<String, Double[]> ss) {
		this.ss = ss;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
}
