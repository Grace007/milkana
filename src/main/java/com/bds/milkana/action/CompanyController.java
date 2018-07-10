package com.bds.milkana.action;

import com.bds.milkana.model.TCompany;
import com.bds.milkana.model.TCompanyField;
import com.bds.milkana.model.TField;
import com.bds.milkana.model.common.Page;
import com.bds.milkana.model.common.Result;
import com.bds.milkana.service.CompanyService;
import com.bds.milkana.service.DynamicFieldService;
import com.bds.milkana.utils.Const;
import com.bds.milkana.utils.FileWriteUtils;
import com.bds.milkana.utils.PdfUtils;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @author eli
 * @date 2018/2/5 10:24
 */
@Controller
public class CompanyController extends BaseAction {
	private org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(CompanyController.class);
	@Resource
	private CompanyService companyService;
	@Resource
	private DynamicFieldService fieldService;

	@RequestMapping("/service/company/showlist")
	public String showList(Map<String, Object> map) {
//		List<TField> fieldList = fieldService.getAllList();
		List<TField> fieldList = fieldService.getAllListByorder();
		map.put("fieldList", fieldList);
		return "ftl/company";
	}

    /**
     * 查询公司列表
     * @param map
     * @param request
     * @param response
     * @param pageNum
     * @param pageSize
     * @param companyName
     * @param establishment
     * @param cheese
     * @return
     */
	@RequestMapping(value = "/service/company/query", method = RequestMethod.GET)
	@ResponseBody
	public Page query(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response,
			Integer pageNum, Integer pageSize, String companyName, String establishment, String cheese) {
		Page page = new Page();
		try {
			if (pageNum == null) {
				pageNum = 1;
			}
			if (pageSize == null) {
				pageSize = 3;
			}

			page = companyService.queryList(pageNum, pageSize, companyName, establishment, cheese);
		} catch (Exception e) {
			page.setCode(Const.FAIL);
			LOGGER.error("", e);
		}
		return page;
	}

	@RequestMapping(value = "/service/company/delete", method = RequestMethod.GET)
	@ResponseBody
	public Result deleteById(@RequestParam int id) {
		boolean temp = companyService.deleteById(id);
		Result result = new Result();
		result.setResult(Const.SUC, temp);
		return result;
	}

	@RequestMapping(value = "/service/company/queryById", method = RequestMethod.GET)
	@ResponseBody
	public Result queryById(@RequestParam Long id) {
		Result result = new Result();
		try {
			TCompany company = companyService.queryById(id);
			List<TCompanyField> companyFieldList = fieldService.getCompanyField(company.getCompany_id());
			company.setCompanyFieldList(companyFieldList);
			result.setResult(Const.SUC, company);

		} catch (Exception e) {
			LOGGER.error(e);
			result.setResult(Const.FAIL, "query message");
		}

		return result;
	}

	@RequestMapping(value = "/service/company/queryInfoById/{id}")
	public String queryInfoById(Map<String, Object> map, @PathVariable Long id) {
		try {
			TCompany company = companyService.queryById(id);
			List<TCompanyField> companyFieldList = fieldService.getCompanyField(company.getCompany_id());

			map.put("company", company);
			map.put("companyFieldList", companyFieldList);
			map.put("temp", true);
			/*
			 * String
			 * realPath=ClassUtils.getDefaultClassLoader().getResource("").
			 * getPath(); realPath =
			 * realPath.substring(realPath.indexOf("F:"),realPath.length());
			 * map.put("linkPath",realPath);
			 */

		} catch (Exception e) {
			LOGGER.error(e);
		}
		return "ftl/info";
	}

	/**
	 * 测试下载pdf
	 * 
	 * @param map
	 * @param response
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/service/company/download/{id}", method = RequestMethod.GET)
	public String downloadById(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response,
			@PathVariable Long id) {
		ServletOutputStream out = null;
		try {
			TCompany company = companyService.queryById(id);
			List<TCompanyField> companyFieldList = fieldService.getCompanyField(company.getCompany_id());
			map.put("company", company);
			map.put("companyFieldList", companyFieldList);

			Map<String, Object> o = new HashMap<String, Object>();

			o.put("company", company);
			o.put("companyFieldList", companyFieldList);
			o.put("temp", false);
			o.put("vtop1", "http://img.bds-analytics.com/4b291d0b3b8547549c6d95634384f111.jpg");
			o.put("vtop2_left", "http://img.bds-analytics.com/4b291d0b3b8547549c6d95634384f111.jpg");
			o.put("vtop2_right", "http://img.bds-analytics.com/4b291d0b3b8547549c6d95634384f111.jpg");
			o.put("vtop3_left", "http://img.bds-analytics.com/4b291d0b3b8547549c6d95634384f111.jpg");
			o.put("vtop3_right", "http://img.bds-analytics.com/4b291d0b3b8547549c6d95634384f111.jpg");

			String path = Const.FTL_PATH;

			PdfUtils.generateToServletOutputStream(path, "info.ftl", null, o, response, company.getCompany_name());

		} catch (Exception e) {
			LOGGER.error(e);
		}
		return null;
	}

	@RequestMapping(value = "/service/company/add", method = RequestMethod.POST)
	@ResponseBody
	public Result add(TCompany company, @RequestParam String field_data) {
		Result result = companyService.add(company);
		fieldService.saveCompanyField(company.getCompany_id(), field_data);
		return result;
	}

	@RequestMapping(value = "/service/company/update", method = RequestMethod.POST)
	@ResponseBody
	public Result update(TCompany company, @RequestParam String field_data) {
		Result result = new Result();

		try {
			TCompany companytemp = companyService.update(company);
			fieldService.updateCompanyField(companytemp.getCompany_id(), field_data);
			result.setResult(Const.SUC, "update success");
		} catch (Exception e) {
			LOGGER.error(e);
			result.setResult(Const.FAIL, "update fail");
		}
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "/service/company/upload_img", method = RequestMethod.POST)
	public String uploadImg(HttpServletRequest request, HttpServletResponse response,
							MultipartFile ajaxTaskFile
	) {
		LOGGER.info(ajaxTaskFile);
		try {

			if (ajaxTaskFile != null) {
				// 将文件上传到阿里OSS上
				InputStream inputStream = ajaxTaskFile.getInputStream();
				byte [] bytes = ajaxTaskFile.getBytes();

				// 获取上传后的图片地址,并且关闭OSS连接
				String imageName = UUID.randomUUID().toString() + ".png";
//				String url = OSSUtil.uploadFile(imageName, inputStream);
				String url = FileWriteUtils.wirteImg(imageName,bytes);
				LOGGER.info(url);

				JSONObject json = new JSONObject();
				json.put("fileName", imageName);
				json.put("url", url);
				return json.toString();

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 图片下载显示映射(读取本地文件以url形式)
	 * @param response
	 * @param filename
	 * @param request
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/download/{filename:.+}")
	public void downLoad(HttpServletResponse response, @PathVariable String filename, HttpServletRequest request) {

		String basePath = "D:\\java\\milkana\\upload\\";
		File file = null;
		try {
			file = new File(basePath+filename);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if (file.exists()) { // 判断文件父目录是否存在
//			response.setContentType("application/force-download");
//			response.setHeader("Content-Disposition", "attachment;fileName=" + filename);

			byte[] buffer = new byte[1024];
			FileInputStream fis = null; // 文件输入流
			BufferedInputStream bis = null;

			OutputStream os = null; // 输出流
			try {
				os = response.getOutputStream();
				fis = new FileInputStream(file);
				bis = new BufferedInputStream(fis);
				int i = bis.read(buffer);
				while (i != -1) {
					os.write(buffer);
					i = bis.read(buffer);
				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("----------file download" + filename);
			try {
				bis.close();
				fis.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

	//@RequestParam("imageData") MultipartFile imageData
//	@ResponseBody
//	@RequestMapping(value = "/service/company/upload_img", method = RequestMethod.POST)
//	public String uploadImg(HttpServletRequest request, HttpServletResponse response,
//							MultipartFile ajaxTaskFile
//			) {
//		LOGGER.info(ajaxTaskFile);
//		try {
//
//			if (ajaxTaskFile != null) {
//				// 将文件上传到阿里OSS上
//				InputStream inputStream = ajaxTaskFile.getInputStream();
//
//				// 获取上传后的图片地址,并且关闭OSS连接
//				String imageName = UUID.randomUUID().toString() + ".jpg";
//				String url = OSSUtil.uploadFile(imageName, inputStream);
//				LOGGER.info(url);
//
//				JSONObject json = new JSONObject();
//				json.put("fileName", imageName + ".jpg");
//				json.put("url", url);
//				return json.toString();
//
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return null;
//	}
}
