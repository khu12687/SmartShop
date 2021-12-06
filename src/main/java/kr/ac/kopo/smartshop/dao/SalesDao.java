package kr.ac.kopo.smartshop.dao;

import java.util.List;

import kr.ac.kopo.smartshop.model.Pager;
import kr.ac.kopo.smartshop.model.Sales;
import kr.ac.kopo.smartshop.model.Stock;

public interface SalesDao {

	List<Sales> list(Pager pager);

	List<Stock> stock();
	
	void add(Sales item);

	Sales item(int code);

	void update(Sales item);

	void delete(int code);

}
