package project.aboutPet.mypage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import project.aboutPet.mypage.model.MemberDTO;
import project.aboutPet.mypage.model.CouponDTO;
import project.aboutPet.mypage.model.LogDTO;
import project.aboutPet.mypage.model.ShopDTO;
import project.aboutPet.mypage.model.TvDTO;
import project.aboutPet.mypage.model.PetDTO;

public class MyPageDAO {

    private static MyPageDAO dao = null;

    private MyPageDAO() {
    }

    public static MyPageDAO getInstance() {
        if (dao == null) {
            dao = new MyPageDAO();
        }
        return dao;
    }


    //회원가입
    public int signUp(Connection con, MemberDTO dto) throws SQLException {
        PreparedStatement pstmt = null;

        String sql = " INSERT INTO MEMBER " +
                " (MEM_CODE, MEM_ID, NICKNAME, MEM_PW, MEM_EMAIL, MEM_INVITE ) "
                + " VALUES (SEQ_MEMBER.NEXTVAL ,?, ?, ?, ? ,?)";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, dto.getMem_id());
            pstmt.setString(2, dto.getNickname());
            pstmt.setString(3, dto.getMem_pw());
            pstmt.setString(4, dto.getMem_email());
            pstmt.setString(5, dto.getMem_invite());
            return pstmt.executeUpdate();

        } finally {
            JdbcUtil.close(pstmt);
        }

    }


    // 회원정보
    public MemberDTO logonMember(Connection con, String id)
            throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberDTO memberDTO = null;

        String sql = " SELECT MEM_CODE, MEM_ID, MEM_NAME, MEM_PW, NICKNAME, MEM_EMAIL, GR_CODE, MEM_POINT, CONTACT, MEM_INVITE, INVITED, MTAG " +
                " FROM MEMBER " +
                " WHERE REGEXP_LIKE(MEM_ID, '^('|| ?||')$', 'i') ";

        //mem_name
        try {
            pstmt = con.prepareStatement(sql);

            // 변수설정
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                memberDTO = new MemberDTO();
                memberDTO.setMem_code(rs.getInt("mem_code"));
                memberDTO.setMem_id(rs.getString("mem_id"));
                memberDTO.setMem_name(rs.getString("mem_name"));
                memberDTO.setMem_pw(rs.getString("mem_pw"));
                memberDTO.setNickname(rs.getString("nickname"));

                memberDTO.setMem_email(rs.getString("mem_email"));
                memberDTO.setGr_name(rs.getString("gr_code"));
                memberDTO.setMem_point(rs.getInt("mem_point"));
                memberDTO.setContact(rs.getString("contact"));
                memberDTO.setMem_invite(rs.getString("mem_invite"));
                memberDTO.setInvited(rs.getString("invited"));
                memberDTO.setMtag(rs.getString("mtag"));

            }

        } finally {
            JdbcUtil.close(pstmt);
        }//finally

        return memberDTO;
    }//logonMember


    // 회원정보
    public MemberDTO selectMember(Connection con, int mem_code)
            throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberDTO memberDTO = null;

        String sql = " SELECT MEM_IMG, MEM_ID, NICKNAME, MEM_NAME, CONTACT " +
                " 		, MEM_EMAIL, GR_NAME, MEM_INVITE, MEM_POINT, MTAG " +
                " FROM MEMBER M JOIN GRADE G ON G.GR_CODE = M.GR_CODE " +
                " WHERE MEM_CODE = ? ";

        try {
            pstmt = con.prepareStatement(sql);

            // 변수설정
            pstmt.setInt(1, mem_code);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                memberDTO = new MemberDTO();
                memberDTO.setMem_img(rs.getString("mem_img"));
                memberDTO.setMem_id(rs.getString("mem_id"));
                memberDTO.setNickname(rs.getString("nickname"));
                memberDTO.setMem_name(rs.getString("mem_name"));
                memberDTO.setContact(rs.getString("contact"));
                memberDTO.setMem_email(rs.getString("mem_email"));
                memberDTO.setGr_name(rs.getString("gr_name"));
                memberDTO.setMem_invite(rs.getString("mem_invite"));
                memberDTO.setMem_point(rs.getInt("mem_point"));
                memberDTO.setMtag(rs.getString("mtag"));
            }

        } finally {
            JdbcUtil.close(pstmt);
        }//finally

        return memberDTO;
    }//selectMember


    // 회원정보 수정
    public int updatePrf(Connection con, MemberDTO dto)
            throws SQLException {
        PreparedStatement pstmt = null;
        int rowCount = 0;

        String sql = " UPDATE MEMBER " +
                " SET MEM_IMG = ?, NICKNAME = ?, MEM_EMAIL = ?, MTAG = ? " +
                " WHERE MEM_CODE = ? ";

        try {
            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, dto.getMem_img());
            pstmt.setString(2, dto.getNickname());
            pstmt.setString(3, dto.getMem_email());
            pstmt.setString(4, dto.getMtag());
            pstmt.setInt(5, dto.getMem_code());

            rowCount = pstmt.executeUpdate();
        } finally {
            JdbcUtil.close(pstmt);
        }  // finally

        return rowCount;

    }//manage


    // 마이펫 리스트
    public List<PetDTO> petList(Connection con, int mem_code)
            throws SQLException {

        ArrayList<PetDTO> list = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = " SELECT PET_CODE, PET_IMG, PET_NAME, PT_NAME, PET_GEN, PET_AGE " +
                " FROM PET P JOIN PET_TYPE PT ON P.PT_CODE = PT.PT_CODE " +
                " WHERE MEM_CODE = ? " +
                " ORDER BY PET_CODE DESC ";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, mem_code);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                list = new ArrayList<PetDTO>();
                PetDTO petDTO = null;
                do {
                    petDTO = new PetDTO();
                    petDTO.setPet_code(rs.getInt("pet_code"));
                    petDTO.setPet_img(rs.getString("pet_img"));
                    petDTO.setPet_name(rs.getString("pet_name"));
                    petDTO.setPt_name(rs.getString("pt_name"));
                    petDTO.setPet_gen(rs.getString("pet_gen"));
                    petDTO.setPet_age(rs.getString("pet_age"));

                    list.add(petDTO);
                } while (rs.next());
            }
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        } // finally

        return list;

    }//selectPet


    // 찜 갯수
    public int markCnt(Connection con, int mem_code, String mark)
            throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int markcnt = 0;

        String sql = " SELECT COUNT(*) $table " +
                " FROM $table " +
                " WHERE MEM_CODE = ? ";

        try {

            sql = sql.replace("$table", mark);

            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, mem_code);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                markcnt = rs.getInt(mark);
            }

        } finally {
            JdbcUtil.close(pstmt);
        }//finally

        return markcnt;
    }//markCnt


    // 장바구니 갯수
    public int cartCnt(Connection con, int mem_code)
            throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int cnt = 0;

        String sql = " SELECT SUM(CART_CNT) CNT " +
                " FROM CART " +
                " WHERE MEM_CODE = ? ";

        try {

            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, mem_code);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                cnt = rs.getInt("cnt");
            }

        } finally {
            JdbcUtil.close(pstmt);
        }//finally

        return cnt;
    }//cartCnt


    // 최근 본 영상
    public List<TvDTO> recentTv(Connection con, int mem_code)
            throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<TvDTO> list = null;

        String sql = " SELECT V.V_CODE, V_TYPE, V_IMG, V_TIME, VV_DATE " +
                "    , NVL(S_NAME, EDU_CATE) S_NAME " +
                "    , NVL(EDU_TITLE, V_NAME) V_NAME " +
                " FROM VIDEO V JOIN VIDEO_VIEW VV ON V.V_CODE = VV.V_CODE " +
                "    LEFT JOIN SERIES_VIDEO SV ON V.V_CODE = SV.V_CODE " +
                "    LEFT JOIN SERIES S ON SV.S_CODE = S.S_CODE " +
                "    LEFT JOIN EDU_VIDEO EV ON V.V_CODE = EV.V_CODE " +
                "    LEFT JOIN PET_EDU E ON EV.EDU_CODE = E.EDU_CODE " +
                " WHERE MEM_CODE = ? " +
                " ORDER BY VV_DATE DESC ";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, mem_code);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                list = new ArrayList<TvDTO>();
                TvDTO mtDTO = null;
                do {
                    mtDTO = new TvDTO();
                    mtDTO.setV_code(rs.getInt("v_code"));
                    mtDTO.setV_type(rs.getString("v_type"));
                    mtDTO.setV_img(rs.getString("v_img"));
                    mtDTO.setV_time(rs.getString("v_time"));
                    mtDTO.setS_name(rs.getString("s_name"));
                    mtDTO.setV_name(rs.getString("v_name"));
                    mtDTO.setVv_date(rs.getDate("vv_date"));
                    list.add(mtDTO);
                } while (rs.next());
            }
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        } // finally

        return list;

    }//recentTv


    // 내쿠폰 개수
    public int couponCnt(Connection con, int mem_code, int mc_used)
            throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int cnt = 0;

        String sql = " SELECT COUNT(*) mem_coupon " +
                " FROM MEM_COUPON " +
                " WHERE MEM_CODE = ? AND MC_USED = ? ";

        try {
            pstmt = con.prepareStatement(sql);

            // 변수설정
            pstmt.setInt(1, mem_code);
            pstmt.setInt(2, mc_used);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                cnt = rs.getInt("mem_coupon");
            }

        } finally {
            JdbcUtil.close(pstmt);
        }//finally

        return cnt;
    }//memCoupon


    // 마이펫
    public PetDTO petView(Connection con, int pet_code)
            throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        PetDTO petDTO = null;

        String sql = " SELECT PET_CODE, PET_IMG, PET_NAME, PET_CATE, PT_NAME " +
                "    		, PET_AGE, PET_GEN, PET_WEI, PET_NEUT, DISE, ALG " +
                " FROM PET P JOIN PET_TYPE PT ON P.PT_CODE = PT.PT_CODE " +
                " WHERE PET_CODE = ? ";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, pet_code);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                petDTO = new PetDTO();
                petDTO.setPet_code(rs.getInt("pet_code"));
                petDTO.setPet_img(rs.getString("pet_img"));
                petDTO.setPet_name(rs.getString("pet_name"));
                petDTO.setPet_cate(rs.getString("pet_cate"));
                petDTO.setPt_name(rs.getString("pt_name"));
                petDTO.setPet_gen(rs.getString("pet_gen"));
                petDTO.setPet_age(rs.getString("pet_age"));
                petDTO.setPet_wei(rs.getString("pet_wei"));
                petDTO.setPet_neut(rs.getString("pet_neut"));
                petDTO.setAlg(rs.getString("alg"));
                petDTO.setDise(rs.getString("dise"));
            }

        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        } // finally

        return petDTO;

    }//petView

    // 마이 찜 리스트 - TV
    public List<TvDTO> wishTv(Connection con, int mem_code)
            throws SQLException {

        ArrayList<TvDTO> list = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = " SELECT V.V_CODE, V_IMG, V_NAME, V_TIME " +
                " FROM VIDEO_MARK VM JOIN VIDEO V ON VM.V_CODE=V.V_CODE " +
                " WHERE MEM_CODE = ? " +
                " ORDER BY VM_CODE DESC ";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, mem_code);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                list = new ArrayList<TvDTO>();
                TvDTO tvDTO = null;
                do {
                    tvDTO = new TvDTO();
                    tvDTO.setV_code(rs.getInt("v_code"));
                    tvDTO.setV_img(rs.getString("v_img"));
                    tvDTO.setV_name(rs.getString("v_name"));
                    tvDTO.setV_time(rs.getString("v_time"));

                    list.add(tvDTO);
                } while (rs.next());
            }
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        } // finally

        return list;

    }//wishTv

    // 마이 찜 리스트 - 로그
    public List<LogDTO> wishLog(Connection con, int mem_code)
            throws SQLException {

        ArrayList<LogDTO> list = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = " SELECT L.LOG_CODE, LOG_IMG " +
                " FROM LOG_MARK LM JOIN PET_LOG L ON LM.LOG_CODE=L.LOG_CODE " +
                " WHERE LM.MEM_CODE = ? " +
                " ORDER BY LM_CODE DESC ";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, mem_code);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                list = new ArrayList<LogDTO>();
                LogDTO logDTO = null;
                do {
                    logDTO = new LogDTO();
                    logDTO.setLog_code(rs.getInt("log_code"));
                    logDTO.setLog_img(rs.getString("log_img"));

                    list.add(logDTO);
                } while (rs.next());
            }
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        } // finally

        return list;

    }//wishLog

    // 마이 찜 리스트 - 샵
    public List<ShopDTO> wishShop(Connection con, int mem_code)
            throws SQLException {

        ArrayList<ShopDTO> list = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = " SELECT I.ITEM_CODE, ITEM_NAME, ITEM_URL, ITEM_IMG " +
                " 			, ITEM_PRICE, NVL(SALE_RATE, 0) SALE_RATE " +
                " FROM ITEM_MARK IM JOIN ITEM I ON IM.ITEM_CODE=I.ITEM_CODE " +
                "    LEFT JOIN ITEM_SALE S ON S.ITEM_CODE=I.ITEM_CODE " +
                " WHERE MEM_CODE = ? " +
                " ORDER BY IM_CODE DESC ";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, mem_code);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                list = new ArrayList<ShopDTO>();
                ShopDTO shopDTO = null;
                do {
                    shopDTO = new ShopDTO();
                    shopDTO.setItem_code(rs.getInt("item_code"));
                    shopDTO.setItem_name(rs.getString("item_name"));
                    shopDTO.setItem_url(rs.getString("item_url"));
                    shopDTO.setItem_img(rs.getString("item_img"));
                    shopDTO.setItem_price(rs.getInt("item_price"));
                    shopDTO.setSale_rate(rs.getInt("sale_rate"));

                    list.add(shopDTO);
                } while (rs.next());
            }
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        } // finally

        return list;

    }//wishShop


    // 최근 본 상품
    public List<ShopDTO> recentShop(Connection con, int mem_code)
            throws SQLException {

        ArrayList<ShopDTO> list = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = " SELECT I.ITEM_CODE, ITEM_NAME, ITEM_URL, ITEM_IMG " +
                " 			, ITEM_PRICE, NVL(SALE_RATE, 0) SALE_RATE " +
                " FROM ITEM_VIEW IV JOIN ITEM I ON IV.ITEM_CODE=I.ITEM_CODE " +
                "    LEFT JOIN ITEM_SALE S ON S.ITEM_CODE=I.ITEM_CODE " +
                " WHERE MEM_CODE = ? " +
                " ORDER BY VI_DATE DESC ";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, mem_code);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                list = new ArrayList<ShopDTO>();
                ShopDTO shopDTO = null;
                do {
                    shopDTO = new ShopDTO();
                    shopDTO.setItem_code(rs.getInt("item_code"));
                    shopDTO.setItem_name(rs.getString("item_name"));
                    shopDTO.setItem_url(rs.getString("item_url"));
                    shopDTO.setItem_img(rs.getString("item_img"));
                    shopDTO.setItem_price(rs.getInt("item_price"));
                    shopDTO.setSale_rate(rs.getInt("sale_rate"));

                    list.add(shopDTO);
                } while (rs.next());
            }
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        } // finally

        return list;

    }//recentShop


    // 비밀번호 확인
    public String checkPwd(Connection con, int mem_code)
            throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String oPwd = null;

        String sql = " SELECT MEM_PW "
                + " FROM MEMBER "
                + " WHERE MEM_CODE = ? ";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, mem_code);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                oPwd = rs.getString("mem_pw");
            }

        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        } // finally

        return oPwd;

    }

    // 재입고알림
    public List<ShopDTO> alarmList(Connection con, int mem_code)
            throws SQLException {

        ArrayList<ShopDTO> list = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = " SELECT IN_CODE, I.ITEM_CODE, ITEM_NAME, ITEM_IMG, O.OPT_NAME, IN_DATE " +
                " FROM ITEM_NTC N JOIN ITEM_OPTION O ON N.OPT_CODE = O.OPT_CODE " +
                "    JOIN ITEM I ON O.ITEM_CODE = I.ITEM_CODE " +
                "    JOIN MEMBER M ON N.MEM_CODE = M.MEM_CODE " +
                " WHERE M.MEM_CODE = ? " +
                " ORDER BY IN_DATE DESC ";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, mem_code);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                list = new ArrayList<ShopDTO>();
                ShopDTO shopDTO = null;
                do {
                    shopDTO = new ShopDTO();
                    shopDTO.setIn_code(rs.getInt("in_code"));
                    shopDTO.setItem_code(rs.getInt("item_code"));
                    shopDTO.setItem_name(rs.getString("item_name"));
                    shopDTO.setItem_img(rs.getString("item_img"));
                    shopDTO.setOpt_name(rs.getString("opt_name"));
                    shopDTO.setIn_date(rs.getDate("in_date"));

                    list.add(shopDTO);
                } while (rs.next());
            }
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        } // finally

        return list;

    }//alarmList


    // 내 쿠폰
    public List<CouponDTO> couponList(Connection con, int mem_code)
            throws SQLException {

        ArrayList<CouponDTO> list = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = " SELECT MC.CP_CODE, CP_NAME, CP_TYPE, CP_RATE, CP_TERM " +
                "    		, CP_CATE, NVL(CP_MAX, 0) CP_MAX, MC_SDATE, MC_EDATE, MC_USED " +
                " FROM MEM_COUPON MC JOIN COUPON C ON MC.CP_CODE = C.CP_CODE " +
                "    JOIN MEMBER M ON MC.MEM_CODE = M.MEM_CODE " +
                " WHERE MC.MEM_CODE = ? " +
                " ORDER BY CP_CODE ASC ";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, mem_code);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                list = new ArrayList<CouponDTO>();
                CouponDTO couponDTO = null;
                do {
                    couponDTO = new CouponDTO();
                    couponDTO.setCp_code(rs.getInt("cp_code"));
                    couponDTO.setCp_name(rs.getString("cp_name"));
                    couponDTO.setCp_type(rs.getString("cp_type"));
                    couponDTO.setCp_rate(rs.getInt("cp_rate"));
                    couponDTO.setCp_term(rs.getInt("cp_term"));
                    couponDTO.setCp_cate(rs.getString("cp_cate"));
                    couponDTO.setCp_max(rs.getInt("cp_max"));

                    couponDTO.setMc_sdate(rs.getDate("mc_sdate"));
                    couponDTO.setMc_edate(rs.getDate("mc_edate"));
                    couponDTO.setMc_used(rs.getInt("mc_used"));

                    list.add(couponDTO);
                } while (rs.next());
            }
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        } // finally

        return list;

    }//couponList


    // 장바구니 리스트
    public List<ShopDTO> cartList(Connection con, int mem_code, String cpn_type)
            throws SQLException {

        ArrayList<ShopDTO> list = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = " SELECT CART_CODE, CART_CNT, I.ITEM_CODE, ITEM_NAME, ITEM_IMG " +
                "    , O.OPT_CODE, OPT_NAME, ITEM_PRICE, NVL(SALE_RATE, 0) SALE_RATE, EXTRA_PRICE " +
                "    , C.CPN_CODE, CPN_NAME, ITEM_FEE, FREE_FEE, CPN_TYPE, B.BR_CODE, BR_NAME " +
                " FROM CART CT JOIN ITEM_OPTION O ON O.OPT_CODE = CT.OPT_CODE " +
                "    JOIN ITEM I ON I.ITEM_CODE = O.ITEM_CODE " +
                "    LEFT JOIN ITEM_SALE S ON I.ITEM_CODE = S.ITEM_CODE " +
                "    JOIN COMPANY C ON C.CPN_CODE = I.CPN_CODE " +
                "    JOIN BRAND B ON B.BR_CODE = I.BR_CODE " +
                " WHERE MEM_CODE = ? AND CPN_TYPE = ? " +
                " ORDER BY CART_CODE DESC ";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, mem_code);
            pstmt.setString(2, cpn_type);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                list = new ArrayList<ShopDTO>();
                ShopDTO dto = null;
                do {
                    dto = new ShopDTO();

                    dto.setCart_code(rs.getInt("cart_code"));
                    dto.setCart_cnt(rs.getInt("cart_cnt"));

                    dto.setItem_code(rs.getInt("item_code"));
                    dto.setItem_name(rs.getString("item_name"));
                    dto.setItem_img(rs.getString("item_img"));

                    dto.setOpt_code(rs.getInt("opt_code"));
                    dto.setOpt_name(rs.getString("opt_name"));
                    dto.setItem_price(rs.getInt("item_price"));
                    dto.setSale_rate(rs.getInt("sale_rate"));
                    dto.setExtra_price(rs.getInt("extra_price"));

                    dto.setCpn_code(rs.getInt("cpn_code"));
                    dto.setCpn_name(rs.getString("cpn_name"));
                    dto.setItem_fee(rs.getInt("item_fee"));
                    dto.setFree_fee(rs.getInt("free_fee"));
                    dto.setCpn_type(rs.getString("cpn_type"));

                    dto.setBr_code(rs.getInt("br_code"));
                    dto.setBr_name(rs.getString("br_name"));

                    list.add(dto);
                } while (rs.next());
            }
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        } // finally

        return list;

    }//cartList


    // 주문내역
    // 주문리스트
    public List<ShopDTO> orderList(Connection con, int mem_code)
            throws SQLException {

        ArrayList<ShopDTO> list = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = " SELECT T.* " +
                " FROM " +
                "    ( SELECT OL.ORD_CODE, ORD_DATE, ORD_STATUS, DT_TYPE, D_TIME " +
                "        , ROW_NUMBER() OVER(PARTITION BY OL.ORD_CODE ORDER BY D_TIME) RN " +
                "    FROM ORDER_LIST OL JOIN ORDER_DETAIL OD ON OL.ORD_CODE = OD.ORD_CODE " +
                "        JOIN DEL_TYPE DT ON DT.DT_CODE = OD.DT_CODE " +
                "    WHERE MEM_CODE = ?" +
                "    ORDER BY ORD_CODE DESC )T " +
                "WHERE RN =  1";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, mem_code);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                list = new ArrayList<ShopDTO>();
                ShopDTO dto = null;
                do {
                    dto = new ShopDTO();

                    dto.setOrd_code(rs.getInt("ord_code"));
                    dto.setOrd_date(rs.getDate("ord_date"));
                    dto.setOrd_status(rs.getString("ord_status"));
                    dto.setD_time(rs.getDate("d_time"));
                    dto.setDt_type(rs.getString("dt_type"));

                    list.add(dto);
                } while (rs.next());
            }
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        } // finally

        return list;

    }//orderList


    // 주문상품 리스트
    public List<ShopDTO> orderItemList(Connection con, int mem_code)
            throws SQLException {

        ArrayList<ShopDTO> list = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = " SELECT OL.ORD_CODE, ODD_CODE, ODD_CNT, IT.ITEM_CODE " +
                "    , ITEM_NAME, ITEM_IMG, OPT_NAME, ITEM_PRICE, SALE_RATE, EXTRA_PRICE " +
                " FROM ORDER_LIST OL JOIN ORDER_DETAIL OD ON OL.ORD_CODE = OD.ORD_CODE " +
                "    LEFT OUTER JOIN STOCK ST ON OD.ST_CODE = ST.ST_CODE " +
                "    LEFT OUTER JOIN ITEM_OPTION IO ON IO.OPT_CODE = ST.OPT_CODE " +
                "    JOIN ITEM IT ON IT.ITEM_CODE = IO.ITEM_CODE " +
                "    LEFT OUTER JOIN ITEM_SALE SL ON IT.ITEM_CODE = SL.ITEM_CODE " +
                " WHERE MEM_CODE = ? " +
                " ORDER BY ODD_CODE DESC ";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, mem_code);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                list = new ArrayList<ShopDTO>();
                ShopDTO dto = null;
                do {
                    dto = new ShopDTO();

                    dto.setOrd_code(rs.getInt("ord_code"));
                    dto.setOdd_code(rs.getInt("odd_code"));
                    dto.setOdd_cnt(rs.getInt("odd_cnt"));
                    dto.setItem_code(rs.getInt("item_code"));
                    dto.setItem_name(rs.getString("item_name"));
                    dto.setItem_img(rs.getString("item_img"));
                    dto.setOpt_name(rs.getString("opt_name"));
                    dto.setItem_price(rs.getInt("item_price"));
                    dto.setSale_rate(rs.getInt("sale_rate"));
                    dto.setExtra_price(rs.getInt("extra_price"));

                    list.add(dto);
                } while (rs.next());
            }
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        } // finally

        return list;

    }//orderItemList


    // 주문상세
    // 주문
    public ShopDTO orderDetail(Connection con, int mem_code, int ord_code)
            throws SQLException {

        ShopDTO dto = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = " SELECT T.* " +
                " FROM " +
                "    ( SELECT OL.ORD_CODE, ORD_DATE, ORD_STATUS, DT_TYPE, D_TIME " +
                "        , ROW_NUMBER() OVER(PARTITION BY OL.ORD_CODE ORDER BY D_TIME) RN " +
                "    FROM ORDER_LIST OL JOIN ORDER_DETAIL OD ON OL.ORD_CODE = OD.ORD_CODE " +
                "        JOIN DEL_TYPE DT ON DT.DT_CODE = OD.DT_CODE " +
                "    WHERE MEM_CODE = ? AND OL.ORD_CODE = ?" +
                "    ORDER BY ORD_CODE DESC )T " +
                "WHERE RN =  1";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, mem_code);
            pstmt.setInt(2, ord_code);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                dto = new ShopDTO();

                dto.setOrd_code(rs.getInt("ord_code"));
                dto.setOrd_date(rs.getDate("ord_date"));
                dto.setOrd_status(rs.getString("ord_status"));
                dto.setD_time(rs.getDate("d_time"));
                dto.setDt_type(rs.getString("dt_type"));

            }
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        } // finally

        return dto;

    }//orderDetail


    // 주문상세
    // 주문상품
    public List<ShopDTO> orderItemDetail(Connection con, int mem_code, int ord_code)
            throws SQLException {

        ArrayList<ShopDTO> list = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = " SELECT OL.ORD_CODE, ODD_CODE, ODD_CNT, IT.ITEM_CODE " +
                "    , ITEM_NAME, ITEM_IMG, OPT_NAME, ITEM_PRICE, SALE_RATE, EXTRA_PRICE " +
                " FROM ORDER_LIST OL JOIN ORDER_DETAIL OD ON OL.ORD_CODE = OD.ORD_CODE " +
                "    JOIN STOCK ST ON OD.ST_CODE = ST.ST_CODE " +
                "    JOIN ITEM_OPTION IO ON IO.OPT_CODE = ST.OPT_CODE " +
                "    JOIN ITEM IT ON IT.ITEM_CODE = IO.ITEM_CODE " +
                "    JOIN ITEM_SALE SL ON IT.ITEM_CODE = SL.ITEM_CODE " +
                " WHERE MEM_CODE = ? AND OL.ORD_CODE = ? " +
                " ORDER BY ODD_CODE DESC ";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, mem_code);
            pstmt.setInt(2, ord_code);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                list = new ArrayList<ShopDTO>();
                ShopDTO dto = null;
                do {
                    dto = new ShopDTO();

                    dto.setOrd_code(rs.getInt("ord_code"));
                    dto.setOdd_code(rs.getInt("odd_code"));
                    dto.setOdd_cnt(rs.getInt("odd_cnt"));
                    dto.setItem_code(rs.getInt("item_code"));
                    dto.setItem_name(rs.getString("item_name"));
                    dto.setItem_img(rs.getString("item_img"));
                    dto.setOpt_name(rs.getString("opt_name"));
                    dto.setItem_price(rs.getInt("item_price"));
                    dto.setSale_rate(rs.getInt("sale_rate"));
                    dto.setExtra_price(rs.getInt("extra_price"));

                    list.add(dto);
                } while (rs.next());
            }
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        } // finally

        return list;

    }//orderItemDetail


    // 배송지
    public ShopDTO selectAdr(Connection con, int ord_code)
            throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ShopDTO dto = null;

        String sql = " SELECT OL.ORD_CODE, ADR_NAME, RECIPIENT, AD.CONTACT " +
                "    , ADR_DETAIL, DR_LOC, DR_ENTER, REQUESTS " +
                " FROM ADDRESS AD JOIN DEL_REQUEST DR ON AD.ADR_CODE = DR.ADR_CODE " +
                "    JOIN ORDER_LIST OL ON AD.ADR_CODE = OL.ADR_CODE " +
                "    JOIN MEMBER MB ON OL.MEM_CODE = MB.MEM_CODE " +
                " WHERE OL.ORD_CODE = ? ";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, ord_code);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                dto = new ShopDTO();

                dto.setOrd_code(rs.getInt("ord_code"));
                dto.setAdr_name(rs.getString("adr_name"));
                dto.setRecipient(rs.getString("recipient"));
                dto.setContact(rs.getString("contact"));
                dto.setAdr_detail(rs.getString("adr_detail"));
                dto.setDr_loc(rs.getString("dr_loc"));
                dto.setDr_enter(rs.getString("dr_enter"));
                dto.setRequests(rs.getString("requests"));

            }
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        } // finally

        return dto;

    }//selectAdr


    // 결제정보
    public ShopDTO selectPay(Connection con, int ord_code)
            throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ShopDTO dto = null;

        String sql = " SELECT OL.ORD_CODE, PM.PM_CODE, PD_METHOD " +
                " FROM PAYMENT PM JOIN PAYMENT_DETAIL PD ON PM.PM_CODE = PD.PM_CODE " +
                "    JOIN ORDER_LIST OL ON OL.ORD_CODE = PM.ORD_CODE " +
                "    JOIN MEMBER MB ON MB.MEM_CODE = OL.MEM_CODE " +
                " WHERE OL.ORD_CODE = ? " +
                " ORDER BY ORD_CODE DESC ";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, ord_code);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                dto = new ShopDTO();

                dto.setOrd_code(rs.getInt("ord_code"));
                dto.setPm_code(rs.getInt("pm_code"));
                dto.setPd_method(rs.getString("pd_method"));

            }
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        } // finally

        return dto;

    }//selectPay


}//class
