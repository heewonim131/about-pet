package project.aboutPet.shop.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import net.sf.json.JSONObject;
import project.aboutPet.shop.dao.BestGoodsListDAO;
import project.aboutPet.shop.dao.BrandListDAO;
import project.aboutPet.shop.dao.ShopDAO;
import project.aboutPet.shop.model.ShopDTO;

public class BestGoodsListService {

	private BestGoodsListService() {
	}

	private static BestGoodsListService instance = new BestGoodsListService();

	public static BestGoodsListService getInstance() {
		return instance;
	}
	
	public JSONObject bestGoodsList() {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			BestGoodsListDAO dao = BestGoodsListDAO.getInstance();
			JSONObject jsonData = null;
			jsonData = dao.bestGoodsList(con);
			return jsonData;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

}
