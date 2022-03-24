package project.aboutPet.shop.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.shop.dao.ItemListDAO;
import project.aboutPet.shop.dao.ShopDAO;
import project.aboutPet.shop.model.ShopDTO;

public class ItemListService {

	private ItemListService() {
	}

	private static ItemListService instance = new ItemListService();

	public static ItemListService getInstance() {
		return instance;
	}

	// 상품목록
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

	
	public List<ShopDTO> selectScate(int mcate_code) {
	      Connection con = null;
	      try {
	         con = ConnectionProvider.getConnection();
	         ItemListDAO dao = ItemListDAO.getInstance();
	         List<ShopDTO> list = null;
	         list = dao.selectScate(con, mcate_code);
	         return list;
	      } catch (SQLException | NamingException e) {
	         throw new RuntimeException(e);
	      } finally {
	         JdbcUtil.close(con);
	      }
	   }
	
	public List<ShopDTO> selectMemZzim(int mcate_code) {
	      Connection con = null;
	      try {
	         con = ConnectionProvider.getConnection();
	         ItemListDAO dao = ItemListDAO.getInstance();
	         List<ShopDTO> list = null;
	         list = dao.selectZzim(con, mcate_code);
	         return list;
	      } catch (SQLException | NamingException e) {
	         throw new RuntimeException(e);
	      } finally {
	         JdbcUtil.close(con);
	      }
	   }
	
	public int getCount(int lcate_code, int mcate_code) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			ItemListDAO dao = ItemListDAO.getInstance();
			int cnt = dao.count(con, lcate_code, mcate_code);
			return cnt;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

}
