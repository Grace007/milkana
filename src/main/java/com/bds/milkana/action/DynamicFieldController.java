package com.bds.milkana.action;

import com.bds.milkana.model.TCompany;
import com.bds.milkana.model.TField;
import com.bds.milkana.model.common.Page;
import com.bds.milkana.model.common.Result;
import com.bds.milkana.service.CompanyService;
import com.bds.milkana.service.DynamicFieldService;
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
import java.util.List;
import java.util.Map;

/**
 * @author eli
 * @date 2018/2/22 18:24
 */
@Controller
public class DynamicFieldController extends BaseAction {
	private org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(DynamicFieldController.class);
	@Resource
	private DynamicFieldService fieldService;
	@Resource
	private CompanyService companyService;


	@RequestMapping("/service/field/showlist")
	public String showList(Map<String, Object> map) {
		List<TCompany> companyList = companyService.getList();
		List<TField> fieldList = fieldService.getAllList();
		map.put("companyList", companyList);
		map.put("fieldList", fieldList);
		return "ftl/field";
	}

	@RequestMapping(value = "/service/field/query")
	@ResponseBody
	public Page getCompanyList(HttpServletRequest request, HttpServletResponse response,
							   Integer pageNum,
								Integer pageSize,
							   Integer isread) throws Exception {
		Page page = new Page();
		try {

			page = fieldService.getFieldList(pageNum, pageSize);
		} catch (Exception e) {
			page.setCode(Const.FAIL);
			LOGGER.error("", e);
		}
		return page;
	}


	// 改原数据
	@RequestMapping(value = "/service/field/update", method = RequestMethod.POST)
	@ResponseBody
	public Result updateMeta(HttpServletRequest request,
							 TField field) throws Exception {
		Result ret = new Result();
		try {
			fieldService.update(field);
			ret.setCode(Const.SUC);
		} catch (Exception e) {
			e.printStackTrace();
			ret.setCode(Const.FAIL);
		}
		return ret;
	}

	@RequestMapping(value = "/service/field/addRow")
	@ResponseBody
	public Result addRow(HttpServletRequest request, HttpServletResponse response, TField field)
			throws Exception {
		Result ret = new Result();
		try {

			if (field == null) {
				ret.setCode(Const.FAIL);
				ret.setMsg("please input Row Data");
				return ret;
			}
			if (StringUtils.isEmpty(field.getField_name())) {
				ret.setCode(Const.FAIL);
				ret.setMsg("please input field_name");
				return ret;
			}
			if (StringUtils.isEmpty(field.getField_type())) {
				ret.setCode(Const.FAIL);
				ret.setMsg("please input field_type");
				return ret;
			}

			ret = fieldService.save(field);

		} catch (Exception e) {
			ret.setCode(Const.FAIL);
			ret.setMsg("Add Fail,Please Contact Administrator");
			LOGGER.error("", e);
		}
		return ret;
	}


	// 删除元数据
	@RequestMapping(value = "/service/field/delete", method = RequestMethod.GET)
	@ResponseBody
	public Result deleteById( @RequestParam int id) {
		TField field= fieldService.getFieldById(id);

			boolean temp = fieldService.deleteById(id);
			Result result = new Result();
			result.setResult(Const.SUC,temp);
			return result;
	}

}
