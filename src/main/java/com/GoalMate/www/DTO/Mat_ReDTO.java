package com.GoalMate.www.DTO;

public class Mat_ReDTO {

	private int mat_num;
	private String mat_home;
	private String mat_away;
	private String mat_date;
	private String mat_time;
	private String mat_place;
	private String mat_number;
	private int mat_price;
	private String mat_content;
	private int re_home_score;
	private int re_away_score;
	private String re_path1;
	private String re_path2;
	private int mat_confirm;
	
	public int getMat_num() {
		return mat_num;
	}
	public void setMat_num(int mat_num) {
		this.mat_num = mat_num;
	}
	public String getMat_home() {
		return mat_home;
	}
	public void setMat_home(String mat_home) {
		this.mat_home = mat_home;
	}
	public String getMat_away() {
		return mat_away;
	}
	public void setMat_away(String mat_away) {
		this.mat_away = mat_away;
	}
	public String getMat_date() {
		return mat_date;
	}
	public void setMat_date(String mat_date) {
		mat_date=mat_date.substring(0, 10);
		this.mat_date = mat_date;
	}
	public String getMat_time() {
		return mat_time;
	}
	public void setMat_time(String mat_time) {
		this.mat_time = mat_time;
	}
	public String getMat_place() {
		return mat_place;
	}
	public void setMat_place(String mat_place) {
		this.mat_place = mat_place;
	}
	public String getMat_number() {
		return mat_number;
	}
	public void setMat_number(String mat_number) {
		this.mat_number = mat_number;
	}
	public int getMat_price() {
		return mat_price;
	}
	public void setMat_price(int mat_price) {
		this.mat_price = mat_price;
	}
	public String getMat_content() {
		return mat_content;
	}
	public void setMat_content(String mat_content) {
		this.mat_content = mat_content;
	}
	public int getRe_home_score() {
		return re_home_score;
	}
	public void setRe_home_score(int re_home_score) {
		this.re_home_score = re_home_score;
	}
	public int getRe_away_score() {
		return re_away_score;
	}
	public void setRe_away_score(int re_away_score) {
		this.re_away_score = re_away_score;
	}
	public String getRe_path1() {
		return re_path1;
	}
	public void setRe_path1(String re_path1) {
		this.re_path1 = re_path1;
	}
	public String getRe_path2() {
		return re_path2;
	}
	public void setRe_path2(String re_path2) {
		this.re_path2 = re_path2;
	}
	public int getMat_confirm() {
		return mat_confirm;
	}
	public void setMat_confirm(int mat_confirm) {
		this.mat_confirm = mat_confirm;
	}
	
}
