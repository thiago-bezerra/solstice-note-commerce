package br.com.solstice.notecommerce.controller.strategy.impl.domain.customer;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.dao.impl.domain.user.UserDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.user.User;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;

public class ValidateExistsEmail implements IStrategy {

	@Override
	public String process(Entity entity) {
		Customer customer = (Customer) entity;

		User user = customer.getUser();

		if (!new UserDAO().consult(user, "existsEmail").isEmpty()) {
			return "Já existe uma conta com este e-mail vinculado";
		}

		return null;
	}

}
