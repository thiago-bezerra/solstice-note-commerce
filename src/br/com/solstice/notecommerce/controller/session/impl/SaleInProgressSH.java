package br.com.solstice.notecommerce.controller.session.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import br.com.solstice.notecommerce.controller.session.ISessionHelper;
import br.com.solstice.notecommerce.dao.impl.domain.user.customer.CustomerDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.shop.cart.Cart;
import br.com.solstice.notecommerce.entity.domain.shop.cart.CartItem;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleInProgress;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleItem;
import br.com.solstice.notecommerce.entity.domain.user.User;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;

public class SaleInProgressSH implements ISessionHelper {

	@Override
	public void save(Entity entity, HttpSession session) {
		SaleInProgress saleInProgress = (SaleInProgress) entity;

		if (session.getAttribute("saleInProgress") == null) {
			SaleInProgress newSessionSaleInProgress = new SaleInProgress();

			// Set Customer
			User user = (User) session.getAttribute("loggedUser");
			Customer customer = new Customer();
			customer.setUser(user);
			customer = (Customer) new CustomerDAO().consult(customer, "consult").get(0);
			newSessionSaleInProgress.setCustomer(customer);

			// Set Items
			Cart cart = (Cart) session.getAttribute("cart");
			List<SaleItem> saleItems = new ArrayList<SaleItem>();
			for (CartItem item : cart.getItems()) {
				saleItems.add(SaleItem.fromCartItem(item));
			}
			newSessionSaleInProgress.setItems(saleItems);

			session.setAttribute("saleInProgress", newSessionSaleInProgress);
		}

		SaleInProgress sessionSaleInProgress = (SaleInProgress) session.getAttribute("saleInProgress");

		if (saleInProgress.getCreditCard() == null && saleInProgress.getBalanceUsage() == -1.0) {
			sessionSaleInProgress.setAddress(saleInProgress.getAddress());
		}

		if (saleInProgress.getCreditCard() != null) {
			sessionSaleInProgress.setCreditCard(saleInProgress.getCreditCard());
		}

		if (saleInProgress.getBalanceUsage() != -1) {
			sessionSaleInProgress.setBalanceUsage(saleInProgress.getBalanceUsage());
		}
	}

	@Override
	public void remove(Entity entity, HttpSession session) {

	}

	@Override
	public void update(Entity entity, HttpSession session) {

	}

	@Override
	public List<Entity> consult(Entity entity, HttpSession session, String operation) {
		SaleInProgress saleInProgress = (SaleInProgress) session.getAttribute("saleInProgress");
		
		return Arrays.asList(saleInProgress);
	}

}