package com.GoalMate.www.DAO.Rank;

import java.util.ArrayList;
import java.util.List;

import com.GoalMate.www.DTO.ClubDTO;

public interface RankDAO {
	public List<ClubDTO> list();
	public ArrayList<Integer> Player_list(List<ClubDTO> check);
	public List<ClubDTO> list_area(String areas);
	public List<ClubDTO> list_type(String types);
	public List<ClubDTO> list_age(String ages);
	public List<ClubDTO> list_area_type(String areas,String types);
	public List<ClubDTO> list_area_age(String areas,String ages);
	public List<ClubDTO> list_type_age(String types,String ages);
	public List<ClubDTO> list_area_type_age(String areas,String types,String ages);
	
}
