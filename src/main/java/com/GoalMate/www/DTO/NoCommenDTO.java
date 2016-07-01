package com.GoalMate.www.DTO;

public class NoCommenDTO {
	private int ca_num;	//댓글 번호
	private String ca_content; //댓글 내용
	private String ca_id; //댓글 작성자
	private String ca_join; //댓글 작성일
	private int bad_num; //공지사항 번호
	private int bad_rcount;//공지사항별 댓글수
	private String ca_type;//댓글쓴사람의 계정 타입

	public String getCa_type() {
		return ca_type;
	}
	public void setCa_type(String ca_type) {
		this.ca_type = ca_type;
	}
	public int getBad_rcount() {
		return bad_rcount;
	}
	public void setBad_rcount(int bad_rcount) {
		this.bad_rcount = bad_rcount;
	}
	public int getCa_num() {
		return ca_num;
	}
	public void setCa_num(int ca_num) {
		this.ca_num = ca_num;
	}
	public String getCa_content() {
		return ca_content;
	}
	public void setCa_content(String ca_content) {
		this.ca_content = ca_content;
	}
	public String getCa_id() {
		return ca_id;
	}
	public void setCa_id(String ca_id) {
		this.ca_id = ca_id;
	}
	public String getCa_join() {
		return ca_join;
	}
	public void setCa_join(String ca_join) {
		this.ca_join = ca_join;
	}
	public int getBad_num() {
		return bad_num;
	}
	public void setBad_num(int bad_num) {
		this.bad_num = bad_num;
	}
	
}
