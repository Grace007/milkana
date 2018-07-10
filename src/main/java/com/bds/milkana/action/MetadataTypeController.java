package com.bds.milkana.action;

import com.bds.milkana.model.TChartType;
import com.bds.milkana.model.TCompany;
import com.bds.milkana.model.TMetadataType;
import com.bds.milkana.model.common.Page;
import com.bds.milkana.model.common.Result;
import com.bds.milkana.service.CompanyService;
import com.bds.milkana.service.TMetadataTypeService;
import com.bds.milkana.utils.Const;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author eli
 * @date 2018/2/5 10:24
 */
@Controller
public class MetadataTypeController extends BaseAction {
	private org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(MetadataTypeController.class);
	@Resource
	private TMetadataTypeService metadataTypeService;
	@Resource
	private CompanyService companyService;

	@RequestMapping("/service/data/metadatatype/show")
	public String showList(Map<String, Object> map) {
		List<TCompany> companyList = companyService.getList();
		List<TChartType> charts = metadataTypeService.getChartTypeList();
		map.put("charts", charts);
		map.put("companyList", companyList);
		return "ftl/metadata_type";
	}

	@RequestMapping(value = "/service/data/metadatatype/query")
	@ResponseBody
	public Page queryMetadatatypeList(HttpServletRequest request, HttpServletResponse response, Integer pageNum,
			Integer pageSize, String company_id,String unit_category) throws Exception {
		Page page = new Page();
		try {
			page = metadataTypeService.getDataList(pageNum, pageSize,company_id,unit_category);
		} catch (Exception e) {
			page.setCode(Const.FAIL);
			LOGGER.error("", e);
		}
		return page;
	}

	@RequestMapping(value = "/service/data/metadatatype/get")
	@ResponseBody
	public Result getMetadatatype(HttpServletRequest request, HttpServletResponse response, String chart_type,String company_id)
			throws Exception {
		Result ret = new Result();
		try {

			List<TMetadataType> data = metadataTypeService.getTypeList(chart_type,company_id);
			if (data == null) {
				data = new ArrayList<TMetadataType>();
			}
			ret.setData(data);
			ret.setCode(Const.SUC);
		} catch (Exception e) {
			ret.setCode(Const.FAIL);
			LOGGER.error("", e);
		}
		return ret;
	}

	// 改 原数据
	@RequestMapping(value = "/service/data/metadatatype/update", method = RequestMethod.POST)
	@ResponseBody
	public Result updateMeta(HttpServletRequest request, TMetadataType product) throws Exception {

		Result result = new Result();
		try {
			metadataTypeService.updateData(product);
			result.setResult(Const.SUC, "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.setResult(Const.FAIL, "fail");
		}
		return result;
	}

	@RequestMapping(value = "/service/data/metadatatype/addRow")
	@ResponseBody
	public Result addRow(HttpServletRequest request, HttpServletResponse response, TMetadataType product)
			throws Exception {
		Result ret = new Result();
		try {

			if (product == null) {
				ret.setCode(Const.FAIL);
				ret.setMsg("please input Row Data");
				return ret;
			}

			if (StringUtils.isEmpty(product.getMetadata_type_name())) {
				ret.setCode(Const.FAIL);
				ret.setMsg("please select Metadata type name");
				return ret;
			}

			ret = metadataTypeService.saveData(product);

		} catch (Exception e) {
			ret.setCode(Const.FAIL);
			ret.setMsg("Add Fail,Please Contact Administrator");
			LOGGER.error("", e);
		}
		return ret;
	}

	// 删除元数据
	@RequestMapping(value = "/service/data/metadatatype/delete", method = RequestMethod.GET)
	@ResponseBody
	public Result deleteById(@RequestParam int id) {
		boolean temp = metadataTypeService.deleteById(id);
		Result result = new Result();
		result.setResult(Const.SUC, temp);
		return result;
	}

}
