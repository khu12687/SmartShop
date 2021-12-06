package kr.ac.kopo.smartshop.dao;

import java.util.List;

import kr.ac.kopo.smartshop.model.Pager;
import kr.ac.kopo.smartshop.model.Purchase;

public interface PurchaseDao {

	List<Purchase> list(Pager pager);

	void add(Purchase item);

	Purchase item(int code);

	void update(Purchase item);

	void delete(int code);

}
