package com.bds.milkana.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bds.milkana.model.*;
import com.bds.milkana.model.common.Result;
import com.bds.milkana.service.DashBoardService;
import com.bds.milkana.service.DynamicFieldService;
import com.bds.milkana.utils.Const;
import com.bds.milkana.utils.ExcelExporterOrImpUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class DashboardController extends BaseAction {

	private final Logger logger = Logger.getLogger(DashboardController.class);
	@Resource
	private DashBoardService dashboardService;
	@Resource
	private DynamicFieldService fieldService;

	@RequestMapping("/service/dashboard/show/{companyId}")
	public String showList(Map<String, Object> map, @PathVariable String companyId, String year) {
		List<TCompany> companyList = dashboardService.getCompanyList();
		map.put("companyList", companyList);

		if (StringUtils.isEmpty(companyId) || companyId.equals("0")) {
			companyId = companyList.get(0).getCompany_id();
		}

		TCompany company = dashboardService.getCompanyInfo(companyId);
		List<TCompanyField> companyFieldList = fieldService.getCompanyField(companyId);
		company.setCompanyFieldList(companyFieldList);
		map.put("companyName", company.getCompany_name());
		map.put("companyId", company.getCompany_id());
		TChartXYS top1 = dashboardService.getTurnover(companyId, "top1");
		TChartXYS top2_right = dashboardService.getRightBar(companyId, "top2_right");
		String top2year = "";
		if (top2_right.getX() == null || top2_right.getX().size() < 1) {
			top2year = "2000";
		} else {
			top2year = top2_right.getX().get(0) + "";
		}

		TChartXYS bottom = dashboardService.getBottomTable(companyId, "bottom");

		String index1Json = this.parseJson(top1);
		String top2_rightJson = this.parseJson(top2_right);

		String bottomJson = this.parseJson(bottom);
		map.put("top1", index1Json);
		map.put("top2_right", top2_rightJson);

		map.put("bottom", bottomJson);
		map.put("top2year", top2year);

		List<TMetadata> list = dashboardService.getLeftBar(companyId, Integer.parseInt(top2year), "top2_right");
		String top2_leftJson = this.parseJson(list);

		map.put("company", company);
		map.put("top2_left", top2_leftJson);
		return "ftl/index";
	}

	/**
	 * 首页圆形饼状图
	 * 
	 * @param request
	 * @param response
	 * @param companyId
	 * @param year
	 * @param chart_type
	 * @return
	 */
	@RequestMapping(value = "/service/dashboard/charts/index2/{companyId}", method = RequestMethod.GET)
	@ResponseBody
	public Result query(HttpServletRequest request, HttpServletResponse response, @PathVariable String companyId,
			Integer year, String chart_type) {
		Result ret = new Result();
		try {
			List<TMetadata> list = dashboardService.getLeftBar(companyId, year, chart_type);
			ret.setCode(Const.SUC);
			ret.setData(list);
			response.setHeader("Access-Control-Allow-Origin", "*");
		} catch (Exception e) {
			ret.setCode(Const.FAIL);
			logger.error("", e);
		}
		return ret;
	}

	@RequestMapping(value = "/server/dashboard/charts/exportExcel", method = RequestMethod.POST)
	public String exportExcel(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response,
			String chart_type, String company_id, String year) throws IOException {

		// logger.info(chart_type);
		// logger.info(company_id);
		// logger.info(year);
		TCompany company = dashboardService.getCompanyInfo(company_id);
		TChartXYS top1 = dashboardService.getTurnover(company_id, "top1");
		TChartXYS top2_left = dashboardService.getRightBar(company_id, "top2_right");

		String index1Json = this.parseJson(top1);
		String top2_leftJson = this.parseJson(top2_left);
		ServletOutputStream out = response.getOutputStream();

		// 导出excel
		List<String> topYearData = null;
		List<List<String>> data = new ArrayList<List<String>>();
		List<String> th = new ArrayList<String>();

		// 导出excel类型
		// top1
		if (StringUtils.equals(chart_type, "top1")) {
			th.add("Year");
			th.add("Turnover");
			data.add(th);
			for (int i = 0; i < top1.getX().size(); i++) {
				List<String> line = new ArrayList<String>();
				line.add(top1.getX().get(i).toString());
				Double[] ymap = top1.getSs().get("bar");
				line.add(ymap[i].toString());
				data.add(line);
			}
		}
		// top2_left ，2年柱状图
		else if (StringUtils.equals(chart_type, "top2_left")) {
			th.add("Year");
			th.add("Product");
			th.add("Turnover");
			data.add(th);
			int[] top2_x = new int[top2_left.getX().size()];
			for (int i = 0; i < top2_left.getX().size(); i++) {
				top2_x[i] = top2_left.getX().get(i);
			}
			JSONObject all_jsonObject = JSON.parseObject(top2_leftJson);
			JSONArray ys = all_jsonObject.getJSONArray("ys");
			for (int i = 0; i < ys.size(); i++) {

				JSONObject firstObject = ys.getJSONObject(i);
				JSONObject ts = firstObject.getJSONObject("ts");
				String first_name = firstObject.getString("name");
				for (int j = 0; j < top2_x.length; j++) {
					if (StringUtils.isNotEmpty(String.valueOf(top2_x[j]))) {
						List<String> line = new ArrayList<String>();
						JSONObject secondObject = ts.getJSONObject(String.valueOf(top2_x[j]));
						line.add(String.valueOf(top2_x[j]));
						line.add(first_name);
						line.add(String.valueOf(secondObject.getString("val")));
						data.add(line);
					}

				}

			}
		} else if (StringUtils.equals(chart_type, "top2_right")) {
			List<TMetadata> list = dashboardService.getLeftBar(company_id, Integer.parseInt(year), chart_type);
			th.add("Year");
			th.add("Product");
			th.add("Turnover");
			data.add(th);
			for (int i = 0; i < list.size(); i++) {
				List<String> line = new ArrayList<String>();
				TMetadata metadata = list.get(i);
				String metadata_name = dashboardService.getMetadata_name(metadata.getMetadata_type_id());
				line.add(metadata.getYear().toString());
				line.add(metadata_name);
				line.add(metadata.getVal().toString());
				data.add(line);
			}

		}
		response.setHeader("Content-disposition", "attachment;filename="
				+ URLEncoder.encode(company.getCompany_name(), "UTF-8") + new Date().getTime() + ".xls");
		response.setContentType("application/xls");
		ExcelExporterOrImpUtil.exportToExcel(out, data);
		out.flush();
		if (out != null) {
			out.close();
		}

		return null;

	}

	@RequestMapping("/service/dashboard/show_exportAll")
	public String showExportAllView(Map<String, Object> map) {
		List<TCompany> companyList = dashboardService.getCompanyList();
		map.put("companyList", companyList);

		List<TField> fieldList = fieldService.getAllList();
		map.put("fieldList", fieldList);

		return "ftl/export_view";
	}

	@RequestMapping(value = "/service/dashboard/exportAll", method = RequestMethod.POST)
	public String exportAll(HttpServletRequest request, HttpServletResponse response, String company, String field,
			String datatype) {
		logger.info(company);

		return null;
	}

}
