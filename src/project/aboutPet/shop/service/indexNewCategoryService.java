package project.aboutPet.shop.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.shop.dao.ItemListDAO;
import project.aboutPet.shop.dao.ShopDAO;
import project.aboutPet.shop.dao.indexNewCategoryDAO;
import project.aboutPet.shop.model.ShopDTO;

public class indexNewCategoryService {

	private indexNewCategoryService() {
	}

	private static indexNewCategoryService instance = new indexNewCategoryService();

	public static indexNewCategoryService getInstance() {
		return instance;
	}

	// 신상품
	public List<ShopDTO> selectIndexNewCategory(int lcate_code, int mcate_code) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			indexNewCategoryDAO dao = indexNewCategoryDAO.getInstance();
			List<ShopDTO> list = null;
			list = dao.selectNewCategoryItem(con, lcate_code, mcate_code);
			return list;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

	public List<ShopDTO> selectItemList(int lcate_code, int mcate_code) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			ItemListDAO dao = ItemListDAO.getInstance();
			List<ShopDTO> list = null;
			list = dao.selectItemList(con, lcate_code, mcate_code);
			return list;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	public List<ShopDTO> selectMcate(int lcate_code) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			indexNewCategoryDAO dao = indexNewCategoryDAO.getInstance();
			List<ShopDTO> list = null;
			list = dao.selectMcate(con,lcate_code);
			return list;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
}
