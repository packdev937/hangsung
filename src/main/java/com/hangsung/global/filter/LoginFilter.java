package com.hangsung.global.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginFilter implements Filter {

    private FilterConfig filterConfig;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
        throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        Cookie[] cookies = httpRequest.getCookies();
        String userId = null;

        log.info("doFilter() 시작");
        if (cookies != null) {
            log.info("cookies가 null이 아님");
            for (Cookie cookie : cookies) {
	if (cookie.getName().equals("userId")) {
	    userId = cookie.getValue();
	    break;
	}
            }
        }

        if (userId == null) {
            httpResponse.sendRedirect("/login");
        } else {
            log.info("userId in Filter : " + userId);
            httpRequest.setAttribute("userId", userId);
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
    }
}
