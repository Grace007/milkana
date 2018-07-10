package com.bds.milkana.model;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;
import org.nutz.dao.impl.NutDao;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import java.util.Date;
import java.util.List;

/**
 * @author eli
 * @date 2018/2/1 12:21
 */
@Table("t_company")
public class TCompany {
    @Id
    private Long id;
    @Column
    private String company_id;
    @Column
    private String company_name;
  
    @Column
    private int establishment;

	@Column
	private String cheese;
  
    @Column
    private Date create_time;
    @Column
    private Date update_time;
    @Column
    private String remark;
    @Column
    private int status;
    
    private String img_top1;
    private String img_top2_left;
    private String img_top2_right;

    private List<TMetadata> tMetadata;

    private List<TChartXY> turnover;

    
    private List<TCompanyField> companyFieldList;

    private List<Boolean> charts_type;

    private List<List<String>> top2_right_table;

	private List<List<String>> bottom;

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

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }


    public int getEstablishment() {
		return establishment;
	}

	public void setEstablishment(int establishment) {
		this.establishment = establishment;
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

	public List<TMetadata> gettMetadata() {
		return tMetadata;
	}

	public void settMetadata(List<TMetadata> tMetadata) {
		this.tMetadata = tMetadata;
	}

	public List<TChartXY> getTurnover() {
		return turnover;
	}

	public void setTurnover(List<TChartXY> turnover) {
		this.turnover = turnover;
	}

	public static void main(String[] args) {
        ApplicationContext ctx = new FileSystemXmlApplicationContext("F:\\HCR\\Java\\IdeaProjects\\milkana\\src\\main\\java\\com\\bds\\milkana\\utils\\dataSource.xml");
        NutDao biDao = (NutDao) ctx.getBean("biDao");
        biDao.create(TCompany.class, false);

    }

	public List<TCompanyField> getCompanyFieldList() {
		return companyFieldList;
	}

	public void setCompanyFieldList(List<TCompanyField> companyFieldList) {
		this.companyFieldList = companyFieldList;
	}

	public String getImg_top1() {
		return img_top1;
	}

	public void setImg_top1(String img_top1) {
		this.img_top1 = img_top1;
	}

	public String getImg_top2_left() {
		return img_top2_left;
	}

	public void setImg_top2_left(String img_top2_left) {
		this.img_top2_left = img_top2_left;
	}

	public String getImg_top2_right() {
		return img_top2_right;
	}

	public void setImg_top2_right(String img_top2_right) {
		this.img_top2_right = img_top2_right;
	}

	public String getCheese() {
		return cheese;
	}

	public void setCheese(String cheese) {
		this.cheese = cheese;
	}

	public List<Boolean> getCharts_type() {
		return charts_type;
	}

	public void setCharts_type(List<Boolean> charts_type) {
		this.charts_type = charts_type;
	}

	public List<List<String>> getTop2_right_table() {
		return top2_right_table;
	}

	public void setTop2_right_table(List<List<String>> top2_right_table) {
		this.top2_right_table = top2_right_table;
	}

	public List<List<String>> getBottom() {
		return bottom;
	}

	public void setBottom(List<List<String>> bottom) {
		this.bottom = bottom;
	}
}
