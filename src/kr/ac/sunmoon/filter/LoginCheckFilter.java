package kr.ac.sunmoon.filter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.sunmoon.model.dto.UserDto;

public class LoginCheckFilter implements Filter {
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws java.io.IOException, ServletException {
		HttpSession session = ((HttpServletRequest)request).getSession();
		UserDto userDto = (UserDto) session.getAttribute("userDto");

		if( userDto == null ){
			((HttpServletResponse)response).sendRedirect("/login/login.jsp");
			return;
		}
		else {
			chain.doFilter(request, response);
		}
	}

	@Override
	public void destroy() {
  
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
  
	}

}
