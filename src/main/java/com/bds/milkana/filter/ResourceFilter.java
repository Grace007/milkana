package com.bds.milkana.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class ResourceFilter extends HttpServlet implements Filter {

    private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(ResourceFilter.class);
    private static final long serialVersionUID = 1L;

    /**
     * 白名单_资源后缀
     */
    private static String[] RESOURCES_SUFFIX;

    public void doFilter(ServletRequest serRequest, ServletResponse serRespone, FilterChain filter)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) serRequest;
        HttpServletResponse response = (HttpServletResponse) serRespone;

        String uri = request.getRequestURI();

        try {
            if (containsSuffix(uri)) {
                filter.doFilter(serRequest, serRespone);
            } else {
                response.sendRedirect(request.getContextPath() + "/pages/error/404.html");
            }
        } catch (Exception e) {
            logger.error("", e);
        }

        return;
    }

    private boolean containsSuffix(String url) {
        boolean flag = false;
        for (String s : RESOURCES_SUFFIX) {
            if (url.endsWith(s)) {
                flag = true;
                break;
            }
        }
        return flag;
    }

    public void init(FilterConfig config) throws ServletException {

        /** 后缀 */
        RESOURCES_SUFFIX = config.getInitParameter("RESOURCES_SUFFIX").split(",");

    }
}
