package com.bds.milkana.utils;

import org.apache.batik.transcoder.TranscoderException;
import org.apache.batik.transcoder.TranscoderInput;
import org.apache.batik.transcoder.TranscoderOutput;
import org.apache.batik.transcoder.image.PNGTranscoder;

import java.io.*;


/**
 * @author eli
 * @date 2018/4/16 14:36
 */
public class SvgToImgUtil {
    /**
     * 将svg字符串转换为png
     *
     * @param svgCode     svg代码
     * @param pngFilePath 保存的路径
     * @throws TranscoderException svg代码异常
     * @throws IOException         io错误
     */
    public static void convertToPng(String svgCode, String pngFilePath) {

        File file = new File(pngFilePath);

        FileOutputStream outputStream = null;
        try {
            file.createNewFile();
            outputStream = new FileOutputStream(file);
            convertToPng(svgCode, outputStream);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * 将svgCode转换成png文件，直接输出到流中
     *
     * @param svgCode      svg代码
     * @param outputStream 输出流
     * @throws TranscoderException 异常
     * @throws IOException         io异常
     */
    public static void convertToPng(String svgCode, OutputStream outputStream) {
        try {
            byte[] bytes = svgCode.getBytes("utf-8");

            PNGTranscoder t = new PNGTranscoder();
            TranscoderInput input = new TranscoderInput(
                    new ByteArrayInputStream(bytes));
            TranscoderOutput output = new TranscoderOutput(outputStream);
            t.transcode(input, output);
            outputStream.flush();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }


//    public static void main(String[] args) throws IOException {
//        SvgToImgUtil svgTool =new SvgToImgUtil();
//
//        String svgpath = "d:\\1.svg";
//        File f = new File(svgpath);
//        String svgstr = svgTool.svg2String(f);
//      //  System.out.println("svgCode = " + svgCode);
////        svgCode = svgCode.replaceAll("transform=\".*?\"","transform=\"\"");
//   //     System.out.println("svgCode = " + svgCode);
//        String pngFilePath = "F:\\" + new Date().getTime() + ".png";
//        try {
//            convertToPng(svgstr, pngFilePath);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//
//    public InputStream getInputStream(File file) throws IOException {
//        return new FileInputStream(file);
//    }
//
//    public InputStream getInputStream(String filepath) throws IOException {
//        File file = new File(filepath);
//        if (file.exists())
//            return getInputStream(file);
//        else
//            return null;
//    }
//
//    public OutputStream getOutputStream(File outFile) throws IOException {
//        return new FileOutputStream(outFile);
//    }
//
//    public OutputStream getOutputStream(String outpath) throws IOException {
//        File file = new File(outpath);
//        if (!file.exists())
//            file.createNewFile();
//        return getOutputStream(file);
//    }
//
//    /**
//     * 默认使用编码UTF-8  SVG文件输入流转String
//     *
//     * @param svgFile
//     * @return SVG代码
//     * @throws IOException
//     */
//    public String svg2String(File svgFile) throws IOException {
//        InputStream in = getInputStream(svgFile);
//        return svg2String(in, "UTF-8");
//    }
//
//    /**
//     * SVG文件输入流转String
//     *
//     * @param svgFile
//     * @return SVG代码
//     * @throws IOException
//     */
//    public String svg2String(File svgFile, String charset) throws IOException {
//        InputStream in = getInputStream(svgFile);
//        return svg2String(in, charset);
//    }
//
//    /**
//     * 默认使用编码UTF-8  SVG输入流转String
//     *
//     * @param in
//     * @return SVG代码
//     */
//    public String svg2String(InputStream in) {
//        return svg2String(in, "UTF-8");
//    }
//
//    /**
//     * 指定字符集SVG输入流转String
//     *
//     * @param in      输入流
//     * @param charset 字符编码
//     * @return SVG代码
//     */
//    public String svg2String(InputStream in, String charset) {
//        StringBuffer svgBuffer = new StringBuffer();
//        BufferedReader bfr = null;
//        try {
//            InputStreamReader inputStreamReader = new InputStreamReader(in, charset);
//            bfr = new BufferedReader(inputStreamReader);
//            String line = "";
//            while ((line = bfr.readLine()) != null) {
//                svgBuffer.append(line);
//            }
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (bfr != null)
//                    bfr.close();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//        return svgBuffer.toString();
//    }
//

}
