package com.bds.milkana.utils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.xhtmlrenderer.pdf.ITextRenderer;

import com.itextpdf.kingzheng.FreemarkerUtil;
import com.itextpdf.kingzheng.FtlToPDFUtil;
import com.lowagie.text.DocumentException;

import freemarker.core.ParseException;
import freemarker.template.MalformedTemplateNameException;
import freemarker.template.TemplateException;
import freemarker.template.TemplateNotFoundException;

public class PdfUtils {
	public static void main(String[] args) {
		try {

			Map<Object, Object> o = new HashMap<Object, Object>();
			// 存入一个集合
			List<String> list = new ArrayList<String>();
			list.add("小明");
			list.add("张三");
			list.add("李四");
			o.put("name", "http://www.xdemo.org/");
			o.put("nameList", list);

			String path = "ftl/";

			generateToFile(path, "info.ftl", path + "/", o, "D:\\xdemo.pdf");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 生成PDF到文件
	 * 
	 * @param ftlPath
	 *            模板文件路径（不含文件名）
	 * @param ftlName
	 *            模板文件吗（不含路径）
	 * @param imageDiskPath
	 *            图片的磁盘路径
	 * @param data
	 *            数据
	 * @param outputFile
	 *            目标文件（全路径名称）
	 * @throws Exception
	 */
	public static void generateToFile(String ftlPath, String ftlName, String imageDiskPath, Object data,
			String outputFile) throws Exception {
		String html = PdfHelper.getPdfContent(ftlPath, ftlName, data);

		OutputStream out = new FileOutputStream(outputFile);
		ITextRenderer render = PdfHelper.getRender();
		render.setDocumentFromString(html);

		if (imageDiskPath != null && !imageDiskPath.equals("")) {
			// html中如果有图片，图片的路径则使用这里设置的路径的相对路径，这个是作为根路径
			render.getSharedContext().setBaseURL("file:/" + imageDiskPath);
		}
		render.layout();
		render.createPDF(out);
		render.finishPDF();
		render = null;
		out.close();
	}

	/**
	 * 生成PDF到输出流中（ServletOutputStream用于下载PDF）
	 * 
	 * @param ftlPath
	 *            ftl模板文件的路径（不含文件名）
	 * @param ftlName
	 *            ftl模板文件的名称（不含路径）
	 * @param imageDiskPath
	 *            如果PDF中要求图片，那么需要传入图片所在位置的磁盘路径
	 * @param data
	 *            输入到FTL中的数据
	 * @param response
	 *            HttpServletResponse
	 * @return
	 * @throws TemplateNotFoundException
	 * @throws MalformedTemplateNameException
	 * @throws ParseException
	 * @throws IOException
	 * @throws TemplateException
	 * @throws DocumentException
	 */
	public static OutputStream generateToServletOutputStream(String ftlPath, String ftlName, String imageDiskPath,
			Map<String, Object> data, HttpServletResponse response, String company_name)
			throws TemplateNotFoundException, MalformedTemplateNameException, ParseException, IOException,
			TemplateException, DocumentException {

		OutputStream out = response.getOutputStream();

		String html = FtlToPDFUtil.getInstance(ftlPath).write(FreemarkerUtil.DirectoryForTemplateLoading, ftlName, data, out);

//		Document doc = Jsoup.parse(html);
//		Map<String, String> map = new HashMap<String, String>();
//		Elements images = doc.select("img");
//		for (Element e : images) {
//			String key = e.outerHtml();
//			map.put(key, key + "</img>");
//		}
//
//		Map<String, String> map_input = new HashMap<String, String>();
//		Elements input = doc.select("input");
//		for (Element e : input) {
//			String key = e.outerHtml();
//			map_input.put(key, key + "</input>");
//		}
//		Map<String, String> br_input = new HashMap<String, String>();
//		Elements br = doc.select("br");
//		for (Element e : br) {
//			String key = e.outerHtml();
//			br_input.put(key, key + "</br>");
//		}
//
//		String dochtml = doc.html();
//
//		for (Map.Entry<String, String> entry : map.entrySet()) {
//			System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
//			dochtml = dochtml.replaceAll(entry.getKey(), entry.getValue());
//		}
//		for (Map.Entry<String, String> entry : map_input.entrySet()) {
//			dochtml = dochtml.replaceAll(entry.getKey(), entry.getValue());
//		}
//		for (Map.Entry<String, String> entry : br_input.entrySet()) {
//			dochtml = dochtml.replaceAll(entry.getKey(), entry.getValue());
//		}

		//FileWrite.wirteFile("D:\\pdf.html", html);

		return out;
	}
}
