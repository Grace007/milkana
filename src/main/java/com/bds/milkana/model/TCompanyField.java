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
 * @date 2018/2/23 18:21
 */
@Table("t_company_field")
public class TCompanyField {
    @Id
    private Long id;
    @Column
    private String company_id;
    @Column
    private String field_id;
    @Column
    private String field_value;
    @Column
    private Date create_time;
    @Column
    private Date update_time;
    @Column
    private String remark;
    
    private String field_type;

    private TField field;

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

    public String getField_id() {
        return field_id;
    }

    public void setField_id(String field_id) {
        this.field_id = field_id;
    }

    public String getField_value() {
        return field_value;
    }

    public void setField_value(String field_value) {
        this.field_value = field_value;
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

    public TField getField() {
        return field;
    }

    public void setField(TField field) {
        this.field = field;
    }

    public String getField_type() {
		return field_type;
	}

	public void setField_type(String field_type) {
		this.field_type = field_type;
	}

	public static void main(String[] args) {
        ApplicationContext ctx = new FileSystemXmlApplicationContext("F:\\HCR\\Java\\IdeaProjects\\milkana\\src\\main\\java\\com\\bds\\milkana\\utils\\dataSource.xml");
        NutDao biDao = (NutDao) ctx.getBean("biDao");
        biDao.create(TCompanyField.class, false);

    }
}
