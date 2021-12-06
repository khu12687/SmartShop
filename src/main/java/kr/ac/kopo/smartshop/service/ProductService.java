package kr.ac.kopo.smartshop.service;

import java.util.List;

import kr.ac.kopo.smartshop.model.Pager;
import kr.ac.kopo.smartshop.model.Product;
import kr.ac.kopo.smartshop.model.ProductImage;

public interface ProductService {

	List<Product> list(Pager pager);

	void add(Product item);
	
	Product item(int code);

	void update(Product item);

	void delete(int code);

	void dummy();

	void init();

	List<Product> list();

	boolean deleteImage(int code);

	void deleteList(List<Integer> list);
	
}
