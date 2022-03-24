package project.aboutPet.mypage.service;

import java.sql.Connection;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.mypage.dao.MyPageDAO;
import project.aboutPet.mypage.model.MemberDTO;

public class SignUpService {

    private SignUpService() {
    }

    private static SignUpService instance = new SignUpService();

    public static SignUpService getInstance() {
        return instance;
    }

    public int signUp(MemberDTO dto) {
        Connection con = null;
        int rowCount = 0;

        try {
            con = ConnectionProvider.getConnection();
            MyPageDAO dao = MyPageDAO.getInstance();
            rowCount = dao.signUp(con, dto);
        } catch (Exception e) {
            throw new RuntimeException();
        } finally {
            JdbcUtil.close(con);
        }
        return rowCount;

    }

}
