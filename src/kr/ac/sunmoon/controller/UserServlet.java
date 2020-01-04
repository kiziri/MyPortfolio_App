package kr.ac.sunmoon.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import kr.ac.sunmoon.model.dto.UserDto;
import kr.ac.sunmoon.model.service.UserService;


@WebServlet("/register")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("userPassword");
		
		UserDto userDto = new UserDto();
		userDto.setUserName(userName);
		userDto.setUserEmail(userEmail);
		userDto.setUserPassword(userPassword);
		
		UserService userService = new UserService();
		
		int ret = userService.userRegister(userDto);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if( ret == 1 ) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		
		JSONObject jsonObj =  new JSONObject(map);
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jsonObj);
	}

}
