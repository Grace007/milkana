package com.bds.milkana.model;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;
import org.nutz.dao.impl.NutDao;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import java.util.Date;

/**
 * @author eli
 * @date 2018/2/22 18:21
 */
@Table("t_field")
public class TField {
    @Id
    private Long id;
    @Column
    private String field_id;
    @Column
    private String field_name;
    @Column
    private String field_type;
    @Column
    private Date create_time;
    @Column
    private Date update_time;
    @Column
    private String remark;
    @Column
    private int status;

    private TCompanyField companyField;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getField_name() {
        return field_name;
    }

    public void setField_name(String field_name) {
        this.field_name = field_name;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getField_type() {
        return field_type;
    }

    public void setField_type(String field_type) {
        this.field_type = field_type;
    }

    public String getField_id() {
		return field_id;
	}

	public void setField_id(String field_id) {
		this.field_id = field_id;
	}

    public TCompanyField getCompanyField() {
        return companyField;
    }

    public void setCompanyField(TCompanyField companyField) {
        this.companyField = companyField;
    }

    public static void main(String[] args) {
        ApplicationContext ctx = new FileSystemXmlApplicationContext("F:\\HCR\\Java\\IdeaProjects\\milkana\\src\\main\\java\\com\\bds\\milkana\\utils\\dataSource.xml");
        NutDao biDao = (NutDao) ctx.getBean("biDao");
        biDao.create(TField.class, false);

    }
}
