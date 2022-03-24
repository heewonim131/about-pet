package project.aboutPet.shop.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import project.aboutPet.shop.dao.ShopDAO;
import project.aboutPet.shop.model.ShopDTO;


public class ShopService {

	private ShopService() {}
	private static ShopService instance = new ShopService();
	public static ShopService getInstance() {
		return instance;
	}

	//
	public List<ShopDTO> select_Stock(int lcate_code) {
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			ShopDAO dao = ShopDAO.getInstance();         
			List<ShopDTO> list = null;         
			list =  dao.select_Stock(con , lcate_code);          
			return list; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

	
	public List<ShopDTO> selectShelfLife(int lcate_code) {
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			ShopDAO dao = ShopDAO.getInstance();         
			List<ShopDTO> list = null;         
			list =  dao.selectShelfLife(con,lcate_code);          
			return list; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	
	
	public List<ShopDTO> selectTimeDeal(int lcate_code) {
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			ShopDAO dao = ShopDAO.getInstance();         
			List<ShopDTO> list = null;         
			list =  dao.timeDeal(con,lcate_code);          
			return list; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	/*
	 * public JSONObject getBestGoodsList(int lcate_code) { Connection con = null;
	 * try { con = ConnectionProvider.getConnection(); ShopDAO dao =
	 * ShopDAO.getInstance(); JSONObject jsonobj = null; jsonobj =
	 * dao.getBestGoodsList(con,lcate_code); return jsonobj; } catch (SQLException |
	 * NamingException e) { throw new RuntimeException(e); } finally {
	 * JdbcUtil.close(con); } }
	 */
	
	
	
	
	
	public List<ShopDTO> selectMD(String type,int lcate_code) {
	      Connection con = null;
	      try {
	         con = ConnectionProvider.getConnection();
	         ShopDAO dao = ShopDAO.getInstance();
	         List<ShopDTO> list = null;
	         list = dao.selectMDItem(con,type, lcate_code);
	         return list;
	      } catch (SQLException | NamingException e) {
	         throw new RuntimeException(e);
	      } finally {
	         JdbcUtil.close(con);
	      }
	   }

	   
	   public List<ShopDTO> selectCategory(int lcate_code) {
	      Connection con = null;
	      try {
	         con = ConnectionProvider.getConnection();
	         ShopDAO dao = ShopDAO.getInstance();
	         List<ShopDTO> list = null;
	         list = dao.selectCategory(con,lcate_code);
	         return list;
	      } catch (SQLException | NamingException e) {
	         throw new RuntimeException(e);
	      } finally {
	         JdbcUtil.close(con);
	      }
	   }
	
	
	
	
	   public ShopDTO selectMember(int mem_code) {
		      Connection con = null;
		      try {
		         con = ConnectionProvider.getConnection();
		         ShopDAO dao = ShopDAO.getInstance();
		         ShopDTO dto = null;
		         dto = dao.selectMemberInfo(con, mem_code);
		         return dto;
		      } catch (SQLException | NamingException e) {
		         throw new RuntimeException(e);
		      } finally {
		         JdbcUtil.close(con);
		      }
		   }

		   // 회원 추천상품
		   public List<ShopDTO> selectRecommed(int mem_code) {
		      Connection con = null;
		      try {
		         con = ConnectionProvider.getConnection();
		         ShopDAO dao = ShopDAO.getInstance();
		         List<ShopDTO> list = null;
		         list = dao.selectRecommedItem(con, mem_code);
		         return list;
		      } catch (SQLException | NamingException e) {
		         throw new RuntimeException(e);
		      } finally {
		         JdbcUtil.close(con);
		      }
		   }
	
	
	


}
