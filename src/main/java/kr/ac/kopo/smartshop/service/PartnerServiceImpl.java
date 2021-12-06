package kr.ac.kopo.smartshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.smartshop.dao.PartnerDao;
import kr.ac.kopo.smartshop.model.Pager;
import kr.ac.kopo.smartshop.model.Partner;

@Service
public class PartnerServiceImpl implements PartnerService {
	@Autowired
	PartnerDao dao;
	
	@Override
	public List<Partner> list(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Override
	public void add(Partner item) {
		dao.add(item);

	}

	@Override
	public Partner item(int code) {
		return dao.item(code);
	}

	@Override
	public void update(Partner item) {
		dao.update(item);
	}

	@Override
	public void delete(int code) {
		dao.delete(code);
	}

	@Override
	public List<Partner> list() {
		Pager pager = new Pager();
		
		int total = dao.total(pager);
		
		pager.setTotal(total);
		pager.setPerPage(total);
		
		return dao.list(pager);
	}

}
