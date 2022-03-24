package project.aboutPet.mypage.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.mypage.dao.MyPageDAO;
import project.aboutPet.mypage.model.MemberDTO;
import project.aboutPet.mypage.model.PetDTO;

public class LogonService {

    private LogonService() {
    }

    private static LogonService instance = new LogonService();

    public static LogonService getInstance() {
        return instance;
    }

    public MemberDTO select(String id) {
        Connection con = null;
        try {
            con = ConnectionProvider.getConnection();
            MyPageDAO dao = MyPageDAO.getInstance();
            MemberDTO memberDTO = null;
            memberDTO = dao.logonMember(con, id);
            return memberDTO;
        } catch (SQLException | NamingException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(con);
        }
    }

}
