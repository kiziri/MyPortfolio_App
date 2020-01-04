package kr.ac.sunmoon.model.service;

import kr.ac.sunmoon.model.dao.PortfolioDAO;
import kr.ac.sunmoon.model.dto.UserDto;

public class UserService {
	
	public int userRegister(UserDto userDto) {
		PortfolioDAO userDao = new PortfolioDAO();
		return userDao.userRegister(userDto);
	}

}
