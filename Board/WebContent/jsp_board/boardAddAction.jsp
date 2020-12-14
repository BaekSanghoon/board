<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardAddAction</title>
</head>
<body>
<%
	//인코딩 설정
	request.setCharacterEncoding("UTF-8");
	//vo
	//request.getParameter() HTTP 요청의 파라미터 값을 얻기 위해 사용하는 것

	String boardPw = request.getParameter("boardPw");
	//System.out.println("boardPw"+boardPw);
	String boardTitle = request.getParameter("boardTitle");
	//System.out.println("boardTitle"+boardTitle);
	String boardContent = request.getParameter("boardContent");
	//System.out.println("boardContent"+boardContent);	
	String boardUser = request.getParameter("boardUser"); 
	//System.out.println("boardUser"+boardUser);
	//DB연동
	String dbUrl = "jdbc:mariadb://127.0.0.1:3306/boardd";
	String dbUser = "root";
	String dbPw = "java1004";
	//Connection DB연결과 관련된 정보를 가지는 데이터 타입
	Connection connection = null;
	//PreparedStatement 연결된 DB에 쿼리를 설정하고 실행할때 사용되는 데이터 타입, 객체를 캐시에 담아 재사용 한다.
	PreparedStatement statement = null;
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
		String sql = "insert into board( board_pw, board_title, board_content, board_user, board_date) values(?,?,?,?,now())";
		statement = connection.prepareStatement(sql);	
		statement.setString(1,boardPw);
		statement.setString(2,boardTitle);
		statement.setString(3,boardContent);
		statement.setString(4,boardUser);
		statement.executeUpdate();
		
		response.sendRedirect(request.getContextPath()+"/jsp_board/boardList.jsp");
	} catch(Exception e) {
        e.printStackTrace();
        out.print("입력에 실패하였습니다."); 
    } finally {
        try {statement.close();} catch(Exception e){}
        try {connection.close();} catch(Exception e){}
    }
%>
</body>
</html>