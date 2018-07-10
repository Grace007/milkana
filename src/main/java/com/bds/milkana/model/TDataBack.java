package com.bds.milkana.model;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @author eli
 * @date 2018/2/1 12:21
 */
@Table("t_data_back")
public class TDataBack {
	@Id
	private Long id;
	@Column
	private String name;
	@Column
	private Long user_id;
	@Column
	private int status;
	@Column

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date restore_time;
	@Column
	private Long op_user_id;
	private String op_user;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column
	private Date create_time;
	@Column
	private Date update_time;
	@Column
	private String remark;
	@Column
	private String sql;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getUser_id() {
		return user_id;
	}

	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public Date getRestore_time() {
		return restore_time;
	}

	public void setRestore_time(Date restore_time) {
		this.restore_time = restore_time;
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

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public Long getOp_user_id() {
		return op_user_id;
	}

	public void setOp_user_id(Long op_user_id) {
		this.op_user_id = op_user_id;
	}

	public String getOp_user() {
		return op_user;
	}

	public void setOp_user(String op_user) {
		this.op_user = op_user;
	}

}
