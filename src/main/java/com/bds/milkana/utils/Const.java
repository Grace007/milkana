package com.bds.milkana.utils;

import java.io.File;

public class Const {
	public static final String FAIL = "fail";

	public static final String SUC = "suc";

	public final static String sessionKey = "sessionContext";
	public final static String verifyCode = "verifyCode";

	public static final String SESSION_USER = "sessionUser";

	public static final String SESSION_USERNAME = "username"; // 用户名

	public static final String DESKEY = "12345abc";
	public static String Context;
	public static String Host_Ip;
	public static int Host_Port;
	public static String HttpContext;
	public static String ContextPath = "";

	public static String Zookepper_Nodes;

	public static String Node;
	public static String ZNode;

	public static boolean LOCAL;

	public static final int decimal_num = 4;

	// 文件路径
	public static String FTL_PATH = System.getProperty("user.dir") + File.separator + "ftl";

}
