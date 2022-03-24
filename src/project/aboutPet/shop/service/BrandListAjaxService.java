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
import project.aboutPet.shop.dao.BrandListAjaxDAO;
import project.aboutPet.shop.dao.ShopDAO;
import project.aboutPet.shop.model.ShopDTO;

public class BrandListAjaxService {

	private BrandListAjaxService() {
	}

	private static BrandListAjaxService instance = new BrandListAjaxService();

	public static BrandListAjaxService getInstance() {
		return instance;
	}

	public ArrayList<String> brandSelect(int br_code, int mem_code) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			BrandListAjaxDAO dao = BrandListAjaxDAO.getInstance();
			ArrayList<String >html = null;
			html = dao.brandSelect(con,br_code,mem_code);
			return html;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

	public String listCount(int br_code) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			BrandListAjaxDAO dao = BrandListAjaxDAO.getInstance();
			String count = null;
			count = dao.listCount(con,br_code);
			return count;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	


}
