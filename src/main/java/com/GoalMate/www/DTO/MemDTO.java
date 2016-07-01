package com.GoalMate.www.DTO;

public class MemDTO {
	private String mem_id; //회원 아이디
	private String mem_pw; //비밀번호
	private String mem_name; //이름
	private String mem_used; //사용유무
	private String mem_path;//회원 사진
	private String mem_date;//회원 가입일
	
	public String getMem_date() {
		return mem_date;
	}
	public void setMem_date(String mem_date) {
		this.mem_date = mem_date;
	}
	public String getMem_path() {
		return mem_path;
	}
	public void setMem_path(String mem_path) {
		this.mem_path = mem_path;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_used() {
		return mem_used;
	}
	public void setMem_used(String mem_used) {
		this.mem_used = mem_used;
	}
	
}
