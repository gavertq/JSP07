package board;

import java.sql.Timestamp;

public class BoardDTO {
	public int id, hit, idgroup, step, indent;	//글아이디, 조회수, 해당글에 달릴 댓글을 묶어줄 그룹, 댓글 순서, 들여쓰기
	private String name, title, content;
	private Timestamp savedate;
	
	public int getId() {return id;}
	public void setId(int id) {	this.id = id;}
	
	public int getHit() {return hit;}
	public void setHit(int hit) {this.hit = hit;}
	
	public int getIdgroup() {return idgroup;}
	public void setIdgroup(int idgroup) {this.idgroup = idgroup;}
	
	public int getStep() {return step;}
	public void setStep(int step) {	this.step = step;}
	
	public int getIndent() {return indent;}
	public void setIndent(int indent) {this.indent = indent;}
	
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	
	public String getTitle() {return title;	}
	public void setTitle(String title) {this.title = title;}
	
	public String getContent() {return content;}
	public void setContent(String content) {this.content = content;}
	
	public Timestamp getSavedate() {return savedate;}
	public void setSavedate(Timestamp savedate) {this.savedate = savedate;}		
}

/*
--<사용된 sql의 table과 sequence 생성 구문>--

create table test_board(
id number(4) primary key,
name varchar2(20),
title varchar2(100),
content varchar2(300),
savedate date default sysdate,
hit number(4) default 0,
idgroup number(4),
step number(4),
indent number(4)
);
create sequence test_board_seq; 
 
*/
