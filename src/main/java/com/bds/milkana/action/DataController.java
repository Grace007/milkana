package com.bds.milkana.action;

import com.bds.milkana.model.TChartType;
import com.bds.milkana.model.TCompany;
import com.bds.milkana.model.TMetadata;
import com.bds.milkana.model.TMetadataType;
import com.bds.milkana.model.common.Page;
import com.bds.milkana.model.common.Result;
import com.bds.milkana.model.transition.BatchUpdateModel;
import com.bds.milkana.model.transition.MetadataYear;
import com.bds.milkana.service.CompanyService;
import com.bds.milkana.service.DataService;
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
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author eli
 * @date 2018/2/5 10:24
 */
@Controller
public class DataController extends BaseAction {
	private org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(DataController.class);
	@Resource
	private DataService dataService;
	@Resource
	private CompanyService companyService;
	@Resource
	private TMetadataTypeService metadataTypeService;
	@Resource
	private TMetadataTypeService productService;

	@RequestMapping("/service/data/metadata/show")
	public String showList(Map<String, Object> map) {
		List<TCompany> companyList = companyService.getList();
		List<TChartType> charts = metadataTypeService.getChartTypeList();
		
		List<TMetadataType> productList = productService.getList();
		map.put("companyList", companyList);
		map.put("productList", productList);
		map.put("charts", charts);
		return "ftl/metadata";
	}

	@RequestMapping(value = "/service/data/metadata/query")
	@ResponseBody
	public Page getCompanyList(HttpServletRequest request, HttpServletResponse response,
							   Integer pageNum,
								Integer pageSize,
							   Integer isread,
							   String company,
							   String year,String chart_type) throws Exception {
		Page page = new Page();
		try {

			page = dataService.getMetadataList(pageNum, pageSize,company,year,chart_type);
		} catch (Exception e) {
			page.setCode(Const.FAIL);
			LOGGER.error("", e);
		}
		return page;
	}


	// 改原数据
	@RequestMapping(value = "/service/data/metadata/update", method = RequestMethod.POST)
	@ResponseBody
	public Result updateMeta(HttpServletRequest request,
							 TMetadata metadata) throws Exception {
		Result ret = new Result();
		try {
			dataService.updateMetaData(metadata);
			ret.setCode(Const.SUC);
		} catch (Exception e) {
			e.printStackTrace();
			ret.setCode(Const.FAIL);
		}
		return ret;
	}

	@RequestMapping(value = "/service/data/metadata/addRow")
	@ResponseBody
	public Result addRow(HttpServletRequest request, HttpServletResponse response, MetadataYear metadataYear)
			throws Exception {
		Result ret = new Result();
		try {

			if (metadataYear == null) {
				ret.setCode(Const.FAIL);
				ret.setMsg("please input Row Data");
				return ret;
			}
			if (StringUtils.isEmpty(metadataYear.getCompany_id())) {
				ret.setCode(Const.FAIL);
				ret.setMsg("please select company");
				return ret;
			}
			if (StringUtils.isEmpty(metadataYear.getStart_year())) {
				ret.setCode(Const.FAIL);
				ret.setMsg("please select Start Year");
				return ret;
			}
			if (StringUtils.isEmpty(metadataYear.getStop_year())) {
				ret.setCode(Const.FAIL);
				ret.setMsg("please input Stop Year");
				return ret;
			}
			for (int i = metadataYear.getStart_year(); i <= metadataYear.getStop_year(); i++) {
				TMetadata metadata = new TMetadata();
				metadata.setRemark(metadataYear.getRemark());
				metadata.setYear(i);
				metadata.setChart_type(metadataYear.getChart_type());
				metadata.setCompany_id(metadataYear.getCompany_id());
				metadata.setMetadata_type_id(metadataYear.getMetadata_type_id());
				ret = dataService.saveMetadata(metadata);
			}


		} catch (Exception e) {
			ret.setCode(Const.FAIL);
			ret.setMsg("Add Fail,Please Contact Administrator");
			LOGGER.error("", e);
		}
		return ret;
	}


	// 删除元数据
	@RequestMapping(value = "/service/data/metadata/delete", method = RequestMethod.GET)
	@ResponseBody
	public Result deleteById( @RequestParam int id) {
			boolean temp = dataService.deleteById(id);
			Result result = new Result();
			result.setResult(Const.SUC,temp);
			return result;
	}


	@RequestMapping(value = "/service/data/metadata/batch",method = RequestMethod.GET)
	public String  batchUpdate(Map<String,Object> map,
							   String company_id,
							   String year,String chart_type) {


		return "ftl/metadata_batch";
	}

	/**
	 * 实时更新元数据的api
	 * @param row_id
	 * @param column
	 * @param value
	 * @return
	 */
	@RequestMapping(value = "/service/data/metadata/updateCell",method = RequestMethod.POST)
	@ResponseBody
	public Result  updateCell(Long row_id,int column,String value) {

		HashMap<Integer,String> map = new HashMap<Integer,String>();
		map.put(2,"year");
		map.put(4,"turnover");
		map.put(6,"remark");

		Result result =new Result();
		boolean current=false;
		String old_value="";
		try {
			TMetadata metadata = dataService.getMetaDataById(row_id);
			if (map.containsKey(column)){
                String field_name = map.get(column);
                if (org.apache.commons.lang.StringUtils.equals(map.get(column),"year")){
                	old_value=metadata.getYear().toString();
                    metadata.setYear(Integer.parseInt(value));

                }else if (org.apache.commons.lang.StringUtils.equals(map.get(column),"turnover")){
                	if (metadata.getVal() != null) {
						old_value = String.valueOf((new Double(metadata.getVal())).intValue());
					}else{
						old_value =null;
					}
                    metadata.setVal(Double.parseDouble(value));

                }else if (org.apache.commons.lang.StringUtils.equals(map.get(column),"remark")){
                	old_value =metadata.getRemark();
                    metadata.setRemark(value);
                }
                metadata.setUpdate_time(new Date());
                dataService.updateMetaData(metadata);
                result.setData(value);
                current=true;
            }
            result.setResult(Const.SUC,"update success");
		} catch (Exception e) {
			LOGGER.error(e);
			result.setResult(Const.FAIL,"updata fail");
			result.setData(old_value);
			current=true;
		}

		if (current == false){
			result.setCode("NotAllowed");
		}


		return result;
	}

	@RequestMapping(value = "/service/data/metadata/batchUpdate",method = RequestMethod.POST)
	public Result  batchUpdatePost(BatchUpdateModel batchUpdateModel) {

		Result result = dataService.batchUpdate(batchUpdateModel);

		return null;
	}

}
