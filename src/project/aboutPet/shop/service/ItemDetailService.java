package project.aboutPet.shop.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;

import org.apache.commons.collections.map.HashedMap;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.shop.dao.ItemDetailDAO;
import project.aboutPet.shop.dao.ShopDAO;
import project.aboutPet.shop.model.ShopDTO;

public class ItemDetailService {

	private ItemDetailService() {}
	private static ItemDetailService instance = new ItemDetailService();
	public static ItemDetailService getInstance() {
		return instance;
	}
	public ShopDTO selectItem(int item_code, int mem_code) throws ParseException {
		Connection con = null;
		ShopDTO dto = null;
		try {
			con = ConnectionProvider.getConnection();
			ItemDetailDAO dao = ItemDetailDAO.getInstance();
			dto = dao.selectItem(con , item_code);
			
			if (dto != null && mem_code != 0) {
				dao.insertItemView(con, item_code, mem_code);
			}
			
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	
	public List<ShopDTO> selectCompareItem(int item_code) {
		Connection con = null;            
		List<ShopDTO> list = null;         
		try {
			con = ConnectionProvider.getConnection();
			ItemDetailDAO dao = ItemDetailDAO.getInstance();         
			list =  dao.selectCompareItem(con,item_code);          
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
		return list; 
	}
	
	
	public String countPage(int item_code) {
		Connection con = null;            
		String count ="";         
		try {
			con = ConnectionProvider.getConnection();
			ItemDetailDAO dao = ItemDetailDAO.getInstance();         
			count =  dao.countPage(con,item_code);          
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
		return count; 
	}
	
	
	public Map<Integer, Double> countStar(int item_code) {
		Connection con = null;  
		Map<Integer, Double> map = null;
		try {
			con = ConnectionProvider.getConnection();
			ItemDetailDAO dao = ItemDetailDAO.getInstance();  
			map = new HashedMap();
			map =  dao.countStar(con,item_code);          
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
		return map; 
	}

	
	public ShopDTO selectRequiredInfo(int item_code) {
	      Connection con = null;
	      try {
	         con = ConnectionProvider.getConnection();
	         ItemDetailDAO dao = ItemDetailDAO.getInstance();
	         ShopDTO dto = null;
	         dto = dao.selectRequiredInfo(con, item_code);
	         return dto;
	      } catch (SQLException | NamingException e) {
	         throw new RuntimeException(e);
	      } finally {
	         JdbcUtil.close(con);
	      }
	   }

	   public ShopDTO selectItemStar(int item_code) {
	      Connection con = null;
	      try {
	         con = ConnectionProvider.getConnection();
	         ItemDetailDAO dao = ItemDetailDAO.getInstance();
	         ShopDTO dto = null;
	         dto = dao.selectItemStar(con, item_code);
	         return dto;
	      } catch (SQLException | NamingException e) {
	         throw new RuntimeException(e);
	      } finally {
	         JdbcUtil.close(con);
	      }
	   }

}
