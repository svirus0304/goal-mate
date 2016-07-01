package com.GoalMate.www.DAO.Club;

import java.util.ArrayList;
import java.util.List;

import com.GoalMate.www.DTO.ClubDTO;
import com.GoalMate.www.DTO.PlayerDTO;

public interface ClubDAO {
	public List<ClubDTO> list(); 
	public List<ClubDTO> listPage(int start,int end); 

	public List<ClubDTO> list_age(String age);
	public List<ClubDTO> list_age_Page(int start,int end,String age);
	
	public List<ClubDTO> list_club(String finds);
	public List<ClubDTO> list_club_Page(int start,int end,String finds);
	
	public List<ClubDTO> list_area(String finds);
	public List<ClubDTO> list_area_Page(int start,int end,String finds);
	
	public ClubDTO findClub(String club_id);
	public List<PlayerDTO> list_player(String club_id);
	
}


