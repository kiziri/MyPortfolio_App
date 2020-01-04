package kr.ac.sunmoon.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.ac.sunmoon.model.dto.Portfolio;
import kr.ac.sunmoon.model.dto.PortfolioData;
import kr.ac.sunmoon.model.service.PortfolioService;
import kr.ac.sunmoon.util.DateTimeFileReNamePolicy;


@WebServlet("/portfolio_register.do")
public class PortfolioRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String saveDir = "uploadFileSave";
			String saveFullDir = getServletContext().getRealPath(saveDir);
			int maxFileSize = 5*1024*1024;
			//int maxFileSize = 5*1024;
			String encoding = "utf-8";
			
			MultipartRequest mRequest = null;
		 	//mRequest = new MultipartRequest(request,saveFullDir,maxFileSize,encoding,		new DefaultFileRenamePolicy());
		 	mRequest = new MultipartRequest(request,saveFullDir,maxFileSize,encoding,
		 			new DateTimeFileReNamePolicy());
		 	
		 	String Title = mRequest.getParameter("Title");
		 	String Representative = mRequest.getParameter("Representative"); 
		 	String Participants = mRequest.getParameter("Participants"); 
		 	String Content = mRequest.getParameter("Content"); 
		 	String StartDate = mRequest.getParameter("StartDate"); 
		 	String EndDate = mRequest.getParameter("EndDate"); 
		 	
		 	Portfolio p = new Portfolio(Title, Representative, Participants, Content, StartDate, EndDate);
		 	
		 	ArrayList<PortfolioData> list = new ArrayList<PortfolioData>();
		 	Enumeration em = mRequest.getFileNames();
		 	while(em.hasMoreElements()) {
		 		String name = (String)em.nextElement();
		 		String originalFileName = mRequest.getOriginalFileName(name);
		 		if(originalFileName == null) continue;
		 		String realFileName = mRequest.getFilesystemName(name);
		 		
		 		list.add(new PortfolioData(originalFileName, realFileName));

		 	}
		 	p.setDataList(list);
		 	
		 	// 입력 받은 포트폴리오 넘기기 위함.
		 	PortfolioService pService = new PortfolioService();
		 	pService.register(p);
		 	
	 		response.sendRedirect("/portfolio/portfolio_list.do");
	 		
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			request.getRequestDispatcher("/error/error.jsp").forward(request, response);
		}	
	}
}
