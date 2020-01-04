package kr.ac.sunmoon.model.service;

import java.util.ArrayList;

import kr.ac.sunmoon.model.dao.PortfolioDAO;
import kr.ac.sunmoon.model.dto.Portfolio;
import kr.ac.sunmoon.model.dto.PortfolioData;

public class PortfolioService {
	
	private PortfolioDAO pDao = new PortfolioDAO();
	
	// 포트폴리오 등록
	public void register(Portfolio p) throws Exception {
		
		int no = pDao.insert(p);	// portfolio no will be getted
		ArrayList<PortfolioData> list = p.getDataList();
		
		if(list != null && list.size()>0) {
			pDao.insert(no, p.getDataList());	// Tx will needs.		
		}
	}
	
	// 포트폴리오 목록 조회
	public ArrayList<Portfolio> getList() throws Exception {
		return pDao.select();
	}
	
	// 포트폴리오 상세 조회
	public ArrayList<Portfolio> search(String title) throws Exception {
		return pDao.select(title);
	}
	
	// 포트폴리오 하나 상세 조회
	public Portfolio getDetail(int no) throws Exception {	
		Portfolio p = pDao.select(no);
		p.setDataList(pDao.selectDataList(no));
		
		return p;
	}
	
	// 포트폴리오 수정
	public void modify(Portfolio p ) throws Exception {
		pDao.update(p);
	}
	
	// 포트폴리오 삭제
	public void remove(int no) throws Exception {
		pDao.delete(no);
	}
}
