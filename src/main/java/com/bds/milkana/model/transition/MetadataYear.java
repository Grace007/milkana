package com.bds.milkana.model.transition;

import java.util.Date;

/**
 * @author eli
 * @date 2018/3/5 11:58
 */
public class MetadataYear {
    private Long id;
    private String company_id;
    private Integer start_year;
    private Integer stop_year;
    private String metadata_type_id;
    private String chart_type;
    private Date create_time;
    private Date update_time;
    private String remark;
    private int status;

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

    public Integer getStart_year() {
        return start_year;
    }

    public void setStart_year(Integer start_year) {
        this.start_year = start_year;
    }

    public Integer getStop_year() {
        return stop_year;
    }

    public void setStop_year(Integer stop_year) {
        this.stop_year = stop_year;
    }

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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
