package kr.ac.sunmoon.model.service;

import kr.ac.sunmoon.model.dao.PortfolioDAO;
import kr.ac.sunmoon.model.dto.UserDto;

public class LoginService {

	public UserDto login(String userEmail, String userPassword) {
		PortfolioDAO loginDao = new PortfolioDAO();
		UserDto userDto =  loginDao.login(userEmail);
		
		if ( userDto != null && userDto.getUserPassword().equals(userPassword)) {
			return userDto;
		}
		else {
			return null;
		}
	}

}
