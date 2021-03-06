package br.com.solstice.notecommerce.controller.viewhelper.impl.domain.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;
import br.com.solstice.notecommerce.entity.domain.user.User;
import br.com.solstice.notecommerce.entity.domain.user.UserRole;

public class LoginVH implements IViewHelper {

	@Override
	public Entity getEntity(HttpServletRequest request) {
		
		String operation = request.getParameter("operation");

		if (null != operation) {
			if (operation.equals("login")) {
				String email = "";
				if (null != request.getParameter("email")) {
					try {
						email = request.getParameter("email");
					} catch (Exception ex) {
					}
				}

				String password = "";
				if (null != request.getParameter("password")) {
					try {
						password = request.getParameter("password");
					} catch (Exception ex) {
					}
				}

				User user = new User();
				user.setEmail(email);
				user.setPassword(password);

				return user;
			}
		}

		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");

		if (operation.equals("login")) {
			List<Entity> resultEntities = result.getEntities();

			if (null == resultEntities) {
				return;
			}

			if (resultEntities.size() > 0) {
				User resultUser = (User) resultEntities.get(0);

				//request.getSession().invalidate();
				request.getSession().setAttribute("loggedUser", resultUser);
				
				String redirectPath = request.getParameter("redirect");
				if (redirectPath != null && !redirectPath.trim().isEmpty()) {
					response.sendRedirect(redirectPath);
					return;
				}
				
				if (resultUser.getRole() == UserRole.CLIENT) {
					response.sendRedirect("/note-commerce/pages/shop/products.jsp");
					return;
				} else {
					response.sendRedirect("/note-commerce/pages/admin/dashboard.jsp");
					return;
				}
			} else {
				String message = "E-mail e/ou senha inválidos!";
				request.setAttribute("message", message);
				request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
			}
		}
	}

}
