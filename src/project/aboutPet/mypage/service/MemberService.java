package project.aboutPet.mypage.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.mypage.dao.MyPageDAO;
import project.aboutPet.mypage.model.MemberDTO;

public class MemberService {

    private MemberService() {
    }

    private static MemberService instance = new MemberService();

    public static MemberService getInstance() {
        return instance;
    }

    // 회원정보 가져오기
    public MemberDTO selectMember(int mem_code) {
        Connection con = null;
        try {
            con = ConnectionProvider.getConnection();
            MyPageDAO dao = MyPageDAO.getInstance();
            MemberDTO memberDTO = null;
            memberDTO = dao.selectMember(con, mem_code);
            return memberDTO;
        } catch (SQLException | NamingException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(con);
        }
    }

    // 마이 찜리스트
    public int markCnt(int mem_code, String mark) {
        Connection con = null;
        try {
            con = ConnectionProvider.getConnection();
            MyPageDAO dao = MyPageDAO.getInstance();
            int markcnt = dao.markCnt(con, mem_code, mark);
            return markcnt;
        } catch (SQLException | NamingException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(con);
        }
    }

    // 장바구니 갯수 cartCnt
    public int cartCnt(int mem_code) {
        Connection con = null;
        try {
            con = ConnectionProvider.getConnection();
            MyPageDAO dao = MyPageDAO.getInstance();
            int cnt = dao.cartCnt(con, mem_code);
            return cnt;
        } catch (SQLException | NamingException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(con);
        }
    }


    // 쿠폰 갯수
    public int couponCnt(int mem_code, int mc_used) {
        Connection con = null;
        try {
            con = ConnectionProvider.getConnection();
            MyPageDAO dao = MyPageDAO.getInstance();
            int couponcnt = dao.couponCnt(con, mem_code, mc_used);
            return couponcnt;
        } catch (SQLException | NamingException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(con);
        }
    }


}
