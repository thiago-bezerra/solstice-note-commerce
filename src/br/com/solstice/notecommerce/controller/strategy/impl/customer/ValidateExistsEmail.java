package br.com.solstice.notecommerce.controller.strategy.impl.customer;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.dao.impl.user.UserDAO;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.user.User;
import br.com.solstice.notecommerce.domain.user.customer.Customer;

public class ValidateExistsEmail implements IStrategy {

	@Override
	public String process(DomainEntity entity) {
		Customer customer = (Customer) entity;

		User user = customer.getUser();

		if (!new UserDAO().consult(user, "existsEmail").isEmpty()) {
			return "Já existe uma conta com este e-mail vinculado";
		}

		return null;
	}

}