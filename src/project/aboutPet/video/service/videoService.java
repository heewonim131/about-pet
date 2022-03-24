package project.aboutPet.video.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.video.dao.videoDAO;
import project.aboutPet.video.model.videoDTO;

public class videoService {

	private videoService() {}
	private static videoService instance = new videoService();
	public static videoService getInstance() {
		return instance;
	}
	
	//검은배너
	public List<videoDTO> blackBanner() {
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			videoDAO dao = videoDAO.getInstance();         
			List<videoDTO> list = null;         
			list = dao.blackBanner(con);       
			return list; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

	//시리즈추천
	public List<videoDTO> rcmdsList() {
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			videoDAO dao = videoDAO.getInstance();         
			List<videoDTO> list = null;         
			list = dao.rcmdsList(con);       
			return list; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	//인기영상
	public List<videoDTO> popuList() {
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			videoDAO dao = videoDAO.getInstance();         
			List<videoDTO> list = null;         
			list = dao.popuList(con);       
			return list; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	//신규영상
	public List<videoDTO> latestList() {
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			videoDAO dao = videoDAO.getInstance();         
			List<videoDTO> list = null;         
			list = dao.latestList(con);       
			return list; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	 
	//시리즈하나 설명
	public videoDTO seriesInfo(int s_code, int s_season) {
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			videoDAO dao = videoDAO.getInstance();         
			videoDTO sidto = null;         
			sidto = dao.seriesInfo(con, s_code, s_season);       
			return sidto; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	//시리즈별 영상
	public List<videoDTO> seriesVideos(int s_code, int s_season) {
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			videoDAO dao = videoDAO.getInstance();         
			List<videoDTO> list = null;         
			list = dao.seriesVideos(con, s_code, s_season);       
			return list; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	//영상재생
	public videoDTO playVideo(int v_code) {
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			videoDAO dao = videoDAO.getInstance();         
			videoDTO pvdto = null;         
			pvdto = dao.playVideo(con, v_code);       
			return pvdto; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	
}//videoService
