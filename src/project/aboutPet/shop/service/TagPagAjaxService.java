package project.aboutPet.shop.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;

import org.apache.commons.collections.map.HashedMap;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.shop.dao.ItemDetailDAO;
import project.aboutPet.shop.dao.ShopDAO;
import project.aboutPet.shop.dao.TagPageAjaxDAO;
import project.aboutPet.shop.model.ShopDTO;

public class TagPagAjaxService {

	private TagPagAjaxService() {}
	private static TagPagAjaxService instance = new TagPagAjaxService();
	public static TagPagAjaxService getInstance() {
		return instance;
	}
	public List<ShopDTO> selectTagList(String tagName ) {
		Connection con = null;
		List<ShopDTO> list= null;
		try {
			con = ConnectionProvider.getConnection();
			TagPageAjaxDAO dao = TagPageAjaxDAO.getInstance();
			list = dao.selectTagList(con,tagName);
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public String countPage(String tagName ) {
		Connection con = null;            
		String count ="";         
		try {
			con = ConnectionProvider.getConnection();
			TagPageAjaxDAO dao = TagPageAjaxDAO.getInstance();       
			count =  dao.countList(con,tagName);          
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
		return count; 
	}
}
