package br.com.solstice.notecommerce.controller.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.domain.user.User;
import br.com.solstice.notecommerce.domain.user.UserRole;

@WebFilter({ "/customer/*", "/pages/customer/*" })
public class CustomerFilter implements Filter {
	
	List<String> excludedUrls;
	
	public void init(FilterConfig fConfig) throws ServletException {
		excludedUrls = Arrays.asList(new String[] { "/pages/customer/customer-register.jsp" });
	}

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		User loggedUser = (User) request.getSession().getAttribute("loggedUser");
		
		String path = ((HttpServletRequest) req).getServletPath();
		
		if(!excludedUrls.contains(path)) {
			// Redirects to login if admin or not logged-in user tries to access customer pages
			if (null == loggedUser || loggedUser.getRole() != UserRole.CLIENT) {
				System.out.println("CustomerFilter: " + (loggedUser != null ? loggedUser.getRole() + " (" + loggedUser.getEmail() + ")" : "not logged-in user") + " tried to access customer page \"" + request.getRequestURI() + "\", redirecting...");
				response.sendRedirect("/note-commerce/pages/login.jsp");
				return;
			}
		}
		
		chain.doFilter(request, response);
	}

	public void destroy() {
	}
}
