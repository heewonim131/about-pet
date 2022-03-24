package project.aboutPet.shop.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import net.sf.json.JSONObject;
import netscape.javascript.JSObject;
import project.aboutPet.shop.dao.BrandListDAO;
import project.aboutPet.shop.dao.ShopDAO;
import project.aboutPet.shop.model.ShopDTO;

public class BrandListService {

	private BrandListService() {
	}

	private static BrandListService instance = new BrandListService();

	public static BrandListService getInstance() {
		return instance;
	}


	public String listCount(int br_code) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			BrandListDAO dao = BrandListDAO.getInstance();
			String count = null;
			count = dao.listCount(con,br_code);
			return count;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	public Map<String, String> selectItemNameLcate(int br_code) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			BrandListDAO dao = BrandListDAO.getInstance();
			Map map = null;
			map = dao.selectItemNameLcate(con,br_code);
			return map;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	


}
