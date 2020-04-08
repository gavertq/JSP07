package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	private String url = "jdbc:oracle:thin:@192.168.0.49:1521:xe";
	private String user = "java";
	private String pwd="1234";
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public BoardDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*
	 select rownum from test_board; 하면 총 열 갯수 출력.
	 이를 이용해서 중간에 글의 삭제가 일어나도 그 글의 id값만 삭제 되는 것이 아니라
	 다시 1부터 최근 글 갯수까지 순차적으로 id값이 들어가도록 만들 수 있을까?
	 id가 null이면 1, 그외에는 열의 총갯수에 +1한 값이 id값으로 들어가게..
	 */
	
	//글 목록
	public ArrayList<BoardDTO> list() {
		String sql = "select * from test_board order by idgroup desc, step asc";
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setId(rs.getInt("id"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setIndent(rs.getInt("indent"));
				dto.setStep(rs.getInt("step"));
				
				dto.setContent(rs.getString("content"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setSavedate(rs.getTimestamp("savedate"));
				
				list.add(dto);
			}
		} catch (Exception e) {e.printStackTrace();}
		
		return list;
	}
	
	//글 등록(저장)
	public void write_save(String name, String title, String content) {
		//현재 테이블의 열의 총 갯수 알아보기 ->메소드로 열 총 갯수 가져와서..
		//추가로 중간에 삭제 일어나면, 삭제된 글의 id보다 작은 수는 그대로, 큰 수의 id는 1씩 줄이는 과정이 필요하다..;;
		
		
		String sql = "insert into test_board(id, name, title, content, idgroup, step, indent)"+
						" values (test_board_seq.nextval, ?, ?, ?, test_board_seq.currval, 0, 0)";
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, title);
			ps.setString(3, content);
			ps.executeUpdate();		

		} catch (Exception e) {e.printStackTrace();}
	}
	
	//글 내용 보기
	public BoardDTO contentView(String id) {
		upHit(id);	//조회수를 올려줄 메소드
		
		String sql = "select * from test_board where id=?";
		BoardDTO dto = new BoardDTO();
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getInt("id"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setIndent(rs.getInt("indent"));
				dto.setStep(rs.getInt("step"));
				
				dto.setContent(rs.getString("content"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setSavedate(rs.getTimestamp("savedate"));
			}

		} catch (Exception e) {e.printStackTrace();}
		return dto;
	}
	
	//조회수
	public void upHit(String id) {
		String sql = "update test_board set hit=hit+1 where id="+id;
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {e.printStackTrace();}
	}
	
	//글 수정
	public void modify(BoardDTO dto) {	
		String sql = "update test_board set name=?, title=?, content=? where id=?";
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			ps.setInt(4, dto.getId());
			ps.executeUpdate();
		} catch (Exception e) {e.printStackTrace();}
	}
	
	//글삭제
	public void delete(String id) {	
		String sql = "delete test_board where id="+id;
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.executeUpdate();			
		} catch (Exception e) {e.printStackTrace();}
	}
	
	//답글 페이지
	public BoardDTO reply_view(String id) {
		String sql = "select * from test_board where id=?";
		BoardDTO dto = new BoardDTO();
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getInt("id"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setIndent(rs.getInt("indent"));
				dto.setStep(rs.getInt("step"));
				
				dto.setContent(rs.getString("content"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setSavedate(rs.getTimestamp("savedate"));
			}

		} catch (Exception e) {e.printStackTrace();}
		return dto;
	}
	
	//답글 작성
	public void reply(BoardDTO dto) {	
		replyShape(dto); //댓글 작성후 정렬을 위한 메소드
		
		String sql = "insert into test_board(id, name, title, content, idgroup, step, indent)"+
					" values(test_board_seq.nextval,?,?,?,?,?,?)";
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			ps.setInt(4, dto.getIdgroup());
			ps.setInt(5, dto.getStep()+1); //step 1 증가
			ps.setInt(6, dto.getIndent()+1); //indent 1 증가
			ps.executeUpdate();		

		} catch (Exception e) {e.printStackTrace();}
	}
	
	public void replyShape(BoardDTO dto) {//idgroup이 같고(원글이 같고) step이 현재 step보다 큰 댓글(먼저 달린 댓글들)의 step을 1 증가시켜라..
		//처음 댓글을 달면 원글의 step이 0이므로 0보다 큰 step이 없어 댓글의 step은 1..
		//그 다음에 댓글을 또 작성하면 기존 댓글의 step은 1 ->2로, 새로 작성된 댓글의 step이 1로 들어감
		String sql = "update test_board set step=step+1 where idgroup=? and step>?";
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getIdgroup());
			ps.setInt(2, dto.getStep());
			ps.executeUpdate();		

		} catch (Exception e) {e.printStackTrace();}
	}
	
}
