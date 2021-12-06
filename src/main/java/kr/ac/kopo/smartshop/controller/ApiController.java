package kr.ac.kopo.smartshop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.smartshop.model.Pager;
import kr.ac.kopo.smartshop.model.Product;
import kr.ac.kopo.smartshop.service.ProductService;

@RequestMapping("/api")
@RestController
public class ApiController {
	@Autowired
	ProductService service;
	
	@PostMapping("/delete/list")
	public List<Integer> deleteList(@RequestBody List<Integer> list) {
		service.deleteList(list);
		
		return list;
	}
	
	@GetMapping
	public Map<String, Object> list(Pager pager) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", service.list(pager));
		map.put("pager", pager);
		
		return map;
	}
	
	@GetMapping("/{code}")
	public Product item(@PathVariable int code) {
		return service.item(code);
	}
	
	@PostMapping
	public Product add(@RequestBody Product item) {
		service.add(item);
		
		return item;
	}
	
	@PutMapping
	public Product update(@RequestBody Product item) {
		service.update(item);
		
		return item;
	}
	
	@DeleteMapping("/{code}")
	public Integer delete(@PathVariable int code) {
		service.delete(code);
		
		return code;
	}
	
}
