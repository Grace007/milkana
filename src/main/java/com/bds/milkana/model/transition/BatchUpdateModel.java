package com.bds.milkana.model.transition;

/**
 * @author eli
 * @date 2018/3/1 14:17
 */
public class BatchUpdateModel {
    private String batch_company_id;
    private String batch_year;
    private String batch_chart_type;
    private String chart_type;
    private String company_id;
    private String year;
    private String val;
    private String metadata_type_id;
    private String remark;

    public String getBatch_company_id() {
        return batch_company_id;
    }

    public void setBatch_company_id(String batch_company_id) {
        this.batch_company_id = batch_company_id;
    }

    public String getBatch_year() {
        return batch_year;
    }

    public void setBatch_year(String batch_year) {
        this.batch_year = batch_year;
    }

    public String getBatch_chart_type() {
        return batch_chart_type;
    }

    public void setBatch_chart_type(String batch_chart_type) {
        this.batch_chart_type = batch_chart_type;
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

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getVal() {
        return val;
    }

    public void setVal(String val) {
        this.val = val;
    }

    public String getMetadata_type_id() {
        return metadata_type_id;
    }

    public void setMetadata_type_id(String metadata_type_id) {
        this.metadata_type_id = metadata_type_id;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
