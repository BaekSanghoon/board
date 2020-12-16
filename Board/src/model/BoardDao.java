package model;

import java.sql.*;
import java.util.*;

public class BoardDao {
	// 게시글 쓰기
	public int insertBoard(Board board) { 
		//DB연동
		/*
		 * String dbUrl = "jdbc:mariadb://127.0.0.1:3306/boardd"; String dbUser =
		 * "root"; String dbPw = "java1004";
		 */
		//Connection DB연결과 관련된 정보를 가지는 데이터 타입
		Connection connection = null;
		//PreparedStatement 연결된 DB에 쿼리를 설정하고 실행할때 사용되는 데이터 타입, 객체를 캐시에 담아 재사용 한다.
		PreparedStatement statement = null;
		int row = 0;
		try {
			connection = this.getConnection();
			String sql = "insert into board( board_pw, board_title, board_content, board_user, board_date) values(?,?,?,?,now())";
			statement = connection.prepareStatement(sql);	
            statement.setString(1,board.getBoardPw());
            statement.setString(2,board.getBoardTitle());
            statement.setString(3,board.getBoardContent());
            statement.setString(4,board.getBoardUser());
			//statement.executeUpdate();
			row = statement.executeUpdate(); // insert 쿼리를 실행	
			
		} catch(Exception e) {
	        e.printStackTrace();
	        System.out.print("입력에 실패하였습니다."); 
	    } finally {
	        try {statement.close();} catch(Exception e){}
	        try {connection.close();} catch(Exception e){}
	    }
			return row;
	}
	
	//DB연동
    public Connection getConnection() throws Exception {
		Class.forName("org.mariadb.jdbc.Driver");
		String dbUrl = "jdbc:mariadb://127.0.0.1:3306/boardd";
		String dbUser = "root";
		String dbPw = "java1004";
        Connection connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
        return connection;
    }
    
    // 게시글 목록
    public ArrayList<Board> getBoardList(int currentPage, int pagePerRow) {
        ArrayList<Board> list = new ArrayList<Board>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            connection = this.getConnection();
            String listSql = "select board_no, board_title, board_user, board_date from board order by board_date desc limit ?, ?";
            statement = connection.prepareStatement(listSql);
            statement.setInt(1, (currentPage-1)*pagePerRow); 
            statement.setInt(2, pagePerRow); 
            rs = statement.executeQuery();
            while(rs.next()) {
                Board board = new Board();
                board.setBoardNo(rs.getInt("board_no"));
                board.setBoardTitle(rs.getString("board_title"));
                board.setBoardUser(rs.getString("board_user"));
                board.setBoardDate(rs.getString("board_date"));
                list.add(board);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.print("게시판 목록 가져오기 실패");
        } finally {
            try {rs.close();} catch(Exception e){}
            try {statement.close();} catch(Exception e){}
            try {connection.close();} catch(Exception e){}
        }
        return list;
    }
    
    // 전체 글 카운트
    public int getBoardCount() {
        int count = 0; 
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            connection = this.getConnection();
        	//board테이블의 전체행의 수를 세어서 반환
            String totalSql = "select count(*) from board";
            statement = connection.prepareStatement(totalSql);
            rs = statement.executeQuery();
            if(rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.print("예외 발생");
        } finally {
            try {rs.close();} catch(Exception e){}
            try {statement.close();} catch(Exception e){}
            try {connection.close();} catch(Exception e){}
        }
        return count;
    }
    
    // 게시글 자세히 보기
    public Board getBoard(int boardNo) {
        Board board = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            connection = this.getConnection();
            String sql = "select board_title, board_content, board_user, board_date from board where board_no=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, boardNo);
            rs = statement.executeQuery();
            if(rs.next()) {
                board = new Board();
                board.setBoardNo(boardNo);
                board.setBoardTitle(rs.getString("board_title"));
                board.setBoardContent(rs.getString("board_content"));
                board.setBoardUser(rs.getString("board_user"));
                board.setBoardDate(rs.getString("board_date"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.print("BOARD VIEW ERROR");
        } finally {
            try {rs.close();} catch(Exception e){}
            try {statement.close();} catch(Exception e){}
            try {connection.close();} catch(Exception e){}
        }   
        return board;
    }
    
    //게시물 비밀번호 확인 및 삭제
    public int deleteBoard(int boardNo, String boardPw) {
        Connection connection = null;
        PreparedStatement statement = null;
        int row = 0;
        try {
            connection = this.getConnection();
            String sql = "delete from board where board_no=? and board_pw=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, boardNo);
            statement.setString(2, boardPw);
            row = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.print("오류 발생!");
        } finally {
            try {statement.close();} catch(Exception e){}
            try {connection.close();} catch(Exception e){}
        } 
        return row;
    }
    
        // 글수정 메서드 
    public int updateBoard(Board board) {
    	Connection connection = null;
    	PreparedStatement statement = null;
    	int row = 0;
    	try {
    		connection = this.getConnection();
    		String sql = "update board set board_title=?, board_content=? where board_no=? and board_pw=?";
    		statement = connection.prepareStatement(sql);
    		statement.setString(1, board.getBoardTitle());
    		statement.setString(2, board.getBoardContent());
    		statement.setInt(3, board.getBoardNo());
    		statement.setString(4, board.getBoardPw());
    		row = statement.executeUpdate();
    		} catch (Exception e) {
    			e.printStackTrace();
    			System.out.print("게시글 수정 에러!");
    		} finally {
    			try {statement.close();} catch(Exception e){}
    			try {connection.close();} catch(Exception e){}
    		} 
            return row;
        }
    
	
}
