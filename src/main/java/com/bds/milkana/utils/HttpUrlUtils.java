package com.bds.milkana.utils;

import org.springframework.util.AntPathMatcher;
import org.springframework.web.servlet.HandlerMapping;

import javax.servlet.http.HttpServletRequest;


public class HttpUrlUtils {
    // 把指定URL后的字符串全部截断当成参数
    // 这么做是为了防止URL中包含中文或者特殊字符（/等）时，匹配不了的问题
    public static String extractPathFromPattern(final HttpServletRequest request) {
        String path = (String) request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
        String bestMatchPattern = (String) request.getAttribute(HandlerMapping.BEST_MATCHING_PATTERN_ATTRIBUTE);
        return new AntPathMatcher().extractPathWithinPattern(bestMatchPattern, path);
    }
}
