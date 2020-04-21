package br.com.solstice.notecommerce.controller.viewhelper.impl.application.shop;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;
import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.product.Product;

public class ProductShopVH implements IViewHelper {

	@Override
	public Entity getEntity(HttpServletRequest request) {

		String operation = request.getParameter("operation");

		if (operation.equals("consult")) {
			long productId = -1L;
			if (null != request.getParameter("id")) {
				try {
					productId = Long.parseLong(request.getParameter("id"));
				} catch (Exception ex) {
				}
			}
			
			Product product = new Product();
			product.setId(productId);
			
			return product;
		}

		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");

		if (operation.equals("consult")) {
			if (((DomainEntity) getEntity(request)).getId() != -1L) {
				Product product = (Product) result.getEntities().get(0);
				
				if (product == null) {
					return;
				}
				
				request.setAttribute("product", product);
				
				request.getRequestDispatcher("/pages/shop/product-details.jsp").forward(request, response);
			} else {
				List<Product> products = result.getEntities().stream().map(product -> (Product) product)
						.collect(Collectors.toList());
	
				response.setContentType("application/json");
	
				try {
					JSONObject responseDetailsJson = new JSONObject();
					JSONArray jsonArray = new JSONArray();
	
					for (Product product : products) {
						JSONObject addressDetailsJSON = new JSONObject();
						addressDetailsJSON.put("id", product.getId());
						addressDetailsJSON.put("title", product.getTitle());
						addressDetailsJSON.put("imageURL", product.getImage().getUrl());
						addressDetailsJSON.put("price", product.getPrice());
						addressDetailsJSON.put("description", product.getDescription());
						addressDetailsJSON.put("brandName", product.getBrand().getName());
						addressDetailsJSON.put("processor", product.getProcessor());
						addressDetailsJSON.put("graphicsCard", product.getGraphicsCard());
						addressDetailsJSON.put("ram", product.getRam());
						addressDetailsJSON.put("monitor", product.getMonitor());
						addressDetailsJSON.put("hd", product.getHd());
						addressDetailsJSON.put("ssd", product.getSsd());
						addressDetailsJSON.put("os", product.getOs());
						jsonArray.put(addressDetailsJSON);
					}
					responseDetailsJson.put("products", jsonArray);
	
					PrintWriter writer = response.getWriter();
					writer.write(jsonArray.toString());
					writer.flush();
				} catch (JSONException e) {
					e.printStackTrace();
				}
			}
		}
	}

}
