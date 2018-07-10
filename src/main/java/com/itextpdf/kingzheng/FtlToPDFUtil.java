package com.itextpdf.kingzheng;

import com.itextpdf.html2pdf.ConverterProperties;
import com.itextpdf.html2pdf.HtmlConverter;
import com.itextpdf.html2pdf.resolver.font.DefaultFontProvider;
import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.kernel.pdf.PdfWriter;

import java.io.*;
import java.util.Map;

public class FtlToPDFUtil {

	private String path = "/";
	private static FtlToPDFUtil fk;

	private FtlToPDFUtil(String templatePath) {
		this.path = templatePath;
	}

	/**
	 * 
	 * @param templatePath
	 * @return
	 */
	public static FtlToPDFUtil getInstance(String templatePath) {
		if (null == fk) {
			fk = new FtlToPDFUtil(templatePath);
		}
		return fk;
	}

	public void change(String feltemp, Map<String, Object> values, String pdffilename) {
		FreemarkerUtil fu = FreemarkerUtil.getInstance(FreemarkerUtil.DirectoryForTemplateLoading, path);
		byte[] u = fu.generatorHtmlByteFromTemplate(feltemp, values);
		InputStream is = null;
		File out = new File(pdffilename);
		try {
			is = new ByteArrayInputStream(u);
			DefaultFontProvider fp = new DefaultFontProvider(true, true, true);
			ConverterProperties p = new ConverterProperties();
			p.setFontProvider(fp);
			p.setCharset(PdfEncodings.UTF8);

			HtmlConverter.convertToPdf(is, new PdfWriter(out), p);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public String write(String ttype, String feltemp, Map<String, Object> values, OutputStream out) {
		FreemarkerUtil fu = FreemarkerUtil.getInstance(ttype, path);
		byte[] u = fu.generatorHtmlByteFromTemplate(feltemp, values);
		InputStream is = null;

		try {
			is = new ByteArrayInputStream(u);
			DefaultFontProvider fp = new DefaultFontProvider(true, true, true);
			ConverterProperties p = new ConverterProperties();
			p.setFontProvider(fp);
			p.setCharset(PdfEncodings.UTF8);

			HtmlConverter.convertToPdf(is, new PdfWriter(out), p);
			return new String(u);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}

	public void change(String feltemp, Map<String, Object> values, OutputStream out) {
		FreemarkerUtil fu = FreemarkerUtil.getInstance(FreemarkerUtil.ClassForTemplateLoading, path);
		byte[] u = fu.generatorHtmlByteFromTemplate(feltemp, values);
		if (u == null || u.length == 0) {
			try {
				throw new Exception("freemarker");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		InputStream is = null;
		try {
			is = new ByteArrayInputStream(u);
			DefaultFontProvider fp = new DefaultFontProvider(true, true, true);
			ConverterProperties p = new ConverterProperties();
			p.setFontProvider(fp);
			p.setCharset(PdfEncodings.UTF8);
			HtmlConverter.convertToPdf(is, new PdfWriter(out), p);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
