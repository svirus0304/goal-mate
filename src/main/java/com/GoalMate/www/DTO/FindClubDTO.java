package com.GoalMate.www.DTO;

public class FindClubDTO {
	private int	bcl_num;	//팀구함 번호
	private String bcl_title;//제목
	private String bcl_content;//내용
	private String bcl_name;//선수명
	private String bcl_area;//지역
	private String bcl_age;//나이
	private String bcl_id;//작성자
	private String bcl_date;//작성일
	private int bcl_hits;//조회수
	private int bcl_rcount;
	private String bcl_type; //글쓴계정 타입
	
	
	
	public int getBcl_rcount() {
		return bcl_rcount;
	}
	public void setBcl_rcount(int bcl_rcount) {
		this.bcl_rcount = bcl_rcount;
	}
	public String getBcl_type() {
		return bcl_type;
	}
	public void setBcl_type(String bcl_type) {
		this.bcl_type = bcl_type;
	}
	public int getBcl_num() {
		return bcl_num;
	}
	public void setBcl_num(int bcl_num) {
		this.bcl_num = bcl_num;
	}
	public String getBcl_title() {
		return bcl_title;
	}
	public void setBcl_title(String bcl_title) {
		this.bcl_title = bcl_title;
	}
	public String getBcl_content() {
		return bcl_content;
	}
	public void setBcl_content(String bcl_content) {
		this.bcl_content = bcl_content;
	}
	public String getBcl_name() {
		return bcl_name;
	}
	public void setBcl_name(String bcl_name) {
		this.bcl_name = bcl_name;
	}
	public String getBcl_area() {
		return bcl_area;
	}
	public void setBcl_area(String bcl_area) {
		this.bcl_area = bcl_area;
	}
	public String getBcl_age() {
		return bcl_age;
	}
	public void setBcl_age(String bcl_age) {
		this.bcl_age = bcl_age;
	}
	public String getBcl_id() {
		return bcl_id;
	}
	public void setBcl_id(String bcl_id) {
		this.bcl_id = bcl_id;
	}
	public String getBcl_date() {
		return bcl_date;
	}
	public void setBcl_date(String bcl_date) {
		this.bcl_date = bcl_date;
	}
	public int getBcl_hits() {
		return bcl_hits;
	}
	public void setBcl_hits(int bcl_hits) {
		this.bcl_hits = bcl_hits;
	}
	
}
