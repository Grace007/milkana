package com.bds.milkana.utils;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;

public class DoubleFormatUtil {

	public static String userString(double n) {
		return String.format("%.2f", n);
	}

	public static String userDecimalFormat(double n) {
		DecimalFormat decimalFormat = new DecimalFormat("#.00");
		return decimalFormat.format(n);
	}

	public static double userBigDecimal(double n) {
		BigDecimal bigDecimal = new BigDecimal(n);
		return bigDecimal.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
	}

	public static String userNumberFormat(double n) {
		NumberFormat numberFormat = NumberFormat.getNumberInstance();
		numberFormat.setMaximumFractionDigits(2);
		return numberFormat.format(n);
	}

	public static double userMath(double n) {
		return (double) (Math.round(n * 100) / 100.0);
	}

	public static String thousandthPlace(String n){
		BigDecimal a=new BigDecimal(n);
		DecimalFormat df=new DecimalFormat(",###,##0"); //没有小数
//		DecimalFormat df=new DecimalFormat(",###,##0.0"); //保留一位小数
		String result =  df.format(a);
//		System.out.println(df.format(a));
		return result;
	}
	public static String formatDecimal(Double num,String format){
		DecimalFormat df=new DecimalFormat(format); //保留一位小数
		String result = df.format(num);
		return result;
	}

	public static void main(String[] args) {
		String num = "21321.3123";
		System.out.println("num = " + thousandthPlace(num));
		Double num_double = 82221.0200;
		System.out.println("formatDecimal(num_double,\"##0.0\") = " + formatDecimal(num_double,"##0.0"));
	}
}
