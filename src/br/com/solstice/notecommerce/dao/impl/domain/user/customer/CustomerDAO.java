package br.com.solstice.notecommerce.dao.impl.domain.user.customer;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.dao.impl.domain.user.UserDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.user.User;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;
import br.com.solstice.notecommerce.entity.domain.user.customer.Gender;

public class CustomerDAO extends AbstractDAO {

	public CustomerDAO() {
		super("customers", "cus_id");
	}

	@Override
	public int save(Entity entity) {
		openConnection();
		PreparedStatement pstm = null;

		Customer customer = (Customer) entity;

		String sql = "INSERT INTO " + table
				+ "(cus_name, cus_cpf, cus_date_of_birth, cus_phone, cus_gender, cus_usr_id, cus_deleted) VALUES (?, ?, ?, ?, ?, ?, ?)";

		User user = customer.getUser();

		int idUser = new UserDAO().save(user);

		if (idUser == 0) {
			return 0;
		}

		try {
			pstm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			pstm.setString(1, customer.getName());
			pstm.setString(2, customer.getCpf());
			pstm.setDate(3, Date.valueOf(customer.getDateOfBirth()));
			pstm.setString(4, customer.getPhone());
			pstm.setString(5, customer.getGender().toString().toLowerCase());
			pstm.setInt(6, idUser);
			pstm.setBoolean(7, customer.isDeleted());
			
			System.out.println("pstm: " + pstm.toString());

			pstm.execute();

			ResultSet rs = pstm.getGeneratedKeys();

			int idClient = 0;

			if (rs.next()) {
				idClient = rs.getInt(1);
			}

			return idClient;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstm != null) {
				try {
					pstm.close();
				} catch (SQLException e) {
				}
			}
			if (connection != null) {
				try {
					System.out.println("Closing connection from " + this.getClass().getSimpleName());
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
		return 0;
	}

	@Override
	public void remove(Entity entity) {
		
	}

	@Override
	public void update(Entity entity) {
		openConnection();

		PreparedStatement pstm = null;

		Customer customer = (Customer) entity;

		String sql = "UPDATE " + table + " SET cus_name=?, cus_date_of_birth=?, cus_gender=?, cus_phone=? WHERE "
				+ idTable + "=?";

		try {
			pstm = connection.prepareStatement(sql);

			pstm.setString(1, customer.getName());
			pstm.setDate(2, Date.valueOf(customer.getDateOfBirth()));
			pstm.setString(3, customer.getGender().toString().toLowerCase());
			pstm.setString(4, customer.getPhone());
			pstm.setLong(5, customer.getId());
			
			System.out.println("pstm: " + pstm.toString());

			pstm.executeUpdate();
			
			new UserDAO().update(customer.getUser());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstm != null) {
				try {
					pstm.close();
				} catch (SQLException e) {
				}
			}
			if (connection != null) {
				try {
					System.out.println("Closing connection from " + this.getClass().getSimpleName());
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	@Override
	public List<Entity> consult(Entity entity, String operation) {
		openConnection();

		PreparedStatement pstm = null;
		ResultSet rs = null;

		Customer customer = (Customer) entity;

		String sql = "";

		if (operation.equals("consult")) {
			sql = "SELECT * from " + table + " WHERE cus_usr_id=? AND cus_deleted = false";
		}
		
		List<Entity> customers = new ArrayList<Entity>();

		try {
			pstm = connection.prepareStatement(sql);

			if (operation.equals("consult")) {
				pstm.setLong(1, customer.getUser().getId());
			}
			
			System.out.println("pstm: " + pstm.toString());

			rs = pstm.executeQuery();

			UserDAO userDAO = new UserDAO();

			while (rs.next()) {
				Customer currentCustomer = new Customer();
				currentCustomer.setId(rs.getLong(idTable));
				currentCustomer.setName(rs.getString("cus_name"));
				currentCustomer.setCpf(rs.getString("cus_cpf"));
				currentCustomer.setDateOfBirth((rs.getDate("cus_date_of_birth").toLocalDate()));
				currentCustomer.setGender(rs.getString("cus_gender").equals("male") ? Gender.MALE : Gender.FEMALE);
				currentCustomer.setPhone(rs.getString("cus_phone"));
				
				User user = new User();
				user.setId(rs.getLong("cus_usr_id"));

				user = (User) userDAO.consult(user, "findById").get(0);
				
				currentCustomer.setUser(user);

				customers.add(currentCustomer);
			}

			return customers;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstm != null) {
				try {
					pstm.close();
				} catch (SQLException e) {
				}
			}
			if (connection != null) {
				try {
					System.out.println("Closing connection from " + this.getClass().getSimpleName());
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
		
		return null;
	}

}