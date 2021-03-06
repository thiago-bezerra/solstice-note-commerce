package br.com.solstice.notecommerce.dao.impl.domain.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.dao.impl.domain.stock.StockDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.product.Product;
import br.com.solstice.notecommerce.entity.domain.product.brand.Brand;
import br.com.solstice.notecommerce.entity.domain.product.file.ProductFile;
import br.com.solstice.notecommerce.entity.domain.stock.Stock;

public class ProductDAO extends AbstractDAO {

	public ProductDAO() {
		super();
	}

	public ProductDAO(Connection connection) {
		super(connection);
	}

	@Override
	public long save(Entity entity) {
		openConnection();
		PreparedStatement pstm = null;

		Product product = (Product) entity;

//		saveOrOverwriteFile(product.getImage());

		String sql = "INSERT INTO products "
				+ "(`prd_title`, `prd_image_url`, `prd_price`, `prd_description`, `prd_brd_id`, `prd_processor`, `prd_graphics_card`, `prd_ram`, `prd_monitor`, `prd_hd`, `prd_ssd`, `prd_os`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			pstm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			pstm.setString(1, product.getTitle());
			pstm.setString(2, product.getImage().getUrl());
			pstm.setDouble(3, product.getPrice());
			pstm.setString(4, product.getDescription());
			pstm.setLong(5, product.getBrand().getId());
			pstm.setString(6, product.getProcessor());
			pstm.setString(7, product.getGraphicsCard());
			pstm.setInt(8, product.getRam());
			pstm.setString(9, product.getMonitor());
			pstm.setInt(10, product.getHd());
			pstm.setInt(11, product.getSsd());
			pstm.setString(12, product.getOs());

			System.out.println("  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString().substring(pstm.toString().indexOf(':') + 2));

			pstm.execute();

			ResultSet rs = pstm.getGeneratedKeys();

			long idProduct = 0;

			if (rs.next()) {
				idProduct = rs.getLong(1);
				
				
				// Stock creation
				// Because of DB FK constraint, Stock creation needs to be done after Product creation (can't be done in a Strategy)
				StockDAO stockDAO = new StockDAO(connection);
				
				Stock stock = new Stock();
				stock.setQuantity(0);
				
				Product productToCreateStock = new Product();
				productToCreateStock.setId(idProduct);
				stock.setProduct(productToCreateStock);
				
				stockDAO.save(stock);
			}

			return idProduct;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstm != null) {
				try {
					pstm.close();
				} catch (SQLException e) {
				}
			}
			closeConnection();
		}

		return 0;
	}

	@Override
	public void remove(Entity entity) {
		openConnection();
		PreparedStatement pstm = null;

		Product product = (Product) entity;

		String sql = "UPDATE products SET `prd_deleted`='1' WHERE prd_id=?";

		try {
			pstm = connection.prepareStatement(sql);

			pstm.setLong(1, product.getId());

			System.out.println("  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString().substring(pstm.toString().indexOf(':') + 2));

			pstm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstm != null) {
				try {
					pstm.close();
				} catch (SQLException e) {
				}
			}
			closeConnection();
		}
	}

	@Override
	public void update(Entity entity) {
		openConnection();
		PreparedStatement pstm = null;

		Product product = (Product) entity;

//		saveOrOverwriteFile(product.getImage());

		String sql = "UPDATE products SET `prd_title`=?, `prd_image_url`=?, `prd_price`=?, `prd_description`=?, `prd_brd_id`=?, `prd_processor`=?, `prd_graphics_card`=?, `prd_ram`=?, `prd_monitor`=?, `prd_hd`=?, `prd_ssd`=?, `prd_os`=? "
				+ "WHERE prd_id=?";
		try {
			pstm = connection.prepareStatement(sql);

			pstm.setString(1, product.getTitle());
			pstm.setString(2, product.getImage().getUrl());
			pstm.setDouble(3, product.getPrice());
			pstm.setString(4, product.getDescription());
			pstm.setLong(5, product.getBrand().getId());
			pstm.setString(6, product.getProcessor());
			pstm.setString(7, product.getGraphicsCard());
			pstm.setInt(8, product.getRam());
			pstm.setString(9, product.getMonitor());
			pstm.setInt(10, product.getHd());
			pstm.setInt(11, product.getSsd());
			pstm.setString(12, product.getOs());

			pstm.setLong(13, product.getId());

			System.out.println("  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ":" + pstm.toString().substring(pstm.toString().indexOf(':') + 2));

			pstm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstm != null) {
				try {
					pstm.close();
				} catch (SQLException e) {
				}
			}
			closeConnection();
		}
	}

	@Override
	public List<Entity> consult(Entity entity, String operation) {
		openConnection();

		PreparedStatement pstm = null;
		ResultSet rs = null;

		Product product = (Product) entity;

		String sql = "";

		if (product.getId() != -1L) {
			operation = "findById";
		}

		if (operation.equals("consult")) {
			sql = "SELECT * from products WHERE prd_deleted = false";
		} else if (operation.equals("findById")) {
			sql = "SELECT * from products WHERE prd_id = ? AND prd_deleted = false";
		}

		List<Entity> products = new ArrayList<Entity>();

		try {
			pstm = connection.prepareStatement(sql);

			if (operation.equals("consult")) {
			} else if (operation.equals("findById")) {
				pstm.setLong(1, product.getId());
			}

			System.out.println("  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString().substring(pstm.toString().indexOf(':') + 2));

			rs = pstm.executeQuery();

			BrandDAO brandDAO = new BrandDAO(connection);

			while (rs.next()) {
				Product currentProduct = new Product();
				currentProduct.setId(rs.getLong("prd_id"));
				currentProduct.setTitle(rs.getString("prd_title"));

				ProductFile productFile = new ProductFile();
				productFile.setUrl(rs.getString("prd_image_url"));
				currentProduct.setImage(productFile);

				currentProduct.setPrice(rs.getDouble("prd_price"));
				currentProduct.setDescription(rs.getString("prd_description"));

				Brand brand = new Brand();
				brand.setId(rs.getLong("prd_brd_id"));
				brand = (Brand) brandDAO.consult(brand, "findById").get(0);
				currentProduct.setBrand(brand);

				currentProduct.setProcessor(rs.getString("prd_processor"));
				currentProduct.setGraphicsCard(rs.getString("prd_graphics_card"));
				currentProduct.setRam(rs.getInt("prd_ram"));
				currentProduct.setMonitor(rs.getString("prd_monitor"));
				currentProduct.setHd(rs.getInt("prd_hd"));
				currentProduct.setSsd(rs.getInt("prd_ssd"));
				currentProduct.setOs(rs.getString("prd_os"));

				products.add(currentProduct);
			}

			return products;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstm != null) {
				try {
					pstm.close();
				} catch (SQLException e) {
				}
			}
			closeConnection();
		}

		return null;
	}

//	private void saveOrOverwriteFile(ProductFile productFile) {
//		System.out.println("Trying to save file...");
//		if (null == productFile || null == productFile.getFileContent() || null == productFile.getAbsoluteFilePath()) {
//			System.out.println("no file path to save product file: " + productFile);
//			return;
//		}
//		
//		try {
//    	    File targetFile = new File(productFile.getAbsoluteFilePath());
//    	    targetFile.createNewFile(); // Overwrites
//    	    OutputStream outStream = new FileOutputStream(targetFile);
//    	 
//    	    byte[] buffer = new byte[8 * 1024];
//    	    int bytesRead;
//    	    while ((bytesRead = productFile.getFileContent().read(buffer)) != -1) {
//    	        outStream.write(buffer, 0, bytesRead);
//    	    }
//    	    IOUtils.closeQuietly(productFile.getFileContent());
//    	    IOUtils.closeQuietly(outStream);
//    	    
//    	    System.out.println("file " + productFile.getAbsoluteFilePath() + " saved");
//		} catch (Exception e)  {
//			e.printStackTrace();
//		}
//	}

}
