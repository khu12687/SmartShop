package kr.ac.kopo.smartshop.dao;

import java.util.List;

import kr.ac.kopo.smartshop.model.Pager;
import kr.ac.kopo.smartshop.model.Partner;

public interface PartnerDao {

	List<Partner> list(Pager pager);

	void add(Partner item);

	Partner item(int code);

	void update(Partner item);
	
	void delete(int code);

	int total(Pager pager);

}
