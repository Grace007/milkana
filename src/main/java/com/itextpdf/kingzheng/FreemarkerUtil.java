package com.itextpdf.kingzheng;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;

import java.io.*;
import java.util.Map;

/**
 * freemarker ������
 *
 */
public class FreemarkerUtil {
	
	private static FreemarkerUtil fk;
	protected static final String UTF8 ="UTF-8";
    private static Configuration cfg;            //ģ�����ö���
    
    //ģ��·����������
    public static final String DirectoryForTemplateLoading="DirectoryForTemplateLoading";
    public static final String ClassForTemplateLoading="ClassForTemplateLoading";
    public static final String MultiTemplateLoading="MultiTemplateLoading";
    
    private FreemarkerUtil(){}
    
    /**
     * 
     * @param  ��������
     * @param templatePath ģ�����·��
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
					throw new Exception("ģ��·��������ע��鿴");
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
		//ftlģ���ļ�ͳһ���� com.testExample.freemarker.template ������
		//cfg.setClassForTemplateLoading(FreemarkerUtil.class,"/com/testExample/freemarker/template/");
		cfg.setClassForTemplateLoading(FreemarkerUtil.class,templatePath);
	}
	
	//TODO δ����
	private static void setMultiTemplateLoading() {
		//���飬���㲻ͬ�ļ��У�����ģ���ļ���Ҳ������ͬ
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
            out = new OutputStreamWriter(new FileOutputStream(file),FreemarkerUtil.UTF8);//���ñ���  UTF-8
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
            out = new OutputStreamWriter(outStream,FreemarkerUtil.UTF8);//���ñ���  UTF-8
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
     * ��ģ�����ɾ�̬htmlҳ��
     * @param templateName      ģ���ļ���
     * @param targetFileName    Ŀ���ļ������� html ���ļ���������·��������·��
     * @param root     ģ�����������ֵ
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
     * ��ģ�����ɾ�̬html �ַ���
     * @param templateName      ģ���ļ���
     * @param root     ģ�����������ֵ
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
     * ��ģ�����ɾ�̬html �ַ���
     * @param templateName      ģ���ļ���
     * @param root     ģ�����������ֵ
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