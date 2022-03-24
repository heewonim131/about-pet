package project.aboutPet.mypage.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.mypage.dao.SearchDAO;

public class SearchResultService {

	private SearchResultService() {
	}

	private static SearchResultService instance = new SearchResultService();

	public static SearchResultService getInstance() {
		return instance;
	}

	//
	public int searchItem(String s_word, int Lcate_code) {
		Connection con2 = null;
		try {
			con2 = ConnectionProvider.getConnection();
			SearchDAO dao = SearchDAO.getInstance();
			int cntItem = 0;
			cntItem = dao.searchItem(con2, s_word, Lcate_code);

			return cntItem;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con2);
		}
	}

	public ArrayList<String> searchBrand(String s_word) {
		Connection con2 = null;
		try {
			con2 = ConnectionProvider.getConnection();
			SearchDAO dao = SearchDAO.getInstance();
			ArrayList<String> brandList = new ArrayList<String>();
			brandList = dao.searchBrand(con2, s_word);

			return brandList;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con2);
		}
	}

	public ArrayList<Integer> searchLog(String s_word) {
		Connection con2 = null;
		try {
			con2 = ConnectionProvider.getConnection();
			SearchDAO dao = SearchDAO.getInstance();
			ArrayList<Integer> cntLog = new ArrayList<Integer>();

			cntLog = dao.searchLog(con2, s_word);

			return cntLog;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con2);
		}
	}

	public ArrayList<Integer> searchVideo(String s_word) {
		Connection con2 = null;
		try {
			con2 = ConnectionProvider.getConnection();
			SearchDAO dao = SearchDAO.getInstance();
			ArrayList<Integer> cntVideo = new ArrayList<Integer>();

			cntVideo = dao.searchVideo(con2, s_word);

			return cntVideo;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con2);
		}
	}

}
