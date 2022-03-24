package project.aboutPet.mypage.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.mypage.dao.MyPageDAO;
import project.aboutPet.mypage.model.ShopDTO;

public class MyAlarmListService {

	private MyAlarmListService() {}
	private static MyAlarmListService instance = new MyAlarmListService();
	public static MyAlarmListService getInstance() {
		return instance;
	}

	// 재입고알림
	public List<ShopDTO> alarmList(int mem_code) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			MyPageDAO dao = MyPageDAO.getInstance();
			List<ShopDTO> list = null;
			list = dao.alarmList(con, mem_code);
			return list;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
}
