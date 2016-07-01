package com.GoalMate.www.DTO;

public class FreeDTO {
	private int bod_num; //게시판 번호
	private String bod_title;//제목
	private String bod_content;//내용
	private String bod_path;//이미지 경로
	private String bod_id;//작성자
	private String bod_date;//작성일
	private int bod_hits;//조회수
	private int bod_rcount;//게시물 별 댓글수 
	private String bod_type;//글쓴이 계정 타입
	
	
 

	public String getBod_type() {
		return bod_type;
	}
	public void setBod_type(String bod_type) {
		this.bod_type = bod_type;
	}
	public int getBod_rcount() {
		return bod_rcount;
	}
	public void setBod_rcount(int bod_rcount) {
		this.bod_rcount = bod_rcount;
	}
	public int getBod_num() {
		return bod_num;
	}
	public void setBod_num(int bod_num) {
		this.bod_num = bod_num;
	}
	public String getBod_title() {
		return bod_title;
	}
	public void setBod_title(String bod_title) {
		this.bod_title = bod_title;
	}
	public String getBod_content() {
		return bod_content;
	}
	public void setBod_content(String bod_content) {
		this.bod_content = bod_content;
	}
	public String getBod_path() {
		return bod_path;
	}
	public void setBod_path(String bod_path) {
		this.bod_path = bod_path;
	}
	public String getBod_id() {
		return bod_id;
	}
	public void setBod_id(String bod_id) {
		this.bod_id = bod_id;
	}
	public String getBod_date() {
		return bod_date;
	}
	public void setBod_date(String bod_date) {
		this.bod_date = bod_date;
	}
	public int getBod_hits() {
		return bod_hits;
	}
	public void setBod_hits(int bod_hits) {
		this.bod_hits = bod_hits;
	}
 
}
