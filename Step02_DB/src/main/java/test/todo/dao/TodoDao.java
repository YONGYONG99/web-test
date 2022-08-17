package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.todo.dto.TodoDto;
import test.util.DbcpBean;

public class TodoDao {
	private static TodoDao dao;
	
	private TodoDao() {}
	
	public static TodoDao getInstance() {
		if(dao==null) {
			dao=new TodoDao();
		}
		return dao;
	}
		public boolean update(TodoDto dto) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int updatedRowCount = 0;
			try {
				conn = new DbcpBean().getConn();
				//실행할 sql 문
				String sql = "update todo"
						+" set content=?, regdate=?"
						+ " where num=?";
				pstmt = conn.prepareStatement(sql);
				//? 값을 바인딩 할게 있으면 바인딩하기
		        pstmt.setString(1, dto.getContent());
		        pstmt.setString(2, dto.getRegdate());
		        pstmt.setInt(3, dto.getNum());
				//insert, update, delete 를 수행하고 변화되 row 의 갯수를 리턴 받기
				updatedRowCount = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			//변화된 row 의 갯수가 0 보다 크면 작업 성공
			if (updatedRowCount > 0) {
				return true;
			} else {//그렇지 않으면 작업 실패
				return false;
			}
			
		}
	
	   public TodoDto getData(int num) {
		      TodoDto dto=null;
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      try {
		         //Connection 객체의 참조값 얻어오기 (Connection Pool 에서 하나 가져오기)
		         conn = new DbcpBean().getConn();
		         //실행할 sql 문 작성
		         String sql = "SELECT content, TO_CHAR(regdate,'YYYY.MM.DD') regdate"
		               + " FROM todo"
		               + " WHERE num=?";
		         //sql 문을 전달하면서 PreparedStatement 객체의 참조값 얻어오기
		         pstmt = conn.prepareStatement(sql);
		         //? 에 값을 바인딩 할게 있으면 한다.
		         pstmt.setInt(1, num);
		         //select 문 수행하고 결과를 ResultSet 으로 받아온다.
		         rs = pstmt.executeQuery();
		         //반복문 돌면서 ResultSet 의 cursor 를 한칸씩 내린다.
		         while (rs.next()) {
		            //cursor 가 위치한 곳의 칼럼 데이터 추출해서 어딘가에 담기 
		            dto=new TodoDto();
		            dto.setNum(num);
		            dto.setContent(rs.getString("content"));
		            dto.setRegdate(rs.getString("regdate"));
		         }

		      } catch (Exception e) {
		         //혹시 예외가 발생한다면 예외정보를 콘솔에 출력해서 에러의 원인 찾기 
		         e.printStackTrace();
		      } finally {
		         try {
		            if (rs != null)
		               rs.close();
		            if (pstmt != null)
		               pstmt.close();
		            if (conn != null)
		               conn.close(); //Connection 반납
		         } catch (Exception e) {
		         }
		      }
		      return dto;
		   }
	
	
	
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int updatedRowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "delete from todo"
						+" where num=?";
			pstmt = conn.prepareStatement(sql);
			//? 값을 바인딩 할게 있으면 바인딩하기
			pstmt.setInt(1, num);
			//insert, update, delete 를 수행하고 변화되 row 의 갯수를 리턴 받기
			updatedRowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		//변화된 row 의 갯수가 0 보다 크면 작업 성공
		if (updatedRowCount > 0) {
			return true;
		} else {//그렇지 않으면 작업 실패
			return false;
		}
		
	}
	
	
	//insert
	public boolean insert(TodoDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int updatedRowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "insert into todo"
					+" (num,content,regdate)"
					+" values(todo_seq.nextval,?,?)";
			pstmt = conn.prepareStatement(sql);
			//? 값을 바인딩 할게 있으면 바인딩하기
			pstmt.setString(1, dto.getContent());
			pstmt.setString(2, dto.getRegdate());
			//insert, update, delete 를 수행하고 변화되 row 의 갯수를 리턴 받기
			updatedRowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		//변화된 row 의 갯수가 0 보다 크면 작업 성공
		if (updatedRowCount > 0) {
			return true;
		} else {//그렇지 않으면 작업 실패
			return false;
		}
	}
	
	
	public List<TodoDto> getList(){
		
		List<TodoDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "select num , content , TO_CHAR(regdate,'YYYY.MM.DD') regdate"
						+" from todo"
						+" order by num asc";
			pstmt = conn.prepareStatement(sql);
			//? 값을 바인딩 할게 있으면 바인딩하기

			//insert, update, delete 를 수행하고 변화되 row 의 갯수를 리턴 받기
			rs=pstmt.executeQuery();
			while(rs.next()) {
				TodoDto dto = new TodoDto();
				dto.setNum(rs.getInt("num"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));	
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs !=null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;

		}
	}
	
	
	
	
	


