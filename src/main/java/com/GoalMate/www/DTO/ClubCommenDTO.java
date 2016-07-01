package com.GoalMate.www.DTO;

public class ClubCommenDTO {
	private int cc_num; //번호
	private String cc_content;//내용
	private String cc_id;//작성자
	private String cc_join;//작성일
	private int bcl_num; //팀구함번호
	private int bcl_rcount;
	private String cc_type; //댓글 쓴 계정 타입



	public int getBcl_rcount() {
		return bcl_rcount;
	}
	public void setBcl_rcount(int bcl_rcount) {
		this.bcl_rcount = bcl_rcount;
	}
	public String getCc_type() {
		return cc_type;
	}
	public void setCc_type(String cc_type) {
		this.cc_type = cc_type;
	}
	public int getCc_num() {
		return cc_num;
	}
	public void setCc_num(int cc_num) {
		this.cc_num = cc_num;
	}
	public String getCc_content() {
		return cc_content;
	}
	public void setCc_content(String cc_content) {
		this.cc_content = cc_content;
	}
	public String getCc_id() {
		return cc_id;
	}
	public void setCc_id(String cc_id) {
		this.cc_id = cc_id;
	}
	public String getCc_join() {
		return cc_join;
	}
	public void setCc_join(String cc_join) {
		this.cc_join = cc_join;
	}
	public int getBcl_num() {
		return bcl_num;
	}
	public void setBcl_num(int bcl_num) {
		this.bcl_num = bcl_num;
	}
	
}
