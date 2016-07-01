package com.GoalMate.www.DAO.Banner;

import java.util.List;
import java.util.Map;

import com.GoalMate.www.DTO.BannerDTO;

public interface BannerDAO {
	List<BannerDTO> bannerList();
	BannerDTO bannerDto(String bann_num);
	void imgModi(Map<String, String> map);
	void bannerDel(String bann_num);
	void bannerModi(BannerDTO dto);
	int bann_num_max();
	void bannerReg(BannerDTO dto);
	List<BannerDTO> bannerSearch(String name);
	void bannerOnOff(String bann_num, String bann_use);
	int bann_use_max();
	List<BannerDTO> bannerUseList();
}//bannerDAO
