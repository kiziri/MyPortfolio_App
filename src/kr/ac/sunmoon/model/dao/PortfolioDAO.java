package kr.ac.sunmoon.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kr.ac.sunmoon.model.dto.Portfolio;
import kr.ac.sunmoon.model.dto.PortfolioData;
import kr.ac.sunmoon.model.dto.UserDto;
import kr.ac.sunmoon.util.DBManager;

public class PortfolioDAO {
	
	// 포트폴리오 목록 조회 
	public ArrayList<Portfolio> select() throws Exception {
		Connection con =null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select no, title, leader, members, start_date, end_date, reg_date, "
					+ "(select count(*) from portfolio_data where portfolio_no = p.no) "	// 상관관계 쿼리
					+ "from portfolio p";
		ArrayList<Portfolio> list = new ArrayList<Portfolio>();
		
		try {
			con = DBManager.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				list.add(new Portfolio(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), null, rs.getString(5), 
										rs.getString(6), rs.getString(7), rs.getInt(8)));
			}
		}
		finally {
			DBManager.close(rs, stmt, con);
		}
		
		return list;
	}
	
	// 포트폴리오 상세 검색
	public ArrayList<Portfolio> select(String title) throws Exception {
		Connection con =null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select no, title, leader, members, start_date, end_date, reg_date, "
				+ "(select count(*) from portfolio_data where portfolio_no = p.no) "	// 상관관계 쿼리
				+ "from portfolio p "
				+ "where title like ?";
		ArrayList<Portfolio> list = new ArrayList<Portfolio>();
		
		try {
			con = DBManager.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, "%"+title+"%");
			rs = stmt.executeQuery();
			while (rs.next()) {
				list.add(new Portfolio(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), null, rs.getString(5), 
						rs.getString(6), rs.getString(7), rs.getInt(8)));
			}
		}
		finally {
			DBManager.close(rs, stmt, con);
		}
		
		return list;
	}
	
	// 포트폴리오 자료 수
	public ArrayList<PortfolioData> selectDataList(int no) throws Exception {
		Connection con =null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select no, original_file_name, real_file_name "
				+ "from portfolio_data where portfolio_no = ?";
		
		ArrayList<PortfolioData> list = new ArrayList<PortfolioData>();
		
		try {
			con = DBManager.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, no);
			rs = stmt.executeQuery();
			while (rs.next()) {
				list.add(new PortfolioData(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
		}
		finally {
			DBManager.close(rs, stmt, con);
		}
		
		return list;
	}
	
	// 특정 포트폴리오 상세 조회
	public Portfolio select(int no) throws Exception {
		Connection con =null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select no, title, leader, members, content, start_date, end_date, reg_date "	
				+ "from portfolio where no = ?";
		
		Portfolio p = null;
		
		try {
			con = DBManager.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, no);
			rs = stmt.executeQuery();
			if(rs.next()) {
				p = new Portfolio(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), 
						rs.getString(7), rs.getString(8), 0);
			}
		}
		finally {
			DBManager.close(rs, stmt, con);
		}
		
		return p;
	}
	
	// 포폴리오 업데이트
	public void update(Portfolio p) throws Exception {
		Connection con =null;
		PreparedStatement stmt = null;
		String sql = "update portfolio set title=?, leader=?, members=?, content=?, "
				+ "start_date=STR_TO_DaTe(?, '%Y-%m-%d), end_date=STR_TO_DaTe(?, '%Y-%m-%d), reg_date=curdate()";
		
		try {
			con = DBManager.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, p.getTitle());
			stmt.setString(2, p.getLeader());
			stmt.setString(3, p.getMember());
			stmt.setString(4, p.getContent());
			stmt.setString(5, p.getStartDate());
			stmt.setString(6, p.getEndDate());
			stmt.executeUpdate();
		} 
		finally {
			DBManager.close(stmt, con);
		}
	}
	
	// 포트폴리오 삽입
	public int insert(Portfolio p) throws Exception {
		Connection con =null;
		PreparedStatement stmt = null;	// for insert
		PreparedStatement nostmt = null;	// for select
		ResultSet rs = null;
		String sql = "insert into portfolio(title, leader, members, content, start_date, end_date, reg_date)"
				+ " values(?, ?, ?, ?, STR_TO_DaTe(?, '%Y-%m-%d'), STR_TO_DaTe(?, '%Y-%m-%d'), curdate())";
		String nosql = "select last_insert_id() from portfolio";
		int no = 0;
		
		try {
			con = DBManager.getConnection();
			con.setAutoCommit(false);
			stmt = con.prepareStatement(sql);
			nostmt = con.prepareStatement(nosql);
			stmt.setString(1, p.getTitle());
			stmt.setString(2, p.getLeader());
			stmt.setString(3, p.getMember());
			stmt.setString(4, p.getContent());
			stmt.setString(5, p.getStartDate());
			stmt.setString(6, p.getEndDate());
			stmt.executeUpdate();
			rs = nostmt.executeQuery();
			
			if (rs.next()) {
				no = rs.getInt(1);
			}
			con.commit();
		} 
		catch(Exception e) {
			con.rollback();
			throw e;
		}
		finally {
			con.setAutoCommit(true);	// reset of AutoCommit
			DBManager.close(rs, stmt, con);
			DBManager.close(nostmt, con);
		}
		return no;
	}
	
	// 포트폴리오 첨부파일 삽입
	public void insert(int no, ArrayList<PortfolioData> list) throws Exception {
		Connection con =null;
		PreparedStatement stmt = null;
		String sql = "insert into portfolio_data(original_file_name, real_file_name, portfolio_no) "
				+ "values(?, ?, ?)";
		
		try {
			con = DBManager.getConnection();
			stmt = con.prepareStatement(sql);
			
			for (PortfolioData p : list) {
				stmt.setString(1, p.getOriginalFileName());
				stmt.setString(2, p.getRealFileName());
				stmt.setInt(3, no);
				stmt.executeUpdate();
			}
		} 
		finally {
			DBManager.close(stmt, con);
		}
	}
	
	public void delete(int no) throws Exception {
		Connection con =null;
		PreparedStatement stmt = null;
		String sql = "delete from portfolio where no = ?";
		
		try {
			con = DBManager.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, no);
			stmt.executeUpdate();
		} 
		finally {
			DBManager.close(stmt, con);
		}
	}

	public int userRegister(UserDto userDto) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int ret = -1;
		
		try {
			con = DBManager.getConnection();
			String sql = "INSERT INTO USER (USER_NAME, USER_PASSWORD, USER_EMAIL, USER_PROFILE_IMAGE_URL, USER_REGISTER_DATE) VALUES ( ?, ?, ?, '', now() ) ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  userDto.getUserName());
			pstmt.setString(2,  userDto.getUserPassword());
			pstmt.setString(3,  userDto.getUserEmail());

			ret = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, con);
		}
		
		return ret;
	}

	public UserDto login(String userEmail) {
		UserDto userDto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DBManager.getConnection();
			String sql = "SELECT USER_SEQ, USER_NAME, USER_PASSWORD, USER_EMAIL, USER_PROFILE_IMAGE_URL, USER_REGISTER_DATE from USER where USER_EMAIL = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  userEmail);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userDto = new UserDto();
				userDto.setUserSeq(rs.getInt("user_seq"));
				userDto.setUserName(rs.getString("user_name"));
				userDto.setUserPassword(rs.getString("user_password"));
				userDto.setUserEmail(rs.getString("user_email"));
				userDto.setUserEmail(rs.getString("user_profile_image_url"));
				userDto.setUserRegisterDate(rs.getDate("user_register_date"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBManager.close(rs, pstmt, con);
		}
		
		return userDto;
	}
}
