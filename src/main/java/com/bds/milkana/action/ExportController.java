package com.bds.milkana.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bds.milkana.model.*;
import com.bds.milkana.model.common.Result;
import com.bds.milkana.service.CompanyService;
import com.bds.milkana.service.DashBoardService;
import com.bds.milkana.service.DynamicFieldService;
import com.bds.milkana.service.TMetadataTypeService;
import com.bds.milkana.utils.*;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.nutz.dao.entity.Record;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author eli
 * @date 2018/2/5 10:24
 */
@Controller
public class ExportController extends BaseAction {
    private org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(ExportController.class);
    @Resource
    private DashBoardService dashboardService;
    @Resource
    private CompanyService companyService;
    @Resource
    private DynamicFieldService fieldService;
    @Resource
    private TMetadataTypeService metadataTypeService;

    @RequestMapping("/service/data/export/show")
    public String showList(Map<String, Object> map) {
        List<TCompany> companyList = dashboardService.getCompanyList();
        map.put("companyList", companyList);

        List<TField> fields = fieldService.getAllList();

        List<TChartType> charts = metadataTypeService.getChartTypeList();

        Date date = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyyMMddhhmmss");
        String dateStr = dateFormat.format(date);
        map.put("dateStr",dateStr);
        map.put("fields", fields);
        map.put("charts", charts);


        return "ftl/export";
    }

    @RequestMapping("/service/data/export/preview")
    public String preview(Map<String, Object> map, String companys, String companyid, String fileds, String charts) {
        List<TCompany> companyAllList = dashboardService.getCompanyList();
        List<TField> fieldAllList = fieldService.getAllList();

        List<TChartType> chartAllList = metadataTypeService.getChartTypeList();
        map.put("companyList", companyAllList);
        map.put("fields", fieldAllList);
        map.put("charts", chartAllList);
        Date date = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyyMMddhhmmss");
        String dateStr = dateFormat.format(date);
        map.put("dateStr",dateStr);
        String[] companyList = companys.split(",");
        JSONArray arr = new JSONArray();
        List<TCompany> selectCompany = new ArrayList<TCompany>();
        String[] selectFiled = fileds.split(",");
        List<String> selectCharts = Arrays.asList(charts.split(","));
        // List<String> charts_type = new ArrayList<>();
        Map<String, List<Boolean>> charts_type = new HashMap<>();

        for (String companyId : companyList) {
            JSONObject json = new JSONObject();
            TCompany company = dashboardService.getCompanyInfo(companyId);
            List<Boolean> charts_type_one = dashboardService.getcheck_type(companyId);
            company.setCharts_type(charts_type_one);
            charts_type.put(companyId, charts_type_one);
            TChartXYS top1 = null;
            TChartXYS top2_right = null;
            List<TMetadata> top2_left = null;
            String top2year = "2000";
            TChartXYS bottom = null;
            if (selectCharts.contains("top1")) {
                top1 = dashboardService.getTurnover(companyId, "top1");
            }

            if (selectCharts.contains("top2_right")) {
                top2_right = dashboardService.getRightBar(companyId, "top2_right");

                if (top2_right.getX() == null || top2_right.getX().size() < 1) {
                    top2year = "2000";
                } else {
                    top2year = top2_right.getX().get(0) + "";
                }
                top2_left = dashboardService.getLeftBar(companyId, Integer.parseInt(top2year), "top2_right");
            }

            if (selectCharts.contains("bottom")) {
                bottom = dashboardService.getBottomTable(companyId, "bottom");
            }

            List<TCompanyField> companyFieldList = fieldService.getCompanyByFids(company.getCompany_id(), selectFiled);
            company.setCompanyFieldList(companyFieldList);
            json.put("company_id", company.getCompany_id());
            json.put("top1", top1);
            json.put("top2_right", top2_right);
            json.put("top2_left", top2_left);
            json.put("leftyear", Integer.parseInt(top2year));
            json.put("bottom", bottom);
            arr.add(json);

            // map.put("companyFieldList", companyFieldList);
            selectCompany.add(company);
        }

        // 转换charts_type为json

        map.put("charts_type", this.parseJson(charts_type));
        String chartData = this.parseJson(arr);
        String selectFiledJson = this.parseJson(selectFiled);
        String selectChartsJson = this.parseJson(selectCharts);
        String selectCompanyJson = this.parseJson(companyList);
        map.put("selectCharts", selectCharts);
        map.put("selectCompany", selectCompany);
        map.put("chart_data", chartData);
        map.put("selectFiledJson", selectFiledJson);
        map.put("selectChartsJson", selectChartsJson);
        map.put("selectCompanyJson", selectCompanyJson);
        return "ftl/export";
    }

    /**
     * 根据svg数据，从highcharts官方服务器中获得图片，并放到本地目录中
     * @param request
     * @param response
     * @param chart
     * @param base64
     * @return
     */
    @RequestMapping(value = "/service/data/export/getImgPath", method = RequestMethod.POST)
    @ResponseBody
    public Result getImgPath(HttpServletRequest request, HttpServletResponse response, String chart, String base64) {
        Result ret = new Result();
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        try {
//            SvgToImgUtil.convertToPng(base64, out);
//            String url = OSSUtil.uploadBdsDataFile(chart, out.toByteArray());
            String url = "https://export.highcharts.com.cn";
            String resultUrl="";
            Map<String,String> data = new HashMap<>();
            data.put("svg",base64);
            data.put("scale","2");

            HttpResponse httpResponse =null;
            httpResponse = HttpClientUtil.doPost(url,data);

            HttpEntity entity1 =  httpResponse.getEntity();
            if (entity1 != null) {
                InputStream inout = entity1.getContent();
                byte[] byteArray = new byte[1024];
                ByteArrayOutputStream byteout = new ByteArrayOutputStream();
                int i = 0;
                while ((i = inout.read(byteArray)) != -1) {
                    byteout.write(byteArray, 0, i);
                }
//                resultUrl = OSSUtil.uploadBdsDataFile("test.png",byteout.toByteArray());
                resultUrl = FileWriteUtils.wirteImg(byteout.toByteArray());
                System.out.println("resultUrl = " + resultUrl);
            }


            ret.setCode(Const.SUC);
            ret.setData(resultUrl);
            response.setHeader("Access-Control-Allow-Origin", "*");
            out.close();
        } catch (Exception e) {
            ret.setCode(Const.FAIL);
            LOGGER.error("", e);
        } finally {
        }
        return ret;
    }


    /**
     * 下载pdf
     * @param map
     * @param request
     * @param response
     * @param companys
     * @param fileds
     * @param charts
     * @param imgs_1
     * @return
     */
    @RequestMapping(value = "/service/data/export/Dairy Market Landscape {\\d*}.pdf", method = RequestMethod.POST)
    public String exportPdf(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response,
                            String companys, String fileds, String charts, String imgs_1) {
        try {
            JSONArray companyList = JSON.parseArray(companys);
            String[] images = null;
            try {
                images = imgs_1.split(",");
            } catch (Exception e) {

            }
            List<TCompany> selectCompany = new ArrayList<TCompany>();
            JSONArray selectFiled = JSON.parseArray(fileds);
            JSONArray selectCharts = JSON.parseArray(charts);
            String[] fs = new String[selectFiled.size()];
            selectFiled.toArray(fs);
            for (int i = 0; i < companyList.size(); i++) {
                String company_id = companyList.getString(i);
                TCompany company = dashboardService.getCompanyInfo(company_id);

                List<Boolean> check_type_list = dashboardService.getcheck_type(company_id);
                // 添加表格公司信息

                try {
                    if (charts.contains("bottom")) {
                        TChartXYS bottom = null;
                        bottom = dashboardService.getBottomTable(company_id, "bottom");

                        List<List<String>> bottom_list = new ArrayList<>();
                        List<Integer> x_years = bottom.getX();
                        List<Record> ys = bottom.getYs();
                        // 获得循环次数
                        int count = ys.size();
                        System.out.println("count = " + count);

                        // 构建第一个list
                        List<String> list_row_01 = new ArrayList<>();
                        list_row_01.add(" ");
                        for (int j = 0; j < x_years.size(); j++) {
                            list_row_01.add(x_years.get(j).toString());
                        }
                        bottom_list.add(list_row_01);
                        // 构建表格内容,循环次数为count
                        for (int j = 0; j < count; j++) {
                            List<String> list_row = new ArrayList<>();

                            list_row.add(ys.get(j).getString("name"));

                            Map<Integer, TMetadata> map_table = new HashMap<Integer, TMetadata>();
                            map_table = (Map<Integer, TMetadata>) ys.get(j).get("ts");
                            for (int k = 0; k < x_years.size(); k++) {
                                int year = x_years.get(k);
                                TMetadata metadata = map_table.get(year);
                                list_row.add(metadata.getVal().toString());
                            }
                            bottom_list.add(list_row);
                        }
                        company.setBottom(bottom_list);
                    }
                } catch (Exception e) {
                    LOGGER.error(e);
                }

                // 添加表格公司信息
                try {
                    if (charts.contains("bottom")) {
                        TChartXYS bottom = null;
                        bottom = dashboardService.getBottomTable(company_id, "bottom");

                        List<List<String>> bottom_list = new ArrayList<>();
                        List<Integer> x_years = bottom.getX();
                        List<Record> ys = bottom.getYs();
                        // 获得循环次数
                        int count = ys.size();
                        System.out.println("count = " + count);

                        // 构建第一个list
                        List<String> list_row_01 = new ArrayList<>();
                        list_row_01.add(" ");
                        for (int j = 0; j < x_years.size(); j++) {
                            list_row_01.add(x_years.get(j).toString());
                        }
                        bottom_list.add(list_row_01);
                        // 构建表格内容,循环次数为count
                        for (int j = 0; j < count; j++) {
                            List<String> list_row = new ArrayList<>();

                            list_row.add(ys.get(j).getString("name"));

                            Map<Integer, TMetadata> map_table = new HashMap<Integer, TMetadata>();
                            map_table = (Map<Integer, TMetadata>) ys.get(j).get("ts");
                            for (int k = 0; k < x_years.size(); k++) {
                                int year = x_years.get(k);
                                TMetadata metadata = map_table.get(year);
                                list_row.add(DoubleFormatUtil.thousandthPlace(metadata.getVal().toString()));
                            }
                            bottom_list.add(list_row);
                        }
                        company.setBottom(bottom_list);
                    }
                } catch (Exception e) {
                    LOGGER.error(e);
                }

                if (images != null && images.length > 0) {
                    for (String img : images) {
                        String[] paths = img.split("\\|");
                        LOGGER.info(paths.length);
                        if (paths.length == 3) {
                            String cid = paths[0];
                            String pos = paths[1];
                            String url = paths[2];

                            if (cid.equals(company_id)) {
                                if (pos.equals("top1")) {
                                    if (check_type_list.get(0)) {
                                        company.setImg_top1(url);
                                    }
                                } else if (pos.equals("top2_left")) {
                                    if (check_type_list.get(1)) {
                                        company.setImg_top2_left(url);
                                    }
                                } else {
                                    if (check_type_list.get(1)) {

                                        company.setImg_top2_right(url);

                                        try {
                                            // 添加
                                            TChartXYS top2_right_company = null;
                                            top2_right_company = dashboardService.getRightBar(company.getCompany_id(),
                                                    "top2_right");

                                            List<Record> ys = top2_right_company.getYs();
                                            // 获得两个年份
                                            List<Integer> x = top2_right_company.getX();

                                            // (1+2+1)*(n+1)的表格,list
                                            List<List<String>> top2_right_table = new ArrayList<>();
                                            // 添加第一行
                                            List<String> list_row_01 = new ArrayList<>();
                                            list_row_01.add(" ");
                                            // 添加第二行
                                            List<String> list_row_02 = new ArrayList<>();
                                            list_row_02.add(x.get(0).toString());
                                            // 添加第三行
                                            List<String> list_row_03 = new ArrayList<>();
                                            list_row_03.add(x.get(1).toString());
                                            // 添加第四行
                                            List<String> list_row_04 = new ArrayList<>();
                                            list_row_04.add("Growth rate");

                                            // 得到top2_right的数据
                                            for (int j = 0; j < ys.size(); j++) {
                                                Map<Integer, TMetadata> map_table = new HashMap<Integer, TMetadata>();
                                                map_table = (Map<Integer, TMetadata>) ys.get(j).get("ts");
                                                // 添加产品名
                                                list_row_01.add(ys.get(j).getString("name"));
                                                // 添加数据
                                                Double first_data = null;
                                                Double last_data = null;
                                                String rate = " ";

                                                for (int k = 0; k < x.size(); k++) {
                                                    TMetadata tMetadata = map_table.get(x.get(k));
                                                    if (k == 0) {
                                                        first_data = tMetadata.getVal();
                                                    } else if (k == 1) {
                                                        last_data = tMetadata.getVal();
                                                    }
                                                }
                                                if (first_data != null && last_data != null) {

                                                    rate = DoubleFormatUtil.formatDecimal(DoubleFormatUtil.userMath(
                                                                    ((last_data - first_data) / first_data) * 100),"##0.0")
                                                            + "%";
                                                }
                                                list_row_02.add(Double.toString(first_data));
                                                list_row_03.add(Double.toString(last_data));
                                                list_row_04.add(rate);
                                            }

                                            top2_right_table.add(list_row_01);
                                            top2_right_table.add(list_row_02);
                                            top2_right_table.add(list_row_03);
                                            top2_right_table.add(list_row_04);
                                            company.setTop2_right_table(top2_right_table);
                                            // System.out.println("top2_right_company
                                            // = " + top2_right_company);
                                            // System.out.println("this.parseJson(top2_right_company)
                                            // = " +
                                            // this.parseJson(top2_right_company));
                                            // System.out.println("list_row_01 =
                                            // " + list_row_01);
                                            // System.out.println("list_row_02 =
                                            // " + list_row_02);
                                            // System.out.println("list_row_03 =
                                            // " + list_row_03);
                                            // System.out.println("list_row_04 =
                                            // " + list_row_04);
                                            // System.out.println("####");
                                        } catch (Exception e) {
                                            LOGGER.error(e);
                                        }

                                    }
                                }

                            }
                        }

                    }
                }

                List<TCompanyField> companyFieldList = fieldService.getCompanyByFids(company_id, fs);
                company.setCompanyFieldList(companyFieldList);

                selectCompany.add(company);
            }

            map.put("selectCharts", selectCharts.toArray());
            map.put("selectCompany", selectCompany);

            String path = Const.FTL_PATH + File.separator;
            System.out.println("path = " + path);
            DateFormat FORMAT = new SimpleDateFormat("yyyyMMddHHmmss");
            String fileName = "pdf_" + FORMAT.format(new Date()) + ".pdf";
            ServletOutputStream out = (ServletOutputStream) PdfUtils.generateToServletOutputStream(path,
                    "info_export.ftl", null, map, response, "PDF");
            response.setHeader("Content-disposition", "attachment;filename=\"" + fileName + "\"");
            response.setContentType("application/pdf");
            out.flush();
            if (out != null) {
                out.close();
            }

        } catch (Exception e) {
            LOGGER.error("", e);
        }
        return null;

    }

}

/**
 * "ts": { 2016: { "chart_type": "top2_right", "company_id": "M201802050001",
 * "create_time": 1521187283757, "id": 269, "metadata_type_id": "p56", "remark":
 * "", "status": 1, "tCompany": null, "tMetadataList": null, "tt": null,
 * "turnover": null, "update_time": 1521187394180, "val": 49.5, "year": 2016 },
 * 2015: { "chart_type": "top2_right", "company_id": "M201802050001",
 * "create_time": 1521187283757, "id": 268, "metadata_type_id": "p56", "remark":
 * "", "status": 1, "tCompany": null, "tMetadataList": null, "tt": null,
 * "turnover": null, "update_time": 1521187389990, "val": 47.2, "year": 2015 }
 * }, "name": "Liquid milk & Yogurt", "id": "p56" },
 **/