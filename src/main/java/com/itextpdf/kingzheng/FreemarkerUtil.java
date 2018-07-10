package com.itextpdf.kingzheng;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;

import java.io.*;
import java.util.Map;

/**
 * freemarker 工具类
 *
 */
public class FreemarkerUtil {
	
	private static FreemarkerUtil fk;
	protected static final String UTF8 ="UTF-8";
    private static Configuration cfg;            //模版配置对象
    
    //模板路径加载类型
    public static final String DirectoryForTemplateLoading="DirectoryForTemplateLoading";
    public static final String ClassForTemplateLoading="ClassForTemplateLoading";
    public static final String MultiTemplateLoading="MultiTemplateLoading";
    
    private FreemarkerUtil(){}
    
    /**
     * 
     * @param  加载类型
     * @param templatePath 模版加载路径
     * @return
     */
	public static FreemarkerUtil getInstance(String templateLoading, String templatePath) {
		if (null == fk) {
			cfg = new Configuration(Configuration.VERSION_2_3_23);
			cfg.setDefaultEncoding(FreemarkerUtil.UTF8);
			cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
			
			if(DirectoryForTemplateLoading.equals(templateLoading)){
				setDirectoryForTemplateLoading(templatePath);
			}else if(ClassForTemplateLoading.equals(templateLoading)){
				setClassForTemplateLoading(templatePath);
			}else if(MultiTemplateLoading.equals(templateLoading)){
				setMultiTemplateLoading();
			}else{
				try {
					throw new Exception("模板路径出错，请注意查看");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			fk = new FreemarkerUtil();
		}
		return fk;
	}
    
	private static void setDirectoryForTemplateLoading(String templatePath) {
		//cfg.setDirectoryForTemplateLoading(new File("D:/jztemp"));
		try {
			cfg.setDirectoryForTemplateLoading(new File(templatePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private static void setClassForTemplateLoading(String templatePath) {
		//ftl模板文件统一放至 com.testExample.freemarker.template 包下面
		//cfg.setClassForTemplateLoading(FreemarkerUtil.class,"/com/testExample/freemarker/template/");
		cfg.setClassForTemplateLoading(FreemarkerUtil.class,templatePath);
	}
	
	//TODO 未完善
	private static void setMultiTemplateLoading() {
		//建议，就算不同文件夹，但是模板文件名也不能相同
		/*FileTemplateLoader ftl1 = new FileTemplateLoader(new File("C:/freemarker_ftl"));
		FileTemplateLoader ftl2 = new FileTemplateLoader(new File("E:/freemarker_ftl"));
		ClassTemplateLoader ctl = new ClassTemplateLoader(FreemarkerUtil.class, "/com/testExample/freemarker/template/");
		TemplateLoader[] loaders = new TemplateLoader[] { ftl1, ftl2, ctl };
		MultiTemplateLoader mtl = new MultiTemplateLoader(loaders);
		cfg.setTemplateLoader(mtl);*/
	}
  
	private void process(String templateName, String targetFileName, Map<String, Object> root) throws Exception {
        Writer out = null;
        try{
            File file = new File(targetFileName);
            if(!file.exists()) {
                file.createNewFile();
                file.setExecutable(true, false);
                file.setReadable(true, false);
                file.setWritable(true);
            }

            Template t = cfg.getTemplate(templateName);
            out = new OutputStreamWriter(new FileOutputStream(file),FreemarkerUtil.UTF8);//设置编码  UTF-8
            t.process(root, out);
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (null != out) {
                try {
                	out.flush();
                	out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }
	
	private void process(String templateName, OutputStream outStream, Map<String, Object> root) throws Exception {
        Writer out = null;
        try{
            Template t = cfg.getTemplate(templateName);
            out = new OutputStreamWriter(outStream,FreemarkerUtil.UTF8);//设置编码  UTF-8
            t.process(root, out);
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (null != out) {
                try {
                	out.flush();
                	out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }
    
    /**
     * 从模板生成静态html页面
     * @param templateName      模板文件名
     * @param targetFileName    目标文件名，即 html 的文件名，包含路径，绝对路径
     * @param root     模板里面变量的值
     */
    public void generatorHtmlFromTemplate(String templateName, String targetFileName, Map<String, Object> root) {
    	FreemarkerUtil hf = new FreemarkerUtil();
        try {
            hf.process(templateName, targetFileName, root);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 从模板生成静态html 字符串
     * @param templateName      模板文件名
     * @param root     模板里面变量的值
     */
    public String generatorHtmlFromTemplate(String templateName, Map<String, Object> root) {
    	FreemarkerUtil hf = new FreemarkerUtil();
        try {
        	ByteArrayOutputStream out = new ByteArrayOutputStream();
            hf.process(templateName, out, root);
            return new String(out.toByteArray(), FreemarkerUtil.UTF8);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    /**
     * 从模板生成静态html 字符串
     * @param templateName      模板文件名
     * @param root     模板里面变量的值
     */
    public byte[] generatorHtmlByteFromTemplate(String templateName, Map<String, Object> root) {
    	FreemarkerUtil hf = new FreemarkerUtil();
        try {
        	ByteArrayOutputStream out = new ByteArrayOutputStream();
            hf.process(templateName, out, root);
            return out.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}