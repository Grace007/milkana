package com.bds.milkana.utils;

import java.util.Random;

/**
 * Created by guoyu on 2018/1/29. 查询sql视图的语句，统一从这调用
 */
public class Tools {
	public static int getRandomNum(int max) {

		int min = 1;
		Random random = new Random();
		int s = random.nextInt(max) % (max - min + 1) + min;
		return s;

	}
}
